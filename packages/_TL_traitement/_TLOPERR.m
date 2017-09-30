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

;%TLOPERR^INT^1^59547,74030^0
%TLOPERR ;;09:18 AM  31 Oct 1992; 16 Oct 92  3:25 PM ; 08 Nov 92 10:51 AM
 
ERR S $ZT=""
 D TRTERR
 G FIN^%TLIACT0
 
 
 
 S (PARCO("REG"),PAREXE("REG"))=$$PLANIFE^%TLIACT0(PARCO("TRT"),PARCO("REG"),NATERR)
 K V G EXEREGL^%TLIACT0
 
TRTERR 
 U 0
 D CLEPAG^%VVIDEO
 I '($D(PARCO)) D ^%VZEAVT($$^%QZCHW("Probleme")) Q
 S DX=10,DY=5 X XY W $$^%QZCHW("Probleme sur la regle")_" "_PARCO("REG")_" "_$$^%QZCHW("du traitement")
 S DX=10,DY=6 X XY W PARCO("TRT")
 I $D(^[QUI]TTL(PARCO("TRT"),2,PARCO("REG"))) S DX=10,DY=8 X XY W ^[QUI]TTL(PARCO("TRT"),2,PARCO("REG"))
 I $D(V("V")) S DX=10,DY=11 X XY W $$^%QZCHW("erreur sur le verbe")_" "_V("V")
 D ^%VZEAVT("")
 Q

