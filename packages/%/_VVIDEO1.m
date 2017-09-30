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

;%VVIDEO1^INT^1^59769,39009^0
%VVIDEO1 ;;01:15 PM  28 Aug 1996
CLEAR W *27,*91,*50,*74 S (DX,DY)=0 X XY I $D(SUB) W $S(SUB="C-ADM3":$C(26),SUB="C-TDV":$C(25),1:"")
 Q
132 Q:TADTM=0
 S %A=$I,IOM=132 O %A U %A W *27,"[?3h" Q
80 Q:TADTM=0
 S %A=$I,IOM=80 
 O %A 
 W *27,"[?3l" 
 Q
XY(A,B) ; trouver par manel N C W /FCTC(A,B,"C") Q C
 ;;Q:(^%INCONNE("INCA3","TYPECR")="C-DTM") $C(255)_"C"_$C(A)_$C(B)
 I SUB="C-DTM" Q $C(255)_"C"_$C(A)_$C(B) ;; cao
 Q $C(27,91)_(B+1)_$C(59)_(A+1)_$C(72) 
 
ALT W *27,"(1",MSG,*27,"(B" Q
WRON() Q $C(27,$A("["),$A("?"),$A(7),$A("h"))
WROFF() Q $C(27,$A("["),$A("?"),$A(7),$A("l"))
NET() Q $C(27,$A("["),$A(0),$A("K"))
 
BLK() ; trouver par manel N A W /FCTAI("A") Q A
 ;;Q:(^%INCONNE("INCA3","TYPECR")="C-DTM") $C(255)_"AI" 
         I SUB="C-DTM" Q $C(255)_"AI"  ;; cao
         Q $C(27,$A("["),$A(5),$A("m"))
 
BLD() ; trouver par manel N A W /FCTAB("A") Q A
 ;;Q:(^%INCONNE("INCA3","TYPECR")="C-DTM") $C(255)_"AB"  
 I SUB="C-DTM" Q $C(255)_"AB"  ;;cao
 Q $C(27,$A("["),$A(1),$A("m"))
 
 
 
CAG() Q:TADTM=0 ""
 D CAG^%VVIDEO
 ;HL Q $C(27,$A("#"),$A(6)) Q
 Q ""
 
MOY() 
 D MOY^%VVIDEO
 ;HL Q $C(27,$A("#"),$A(6)) Q
 Q ""       
 
CUROF() ; trouver par manel N A W /FCTVF("A") Q A
 ;;Q:(^%INCONNE("INCA3","TYPECR")="C-DTM") $C(255)_"LF" 
 I SUB="C-DTM" Q $C(255)_"LF"  ;; cao
 Q $C(27,$A("["),$A(2),$A(5),$A("l"))
 
 
 
CURON() ; trouver par manel N A W /FCTVN("A") Q A
 ;;Q:(^%INCONNE("INCA3","TYPECR")="C-DTM") $C(255)_"VN" 
 I SUB="C-DTM" Q $C(255)_"VN"  ;; cao
 Q $C(27,$A("["),$A(2),$A(5),$A("h"))
 
 
 
CURBLK W *27,"[5v" Q
CURIMO W *27,"[4v" Q
CURUDL W *27,"[2v" Q
CURBLO W *27,"[3v" Q
 
NORM() ; trouver par manel N A W /FCTAA("A") Q A
 ;;Q:(^%INCONNE("INCA3","TYPECR")="C-DTM") $C(255)_"AA"
 I SUB="C-DTM" Q $C(255)_"AA"  ;; cao
 Q $C(27,$A("["),$A(0),$A("m"))
 
 
 
REV() ; trouver par manel N A W /FCTAE("A") Q A
 ;;Q:(^%INCONNE("INCA3","TYPECR")="C-DTM") $C(255)_"AE" 
 I SUB="C-DTM" Q $C(255)_"AE"            ;; cao
 Q $C(27,$A("["),$A(7),$A("m"))
 
 
 
SCRL Q:TADTM=0
 W *27,"[",DYH,";",DYB,"r" Q
OFSCRL Q:TADTM=0
 W *27,"[r" Q
SMTHSCRL W *27,"[?4h" Q
JMPSCRL W *27,"[?4l" Q
ONTTREV() Q $C(27,$A("["),$A("?"),$A(5),$A("h")) Q
OFTTREV() Q $C(27,$A("["),$A("?"),$A(5),$A("l")) Q
 
UDL() ; trouver par manel N A W /FCTAC("A") Q A
 ;;Q:(^%INCONNE("INCA3","TYPECR")="C-DTM") $C(255)_"AG" 
 I SUB="C-DTM" Q $C(255)_"AG"
 Q $C(27,$A("["),$A(4),$A("m"))
 
 
 
 
APPKP() Q:TADTM=0 ""
 Q $C(27)_"="
 
NUMKP() Q:TADTM=0 ""
 Q $C(27)_">"
GRD(MSG,X,Y) Q $$XY(X,Y)_$C(27,$A("#"),$A(3))_MSG_$$XY(X,Y+1)_$C(27,$A("#"),$A(4))_MSG Q
BIG(MSG,X,Y) Q:SUB="C-DTM" $$XY(X,Y)_$C(255)_"AH"_MSG_$C(255)_"AA"
 Q:TADTM=0 $$XY(X,Y)_MSG
 ;HL Q $$XY(X,Y)_$C(27,$A("#"),$A(3))_MSG_$$XY(X,Y+1)_$C(27,$A("#"),$A(4))_MSG Q
 Q $$XY(X,Y)_$C(27,$A("#"),$A(5))_MSG_$$XY(X,Y+1)_$C(27,$A("#"),$A(5))_MSG Q
LWIN W *27,"[>3;",DYH,";",DXG,";",DYB,";",DXD,"J" K DXD,DXG,DYH,DYB Q
G0ON() Q:TADTM=0 ""
 Q $C(27,$A("("),$A(0))
G0OFF() Q:TADTM=0 ""
 Q $C(27,$A("("),$A("B"))
CARSA(DXG,DYH,LH,LV) 
CARS G CARS^%VVIDEO
TRH G TRH^%VVIDEO
DAMIER S C3=$$CARSPE^%VVIDEO2("w"),C4=$$CARSPE^%VVIDEO2("v")
 S C5=$$CARSPE^%VVIDEO2("t"),C6=$$CARSPE^%VVIDEO2("u")
 S C7=$$CARSPE^%VVIDEO2("n")
 S:'($D(BLD)) BLD=0 S GDX=DXG,HDY=DYH,DLB=BLD,HL=LH,VL=LV D CARS^%VVIDEO
 F C2=1:1 S BLD=DLB,(CXD,DXG)=GDX+(C2*(IX+1)),DYH=HDY+1,LV=VL-2 Q:DXG'<((GDX+HL)-1)  D G0ON^%VVIDEO D:DLB=1 BLD^%VVIDEO S DX=DXG,DY=HDY X XY W C3 D TRV^%VVIDEO S DX=CXD,DY=(HDY+VL)-1 D G0ON^%VVIDEO D:DLB=1 BLD^%VVIDEO X XY W C4
 F C2=1:1 S BLD=DLB,(CYD,DYH)=HDY+(C2*(IY+1)),DXG=GDX+1,LH=HL-2 Q:DYH'<((HDY+VL)-1)  D G0ON^%VVIDEO D:DLB=1 BLD^%VVIDEO S DX=GDX,DY=DYH X XY W C5 D TRH^%VVIDEO S DX=(GDX+HL)-1,DY=CYD D G0ON^%VVIDEO D:DLB=1 BLD^%VVIDEO X XY W C6
 D:DLB=1 BLD^%VVIDEO D CUROF^%VVIDEO2 S IX=IX+1,IY=IY+1,CXD=GDX+IX,CYD=HDY+IY F DX=CXD:IX Q:DX'<((GDX+HL)-1)  F DY=CYD:IY Q:DY'<((HDY+VL)-1)  X XY W C7
 K DLB,C2,C3,C4,C5,C6,C7,HL,HV2,GDX,HDY,IX,IY,CXD,CYD
 D G0OFF^%VVIDEO,CURON^%VVIDEO2,NORM^%VVIDEO Q
CARL K GRAPH D CUROF^%VVIDEO2,REV^%VVIDEO S:'($D(BLD)) BLD=0 D:BLD BLD^%VVIDEO S:'($D(GRAPH)) GRAPH=0 S LIP="" F QA=DXG:1:DXD S LIP=LIP_" "
 S DY=DYH,DX=DXG X XY D:GRAPH=1 CAG^%VVIDEO X XY W LIP
 S DYP=DYH+1,DYM=DYB-1 F DY=DYP:1:DYM S DX=DXG X XY D:GRAPH=1 CAG^%VVIDEO X XY W " " S DX=DXD X XY W " "
 S DX=DXG,DY=DYB X XY D:GRAPH=1 CAG^%VVIDEO X XY W LIP
 D NORM^%VVIDEO
FIN S (DX,DY)=0 X XY D CURON^%VVIDEO2 Q
FIG G FIG^%VVIDEO2
L G L^%VVIDEO22
KS G KS^%VVIDEO
ECHON G ECHON^%VVIDEO
ECHOFF G ECHOFF^%VVIDEO
RM S:'($D(RM)) RM=80 Q
 
TDVCLB N DDX,DDY,%XLEC
 S DDX=DX,DDY=DY F %XLEC=DDY:1:24 S DX=0,DY=%XLEC X XY W *4
 S DX=DDX,DY=DDY X XY
 Q
TDVCLI N DDX,DDY,%XLEC
 S DDX=DX,DDY=DY F %XLEC=DDY:1:23 S DX=0,DY=%XLEC X XY W $J(" ",80)
 S DX=0,DY=24 X XY W $J(" ",74)
 S $X=0,DX=DDX,DY=DDY X XY
 Q
TDVCLL N DDX,DDY
 S DDX=DX,DDY=DY,DX=0 X XY W *4
 S DX=DDX,DY=DDY X XY
 Q

