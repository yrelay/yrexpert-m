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

;TO31ORDE^INT^1^59547,74869^0
TO3ORDEX ;
 
 D CLEPAG^%VVIDEO W $$^%QZCHW("Reorganisation des parametres explicites de l'article : ") D POCLEPA^%VVIDEO W $$^%QZCHW("RETURN pour abandon ") S DX=10,DY=5 X XY W $$^%QZCHW("- ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S ART=Y1
 I '($D(^[QUI]EXPLICI(ART))) W " ??? " H 2 G TO3ORDEX
 W $$^%QZCHW(" OK ! Traitement en cours...") S INUM="NUM",TABSTO="^ORDEXP($I)",TABEXP="^[QUI]EXPLICI",ADR="TRAIT^TO3ORDEX",NOMTAB="^[QUI]EXPLICI(Y1",NUM=0 D ^%VTENR K ^[QUI]EXPLICI(ART)
 S TABEXP="^ORDEXP($I)",ADR="TRAIT2^TO3ORDEX",NOMTAB="^ORDEXP($I,ART" D ^%VTENR
 D RESUM G TO3ORDEX
TRAIT S NUM=NUM+1 I $D(@TABEXP@(Y1,B2,B3))=1 K @TABEXP@(Y1,B2,B3) S @TABSTO@(Y1,@INUM,B3)=RS G FIN
TRAIT2 S ^[QUI]EXPLICI(ART,B3,B4)=RS G FIN
RESUM W !,!,!,! S NUM=-1 F UU=1:1 S NUM=$N(^[QUI]EXPLICI(Y1,NUM)) Q:NUM=-1  W ?(((UU-1)#2)*40)+10,NUM,$$^%QZCHW(" "),$N(^[QUI]EXPLICI(Y1,NUM,-1)) I (UU#2)=0 W !
 W !,!,$$^%QZCHW("RETURN") R *RET
FIN Q

