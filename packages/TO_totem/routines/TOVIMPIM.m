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

;TOVIMPIM^INT^1^59547,74876^0
TOVIMPIM ;
 
 S %FL=0,C=""
LEC S C="" D ^%VZECUR G:(X1=1)!((X1=6)!(X1=13)) FIN G:X1=7 GOMME S:C="" PX=$X,PY=$Y G:(C="")&('($D(^POSENR($I,PAGE,PY)))) LEC W $C(X1)
 S PAR=$P(^POSENR($I,PAGE,PY),"^",1),YG=$C(X1)_$E(^VALPAR($I,PAR),2,599),DX=$X X XY S PCX=$X-1,PCY=$Y D BEG^%VLEC I (CTRLA=1)!(CTRLF=1) S C="" G FIN
 I Y1="?" G EXPLIC
 S C=Y1 G FIN1
FIN S PY=$Y G:'($D(^POSENR($I,PAGE,PY))) END S PAR=$P(^POSENR($I,PAGE,PY),"^",1) I X1'=13 G END
FIN1 I '($D(^DON($I,PAR))) G FIN2
 S ORD=^DON($I,PAR),CHP=^[QUI]EXPLICI(YA,ORD,PAR),VPD=$P(CHP,"^",18) I C="" S C=VPD,DX=43,DY=PY X XY W C G FIN2
 S VPA=C,PARA=PAR D ^TOTVLEG I VOK=0 D EFF S ^VALPAR($I,PAR)="",DX=43,DY=PY X XY G LEC
 S DX=0,DY=22 X XY D CLEBAS^%VVIDEO
FIN2 D OFF:C="",ON:C'="" S ^VALPAR($I,PAR)=C G END
 Q
EFF S DX=42,DY=PY X XY W "                            " X XY Q
GOMME Q:'($D(^POSENR($I,PAGE,$Y)))  S ADY=$Y,PY=$Y D OFF S PY=ADY,PAR=$P(^POSENR($I,PAGE,PY),"^",1),^VALPAR($I,PAR)="" G EFF
OFF S DX=1,DY=PY X XY W " " Q
ON D REV^%VVIDEO,BLD^%VVIDEO S DX=1,DY=PY X XY W " " D NORM^%VVIDEO Q
EXPLIC I '($D(^DON($I,PAR))) G IMP
 S ORD=^DON($I,PAR),EV=^[QUI]EXPLICI(YA,ORD,PAR),PH=$S(PY>14:8,1:14),DE=PH,FI=DE+7 D ^%ABNETTO S DXG=0,DXD=79,DYH=PH,DYB=PH+7,GRAPH=0,MSG="" D TO4^%VZCD
 S DX=2,DY=PH+1,PHB=PH+7 X XY W ^POSFUL($I,PAGE,PY) S DY=DY+1 D GETPLAG^TOMEMOIR S DE=PH,FI=DE+7 F DDY=DE:1:FI D ECR
 D EFF S DX=43 X XY K EV,ORD,PH,DE,FI,DDY G LEC
IMP D POCLEPA^%VVIDEO W ^POSFUL($I,PAGE,PY)," [RETURN] " R *RET D POCLEPA^%VVIDEO,EFF S DX=43,DY=PY G LEC
ECR Q:'($D(^POSENR($I,PAGE,DY)))
 S DY=DDY,DX=0 X XY W "|",?2 S PAR=$P(^POSENR($I,PAGE,DY),"^",1),TYP=$P(^POSENR($I,PAGE,DY),"^",2) D:TYP["E" BLD^%VVIDEO S DX=2 X XY W $E(PAR,1,37) D NORM^%VVIDEO S DX=40 X XY W " = ",^VALPAR($I,PAR) S DX=75 X XY W TYP,?79,"|" D:^VALPAR($I,PAR)'="" ON Q
END K DE,FI,CHP,ADY,PARA,VPA,VPD,C,Y1,YG Q

