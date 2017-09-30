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

;TO3PNOEV^INT^1^59547,74870^0
TO3PNOEV ;
 
 S LI=0 G EDIT
CADRE W # H:DEV'="ECR" 5 S %PPAGE=%PPAGE+1 D ^TOHAUPAG(IMPR,%DDATE,%HHEUR,%TTITR,%PPAGE)
 D:DEV="ECR" CLEPAG^%VVIDEO W !,!,LSTAR,!,"|",?10,NUC,?20,$$^%QZCHW("Parametres non evalues de : "),?79,"|",!,"|",?79,"|",!,"|",?10,TOID,?79,"|",!,LSTAR,!,"|",?79,"|"
 S LI=$Y Q
EDIT 
 S CTRLA=0,CTRLF=0,NOEV=0,NEXT=-1 F I=1:1 S NEXT=$N(^[QUI]IMPLICI(YA,NEXT)) Q:NEXT=-1  I '($D(^[QUI]TVPAR(NUFA,TWREF,NEXT))),NEXT'["~" D:NOEV=0 CADRE S NOEV=1 W !,"|",?5,NEXT D U W ?79,"|" S LI=LI+1 I LI>LILIM D SUIT Q:STOP=1
 G:NOEV=0 FIN G:(CTRLA=1)!(CTRLF=1) FIN
 W !,LSTAR W:DEV="IMPR" !,!,! I DEV="ECR" S DX=1,DY=24 X XY W $$^%QZCHW("entrer RETURN pour continuer.") R FR
FIN Q
U S U="^[QUI]UNITE(YA,NEXT)" W:$D(@U) ?70,@(U) Q
SUIT I DEV="ECR" D POCLEPA^%VVIDEO W $$L14^%QSLIB1 R *RET D TOUCHE^%INCCLAV(RET,.RET),CLEPAG^%VVIDEO S:RET=1 CTRLA=1,STOP=1 S:RET=6 CTRLF=1,STOP=1 Q:(RET=1)!(RET=6)  W !,$$^%QZCHW("Suite des parametres de :"),!,?5,TOID,!,! S LI=$Y Q
 W !,LSTAR D CADRE S LI=10 Q

