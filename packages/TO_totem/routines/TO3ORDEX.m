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

;TO3ORDEX^INT^1^59547,74870^0
TO3ORDEX ;
 
 D CLEPAG^%VVIDEO W $$^%QZCHW("Reorganisation des parametres explicites de l'article : ") D POCLEPA^%VVIDEO W $$^%QZCHW("RETURN pour abandon ") S DX=10,DY=5 X XY W "- " S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S ART=Y1
 I '($D(^[QUI]EXPLICI(ART))) W " ??? " H 2 G TO3ORDEX
 K POSENR W " OK ! " S NUM=0,ADR="TRAIT^TO3ORDEX",NOMTAB="^[QUI]EXPLICI(Y1",NUM=0 D ^%VTENR,^TONEWNUM
 
 
QU D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("OK pour renumeroter (O/N) ? ") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&(REP'=$$^%QZCHW("N")) QU G:REP=$$^%QZCHW("N") FIN
 K ^[QUI]EXPLICI(ART)
 W !,!,!,!
 S NUM="" F UU=1:1 S NUM=$O(POSENR(NUM)) Q:NUM=""  S PAR=POSENR(NUM),^[QUI]EXPLICI(ART,NUM,PAR)=VAL(PAR) W ?(((UU-1)#2)*40)+10,NUM," ",PAR I (UU#2)=0 W !
 W !,!,$$^%QZCHW("RETURN") R *RET
 Q
 
 
TRAIT S NUM=NUM+1,POSENR(NUM)=B3,VAL(B3)=RS G FIN
FIN Q
 
 
RESUM W !,!,!,! S NUM=-1 F UU=1:1 S NUM=$N(^[QUI]EXPLICI(Y1,NUM)) Q:NUM=-1  W ?(((UU-1)#2)*40)+10,NUM," ",$N(^[QUI]EXPLICI(Y1,NUM,-1)) I (UU#2)=0 W !
 W !,!,$$^%QZCHW("RETURN") R *RET
 G FIN

