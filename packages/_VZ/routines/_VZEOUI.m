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

;%VZEOUI^INT^1^59547,74037^0
ZOUINON(D) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N DX,DY
 S P1="O",P2="N",POS1="OUI",POS2="NON"
 Q $$AUTRE(D)
 
POS(MS,D,X,Y) 
 N AA,DX,DY
 S DX=X,DY=Y X XY D CLFEN^%VVIDEO(X,Y,1,(RM-1)-X)
 X XY S AA=$$MES2(MS,X,D)
 X XY D CLFEN^%VVIDEO(X,Y,1,(RM-1)-X)
 Q AA
 
MES(MS,D) 
 N GX
 S GX=0 G MES3
MES2(MS,GX,D) 
MES3 N %MC,AD,AX,AY,CONT,DEF,LGC,NDEF,ODX,ODY,P1,P2,POS1,POS2,REVID,TBMOV,VID,XD,XG,YH,Z
 N %Z,%EQI,EQ,LI,LGI,LMX,CC,LC
 D COLR^%VZEAVT(MS,GX,79,0)
 S P1="O",P2="N",POS1="OUI",POS2="NON"
 G AUT
 
AUTRE(D) 
AUT S XG=$X,XD=$X+20,YH=$Y
 G AD2
 
ADM(MS,D,XG,XD,YH) 
 
 N %MC,AD,AX,AY,CONT,DEF,LGC,NDEF,ODX,ODY,P1,P2,POS1,POS2,REVID,TBMOV,VID,Z
 N %Z,%EQI,EQ,LI,LGI,LMX,CC,LC
 D COLR^%VZEAVT(MS,XG,79,0)
 S P1="O",P2="N",POS1="OUI",POS2="NON"
 G AD2
 
AD(D,XG,XD,YH) 
AD2 O $I N MESSAGE,DX,DY
 S NDEF=$S(D=P1:POS2,D=P2:POS1),DEF=$S(D=P1:POS1,D=P2:POS2)
 S MESSAGE(1)=$$^%QZCHW(DEF)_"^DEF"
 S MESSAGE(2)=$$^%QZCHW(NDEF)_"^NDEF"
BOUC D ^%VQUIKMN(XG,XD,YH,"MESSAGE",.AD,.CONT) G:(CONT="A")!(CONT="F") FIN G:AD'="" @AD G BOUC
DEF Q:DEF=POS1 1 Q:DEF=POS2 0
NDEF Q:NDEF=POS1 1 Q:NDEF=POS2 0
FIN Q:CONT="A" -1 Q:CONT="F" DEF
 
CONFIRM(MS) 
 N %MC,AD,AX,AY,CONT,DEF,LGC,NDEF,ODX,ODY,P1,P2,POS1,POS2,REVID,TBMOV,VID,XD,XG,YH,Z,D,MESSAGE,DX,DY
 N %Z,%EQI,EQ,LI,LGI,LMX,CC,LC
 S D="N"
 W MS_" "
 S P1="O",P2="N",POS1="OUI",POS2="NON"
 S XG=$X,XD=$X+20,YH=$Y
 O $I
 S NDEF="OUI",DEF="NON"
 S MESSAGE(1)=$$^%QZCHW(DEF)_"^DEF"
 S MESSAGE(2)=$$^%QZCHW(NDEF)_"^NDEF"
BOUCC D CONF^%VQUIKMN(XG,XD,YH,"MESSAGE",1,.AD,.CONT) G:(CONT="A")!(CONT="F") FIN G:AD'="" @AD G BOUCC
 
 
ABREV 
 N OUI,NON,VAL
 S OUI=$E($$^%QZCHW("OUI")),VAL=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 I VAL="" S TAB(ICC)=OUI D ^%VAFFICH Q
 Q:VAL=OUI
 S NON=$E($$^%QZCHW("NON"))
 Q:VAL=NON
 I VAL=$C($A(OUI)+32) S TAB(ICC)=OUI D ^%VAFFICH Q
 I VAL=$C($A(NON)+32) S TAB(ICC)=NON D ^%VAFFICH Q
 D ^%VZEAVT($$^%QZCHW("Seules les valeurs")_" "_OUI_"/"_NON_" "_$$^%QZCHW("sont acceptees"))
 S REFUSE=1
 Q
 ;

