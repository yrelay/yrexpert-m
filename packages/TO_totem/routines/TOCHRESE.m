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

;TOCHRESE^INT^1^59547,74871^0
TOCHRESE ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("RESULTATS A EDITER") D TO4^%VZCD S DXG=1,DYH=7,LV=15,LH=77,BLD=1 D CARS^%VVIDEO
 N LINK,LIMIT
 S LIMIT=$S($D(^KLNTOT($J)):5,1:99)
 S LINK=$S($D(^KLNTOT($J)):1,1:0)
 K ^ROUAUT($J),CHOICE,CHOISI S DX=0,DY=8 X XY F %RR=1:1:LIMIT S LG=$T(RES+%RR),LG=$P(LG,";;",2) Q:LG="*"  D AFF
CH S TOUS=0 D POCLEPA^%VVIDEO W $$^%QZCHW("(RETURN) selection,(CTRLG) gomme,(CTRLF) fin,(CTRLA) abandon ") S NXI=3,NXS=5,NYI=8,NYS=$S(LINK:14,1:21),MPASX=0,MPASY=1,DX=4,DY=9 X XY
CH1 D ^%VZECUR S PY=$Y G FIN:X1=1,FIN1:X1=6,GOMME:X1=7
 G:X1'=13 CH1
 S VAL=CHOICE(PY) D REV^%VVIDEO,BLK^%VVIDEO I VAL'[$$^%QZCHW("Tous") S CHOISI($P(VAL,"^",2))=1 G SCH
 S TOUS=1 F ZR=2,3,5,7,8,9,10,12 S CHOISI(ZR)=1
 G SCH
GOMME S VAL=CHOICE(PY) D NORM^%VVIDEO I VAL'[$$^%QZCHW("Tous (") K CHOISI($P(VAL,"^",2)) G SCH
 S TOUS=0 F ZR=2,3,5,7,8,9,10,12 K CHOISI(ZR)
 G SCH
SCH S DX=5,DY=PY X XY W $P(VAL,"^",1) S DX=4,DY=PY+1
 S:DY>18 DY=18 X XY D NORM^%VVIDEO G CH1
FIN1 D TR
FIN D CLEPAG^%VVIDEO K NXI,NXS,NYI,NYS,MPASX,MPASY,VAL,CHOICE,CHOISI,ZR,RO,LG,%RR,X1,ZP,PLC,PCH Q
AFF I $P(LG,"~",2)="" G AFFI
 S TEST=$P(LG,"~",2) I @TEST=1 G AFFI
 Q
AFFI S %RRR=$S(%RR<10:" ",1:""),DX=5,DY=DY+1 X XY W %RRR,%RR,"   ",$$^%QZCHW($P(LG,"~",1)) S PY=$Y,CHOICE(PY)=%RRR_%RR_"   "_$$^%QZCHW($P(LG,"~",1))_"^"_%RR Q
TR S PCH=-1 F ZP=1:1 S PCH=$N(CHOISI(PCH)) Q:PCH=-1  S RO=$T(ROUT+PCH),RO=$P(RO,";;",2),^ROUAUT($J,PCH)=RO
 Q
RES 
 ;;Tous
 ;;Composants
 ;;Valeurs des parametres
 ;;Valeurs des parametres par ordre d'evaluation
 ;;Parametres non evalues
 ;;Resultats matieres~^TOZE($I,"MATIERE")
 ;;Resultats matieres par ordre d'evaluation~^TOZE($I,"MATIERE")
 ;;Parametres machines~^TOZE($I,"MACHINE")
 ;;Gammes de fabrication~^TOZE($I,"PHASE")
 ;;Gamme detaillee~^TOZE($I,"PHASE")
 ;;Recapitulatifs des durees et des couts a l'unite
 ;;Etude comparative
 ;;*
ROUT 
 ;;
 ;;TO3RESNO
 ;;TO3RESUM
 ;;TORESOEV
 ;;TO3PNOEV
 ;;TO3RESMA
 ;;TOMATOEV
 ;;TOPARMAC
 ;;TO3RESPH
 ;;TODETAPH
 ;;TORESDCT
 ;;TORESCOM
 ;
 ;
 ;

