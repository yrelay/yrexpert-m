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
;! Nomprog     : %VZECHO                                                      !
;! Module      : VZ                                                             !
;! But         : Generation et Affichage d'un menu de choix                   !
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

;%VZECHO^INT^1^59547,74037^0
ZCHOICE(TAB) 
 ;;-------------------------------------------------------------------
 ;;      Generation et Affichage d'un menu de choix
 ;;                   entre plusieurs options
 ;;
 ;;  choix gere sous la forme d'un menu de bas de page (mais affi-
 ;;  che a partir de la position du curseur ou d'apres les coordon-
 ;;  nees specifiees)
 ;;      selon la sous-routine appelee :
 ;; entrees : MS         -> message a afficher
 ;;           TAB        -> nom table libelles options
 ;;                              @TAB(1) = option par defaut
 ;;           XG         -> limite gauche affichage libelles
 ;;           XD         -> limite droite affichage libelles
 ;;           YH         -> ligne d'affichage des libelles
 ;;              
 ;; sortie  : Z2CHOICE   -> libelle de l'option selectionnee
 ;;                         Ctrl<car> si caractere de controle 
 ;;-------------------------------------------------------------------- 
 
 N XD,XG,YH,LARG,OP,LC
 S LARG=0,OP=""
 F %U=1:1 S OP=$O(@TAB@(OP)) Q:OP=""  S LARG=(LARG+$L(@TAB@(OP)))+2
 S YH=$Y,XG=$X,XD=($X+LARG)+5
 Q $$AD(TAB,XG,XD,YH)
 ;;       message et options a partir de la position courante
MES(MS,TAB) 
 S MS=MS_" "
 W $$^%QZCHW(MS)
 Q $$ZCHOICE(TAB)
 ;;      message en position courante puis options a partir des 
 ;;      coordonnees specifiees
ADMES(MS,TAB,XG,XD,YH) 
 W $$^%QZCHW(MS)
 Q $$AD(TAB,XG,XD,YH)
 ;;      options a partir de coordonnees specifiees
AD(TAB,XG,XD,YH) 
 N MEN,CONT,CHOICE,LC
 S MEN="^GL2CHOIX($J)"
 K ^GL2CHOIX($J)
 S OP="" F %U=1:1 S OP=$O(@TAB@(OP)) Q:OP=""  S ^GL2CHOIX($J,%U)=@TAB@(OP)_"^"_@TAB@(OP)
 
LEC D ^%VQUIKMN(XG,XD,YH,MEN,.CHOICE,.CONT)
 Q:CONT'="" $A(CONT)-64
 G:CHOICE="" LEC
 K XG,XD,YH,MEN,CONT
 Q CHOICE

