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

;TO3MODPA^INT^1^59547,74870^0
TO3MODPA ;
 
 D:DEV="ECR" CLEPAG^%VVIDEO W !,!,LSTAR,!,"|",?10,NUC,?20,$$^%QZCHW("Parametres de : "),?79,"|",!,"|",?79,"|",!,"|",?10,TOID,?79,"|",!,LSTAR,!,"|",?79,"|" D EDIT G:%ABAND=1 FIN G SUIT
 Q
EDIT S DEBP=$Y,NEXT=-1,LI=$Y F I=1:1 S NEXT=$N(^[QUI]EXPL(YA,NEXT)) G:NEXT=-1 IMP D EXP G:%ABAND=1 FIN
EXP Q:'($D(^[QUI]TVPAR(NUFA,TWREF,NEXT)))  W ! S PY=$Y W "|",?5 S PX=$X W NEXT,?40 S ^POSENR($I,PY,PX)=NEXT W " = " S PX=$X,VL=^[QUI]TVPAR(NUFA,TWREF,NEXT) W VL,?60,$$^%QZCHW("(E)") D U W ?79,"|" S LI=LI+1 I LI>LILIM D SUIT
 Q
IMP S NEXT=-1,LI=$Y F I=1:1 S NEXT=$N(^[QUI]TVPAR(NUFA,TWREF,NEXT)) G:NEXT=-1 FIN D IMP2 G:%ABAND=1 FIN
IMP2 I $E(NEXT,1)'="$",'($D(^[QUI]EXPL(YA,NEXT))) W ! S PY=$Y,PX=$X,^POSENR($I,PY,PX)=NEXT W "|",?5,NEXT,?40," = " S VL=^[QUI]TVPAR(NUFA,TWREF,NEXT),PX=$X,^POSENR($I,PY,PX)=VL_"^"_NEXT W VL,?60,$$^%QZCHW("(I)") D U W ?79,"|" S LI=LI+1 I LI>LILIM D SUIT
FIN Q
U S U="^[QUI]UNITE(YA,NEXT)" W:$D(@U) ?70,@(U) Q
SUIT D POCLEPA^%VVIDEO W $$L23^%QSLIB2("RETURN pour continuer, (A)cces modifications")," " R *RET D TOUCHE^%INCCLAV(RET,.RET)
 I $C(RET)=$$^%QZCHW("A") D ^TO3GMODI G SUIT
 I RET=1 S %ABAND=1,STOP=1 Q
 K ^POSENR($I) D CLEPAG^%VVIDEO W !,$$^%QZCHW("Suite des parametres de :"),!,?5,TOID,!,! S (DEBP,LI)=$Y Q

