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

;TOEDVACO^INT^1^59547,74872^0
TOEDVACO ;
 
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Valeurs a recapituler") D CLEPAG^%VVIDEO,TO4^%VZCD
QUES S IMPR=0 K ^TACOMPIL($I),^COMPILVU($I) S EFF="                                  ",%NN=1,%IMP=1,%PN=8 D POCLEPA^%VVIDEO W $$^%QZCHW("Donnez le numero d'etude ou numero du lancement batch ")
 S DX=5,DY=6 X XY W $$^%QZCHW("Comparaisons pour  : ")
READ S DX=26,DY=6 D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") RET1 S SFA=Y1
RETOUR I $D(^[QUI]RESBATCH(SFA)) S NUFA=SFA D BAT G OK1
 G:$D(^[QUI]TREEWORK(SFA)) OK S NUFA=$N(^[QUI]TREEWORK(SFA)) G:(NUFA=-1)!(($E(NUFA,1,11)'=SFA)!($L(SFA)'=11)) NONFAIT
OK S NUFA=SFA I '($D(^COMPILVU($I,NUFA))) S ^COMPILVU($I,NUFA)=1,^TACOMPIL($I,%NN)=NUFA,%NN=%NN+1
OK1 I %PN>22 S DX=0,DY=8 D CLEBAS^%VVIDEO S %PN=8
 S DX=10,DY=%PN,%PN=%PN+1 X XY W NUFA
AIJ S DX=26,DY=6 X XY W EFF G READ
RET1 G:'($D(^TACOMPIL($I))) FIN
WOR D ^TOITABCO G TOEDVACO
 G FIN
NONFAIT S DY=DY+2 X XY D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Etude inconnue !! [RETURN] ") R *RET S DX=26,DY=6 X XY W EFF D POCLEPA^%VVIDEO G READ
IDSFA I $D(^[QUI]TREEWORK(SFA)) S NUFA=SFA,SFA=$P(^[QUI]TREEWORK(NUFA,0),"^",4),PPSFA=$P(SFA,"/",1) G RETOUR
 
 G NONFAIT
FIN Q
LISFAB K VALCLE D CLEPAG^%VVIDEO W ?25,$$^%QZCHW("LISTE DES ARTICLES DEJA FABRIQUES"),!,! S ARFA=$P(SFA,"?",1),NOMTAB="^[QUI]ANTETUDE",VALCLE(3)=0,VALCLE(1)=ARFA,ADR="ARFAB^TOEDVACO" D ^%VKMULG G:STOP=1 QUES D POCLEPA^%VVIDEO W $$^%QZCHW("FIN") R *RET D CLEPAG^%VVIDEO G QUES
ARFAB Q:B3'=0  W !,%RS(1),?64,B2 I $Y=20 D ALORS S:CONT=0 STOP=1
 Q
ALORS 
 D POCLEPA^%VVIDEO W $$^%QZCHW("(S)uite,(F)in ") R *EA D TOUCHE^%INCCLAV(EA,.EA)
 I $C(EA)="F" S CONT=0 D CLEPAG^%VVIDEO G END
 D CLEPAG^%VVIDEO S CONT=1 Q
END Q
BAT S PGE=-1,LI=-1,TB="^[QUI]RESBATCH(NUFA)" F %U=1:1 S PGE=$N(@TB@(PGE)) Q:PGE=-1  S LI=-1 F %U1=1:1 S LI=$N(@TB@(PGE,LI)) Q:LI=-1  S SFA=$P(@TB@(PGE,LI),"|",1) I SFA'="",'($D(^COMPILVU($I,SFA))) S ^COMPILVU($I,SFA)=1,^TACOMPIL($I,%NN)=SFA,%NN=%NN+1
 K PGE,LI,TB,%U,%U1 Q

