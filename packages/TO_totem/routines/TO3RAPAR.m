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

;TO3RAPAR^INT^1^59547,74870^0
TO3RAPAR ;
 
 Q  S QMATOT=$S($D(^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE"))):^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QTE.MATIERE.EN.OEUVRE")),1:0)
 S FPRO=$S($D(^[QUI]PARMAT(NUFA,TWREF,$$^%QZCHW("UNITE.PRIX"))):^[QUI]PARMAT(NUFA,TWREF,$$^%QZCHW("UNITE.PRIX")),1:0) S:FPRO="" FPRO=1 S VFPRO=$S($D(^[QUI]PARMAT(NUFA,TWREF,FPRO)):^[QUI]PARMAT(NUFA,TWREF,FPRO),1:1)
 S PRMAT=$S($D(^[QUI]PARMAT(NUFA,TWREF,$$^%QZCHW("PRIX"))):^[QUI]PARMAT(NUFA,TWREF,$$^%QZCHW("PRIX")),1:0)*VFPRO D AROND S PRPM=QMATOT*PRMAT,TOTPRIX=(PT+PRPM)+0,RMAT=$S(TOTPRIX=0:0,1:(PRPM/TOTPRIX)*100),RFAB=$S(TOTPRIX=0:0,1:(PT/TOTPRIX)*100)
 I DEV="ECR" D CLEPAG^%VVIDEO G LOOP
 I (LILIM-$Y)<10 W # G LOOP
 W !,!,!
LOOP 
 H 2 W !,LSTAR,!,"|",?10,$$^%QZCHW("Ratios pour : "),?79,"|",!,"|",?79,"|",!,"|",?10,TOID,?79,"|",!,LSTAR
 W !,"|",?10,$$^%QZCHW("Qantite de matiere necessaire"),?42,"= ",QMATOT,?79,"|" S LI=LI+1 D:LI>LILIM SUIT
 W !,"|",?10,$$^%QZCHW("Prix de la matiere"),?42,"= ",PRPM,?79,"|" S LI=LI+1 D:LI>LILIM SUIT
 W !,"|",?10,$$^%QZCHW("Prix de fabrication"),?42,"= ",PT,?79,"|" S LI=LI+1 D:LI>LILIM SUIT
 W !,"|",?10,$$^%QZCHW("Pourcentage matiere"),?42,"= ",RMAT,?79,"|" S LI=LI+1 D:LI>LILIM SUIT
 W !,"|",?10,$$^%QZCHW("Pourcentage fabrication"),?42,"= ",RFAB,?79,"|" S LI=LI+1 D:LI>LILIM SUIT
 W !,LSTAR
FIN1 I DEV="ECR" D POCLEPA^%VVIDEO W $$^%QZCHW("Frapper RETURN pour continuer") R XX D CLEPAG^%VVIDEO
 E  W #
FIN2 Q
SUIT I DEV="ECR" D POCLEPA^%VVIDEO W $$^%QZCHW("Frapper RETURN pour la suite des ratios ") R *RET D CLEPAG^%VVIDEO W !,$$^%QZCHW("Suite des ratios pour :"),!,?5,TOID,!,! S LI=$Y Q
 W # S LI=1 Q
AROND S DEC=$P(QMATOT,".",2) I DEC>0 S QMATOT=$P(QMATOT,".",1)+1
 Q

