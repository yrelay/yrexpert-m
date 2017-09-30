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

;TOP0HACL^INT^1^59547,74873^0
TOP0HACL ;
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,BIG=1,MSG="HAUT DE CLICHES A EDITER" D CLEPAG^%VVIDEO,TO4^%VZCD
QUES S IMPR=0 K ^TACOMPIL($J),^COMPILVU($J) S EFF="                                  ",%NN=1,%IMP=1,%PN=8 D POCLEPA^%VVIDEO W "Donnez le numero d'etude ou numero du lancement batch "
 S DX=5,DY=6 X XY W "Etude : " S DXC=$X
READ S DX=DXC,DY=6 X XY W $J("",40) X XY D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") RET1 S (%SAI,SFA)=Y1 G RETOUR:$D(^[QUI]TREEWORK(SFA,0)) D NUM^TONUMTOT(.SFA) S %SAI=SFA,DX=DXC,DY=6 X XY W $J("",50) X XY W SFA
RETOUR I $D(^[QUI]RESBATCH(SFA)) S NUFA=SFA D BAT G OK1
 D TES G @AD
TES I $D(^[QUI]TREEWORK(SFA,0)) S ARC=$P(^[QUI]TREEWORK(SFA,0),"^",10) I ARC'="" S AD="OK" Q
 S NUF=$N(^[QUI]TREEWORK(SFA)) I (NUF=-1)!(($E(NUF,1,11)'=SFA)!($L(SFA)'=11)) S AD="NONFAIT" Q
 S NUF=SFA
 F %U=1:1 S NUF=$N(^[QUI]TREEWORK(NUF)) Q:(NUF=-1)!($E(NUF,1,11)'=SFA)  I $D(^[QUI]TREEWORK(NUF,0)) S ARC=$P(^[QUI]TREEWORK(NUF,0),"^",10) I ARC'="",'($D(^COMPILVU($J,NUF))) S ^COMPILVU($J,NUF)=1,^TACOMPIL($J,%NN)=NUF_"^"_ARC,%NN=%NN+1
 S AD="OK1" Q
OK S NUFA=SFA I '($D(^COMPILVU($J,NUFA))) S ^COMPILVU($J,NUFA)=1,^TACOMPIL($J,%NN)=NUFA_"^"_ARC,%NN=%NN+1
OK1 I %PN>22 S DX=0,DY=8 D CLEBAS^%VVIDEO S %PN=8
 S DX=10,DY=%PN,%PN=%PN+1 X XY W %SAI
AIJ S DX=26,DY=6 X XY W EFF G READ
RET1 G:'($D(^TACOMPIL($J))) FIN
WOR G:'($D(^TACOMPIL($J))) FIN
 D POCLEPA^%VVIDEO W "OK pour l'impression (O/N) ? " R *X:^TOZE($I,"ATTENTE") G FIN:X=-1 S X=$C(X) G WOR:(X'="O")&(X'="N"),FIN:X="N" S %NN="",IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0) O IMPR
LWO S %NN=$O(^TACOMPIL($J,%NN)),DOLARI=$I G:%NN="" FLOW S NUFA=^TACOMPIL($J,%NN),ARC=$P(NUFA,"^",2),NUFA=$P(NUFA,"^",1),TWREF=0 U IMPR W #,!,"Etude : ",NUFA,?30,"ARC : ",ARC,!,!,! D ^TOP0HAUC G LWO
FLOW C IMPR G FIN
NONFAIT S DY=DY+2 X XY D ^%VSQUEAK,POCLEPA^%VVIDEO W "Etude inconnue !! [RETURN] " R *RET S DX=26,DY=6 X XY W EFF D POCLEPA^%VVIDEO G READ
IDSFA I $D(^[QUI]TREEWORK(SFA)) S NUFA=SFA,SFA=$P(^[QUI]TREEWORK(NUFA,0),"^",4),PPSFA=$P(SFA,"/",1) G RETOUR
 
 G NONFAIT
FIN Q
LISFAB K VALCLE D CLEPAG^%VVIDEO W ?25,"LISTE DES ARTICLES DEJA FABRIQUES",!,! S ARFA=$P(SFA,"?",1),NOMTAB="^[QUI]ANTETUDE",VALCLE(3)=0,VALCLE(1)=ARFA,ADR="ARFAB^TOEDVACO" D ^%VKMULG G:STOP=1 QUES D POCLEPA^%VVIDEO W "FIN" R *RET D CLEPAG^%VVIDEO G QUES
ARFAB Q:B3'=0  W !,%RS(1),?64,B2 I $Y=20 D ALORS S:CONT=0 STOP=1
 Q
ALORS 
 D POCLEPA^%VVIDEO W "(S)uite,(F)in " R *EA I $C(EA)="F" S CONT=0 D CLEPAG^%VVIDEO G END
 D CLEPAG^%VVIDEO S CONT=1 Q
END Q
BAT S PGE=-1,LI=-1,TB="^[QUI]RESBATCH(NUFA)"
 F %U=1:1 S PGE=$N(@TB@(PGE)) Q:PGE=-1  S LI=-1 F %U1=1:1 S LI=$N(@TB@(PGE,LI)) Q:LI=-1  S SFA=$P(@TB@(PGE,LI),"|",1) I SFA'="" D TES
 K PGE,LI,TB,%U,%U1 Q

