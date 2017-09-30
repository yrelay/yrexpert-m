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

;%LXUC6^INT^1^59547,73871^0
LEXUC6 ;
BEG S:'($D(^TOZE($I,"SIMUL"))) ^TOZE($I,"SIMUL")=0 S:'($D(%UCATT)) %UCATT=60
 S XDP1=XDP K ^TRGUI($J) I XDP["""" D ^%QZCHGUI(XDP,"^TRGUI($J)") S XDP=^TRGUI($J,"SUB")
 D CURRENT^%IS K ^VPOL($I),^T($I),^LOCA($I),^FVPOL($I),^PARCHGR($I) D L,CLEPAG^%VVIDEO W $$^%QZCHW("Expression analysee : "),!,!,?5,XDP1 S:(XDP1["$")!(XDP1[":") EXIOP=0
 
 S ADRF="VLEX"
END S ECHOUE=0,IKS=$N(^T($I,-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(^T($I,IK)) Q:IKS=-1  I IKS'=(IK+1) S (%PCH,PCH)=$E(XDP,IK+1,IKS-1),^VPOL($I,VI)=PCH,^FVPOL($I,VI)=PCH S:(^T($I,IK)="'")!(^T($I,IKS)="'") RL(VI)=1 D:$E(PCH,1)'="$" @ADRF S VI=VI+1
 I ^TOZE($I,"SIMUL")=1 S ECHOUE=0
 I ECHOUE=1 D ^%VZEAVT($$^%QZCHW("Expression refusee ")) S REFUSE=1 G FIN
 D RECONS
 W !,!,$$^%QZCHW("Expression retenue : "),!,!,EX S REFUSE=0,XDP=XDP1
QUES D POCLEPA^%VVIDEO W $$^%QZCHW("Acceptez-vous (O/N) ? ") R *REP:%UCATT S:REP=-1 REP=79 S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&(REP'=$$^%QZCHW("N")) QUES S:REP=$$^%QZCHW("N") REFUSE=1 G FIN
L S EXIC=0,EXIOP=0 K T,MA,MI,RL S IX=1 F I="~","'",":",",",";","_","#","+","*","-","/","\","[","]","(",")","&","!","<",">","=" D REC
 G FIN
REC S POSI=1 F Z1=0:0 S POSI=$F(XDP,I,POSI) Q:POSI=0  S:I="_" EXIC=1 S:(I'="_")&((I'="'")&((I'="(")&((I'=")")&(I'=";")))) EXIOP=1 S ^LOCA($I,IX)=POSI-1,^T($I,^LOCA($I,IX))=I S:I="[" MI(POSI-1)=IX S:I="]" MA(POSI-1)=IX S IX=IX+1
 G FIN
RECONS S ITS=$N(^T($I,-1)),IE=1,EX="",EXF="" F WW=0:0 S IT=ITS,ITS=$N(^T($I,IT)),EX=EX_^T($I,IT),EXF=EXF_^T($I,IT) Q:ITS=-1  S:ITS'=(IT+1) EXF=EXF_^FVPOL($I,IE),EX=EX_^VPOL($I,IE),IE=IE+1
 S LEXF=$L(EXF),LEX=$L(EX),EX=$E(EX,2,LEX-1),EXF=$E(EXF,2,LEXF-1)
FIN Q
BESABR 
 
 
 I '($D(^TOZE($I,"BESABR"))) S ^TOZE($I,"BESABR")=0
 I ^TOZE($I,"BESABR")=0 G FIN
BEST S OPCH=PCH,LIBCPT=PCHCOMP D ^%LXBESTA G FIN
VLEX I $E(PCH)="""" S CHP=$E(PCH,2,$L(PCH)-1) I CHP'="",$D(^TRGUI($J,"SUB",CHP)) W !,^TRGUI($J,"SUB",CHP),?40,"= ",$$^%QZCHW("est un libelle") S ^VPOL($I,VI)=^TRGUI($J,"SUB",CHP),^FVPOL($I,VI)=^TRGUI($J,"SUB",CHP) G FIN
 W !,PCH,?40,"= " D TO^%QZNBN1 I ISNUM W PCH G FIN
 I ($E(PCH,1)'="""")!($E(PCH,$L(PCH))'="""") G SUIT
 I EXIOP=1 S ECHOUE=1 W PCH,$$^%QZCHW(" Une constante ???") G FIN
 W PCH,$$^%QZCHW(" est une constante") G FIN
SUIT S PARA=PCH D ^%QZCHBT S PCH=PARA,VID=0 D LEX S DX=$X,DY=$Y G:VID=1 FIN
UNKN I CONCUR'=0 G AMBI
 I EXIOP=0 G UKNCO
UKNOP S ECHOUE=1 D BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO X XY W $$^%QZCHW("Inconnu") D NORM^%VVIDEO G FIN
UKNCO S ^VPOL($I,VI)=""""_^VPOL($I,VI)_"""",^FVPOL($I,VI)=^VPOL($I,VI) W ^VPOL($I,VI),$$^%QZCHW(" est une constante") G FIN
AMBI G OK:CONCUR=1,OKIND:CONCUR="IND"
 S ECHOUE=1 D BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO X XY W $$^%QZCHW("Ambigu") D NORM^%VVIDEO G FIN
OKIND S ^FVPOL($I,VI)=PCHCOMP,^VPOL($I,VI)=PCH X XY W PCH,"(",PCHCOMP," [",PCHIND,$$^%QZCHW(" indice])") G OKSU
OK 
 D:PCH=PCHCOMP BESABR S ^FVPOL($I,VI)=PCHCOMP,^VPOL($I,VI)=PCH X XY W PCH,"(",PCHCOMP,")"
OKSU S ^PARCHGR($I,PCH)=PCHCOMP G FIN
LEX S SYNON=0 I PCH="" S VID=1 G FIN
 D ^%LXABR I CONCUR'=1 G FIN
 I $D(^[QUI]TOLEX(PCHCOMP)) S SYNON="M" G FIN
 I '($D(^[QUI]TOSYNONY(PCHCOMP))) G FIN
 S SYNON="S",PRECOS=$N(^[QUI]TOSYNONY(PCHCOMP,-1)) I PRECOS=-1 S ECHOUE=1,SYNON=0 G FIN
 S PCHCOMP=PRECOS D BEST G FIN
EV(XDP,EXF) 
 S EXF="",XDP="("_XDP_")" G BEG
 
TEST W !,$$^%QZCHW("A tester : ") R X Q:X=""
 D EV^%LXUC6(X,.OUT) W !,?10," ==> ",OUT G TEST
ADR S ^VPOL($I,VI)=^VPOL($I,VI)_"/"_^VPOL($I,VI) Q

