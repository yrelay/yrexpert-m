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

;%VGENERM^INT^1^59547,74034^0
GEGENERM ;;07:15 PM  2 Jan 1996
 K ^GM8($I,PG) S:DL=0 DL=1 S MS=1,PAG=1,OP=$S(($D(@MES)#10)=1:$P(@MES,"^",4),1:0) D KILL(PG) S LI="",LGI=0,LMX=(XD-XG)+1,LC=YH,CC=XG+1 S:LC>23 LC=23 S ^GM8($I,PG,PAG,LC)="",%U="" D IN4(1)
LU S %U=$O(@MES@(%U)) G:%U="" FLU S %V=@MES@(%U),%W=$P(%V,"^",2,999),%V=$P(%V,"^",1),%L=$L(%V) G LUS:^TOZE($I,"LG")="FR" S %V=$$^%QZCHW($$GETLBLAN^%VTLBLAN($TR(%V,"#",""))),%V=%V_$J("",%L-$L(%V))
LUS S XAFF=$S(OP=1:"   ",1:"")_%V,LXAFF=$L($TR(XAFF,"#","")),LR=(LMX-LGI)-LXAFF I (LR<0)&(LGI'=0) S LR=^GM8($I,PG,PAG,LC),^GM8($I,PG,PAG,LC)=LR_$J("",LMX-$L($TR(LR,"#",""))),LGI=0,CC=XG,LC=LC+1 S:LC>YB LC=YH,PAG=PAG+1 S ^GM8($I,PG,PAG,LC)="" D IN4(PAG)
 S LR=(LMX-LGI)-LXAFF,BL=DL-LXAFF,XAFF=XAFF_$J("",$S(LR<BL:LR,1:BL)),LXAFF=$L($TR(XAFF,"#","")),LGC=LGI+LXAFF
 S ^GM7($I,PG,PAG,LC,CC)=%V
 S ^GM1($I,PG,PAG,$TR($S(%V["#":$P(%V,"#",2,999),1:%V),"#",""))=LC_"/"_CC,^GM3($I,PG,PAG,LC,CC)=%W,^GM6($I,PG,PAG,LC,CC)=$S($D(@MES@(%U,"COM")):$$^%QZCHW(@MES@(%U,"COM")),1:"")
 S LGI=LGI+LXAFF,^GM1($I,PG,PAG,$$^%VMINUSC($TR(%V,"#","")))=LC_"/"_CC
 S %PE="" I $D(@MES@(%U,"EQU")) S EQ=@MES@(%U,"EQU") F %Z=1:1 S %EQI=$P(EQ,"^",%Z) Q:%EQI=""  S:%PE="" %PE=%EQI S ^GM1($I,PG,PAG,%EQI)=LC_"/"_CC,^GM5($I,PG,PAG,LC,CC)=%EQI
 S ^GM8($I,PG,PAG,LC)=^GM8($I,PG,PAG,LC)_$S(OP'=1:XAFF,1:$S($L(%PE)>1:%PE,1:" "_%PE)_$E(XAFF,3,999))
 S CC=CC+LXAFF G LU
FLU S LI=$ZP(^GM7($I,PG,1,""))+1 S:LI>23 LI=23 S ^GM6($I,PG)=$S(($D(@MES)#10)=1:$P(@MES,"^",1,3)_"^0",1:LI_"^"_XG_"^"_XD_"^0")
 S PAG="" F %U=1:1 S PAG=$O(^GM8($I,PG,PAG)) Q:PAG=""  S NU=2,LC="" F %U=1:1 S LC=$O(^GM8($I,PG,PAG,LC)) Q:LC=""  D CADR
 S PAG="" F %U=1:1 S PAG=$O(^GM4($I,PG,PAG)) Q:PAG=""  S NU=1,ZZ="",LC="" F %U=1:1 S LC=$O(^GM4($I,PG,PAG,LC)) D CC Q:LC=""
 S PAG="" F %U=1:1 S PAG=$O(^GM7($I,PG,PAG)) Q:PAG=""  S LC="" F %U=1:1 S LC=$O(^GM7($I,PG,PAG,LC)) Q:LC=""  S CC="" F %U=1:1 S CC=$O(^GM7($I,PG,PAG,LC,CC)) Q:CC=""  D GM2
FIN S:'($D(RM)) RM=80 O 0 K %Z,%EQI,EQ,LI,LGI,LC,LMX,CC Q
CC G CC1:LC'="" I ZZ'="" S ^GM4($I,PG,PAG,NU)=ZZ,^GM4($I,PG,PAG)=NU Q
 Q
CC1 S IT=^GM4($I,PG,PAG,LC),LG=$L(ZZ)+$L(IT) I LG>500 S ^GM4($I,PG,PAG,NU)=ZZ,NU=NU+1,ZZ=""
 S ZZ=ZZ_IT Q
GM2 S CL=$S(OP=1:CC+3,1:CC),^GM2($I,PG,PAG,LC,CL)=$$CONV(^GM7($I,PG,PAG,LC,CC),CL,LC) Q
CADR 
 S IT=$$CONV(^GM8($I,PG,PAG,LC),XG,LC),^GM4($I,PG,PAG,NU)=$S(CADRE=1:N_$$G0ON^%VVIDEO1_$$XY^%VVIDEO1(XG-1,LC)_"x"_$$G0OFF^%VVIDEO1,1:"")_IT_$S(CADRE=1:N_$$G0ON^%VVIDEO1_"x",1:""),NU=NU+1 Q
KILL(NM) 
 K ^GM1($I,NM),^GM2($I,NM),^GM3($I,NM),^GM4($I,NM),^GM5($I,NM),^GM6($I,NM),^GM7($I,NM),^GM8($I,NM) Q
CONV(L,X,Y) 
 N %U,Z,S S S=$L(L,"#"),@("N="_VID1(REVID,"NORM")),@("B="_VID1(REVID,"BLD")),Z=$$XY^%VVIDEO1(X,Y) F %U=1:1:S S IT=$P(L,"#",%U),Z=Z_$S((%U#2)=1:N,1:B)_IT
 S Z=Z_N Q Z
IN4(XX) 
 S @("N="_VID1(REVID,"NORM")),^GM4($I,PG,XX,1)=$$CUROF^%VVIDEO1_N,PC=$S(CADRE=1:"x",REVID>0:" ",1:"")
 I CADRE=1 S ^GM4($I,PG,XX,1)=^GM4($I,PG,XX,1)_$$G0ON^%VVIDEO1_$$XY^%VVIDEO1(XG-1,YH-1)_"l"_$TR($J("",(XD-XG)+1)," ","q")_"k" G COR
 S ^GM4($I,PG,XX,1)=^GM4($I,PG,XX,1)_$$XY^%VVIDEO1(XG-1,YH-1)_PC_$J("",(XD-XG)+1)_PC
COR S NU=2,%V=YB-YH F %W=0:1:%V S ^GM4($I,PG,XX,NU)=$$XY^%VVIDEO1(XG-$L(PC),YH+%W)_PC_$J("",(XD-XG)+1)_PC,NU=NU+1
 I CADRE=1 S ^GM4($I,PG,XX,NU)=$$XY^%VVIDEO1(XG-1,YB+1)_"m"_$TR($J("",(XD-XG)+1)," ","q")_"j"_$$G0OFF^%VVIDEO1 G FCOR
 S ^GM4($I,PG,XX,NU)=$$XY^%VVIDEO1(XG-$L(PC),YB+1)_PC_$J("",(XD-XG)+1)_PC
FCOR S ^GM4($I,PG,XX)=NU,^GM4($I,PG,XX,NU)=^GM4($I,PG,XX,NU)_$$NORM^%VVIDEO1

