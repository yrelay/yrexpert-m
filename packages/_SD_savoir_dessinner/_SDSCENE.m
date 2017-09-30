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

;%SDSCENE^INT^1^59547,73889^0
SDSCENE ;
 
 
 
 
 N %C,%R,COL,PK,VERS,X,Y
DEB 
 D ^%SDCOL($$^%QZCHW("Generation d'une scene"),1,.COL,.VERS)
 
 I COL="" Q
 K PK
 D SCENE(COL,VERS,1)
 G DEB
 
SCENE(COL,VERS,MODE) 
 
 
 
 
 
 N %C,%R,ADRET,CTR,GLI,GLV,PK,X,Y,STO,TEMP,TINT,SMODE
 S DX=0,DY=2 D CLEBAS^%VVIDEO
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TINT=$$CONCAS^%QZCHAD(TEMP,"CXT.INTERP")
 
 S STO=$$DEF^%SDCCMS(COL,VERS),SMODE=MODE
 I '($D(@STO)) D MES("collection non definie") Q
 
 D INIT
 D POCLEPA^%VVIDEO
 I ('($D(@TINT@("VAR"))))&('($D(@TINT@("IND")))) G SINT
 G AINT
 
SINT 
 
 S DX=0,DY=19 D CLEBAS^%VVIDEO
 I MODE=0 S ADRET="" G ACTIV
 S ADRET="SINT"
 K Y
 S Y="20\BLH\2\\\collection,activation"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G FIN
 I CTR'="" G SINT
 
 I X=2 G ACTIV
 
 G COL
 
AINT 
 S ADRET="AINT"
 S DX=0,DY=19 D CLEBAS^%VVIDEO
 K Y
 I MODE=0 S Y="20\BLH\2\\\contexte.interpretation,activation"
 I MODE'=0 S Y="15\BLH\3\\\collection,contexte.interpretation,activation"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G FIN
 I CTR'="" G AINT
 
 G @("ADR"_$S(MODE'=0:1,1:MODE))
ADR1 
 I X=3 G ACTIV
 
 I X=2 G CTXT
 
 G COL
ADR0 
 I X=2 G ACTIV
 
 G CTXT
 
COL 
 D EXT^%SDCDEF(COL,VERS,1,MODE)
 S MODE=SMODE
 G @ADRET
 
ACTIV 
 K Y
 S Y="25\BLH\2\\\ecran,imprimante"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G ACTF
 I CTR'="" G ACTIV
 K PK
 D ^%SDSCACT(COL,VERS,X=2,1,"","","","")
 S MODE=SMODE
ACTF K CXT
 I ADRET="" G FIN
 G @ADRET
 
CTXT 
 
 I '($D(@TINT@("VAR"))) G IND
 
 I '($D(@TINT@("IND"))) G VAR
MENC K Y
 S Y="20\BLH\2\\\individus,variables"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G AINT
 I CTR'="" G MENC
 S ADRET="MENC"
 I X=1 G IND
 G VAR
IND 
 D IFENI
 D ^%QUOLST(GLI)
 G @ADRET
VAR 
 D IFENV
 D ^%QUOLST(GLV)
 G @ADRET
 
FIN K @(TEMP)
 Q
 
INIT 
 N K,NOBJ,NUMV,NUMI,OBJ,VO,TAB
 D ^%VZEATT
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEMPO") K @(TAB)
 S (NUMV,NUMI)=0
 S NOBJ=""
 F K=1:1 S NOBJ=$O(@STO@("OBJ",NOBJ)) Q:NOBJ=""  S OBJ=$O(@STO@("OBJ",NOBJ,"R","")),VO=$O(@STO@("OBJ",NOBJ,"R",OBJ,"")) D VAROBJ(OBJ,VO)
 K @(TAB)
 Q
 
VAROBJ(OBJ,VO) 
 N ADRO,VAR
 S VAR="",ADRO=$$DEF^%SDOCMS(OBJ,VO)
 
 I $D(@ADRO@("ATT")) S @TINT@("ATT")=""
BCVA S VAR=$O(@ADRO@("VAR",VAR)) I VAR="" G BCIN
 I $D(@TAB@("VAR",VAR)) G BCVA
 S NUMV=NUMV+1
 I '($D(@STO@("VAR"))) S @STO@("VAR",VAR)=""
 S @TINT@("VAR",NUMV)=VAR_"^"_@STO@("VAR",VAR)
 S @TAB@("VAR",VAR)=""
 G BCVA
BCIN S VAR=$O(@ADRO@("IND",VAR)) I VAR="" Q
 I $D(@TAB@("IND",VAR)) G BCIN
 S NUMI=NUMI+1
 I '($D(@STO@("IND",VAR,"BA"))) S @STO@("IND",VAR,"BA")=""
 I '($D(@STO@("IND",VAR,"O"))) S @STO@("IND",VAR,"O")=""
 S @TINT@("IND",NUMI)=VAR_"^"_@STO@("IND",VAR,"BA")_"^"_@STO@("IND",VAR,"O")
 S @TAB@("IND",VAR)=""
 G BCIN
 
IFENI 
 S GLI=$$CONCAS^%QZCHAD(TEMP,"INDIV")
 I $D(@GLI) Q
 S @GLI@("X")=0,@GLI@("Y")=4,@GLI@("L")=79,@GLI@("H")=17
 
 S @GLI@("LI",1,"T")="individu",@GLI@("LI",1,"X")=1
 S @GLI@("LI",2,"T")="repertoire",@GLI@("LI",2,"X")=16,@GLI@("LI",2,"U")="REP^%SDSCENE"
 S @GLI@("LI",3,"T")="nom complet",@GLI@("LI",3,"X")=40,@GLI@("LI",3,"U")="INDREP^%SDSCENE"
 
 S @GLI@("A")=$$CONCAS^%QZCHAD(TINT,"IND")
 S @GLI@("UCMO")="MODBI^%SDSCENE"
 
 S @GLI@("CHI",1)=""
 Q
 
REP 
 I $$GETLBLAN^%VTLBLAN(Y1)'="?" S OK=$$REPM^%QSGEST9(Y1)=2 D:OK=0 MES("Ce repertoire n'existe pas") Q
 
 S Y1=$$UN^%PKCHOIX("^[QUI]RQSAUTOR(WHOIS)",1,5,15)
 S OK=Y1'="",REAF=1
 Q
INDREP 
 N REP
 S REP=$$NOMINT^%QSF($P(@A@(LC),"^",2))
 I $$GETLBLAN^%VTLBLAN(Y1)'="?" S OK=$$IR^%QSGE5(REP,Y1) D:OK=0 MES("Cet individu n'existe pas") Q
 
 S Y1=$$UN^%PKCHOIX($$LISTIND^%QSGEST6(REP),1,5,15)
 S OK=Y1'="",REAF=1
 Q
MODBI 
 N N,CO
 S CO=@A@(LC),N=$P(CO,"^",1),$P(CO,"^",COL)=Y1
 S @STO@("IND",N,"BA")=$P(CO,"^",2),@STO@("IND",N,"O")=$P(CO,"^",3)
 Q
 
IFENV 
 S GLV=$$CONCAS^%QZCHAD(TEMP,"VARTEMP")
 I $D(@GLV) Q
 S @GLV@("X")=0,@GLV@("Y")=4,@GLV@("L")=79,@GLV@("H")=17
 
 S @GLV@("LI",1,"T")="variable temporaire",@GLV@("LI",1,"X")=1
 S @GLV@("LI",2,"T")="valeur",@GLV@("LI",2,"X")=30,@GLV@("LI",2,"U")="OK^%SDSCENE"
 
 S @GLV@("A")=$$CONCAS^%QZCHAD(TINT,"VAR")
 S @GLV@("UCMO")="MODVA^%SDSCENE"
 
 S @GLV@("CHI",1)=""
 Q
OK 
 S OK=1 Q
MODVA 
 N N
 S N=$P(@A@(LC),"^",1)
 S @STO@("VAR",N)=Y1
 Q
 
MES(M) D MESS^%PKUTIL(10,21,$$^%QZCHW(M),1) Q

