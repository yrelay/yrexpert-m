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

;TO43CMSE^INT^1^59547,74870^0
TO43CMSE ;
 
DEB D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,BIG=1,MSG=$$^%QZCHW("Consultations") D TO4^%VZCD
Q0 S DX=0,DY=10 X XY W $J("",79) X XY W $$^%QZCHW("A consulter : ") S AX=$X,AY=$Y,DX=$X D ^%VLEC G:Y1="" END
 D ADR^%LXABR(Y1,.OK,.ARTI) I OK'=1 D POCLEPA^%VVIDEO W $S(OK=0:$$^%QZCHW("Inconnu "),1:$$^%QZCHW("Ambigu"))," [RETURN] " R *X:^TOZE($I,"ATTENTE") G END:X=-1 D POCLEPA^%VVIDEO G Q0
 S DX=AX,DY=AY X XY W ARTI H 1 I '($D(^[QUI]EXPLICI(ARTI))) W " ???" D POCLEPA^%VVIDEO W "[RETURN] " R *RET:^TOZE($I,"ATTENTE") G END:RET=-1,DEB
 S ARTI=Y1,%AJCMS=$$^%QZCHW("Cons/Mod/Sup") D ^TO43GSCR
BEG S NOMTAB="^[QUI]REFANTET",ROUTI="^%VMULTGE(.IFLAG)"
 S NOMPROG=$T(+0)
 S NOMAP=$E(NOMPROG,4,$L(NOMPROG)),NOMPROG="^"_NOMPROG
 S NOMAJ="^TOAJREA0"
 S CMS=0 D CLEPAG^%VVIDEO,B^%VACTISC G FIN:ABENDSCR=1 D ^TO43COR G BEG:X1<2
FIN K ^%SCRE(SCR),CMS O 0 G DEB
END Q

