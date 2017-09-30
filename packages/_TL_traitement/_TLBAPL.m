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

;%TLBAPL^INT^1^59547,74028^0
INITPL ;
 N I,IP,EP,ECH,DATEPLA,DATETRT,DATEPLP,TEMP,CREPL
 I MODEX'=3 G GOIN
 
 S PLAN=@GLOETD@(NIVEAU,"NOM.PLAN")
 S PLANE=@GLOETD@(NIVEAU,"NOM.ECHEC")
 S PLANR=@GLOETD@(NIVEAU,"NOM.SORTIE")
 Q
GOIN 
 S PLAN=$$CONCAS^%QZCHAD($$ADRESSE,TRT)
 I ETIQ="" S PLAN=$$CONCAS^%QZCHAD(PLAN,"PRINCIPAL")
 I ETIQ'="" S PLAN=$$CONCAS^%QZCHAD(PLAN,ETIQ) I PARTIE'="" S PLAN=$$CONCAS^%QZCHAD(PLAN,PARTIE)
 S PLANR=PLAN
 
 S I="",IP="",EP=""
 I DEROUL="PROCEDURAL" G SRECH
 S DATETRT=$$GETDATE^%TLGEST(TRT)
BRCHPL S I=$O(@PLAN@(I))
 I I="" G SRECH
 
 I $D(@PLAN@(I,"CREATION")) G BRCHPL
 S DATEPLA=$S($D(@PLAN@(I,"DATE")):@PLAN@(I,"DATE"),1:"")
 I $$CMPDAT^%TLBAINT(DATEPLA,DATETRT)=1 G CHMINER
 
 D TUEPL($$CONCAS^%QZCHAD(PLAN,I))
 G BRCHPL
CHMINER 
 S ECH=$S($D(@PLAN@(I,"ECHECS")):@PLAN@(I,"ECHECS"),1:"")
 I IP="" S IP=I,EP=ECH,DATEPLP=DATEPLA G BRCHPL
 I (EP="")!((ECH'="")&(ECH<EP)) G CHNV
 I (ECH=EP)&($$CMPDAT^%TLBAINT(DATEPLA,DATEPLP)'=0) G CHNV
 
 D TUEPL($$CONCAS^%QZCHAD(PLAN,I))
 G BRCHPL
CHNV 
 D TUEPL($$CONCAS^%QZCHAD(PLAN,IP))
 S IP=I,EP=ECH,DATEPLP=DATEPLA G BRCHPL
SRECH 
 S CREPL=0
 I IP'="" G EXISPL
 
CREAPL S CREPL=1
 S PLAN=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PLAN.EXECUTION") K @(PLAN)
 D CREPLA^%TLBAINT(PLAN)
 G RECHPR
 
EXISPL 
 S PLAN=$$CONCAS^%QZCHAD(PLAN,IP)
 S @PLAN@("UTILISATEURS")=$S($D(@PLAN@("UTILISATEURS")):@PLAN@("UTILISATEURS"),1:"")+1
 S PLAN=$$CONCAS^%QZCHAD(PLAN,"PLAN")
 
RECHPR 
 I DEROUL="PROCEDURAL" S PLANR=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",REUSSITES") K @(PLANR) G IPARPR
 S I=1
BRCHPR I $D(@PLANR@(I)) S I=I+1 G BRCHPR
 S PLANR=$$CONCAS^%QZCHAD(PLANR,I)
IPARPR 
 S @PLANR@("CREATION")=""
 S @PLANR@("DATE")=$H
 S PLANR=$$CONCAS^%QZCHAD(PLANR,"PLAN")
 S @PLANR=1
 
INIPLE 
 S PLANE=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",ECHEC") K @(PLANE)
 S I=1
BCLECB I $D(@PLAN@(I)) S @PLANE@(@PLAN@(I))=I,I=I+1 G BCLECB
 
 I (MODAF=2)!(MODAF=3) D INITRT^%TLBAINT D:MODAF=2 REAF^%TLBAIF(2) D:$D(@PLAN@(1)) ARBAPP^%TLBAINT
 
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION") K @(TEMP)
 S @TEMP@("POSITION.PLAN")=0,@TEMP@("REGLE")="",@TEMP@("REUSSITE")=0
 S @TEMP@("ECHEC.GLOBAL")=0
 
 S @GLOETD@(NIVEAU,"NOM.PLAN")=PLAN
 S @GLOETD@(NIVEAU,"NOM.ECHEC")=PLANE
 S @GLOETD@(NIVEAU,"NOM.SORTIE")=PLANR
 S @GLOETD@(NIVEAU,"CREATION.PLAN")=CREPL
 Q
 
STOPL 
 N I
 I ABANDON=2 Q
 I '(@GLOETD@(NIVEAU,"CREATION.PLAN")) D DECUT(PLAN)
STOCK 
 I '(ABANDON) G PLAN1
 S PLANR=$$ZSUBST^%QZCHSUB(PLANR,",""PLAN"")",")")
 K @(PLANR)
 G FSTRAT
PLAN1 
 S I=""
BSUPLE 
 S I=$O(@PLANE@(I))
 I I="" G FSUPLE
 S @PLANR@(@PLANR)=I,@PLANR=@PLANR+1
 G BSUPLE
FSUPLE 
 S PLANR=$$ZSUBST^%QZCHSUB(PLANR,",""PLAN"")",")")
 S @PLANR@("ECHECS")=ECHGL
 K @PLANR@("CREATION")
 S PLANR=$$CONCAS^%QZCHAD(PLANR,"PLAN")
FSTRAT 
 Q
DECUT(PLAN) 
 N NB
 I PLAN["""PLAN"")" S PLAN=$$ZSUBST^%QZCHSUB(PLAN,",""PLAN"")",")")
 I (PLAN'="")&$D(@PLAN@("UTILISATEURS")) S NB=@PLAN@("UTILISATEURS") I NB>0 S @PLAN@("UTILISATEURS")=NB-1
 Q
TUEPL(PLAN) 
 I PLAN["""PLAN"")" S PLAN=$$ZSUBST^%QZCHSUB(PLAN,",""PLAN"")",")")
 I $S($D(@PLAN@("UTILISATEURS")):@PLAN@("UTILISATEURS"),1:0)'>0 K @(PLAN)
 Q
 
RECHL 
 I NUMRG>$ZP(@"^[QUI]TTL(TRT,2)"@("")) S L=$ZP(@PLAN@(""))+1 Q
 S L=1
BRECH I L>$ZP(@PLAN@("")) Q
 I @PLAN@(L)=NUMRG Q
 S L=L+1
 G BRECH
 
REUSSI(NUM) 
 Q '($D(@PLANE@(NUM)))
 
REGSUI 
 N TEMP
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 S L=@TEMP@("POSITION.PLAN"),NUMRG=@TEMP@("REGLE")
 I MODEX=3 Q
 I L=0 G CONDL
 I (ABANDON!ARRET)!STOP G PASSUI
TRTRES 
 I ECHEC=-1 K @PLANE@(NUMRG) G FTRES
 
 I ECHEC=1 S @TEMP@("ECHEC.GLOBAL")=@TEMP@("ECHEC.GLOBAL")+1 G FTRES
REGREU 
 S @TEMP@("REUSSITE")=1,@PLANR@(@PLANR)=NUMRG,@PLANR=@PLANR+1
 K @PLANE@(NUMRG)
FTRES 
 
 I DEBRAN'="" S NUMRG=DEBRAN D RECHL S DEBRAN="",L=L-1
CONDL 
 S L=L+1
 I L>$ZP(@PLAN@("")) G PASSUI
 
 S NUMRG=@PLAN@(L)
 I DEROUL'="PROCEDURAL",$$REUSSI(NUMRG) G CONDL
 S @TEMP@("POSITION.PLAN")=L,@TEMP@("REGLE")=NUMRG
 Q
PASSUI 
 I ABANDON G PLUREG
 I (DEROUL="PROCEDURAL")!((ETIQ'="")&(ARRET=1)) G PLUREG
 I (@TEMP@("REUSSITE")=0)!(@TEMP@("ECHEC.GLOBAL")=0) G PLUREG
 S @TEMP@("REUSSITE")=0,@TEMP@("ECHEC.GLOBAL")=0,L=0,STOP=0,ARRET=0
 G CONDL
PLUREG 
 S NUMRG=0,ECHGL=@TEMP@("ECHEC.GLOBAL") I ABANDON'=2 K @(TEMP)
 Q
TRTEXD 
 N TEMP
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 I $$REUSSI(NUMRG) Q
 I ECHEC=-1 K @PLANE@(NUMRG) Q
 
 I ECHEC=1 Q
 
 S @TEMP@("REUSSITE")=1,@PLANR@(@PLANR)=NUMRG,@PLANR=@PLANR+1
 K @PLANE@(NUMRG)
 Q
CHREG(L) 
 N %V S %V=@PLAN@(L) Q %V
REGCOU() 
 N TEMP
 S TEMP=$$CONCAS^%QZCHAD(GLOETD,NIVEAU_",PILE.EXECUTION")
 S TEMP=@TEMP@("REGLE") Q TEMP
ADRESSE() 
 Q "^[QUI]BAPLAN"
 Q "^["""_QUI_"""]BAPLAN"

