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

;%ACHIDE1^INT^1^59547,73864^0
ACHIDE1 ;
 
 
 
 
 
 
SUP 
 N NC,X,XO,X2,Y,Y2,Y3,YO,S,PO
 S X=DX,Y=DY,DX=DX-1,Y2=DY-1
 I '($D(@STO@("PLAN",Y2,DX,"INVI"))) G SCA
 
 S S=@STO@("PLAN",Y2,DX,"INVI")
 I S="H" S NC=$S($D(@TEMP@("POS",(Y2-HC)+1,DX)):@TEMP@("POS",(Y2-HC)+1,DX),1:"EXT") F X2=DX+1:1:(DX+LC)-2 D MOD(NUM,NC,Y2,X2)
 
 I S="V" S NC=$S($D(@TEMP@("POS",Y2,(DX-LC)+1)):@TEMP@("POS",Y2,(DX-LC)+1),1:"EXT") F Y3=Y2+1:1:(Y2+HC)-2 D MOD(NUM,NC,Y3,DX)
 
SCA 
 F X2=DX,(DX+LC)-1 D SUPO^%ACHIDE3(STO,Y2,X2),SUPO^%ACHIDE3(STO,(Y2+HC)-1,X2)
 
 I $$EXI("H",Y2,DX) S S="H",PO=1 G ESU
 
OV I $$EXI("V",Y2,DX) S S="V",PO=1 G ESU
 
 G NXTPH
ESU 
 I '($$EXI(S,Y2,DX)) G:S="H" OV G NXTPH
 S XO=$P(@STO@("EXI",S,Y2,DX),"/",PO) I XO="" G:S="H" OV G NXTPH
 S YO=$P(XO,"^",1),XO=$P(XO,"^",2)
 
 G @S
H 
 I XO'<((DX+LC)-1) D CHR^%ACHIDE3(Y2,(DX+LC)-1,Y2,DX,S) G ESU
 
 I '($D(@TEMP@("POS",(Y2-HC)+1,DX))) D MOD(NUM,"EXT",YO,XO) G ESU
 ;; suppression ouv sur le bord hori. haut
 
 
 
 S NC=@TEMP@("POS",(Y2-HC)+1,DX)
 D MOD(NUM,NC,YO,XO)
 S PO=PO+1
 G ESU
V 
 I YO'<((Y2+HC)-1) D CHR^%ACHIDE3((Y2+HC)-1,DX,Y2,DX,S) G ESU
 
 I '($D(@TEMP@("POS",Y2,(DX-LC)+1))) D MOD(NUM,"EXT",YO,XO) G ESU
 ;; suppression ouv sur le bord vert. gauche
 
 
 
 S NC=@TEMP@("POS",Y2,(DX-LC)+1)
 D MOD(NUM,NC,YO,XO)
 S PO=PO+1
 G ESU
 
NXTPH 
 S X2=(DX+LC)-1,PO=1,S="V"
 I '($D(@STO@("PLAN",Y2,X2,"INVI"))) G N1
 
 I @STO@("PLAN",Y2,X2,"INVI")'=S G N1
 S NC=$S($D(@TEMP@("POS",Y2,X2)):@TEMP@("POS",Y2,X2),1:"EXT")
 F Y3=Y2+1:1:(Y2+HC)-2 D MOD(NUM,NC,Y3,X2)
 
N1 G:'($$EXI(S,Y2,X2)) NXTPV
 
 S XO=$P(@STO@("EXI",S,Y2,X2),"/",PO) G:XO="" NXTPV
 S YO=$P(XO,"^",1),XO=$P(XO,"^",2)
 
 I YO'<((Y2+HC)-1) D CHR^%ACHIDE3((Y2+HC)-1,X2,Y2,X2,S) G N1
 
 I '($D(@TEMP@("POS",Y2,X2))) D MOD(NUM,"EXT",YO,XO) G N1
 ;; pas de case a droite ==> on supprime l'ouv sur le bord vert. droit
 
 
 
 S NC=@TEMP@("POS",Y2,X2)
 D MOD(NUM,NC,YO,XO)
 S PO=PO+1
 G N1
 
NXTPV 
 S Y3=(Y2+HC)-1,PO=1,S="H"
 I '($D(@STO@("PLAN",Y3,DX,"INVI"))) G N2
 
 I @STO@("PLAN",Y3,DX,"INVI")'=S G N2
 S NC=$S($D(@TEMP@("POS",Y3,DX)):@TEMP@("POS",Y3,DX),1:"EXT")
 F X2=DX+1:1:(DX+LC)-2 D MOD(NUM,NC,Y3,X2)
 
N2 G:'($$EXI(S,Y3,DX)) AFS
 
 S XO=$P(@STO@("EXI",S,Y3,DX),"/",PO) G:PO="" AFS
 S YO=$P(XO,"^",1),XO=$P(XO,"^",2)
 
 I XO'<((DX+LC)-1) D CHR^%ACHIDE3(Y3,(DX+LC)-1,Y3,DX,S) G N2
 
 I '($D(@TEMP@("POS",Y3,DX))) D MOD(NUM,"EXT",YO,XO) G N2
 ;; si pas de case en dessous ==> on supprime l'ouv sur le bord hori. bas
 
 
 
 S NC=@TEMP@("POS",Y3,DX)
 D MOD(NUM,NC,YO,XO)
 S PO=PO+1
 G N2
 
AFS S DX=X,DY=Y Q
 
EXI(S,Y,X) 
 Q $D(@STO@("EXI",S,Y,X))
 
MOD(NUM1,NUM2,DY,DX) 
 I NUM1=NUM2 D SUPO^%ACHIDE3(STO,YO,XO) Q
 N T,N1,N2,C
 Q:'($D(@STO@("OUV",DY,DX)))
 S T=@STO@("OUV",DY,DX)
 S N1=$P(T,"^",4),N2=$P(T,"^",5)
 S C=@STO@("MOD",N1,N2,DY,DX)
 S @STO@("MOD",NUM1,NUM2,DY,DX)=C,@STO@("MOD",NUM2,NUM1,DY,DX)=C
 K @STO@("MOD",N1,N2,DY,DX),@STO@("MOD",N2,N1,DY,DX)
 Q

