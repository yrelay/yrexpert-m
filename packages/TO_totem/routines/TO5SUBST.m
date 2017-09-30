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

;TO5SUBST^INT^1^59547,74871^0
TO5SUBST ;
 
 D CLEPAG^%VVIDEO
Q1 S DX=5,DY=5 X XY W $$^%QZCHW("Changer dans le S-F de : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S ARTI=Y1
Q2 S DX=20,DY=DY+2 X XY W $$^%QZCHW("L'item : ") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1'="" Q3 S DE=5,FI=$Y D ^%ABNETTO G Q1
Q3 S IT1=Y1
 S DX=20,DY=DY+1 X XY W $$^%QZCHW("par    : ") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1'="" SUIT S DE=7,FI=$Y D ^%ABNETTO G Q2
SUIT S IT2=Y1
 W !,!,?10,$$^%QZCHW("OK pour changer "),IT1,$$^%QZCHW(" par "),IT2,$$^%QZCHW(" (O/N) ? ") R *REP S REP=$C(REP) G:REP'=$$^%QZCHW("O") FIN
 W !,!,?10,$$^%QZCHW("Patientez un instant...")
 S GRI=-1 F UU=0:0 S GRI=$N(^[QUI]ESTAPARU(ARTI,IT1,GRI)) G:GRI=-1 TO5SUBST D TRAIT K ^[QUI]ESTAPARU(ARTI,IT1,GRI) S ^[QUI]ESTAPARU(ARTI,IT2,GRI)=1
TRAIT G:'($D(^[QUI]IREPGRIL(GRI))) FIN
 S REFGRIL=^[QUI]IREPGRIL(GRI),TGRIL=$P(REFGRIL,"|",1),RGRIL=$P(REFGRIL,"|",2),TBCH="^[QUI]"_TGRIL_"("_RGRIL_")" G:'($D(@TBCH)) FIN
 S (ORS,RS)=@TBCH,%CAR="^" D ^%QZCHNBC S NBCAR=%NBCAR+1
 F VV=1:1:NBCAR S ITT=$P(RS,"^",VV) D:ITT[IT1 SUBST
 S @TBCH=RS G FIN
SUBST I ITT=IT1 S $P(RS,"^",VV)=IT2 G FIN
 S ADRF="ADR^TO5SUBST",XDP="("_ITT_")" D ^%ABFSQUL,RECONS^%ABFSQUL S $P(RS,"^",VV)=EX G FIN
ADR I PCH=IT1 S VPOL(VI)=IT2
 G FIN
FIN Q

