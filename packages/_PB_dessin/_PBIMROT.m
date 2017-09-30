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

;%PBIMROT^INT^1^59547,73873^0
PTIROTAT ;
 N ANGLE,EL,%EL
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,$$^%QZCHW("confimation")_" (O/N) : "),CUROFF^%PBMEN
 R *ADRES:^TOZE($I,"ATTENTE") D CURON^%PBMEN
 I $C(ADRES)="O" G L0
 Q
L0 D ^%PBPZALF,REV^%VVIDEO
 D POCLEPA^%VVIDEO W "Angle de rotation : " S DX=$X,DY=$Y D ^%VLEC
 G:CTRLA!(Y1="") END
 G:(Y1?.N)!(Y1?1"-"1N.N) OK D ^%VSQUEAK G L0
OK S ANGLE=$$NORM^%PBCACV(Y1)
 D POCLEPA^%VVIDEO W "Rotation en cours ... un instant"
 S EL=0 F %EL=0:0 S EL=$O(^[QUI]GRAPHE2(O,V,EL)) Q:EL=""  S ^[QUI]GRAPHE2(O,V,EL)=$$ROTATION^%PBEL(EL,ANGLE)
 D NORM^%VVIDEO,CLEPAG^%VVIDEO
 D ^%PBPZGRA,RR^%PBIMCR2
END Q

