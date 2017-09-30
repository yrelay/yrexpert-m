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

;TOTSH^INT^1^59547,74876^0
TOTSH ;
 
 S ADR=$R(2) G @ADR
0 S INV=0,MODN="N",MODR="R",CARET="*" G TR
1 S INV=1,MODN="R",MODR="N",CARET="*" D BLD^%VVIDEO,REV^%VVIDEO
TR S HA=0 D CLEPAG^%VVIDEO,CUROF^%VVIDEO S DX=13,DY=7 X XY F UU=1:1 S LIG=$T(TEXT+UU) Q:LIG=""  S LIG=$P(LIG,";;",2) D ECRI G:HA=1 FIN
 G:INV=0 FIN S DXG=11,DXD=67,DYH=7,DYB=13 D NORM^%VVIDEO,^TO3CADRB
FIN D NORM^%VVIDEO,CURON^%VVIDEO W *-1 Q
ECRI W ! S DY=$Y,DX=12 X XY S MOD=$S(INV=0:MODN,1:MODR) F VV=1:1 S CAR=$E(LIG,VV) Q:CAR="/"  D ALORS Q:HA=1
 Q
ALORS I (CAR=CARET)&(MOD=MODN) S WX=$X,WY=$Y D POCLEPA^%VVIDEO,BLD^%VVIDEO,REV^%VVIDEO S MOD=MODR,DX=WX,DY=WY X XY G W
 I (CAR=CARET)&(MOD=MODR) S WX=$X,WY=$Y D POCLEPA^%VVIDEO,NORM^%VVIDEO S MOD=MODN,DX=WX,DY=WY X XY
W W " " R *X:0 S:X'=-1 HA=1
 Q
TEXT 
 ;;*        * *        * *        * *       * *           */
 ;;   *  *    *  *  *  *    *  *    *  *      *  * * * *  */
 ;;   *  *    *  *  *  *    *  *    *    *    *  * * * *  */
 ;;   *  *    *  *  *  *    *  *    *  *      *  *     *  */
 ;;   *  *    *        *    *  *    *       * *  *     *  */

