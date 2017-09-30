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

;%MZELDOB^INT^1^59547,73871^0
MOZELDOB ;
 
 D CLEPAG^%VVIDEO
 D ^%VZCD(1,39,0,4,1,0,$$^%QZCHW("CONSULTATION BREVE"))
BEG D AFFDOM
BEG1 S DX=6,DY=6 X XY W "No du domaine a  consulter : " S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) BEG1 G:'($D(DOM(Y1))) BEG
 S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=(40-($L(DOM(Y1))+4))\4 X XY D CAG^%VVIDEO W "* ",DOM(Y1)," *"
 S HA=0,DX=0,DY=7 X XY D CLEBAS^%VVIDEO X XY S PAR=-1,NB=1 D BLD^%VVIDEO
 I %PCH=3 F UU=0:0 S PAR=$N(^[QUI]DESMACH(PAR)) Q:PAR=-1  W !,?20,PAR S NB=NB+1 D:NB>10 STOP Q:HA=1
 I %PCH=4 F UU=0:0 S PAR=$N(^[QUI]DESOUT(PAR)) Q:PAR=-1  W !,?20,PAR S NB=NB+1 D:NB>10 STOP Q:HA=1
 I %PCH'=3 F UU=0:0 S PAR=$N(^[QUI]MOZITEM(DOM(Y1),PAR)) Q:PAR=-1  W !,?20,PAR S NB=NB+1 D:NB>10 STOP Q:HA=1
 I HA'=1 D POCLEPA^%VVIDEO W "FIN [Return]" R *REP
 S DX=0,DY=6 D CLEBAS^%VVIDEO G BEG
FIN S CTRLF=0 K CTRLA Q
STOP D POCLEPA^%VVIDEO W "(F)in,autre caractere pour continuer" R *REP S REP=$C(REP) S:REP="F" HA=1 S NB=1,DX=0,DY=7 D CLEBAS^%VVIDEO X XY
 Q
AFFDOM S TR=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA")),NR=0,DX=10,DY=7 X XY
 F IT1=1:1 S P1=$P(TR,",",IT1) Q:P1=""  S NR=NR+1,DY=DY+1,DOM(NR)=P1 S:DY=22 DY=8,DX=DX+40 X XY W $S(NR<10:" ",1:""),NR," ",P1
 D NORM^%VVIDEO Q

