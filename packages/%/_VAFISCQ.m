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

;%VAFISCQ^INT^1^59547,74034^0
GEAFISCQ ;
 N %I,%J
 O $I S %I=^%SCREC(SCR,"RES") F %J=1:1:%I X ^%SCREC(SCR,"RES",%J)
 Q
XY(A,B) Q $C(27,91)_(B+1)_$C(59)_(A+1)_$C(72)
WRON() Q $C(27,$A("["),$A("?"),$A(7),$A("h"))
WROFF() Q $C(27,$A("["),$A("?"),$A(7),$A("l"))
NET() Q $C(27,$A("["),$A(0),$A("K"))
BLK() Q $C(27,$A("["),$A(5),$A("m"))
BLD() Q $C(27,$A("["),$A(1),$A("m"))
CAG() Q $C(27,$A("#"),$C(6)) Q
MOY() Q $C(27,$A("#"),$A(6)) Q
CUROF() 
 Q:SUB="C-IBM PC" ""
 Q $C(27,$A("["),$A(1),$A("v"))
CURON() Q:SUB="C-IBM PC" ""
 Q $C(27,$A("["),$A(0),$A("v"))
NORM() Q $C(27,$A("["),$A(0),$A("m"))
REV() Q $C(27,$A("["),$A(7),$A("m"))
UDL() Q $C(27,$A("["),$A(4),$A("m"))
GRD(MSG,X,Y) Q $$XY(X,Y)_$C(27,$A("#"),$A(3))_MSG_$$XY(X,Y+1)_$C(27,$A("#"),$A(4))_MSG Q
BIG(MSG,X,Y) Q:SUB="C-IBM PC" $$XY(X,Y)_MSG
 Q $$XY(X,Y)_$C(27,$A("#"),$A(3))_MSG_$$XY(X,Y+1)_$C(27,$A("#"),$A(4))_MSG Q
G0ON() Q:SUB="C-IBM PC" ""
 Q $C(27,$A("("),$A(0))
G0OFF() Q:SUB="C-IBM PC" ""
 Q $C(27,$A("("),$A("B"))
GECADFLD(FLD,CX,CY,%LXG,%LXD) 
 S DX=CX,DY=CY,YG1=$E(FLD,1,%LXD-CX),ZZ=$$XY(DX,DY)_YG1,YG1=$E(FLD,(%LXD-CX)+1,999),DY=DY+1,DX=%LXG+1
 S LG=(%LXD-%LXG)-1 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  S ZZ=ZZ_$$XY(DX,DY)_YG2,DY=DY+1
 K YG1,YG2,LG Q ZZ
GECA2(FLD,CX,CY,%LXG,%LXD) 
 S DX=CX,DY=CY,YG1=$E(FLD,1,%LXD-CX) X XY
 W YG1
 S YG1=$E(FLD,(%LXD-CX)+1,999),DY=DY+1,DX=%LXG+1
 S LG=(%LXD-%LXG)-1
 F %U=1:1 S YG2=$E(YG1,((%U-1)*LG)+1,LG*%U) Q:YG2=""  X XY W YG2 S DY=DY+1
 K YG1,YG2,LG Q

