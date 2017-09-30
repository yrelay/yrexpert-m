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

;TOTSHP3^INT^1^59547,74876^0
%ABTSHP ;
 
 S INV=0,MODN="N",MODR="R",CARET=" " G TR
TR S HA=0 W ! F UU=1:1 S LIG=$T(TEXT+UU) Q:LIG=""  S LIG=$P(LIG,";;",2) D ECRI G:HA=1 FIN
FIN Q
ECRI W ! S MOD=$S(INV=0:MODN,1:MODR) F VV=1:1 S CAR=$E(LIG,VV) Q:CAR="/"  D ALORS Q:HA=1
 Q
ALORS I (CAR'=CARET)&(MOD=MODN) S ACAR=CAR,MOD=MODR G W
 I (CAR=CARET)&(MOD=MODR) S CAR=ACAR G W
 S MOD=MODN
W W CAR
 Q
TEXT 
 ;;t        t o        o t        t e       e m         m/
 ;;   *  *    *  *  *  *    *  *    * *       * * * * * */
 ;;   *  *    *  *  *  *    *  *    *    *    * * * * * */
 ;;   *  *    *  *  *  *    *  *    * *       * *     * */
 ;;   *  *    *        *    *  *    *       * * *     * */
 ;;
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("MERCI !! J'ai tout ce qu'il me faut.....") H 1 Q
 Q
LISJEU 

