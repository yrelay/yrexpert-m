;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TLBAPLR^INT^1^59547,74028^0
TLBAPLR ;
 
 
INITPL 
 N I,DATEPLA,DATETRT,PLANB,TEMP
 I MODEX'=3 G GOIN
 S PLAN=@GLOETD@(NIVEAU,"NOM.PLAN")
 S PLANE=@GLOETD@(NIVEAU,"NOM.ECHEC")
 S PLANR=@GLOETD@(NIVEAU,"NOM.SORTIE")
 Q
GOIN 
 S PLAN=$$CONCAS^%QZCHAD($$ADRESSE,TRT)
 I ETIQ="" S PLAN=$$CONCAS^%QZCHAD(PLAN,"PRINCIPAL")
 I ETIQ'="" S PLAN=$$CONCAS^%QZCHAD(PLAN,ETIQ) I PARTIE'="" S PLAN=$$CONCAS^%QZCHAD(PLAN,PARTIE)
 S PLANB=$$CONCAS^%QZCHAD(PLAN,"PLAN.BASE")
 
 S CREPL=0
 I '($D(@PLAN@("DATE"))) S CREPL=1 G SUITE
 S DATEPLA=@PLAN@("DATE"),DATETRT=$$^%QCAZG($$GETDATE^%TLGEST(TRT))
 I $$CMPDAT^%TLBAINT(DATEPLA,DATETRT)=1 G SUITE
 
 K @(PLAN) S CREPL=1
SUITE 
 S PLAN=$$CONCAS^%QZCHAD(PLAN,"PLAN")
 S PLANR=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PLAN.EXECUTION") K @(PLANR)
 S PLANE=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",ECHEC") K @(PLANE)
 I '(CREPL) G EXISPL
CREPL 
 D CREPLA^%TLBAINT(PLANB)
 F I=1:1 Q:'($D(@PLANB@(I)))  S @PLANR@(1,@PLANB@(I))=1,@PLANE@(@PLANB@(I))=0
 
 G INIPLE
 
EXISPL 
 S I=""
BCL S I=$O(@PLAN@(I)) G:I="" INIPLE
 S @PLANR@(@PLAN@(I),I)=@PLAN@(I),@PLANE@(I)=0
 G BCL
 
INIPLE 
 I (MODAF=2)!(MODAF=3) D INIREM^%TLBAINT(PLANR,PLANE) D:MODAF=2 REAF^%TLBAIF(2) D:$O(@PLANE@(""))'="" ARBAPP^%TLBAINT
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 S @TEMP@("COEFFICIENT")="",@TEMP@("REGLE")="",@TEMP@("REUSSITE")=0
 S @TEMP@("ECHEC.GLOBAL")=0
 S PLAN=PLANR
 S PLANR=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",REUSSITES"),@PLANR=1
 
 S @GLOETD@(NIVEAU,"NOM.PLAN")=PLAN
 S @GLOETD@(NIVEAU,"NOM.ECHEC")=PLANE
 S @GLOETD@(NIVEAU,"NOM.SORTIE")=PLANR
 Q
 
 
STOPL 
 N I,J,K,PLANB
 Q:ABANDON
 S PLANB=$$CONCAS^%QZCHAD($$ADRESSE,TRT)
 I ETIQ="" S PLANB=$$CONCAS^%QZCHAD(PLANB,"PRINCIPAL")
 I ETIQ'="" S PLANB=$$CONCAS^%QZCHAD(PLANB,ETIQ) I PARTIE'="" S PLANB=$$CONCAS^%QZCHAD(PLANB,PARTIE)
 S @PLANB@("DATE")=$H
 S PLANB=$$CONCAS^%QZCHAD(PLANB,"PLAN")
 S I=""
BCC S I=$O(@PLAN@(I)) I I="" Q
 S J=""
BCR S J=$O(@PLAN@(I,J)) I J="" G BCC
 S @PLANB@(J)=$S($D(@PLANB@(J)):@PLANB@(J),1:0)+@PLAN@(I,J)
 G BCR
 
 
REGSUI 
 N TEMP,COEFF,VALP
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 S COEFF=@TEMP@("COEFFICIENT"),NUMRG=@TEMP@("REGLE")
 Q:MODEX=3
 I (ABANDON!ARRET)!STOP G PLUREG
 I COEFF="" G COEFFS
 S VALP=@PLAN@(COEFF,NUMRG)
 I ECHEC=0 S @PLAN@(COEFF,NUMRG)=VALP+1 K @PLANE@(NUMRG) S @PLANR@(@PLANR)=NUMRG,@PLANR=@PLANR+1,@TEMP@("REUSSITE")=1
 I ECHEC=1 S @PLAN@(COEFF,NUMRG)=VALP-1
 I ECHEC=-1 K @PLANE@(NUMRG)
 G REGLS
COEFFS 
 S COEFF=$ZP(@PLAN@(COEFF))
 I COEFF="" G NOUVPAS
 S NUMRG=""
REGLS 
 S NUMRG=$O(@PLAN@(COEFF,NUMRG))
 I NUMRG="" G COEFFS
 I $$REUSSI(NUMRG) G REGLS
 S @TEMP@("COEFFICIENT")=COEFF,@TEMP@("REGLE")=NUMRG
 S L=@PLANE@(NUMRG)
 Q
NOUVPAS 
 I (@TEMP@("REUSSITE")=0)!($O(@PLANE@(""))="") G PLUREG
 S (COEFF,@TEMP@("COEFFICIENT"))="",@TEMP@("REGLE")="",@TEMP@("REUSSITE")=0
 G COEFFS
PLUREG 
 S NUMRG=0 K @(TEMP)
 S ECHGL=0 I $O(@PLANE@(""))'="" S ECHGL=1
 Q
 
REUSSI(NUM) 
 Q '($D(@PLANE@(NUM)))
 
ADRESSE() 
 Q "^[QUI]RQSGLO(""TLBA"",""LINEAIRE.REMANENT"")"
 Q "^["""_QUI_"""]RQSGLO(""TLBA"",""LINEAIRE.REMANENT"")"

