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

;%TLBAPLG^INT^1^59547,74028^0
TLBAPLG ;
 
 
INITPL 
 N I,J,DATEPLA,DATETRT,PLANB
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
 S DATETRT=$$^%QCAZG($$GETDATE^%TLGEST(TRT))
 S DATEPLA=@PLAN@("DATE")
 I $$CMPDAT^%TLBAINT(DATEPLA,DATETRT)=1 G SUITE
 
 K @(PLAN) S CREPL=1
SUITE 
 S PLAN=$$CONCAS^%QZCHAD(PLAN,"ARBRE")
 S PLANR=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PLAN.EXECUTION") K @(PLANR)
 I '(CREPL) G EXISPL
 D CREPLA^%TLBAINT(PLANB) G INIPLE
 
EXISPL 
 S I=""
BCLTI S I=$O(@PLAN@(I)) G:I="" INIPLE
 S J=""
BCLTJ S J=$O(@PLAN@(I,J)) G:J="" BCLTI
 S @PLANR@(I,J)=@PLAN@(I,J) G BCLTJ
 
INIPLE 
 S PLANE=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",ECHEC") K @(PLANE)
 S I=1
BCLI I $D(@PLANB@(I)) S @PLANE@(@PLANB@(I))=0,I=I+1 G BCLI
 
 I (MODAF=2)!(MODAF=3) D INIARB^%TLBAINT(PLAN,PLANE) D:MODAF=2 REAF^%TLBAIF(2) D:$O(@PLANE@(""))'="" ARBAPP^%TLBAINT
 S PLAN=PLANR
 S PLANR=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",REUSSITES"),@PLANR=1
 
 S @GLOETD@(NIVEAU,"NOM.PLAN")=PLAN
 S @GLOETD@(NIVEAU,"NOM.ECHEC")=PLANE
 S @GLOETD@(NIVEAU,"NOM.SORTIE")=PLANR
 Q
 
 
STOPL 
 N I,J,PLANB
 I ABANDON Q
 S PLANB=$$CONCAS^%QZCHAD($$ADRESSE,TRT)
 I ETIQ="" S PLANB=$$CONCAS^%QZCHAD(PLANB,"PRINCIPAL")
 I ETIQ'="" S PLANB=$$CONCAS^%QZCHAD(PLANB,ETIQ) I PARTIE'="" S PLANB=$$CONCAS^%QZCHAD(PLANB,PARTIE)
 S @PLANB@("DATE")=$H
 S PLANB=$$CONCAS^%QZCHAD(PLANB,"ARBRE")
 S I=""
BCLS S I=$O(@PLAN@(I)) I I="" Q
 S J=""
BCLS2 S J=$O(@PLAN@(I,J)) G:J="" BCLS
 S @PLANB@(I,J)=@PLAN@(I,J) G BCLS2
 
 
REGSUI 
 N TEMP,PROFAR,PERE,PLANB
 S PLANB=$$CONCAS^%QZCHAD($$ADRESSE,TRT)
 I ETIQ="" S PLANB=$$CONCAS^%QZCHAD(PLANB,"PRINCIPAL")
 I ETIQ'="" S PLANB=$$CONCAS^%QZCHAD(PLANB,ETIQ) I PARTIE'="" S PLANB=$$CONCAS^%QZCHAD(PLANB,PARTIE)
 S PLANB=$$CONCAS^%QZCHAD(PLANB,"PLAN.BASE")
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 S PROFAR=$S($D(@TEMP):@TEMP,1:0)
 I PROFAR=0 S NUMRG=0 D ININIV G CONDL
 S PERE=@TEMP@(PROFAR,"PERE"),NUMRG=@TEMP@(PROFAR,"FILS")
 Q:MODEX=3
 I (ABANDON!ARRET)!STOP G PLUREG
 I ECHEC=0 K @PLANE@(NUMRG) S @PLANR@(@PLANR)=NUMRG,@PLANR=@PLANR+1,@PLAN@(PERE,NUMRG)=0 D ININIV
 I ECHEC=-1 K @PLANE@(NUMRG)
 I $D(@TEMP@(PROFAR,"NOUVEAU.FILS")) G NOUVF
CONDL S NUMRG=$O(@PLAN@(PERE,NUMRG))
 I NUMRG="" S @TEMP@(PROFAR,"NOUVEAU.FILS")="" G NOUVF
 I $$REUSSI(NUMRG) G CONDL
 S @TEMP@(PROFAR,"FILS")=NUMRG,@TEMP@(PROFAR,"TRAITES",NUMRG)=""
 S L=@PLANE@(NUMRG)
 Q
NOUVF 
 S NUMRG=@TEMP@(PROFAR,"NOUVEAU.FILS")
SUIV S NUMRG=$O(@PLANE@(NUMRG))
 I NUMRG="" G PLUREG
 I $D(@TEMP@(PROFAR,"TRAITES",NUMRG)) G SUIV
 S @TEMP@(PROFAR,"FILS")=NUMRG,@TEMP@(PROFAR,"NOUVEAU.FILS")=NUMRG
 S L=@PLANE@(NUMRG)
 Q
PLUREG 
 S NUMRG=0 K @(TEMP)
 S ECHGL=0 I $O(@PLANE@(""))'="" S ECHGL=1
 Q
 
REUSSI(NUM) 
 Q '($D(@PLANE@(NUM)))
 
ININIV 
 S PROFAR=PROFAR+1,@TEMP=PROFAR
 S @TEMP@(PROFAR,"PERE")=NUMRG,@TEMP@(PROFAR,"FILS")=""
 S PERE=NUMRG,NUMRG=""
 Q
 
ADRESSE() 
 Q "^[QUI]RQSGLO(""TLBA"",""ARBRE"")"
 Q "^["""_QUI_"""]RQSGLO(""TLBA"",""ARBRE"")"

