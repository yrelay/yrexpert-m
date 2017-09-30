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

;TOCCMSRE^INT^1^59547,74871^0
TOCCMSRE ;
 
DEB D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Consultations") D TO4^%VZCD S DX=0,DY=10 X XY W $$^%QZCHW("A consulter : ") S DX=$X D ^%VLEC G:Y1="" END
 I '($D(^[QUI]EXPLICI(Y1))) W " ???" D POCLEPA^%VVIDEO W "[RETURN] " R *RET G DEB
 S ARTI=Y1,%AJCMS=$$^%QZCHW("Cons/Mod/Sup") D ^TO43GSCR
BEG S NOMTAB="^[QUI]CTACHCPT",ROUTI="^%VMULTGE(.IFLAG)"
 S NOMPROG=$T(+0)
 S NOMAP=$E(NOMPROG,4,$L(NOMPROG)),NOMPROG="^"_NOMPROG
 S NOMAJ="^TOCAJREA"
 S CMS=0 D CLEPAG^%VVIDEO,^%VACTISC(SCR) G FIN:ABENDSCR=1 D ^TO43COR G BEG:X1<2
FIN K ^%SCRE(SCR)
 K CMS
 D ECHON^%VVIDEO
 G DEB
END Q

