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

;TO3PCREE^INT^1^59547,74870^0
TO3PCREE ;
 
 D CLEPAG^%VVIDEO
LECART S DX=0,DY=10 D CLEBAS^%VVIDEO W $$^%QZCHW("Parametres de l'article : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S PARA=Y1 D ^%QZCHBT S PCH=PARA D ^%LXABR I CONCUR'=1 D ^%VSQUEAK G LECART
 X XY W PCHCOMP S ART=PCHCOMP H 1 D CLEPAG^%VVIDEO
EXPL D BLD^%VVIDEO W !,$$^%QZCHW("Parametres explicites"),! D NORM^%VVIDEO S NUM=-1 F UU=1:1 S NUM=$N(^[QUI]EXPLICI(ART,NUM)) Q:NUM=-1  S PARA=$N(^[QUI]EXPLICI(ART,NUM,-1)) S:$D(^[QUI]EXPGIMP(PARA)) EXGIM(PARA)=1 W ?((UU-1)#3)*26,PARA I (UU#3)=0 W !
EXGIM D BLD^%VVIDEO W !,!,$$^%QZCHW("Parametres implicites"),! D NORM^%VVIDEO G:'($D(EXGIM)) IMPL S PARA=-1 F UU=0:0 S PARA=$N(EXGIM(PARA)) G:PARA=-1 IMPL S VAL=$N(^[QUI]EXPGIMP(PARA,-1)),NOMTAB="^[QUI]EXPGIMP(PARA,VAL",ADR="TRAIT^TO3PCREE" D ^%VTENR
TRAIT W ! F VV=1:3:29 I %RS(VV)'="" W ?(((VV-1)\3)#3)*26,%RS(VV) I (VV=10)!(VV=22) W !
 Q
IMPL S PARA=-1 F UU=1:1 S PARA=$N(^[QUI]IMPLICI(ART,PARA)) Q:PARA=-1  W ?((UU-1)#3)*26,PARA I (UU#3)=0 W !
FIN W !,!,$$^%QZCHW("RETURN") R *RET Q

