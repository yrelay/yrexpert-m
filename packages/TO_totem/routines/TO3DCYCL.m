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

;TO3DCYCL^INT^1^59547,74870^0
TO3DCYCL ;
 
 D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("Suppression des cycles de l'article : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN I '($D(^[QUI]CYCLE(Y1))) W " ??? " H 3 G TO3DCYCL
 S ART=Y1,PCY=-1 F WQ=0:0 S PCY=$N(^[QUI]CYCLE(ART,PCY)) Q:PCY=-1  S TETCYC=^[QUI]CYCLE(ART,PCY) D TRAIT
 K ^[QUI]CYCLE(ART) G FIN
TRAIT S TAB="^[QUI]KEMPLOI(ART,PCY)",NUM=-1 F WE=0:0 S NUM=$N(@TAB@(NUM)) Q:NUM=-1  S REP=@TAB@(NUM) D:$P(REP,$$^%QZCHW(" "),2)=TETCYC SUBS
 Q
SUBS S NFIC=$P(REP,$$^%QZCHW(" "),3),EXP=$P(^[QUI]IMPLICI(ART,TETCYC,NFIC),"^",18) W !,EXP
AFF S POSI=$F(EXP,PCY,0) G:POSI=0 SUIT S EXPG=$P(EXP,PCY,1),EXPD=$E(EXP,POSI,299),EXP=EXPG_$R(100)_EXPD G AFF
SUIT S $P(^[QUI]IMPLICI(ART,TETCYC,NFIC),"^",18)=EXP W "  ==> ",EXP Q
FIN Q

