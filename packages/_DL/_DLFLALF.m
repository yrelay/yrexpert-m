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

;%DLFLALF^INT^1^59547,73867^0
DLFLALF(FLU,DES) 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFF N %DX,%DY,%NF,%P,C,DX,DY,NF,P,GLO
 I DES=1 G DES
 D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,0,23,80,1)
 S DX=2,DY=0 X XY W " Flux ",FLU," du ",DAT1," a ",HEUR1," au ",DAT2," a ",HEUR2," "
 S DX=2,DY=23 X XY W " ",MESSAGE," "
DES 
 S GLO=$$CONCAS^%QZCHAD("^[QUI]DLFLUX",FLU)
 D REV^%VVIDEO,BLD^%VVIDEO
 
 S DX=""
 F %DX=0:0 S DX=$O(@GLO@("POINTS",DX)) Q:DX=""  S DY="" F %DY=0:0 S DY=$O(@GLO@("POINTS",DX,DY)) Q:DY=""  X XY W "*"
 D NORM^%VVIDEO,G0ON^%VVIDEO
 
 S NF=""
 F %NF=0:0 S NF=$O(@GLO@("FLUX",NF)) Q:NF=""  S P="" F %P=0:0 S P=$O(@GLO@("FLUX",NF,P)) Q:P=""  S DX="" F %DX=0:0 S DX=$O(@GLO@("FLUX",NF,P,DX)) Q:DX=""  S DY="" F %DY=0:0 S DY=$O(@GLO@("FLUX",NF,P,DX,DY)) Q:DY=""  D T
 D G0OFF^%VVIDEO
 
 S DX=""
 F %DX=0:0 S DX=$O(@GLO@("TEXTE",DX)) Q:DX=""  S DY="" F %DY=0:0 S DY=$O(@GLO@("TEXTE",DX,DY)) Q:DY=""  X XY W @GLO@("TEXTE",DX,DY)
 
 S NF=""
 F %NF=0:0 S NF=$O(LFLUX(NF)) Q:NF=""  S DX=@GLO@("POSQUA",NF),DY=$P(DX,"^",2),DX=$P(DX,"^",1) X XY W LFLUX(NF)
 Q
 
T S C=@GLO@("FLUX",NF,P,DX,DY) I C'="" X XY W $$CARSPE^%VVIDEO($C(C))
 Q
 
 
OPER(OPEFL,FLU,AFF) 
 
 
 
 
 
 N MPASX,MPASY,NXI,NXS,NYS,NYI,I,MAC,PX,PY,OP
 S DX=$O(^[QUI]DLFLUX(FLU,"POINTS","")),DY=$O(^[QUI]DLFLUX(FLU,"POINTS",DX,"")) X XY
 S MPASX=1,MPASY=1,NXI=0,NXS=79,NYI=0,NYS=22
 S PX=DX,PY=DY
MOUV S DX=PX,DY=PY X XY D ^%VZECUR
 F I=1,6,63 G:I=X1 @I
 G MOUV
 
1 Q
6 Q
63 
 S PY=DY,PX=DX
 S MAC=$O(^[QUI]DLFLUX(FLU,"POINTS",DX,DY,""))
 I MAC="" G MOUV
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Liste des machines et de operations"),0)
 
 D INIT^%QUCHOIP("^[QUI]DLFLUX(FLU,""POINTS"",PX,PY)",1,"",0,2,79,8)
 D AFF^%QUCHOIP
631 S MAC=$$UN^%QUCHOIP I MAC="" D END^%QUCHOIP,@AFF G MOUV
 
 D INIT^%QUCHOIP($$CONCAS^%QZCHAD(OPEFL,MAC),1,"",0,11,79,11)
 D AFF^%QUCHOIP
 S OP=$$UN^%QUCHOIP
 D END^%QUCHOIP G 631

