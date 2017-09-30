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

;PLDESALF^INT^1^59547,74868^0
PLDESALF ;
 
 
 
 
 
 
 
AFF D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,0,23,80,1)
 S DX=2,DY=0 X XY W " Flux ",%FLU," du ",DAT1," a ",HEUR1," au ",DAT2," a ",HEUR2," "
 S DX=2,DY=23 X XY W " ",MESSAGE," "
 D REV^%VVIDEO,BLD^%VVIDEO
 S DX=-1 F %DX=0:0 S DX=$N(^[QUI]PLPOINTS(%FLU,DX)) Q:DX=-1  S DY=-1 F %DY=0:0 S DY=$N(^[QUI]PLPOINTS(%FLU,DX,DY)) Q:DY=-1  X XY W "*"
 D NORM^%VVIDEO,G0ON^%VVIDEO
 S NF=-1
 F %NF=0:0 S NF=$N(^[QUI]PLFLUX(%FLU,NF)) Q:NF=-1  S P=-1 F %P=0:0 S P=$N(^[QUI]PLFLUX(%FLU,NF,P)) Q:P=-1  S DX=-1 F %DX=0:0 S DX=$N(^[QUI]PLFLUX(%FLU,NF,P,DX)) Q:DX=-1  S DY=-1 F %DY=0:0 S DY=$N(^[QUI]PLFLUX(%FLU,NF,P,DX,DY)) Q:DY=-1  D T
 D G0OFF^%VVIDEO S DX=-1 F %DX=0:0 S DX=$N(^[QUI]PLTEXTE(%FLU,DX)) Q:DX=-1  S DY=-1 F %DY=0:0 S DY=$N(^[QUI]PLTEXTE(%FLU,DX,DY)) Q:DY=-1  X XY W ^[QUI]PLTEXTE(%FLU,DX,DY)
 S NF=-1 F %NF=0:0 S NF=$N(LFLUX(NF)) Q:NF=-1  S DX=^[QUI]PLPOSQUA(%FLU,NF),DY=$P(DX,"^",2),DX=$P(DX,"^",1) X XY W LFLUX(NF)
 
FIN D ^%VZEAVT("") K C,DX,%DX,DY,%DY,NF,%NF,P,%P
 Q
 
T S C=^[QUI]PLFLUX(%FLU,NF,P,DX,DY) I C'="" X XY W $$CARSPE^%VVIDEO($C(C))
 Q

