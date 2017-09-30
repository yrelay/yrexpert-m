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
;! Nomprog     : %VMENLEC                                                     !
;! Module      : VIDEO                                                        !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!       Lecture et traitement de la donnee d'un utilisateur pour             !
;!       specifier son choix parmi les options d'un menu                      !
;!                                                                            !
;!       T2   =  "^GM2($I,PG)" = racine du global permettant de trouver       !
;!               un libelle en fonction de ses coordonnees                    !
;!       T3   =  "^GM1($I,PG)" = racine du global permettant de trouver       !
;!               des coordonnees en fonction d'un libelle                     !
;!                                                                            !
;!       variables de sortie : CONT et AD                                     !
;!         . l'utilisateur tape un caractere de controle Ctrl<car>            !
;!              AD="" CONT=<car>^nom de la routine associee au libelle        !
;!                         sur lequel se trouve le curseur                    !
;!         . sinon                                                            !
;!              AD=nom routine correspondant au libelle selectionne           !
;!              CONT=""                                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VMENLEC ;
 
LEC S TBMOV="^GM2($I,PG,PAG)",DX=PX,DY=PY,T5="^GM6($I,PG,PAG)",CP=0
LEC1 X XY D ^%VMOVREV S PX=$X,PY=$Y,XC=$C(X1) G PL:XC="+",PL:XC="=",MS:XC="-",PAG:X1=12,GET:X1=13,CTRL:X1'>31,CHAIN:XC="/",ALP:XC<1,ALP:XC>9 O 0
NUM 
 
 
 
 I CP=1 S CHC=CHC_XC G LEC1
 S CONT="",X1=XC G EX
CHAIN 
 S CP=1,CHC="" G LEC1
PAG 
 
 S PAGP=PAG D EFBM S DX=$P(%EQI,"^",2)+1,DY=$P(%EQI,"^",1) X XY W $$^%QZCHW("Page : ") S DX=$X D ^%VLEC I Y1="" D EFBM G AFM^%VMENUPG
PAGT 
 
 G:'($D(@T2@(Y1))) PAG I Y1=PAG D EFBM G LEC
 S PAG=Y1 D EFBM G AFM^%VMENUPG
PL 
 S PAGP=PAG,Y1=PAG+1 G:'($D(@T2@(Y1))) LEC S PAG=Y1 G AFM^%VMENUPG
MS 
 S PAGP=PAG,Y1=PAG-1 G:'($D(@T2@(Y1))) LEC S PAG=Y1 G AFM^%VMENUPG
ALP 
 
 
 
 I CP=1 S CHC=CHC_$C(X1) G LEC1
 
 S X1=$C(X1) G:$D(@T3@(PAG,X1)) EX S:'($D(RM)) RM=80 O 0
 
 
LP S X2=$ZP(@T3@(PAG,X1)),X2=$O(@T3@(PAG,X2))
 
 
 G:$E(X2,1,$L(X1))'=X1 LEC S X3=X2,%XY=@T3@(PAG,X2)
 
 
 
 
 
 F U=0:0 S X3=$O(@T3@(PAG,X3)) G EX1:X3="",EX1:$E(X3,1,$L(X1))'=X1 Q:'(@T3@(PAG,X3)=%XY)
 
 
 D ^%VSQUEAK R *X:60 G:X'>26 LEC S X1=X1_$C(X) G LP
 
 
 
 
EX1 S X1=X2
EX G:'($D(@T3@(PAG,X1))) LEC S YC=@T3@(PAG,X1),XC=$P(YC,"/",2),YC=$P(YC,"/",1),AD=@T4@(PAG,YC,XC),^GM1($I,PG)=PAG_"^"_XC_"^"_YC D ^%VMENCOM(YC,XC),REV(YC,XC) G FIN
GET 
 
 
 
 
 
 I CP=1 S X1=CHC G LP
 S AD=@T4@(PAG,PY,PX),^GM1($I,PG)=PAG_"^"_PX_"^"_PY D ^%VMENCOM(PY,PX),REV(PY,PX) G FIN
CTRL 
 
 
 S CONT=$C(X1+64)_"^"_@T4@(PAG,PY,PX),^GM1($I,PG)=PAG_"^"_PX_"^"_PY G FIN
REV(AY,AX) 
 Q:'($D(%MC))  S DX=$P(%MC,"^",1),DY=$P(%MC,"^",2),LIB=$P(%MC,"^",3,999) X XY D WRIT S DX=AX,DY=AY D @VID(REVID,"BLD"),UDL^%VVIDEO X XY S LIB=$TR(^GM2($I,PG,PAG,DY,DX),"#","") F %I=$L(LIB):-1:1 Q:$E(LIB,%I)'=" "
 W $E(LIB,1,%I) X XY D @VID(REVID,"NORM")
 Q
WRIT S %B=$L(LIB,"#") F %X=1:1:%B S %Y=$P(LIB,"#",%X) W $$^%QZCHW(%Y) S %A1=$X D:(%X#2)=1 @VID(REVID,"BLD") D:(%X#2)=0 @VID(REVID,"NORM") S DX=%A1 X XY
 K %B,%X,%A1,%Y D @VID(REVID,"NORM") Q
EFBM S %EQUI=^GM6($I,PG),LEQ=$P(%EQUI,"^",4) S:LEQ=0 LEQ=(XD-XG)+1 D ^%VCRIFLD($J("",LEQ),$P(%EQUI,"^",2)+1,$P(%EQI,"^",1),$P(%EQI,"^",2),$P(%EQI,"^",3)) Q
FIN S:'($D(RM)) RM=80 O 0 K %Z,%EQI,EQ,LI,LGI,LC,LMX,CC Q

