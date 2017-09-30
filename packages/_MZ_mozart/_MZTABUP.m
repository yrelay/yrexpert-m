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

;%MZTABUP^INT^1^59547,73872^0
MOZTABUP ;
 
 S:'($D(%TAB)) %TAB=0 Q:%TAB'=0  K SAV,^OPC($J),ORD
 G OK1:((XOP="")!(XOP=0))!(XOP=2) S NEDCL=$O(@%TT@($J,0,EDCL)) G:NEDCL="" OK1 S NXOP=$P(@%TT@($J,0,NEDCL),"^",1) I NXOP=2 D ^%VSQUEAK Q
OK1 I $Y>12 S DX=0,DY=21 X XY W "Place insuffisante pour inserer le repere",!,"Veuiller deplacer votre insertion vers le haut de l'ecran [RETURN]" R *RET:10 S DXG=0,DXD=80,DYH=22,DYB=24 D LWIN^%VVIDEO Q
 S %LUBAT=1,^OPC($J)=EDP_"^"_X_"^"_EDRP_"^"_EDCL_"^"_XOP,(%DYC,DYC)=$Y+1,EDP=$L(X)+1,A=1,NEDCL=$O(@%TT@($J,0,EDCL)),NXOP=$S(NEDCL="":"",1:$P(@%TT@($J,0,NEDCL),"^",1)) G TT:(NXOP="")!(NXOP=0),NTT
TT D CR^%MZED S ^OPC($J,EDCL)=1
 F IT="EDCL","EDRP" S SAV(IT)=@IT
 S IT=-1 F %U=0:0 S IT=$N(SAV(IT)) Q:IT=-1  S @IT=SAV(IT)
 F %U1=1:1:7 S X="",EDP=3 D CR^%MZED S ^OPC($J,EDCL)=1,IT=-1,X="",EDP=3 F %U=0:0 S IT=$N(SAV(IT)) Q:IT=-1  S @IT=SAV(IT)
 K SAV,OED D RF^%MZED
 S %TAB=1 G INS1
NTT S EDCL=$O(@%TT@($J,0,EDCL)),XOP=$S(EDCL="":"",1:$P(@%TT@($J,0,EDCL),"^",1)),X=$S(EDCL="":"",1:$P(@%TT@($J,0,EDCL),"^",2,999)),NEDCL=$O(@%TT@($J,0,EDCL)),NXOP=$S(EDCL="":"",NEDCL="":"",1:$P(@%TT@($J,0,NEDCL),"^",1))
 S NX=$S(NEDCL="":"",1:$P(@%TT@($J,0,NEDCL),"^",2,999)) G @XOP
1 S ^OPC($J,EDCL)=1,ORD(1)=EDCL_"^"_X_"^"_@%TT@($J,0,EDCL,0) I NXOP=2 S ORD(2)=NEDCL_"^"_NX_"^"_@%TT@($J,0,NEDCL,0),^OPC($J,NEDCL)=1 G INS
 D CR^%MZED S ^OPC($J,EDCL)=1,ORD(2)=EDCL_"^^"_@%TT@($J,0,EDCL,0) G INS
2 S ^OPC($J,EDCL)=1,ORD(2)=EDCL_"^"_X_"^"_EDN,OXX=^OPC($J),%U=1 F IT="EDP","X","EDRP","EDCL","XOP" S @IT=$P(OXX,"^",%U),%U=%U+1
 S EDP=$L(X)+1 D CR^%MZED S ^OPC($J,EDCL)=1,ORD(1)=EDCL_"^^"_@%TT@($J,0,EDCL,0)
INS F %U=1,2 F %V=1:1:3 S EDCL=$P(ORD(%U),"^",1),X=$P(ORD(%U),"^",2),EDN=$P(ORD(%U),"^",3),EDP=$L(X)+1 D CR^%MZED S ^OPC($J,EDCL)=1
 S %TAB=1 D RF^%MZED S %U=1,EDCL=$P(ORD(%U),"^",1),X=$P(ORD(%U),"^",2),EDN=$P(ORD(%U),"^",3),EDP=$L(X)+1
INS1 Q:('($D(^MOZ("C","L"))))&('($D(^MOZ(WHOIS,"C","L"))))
 K TBP,TBL,TBDX F %WU=1,2 S TABI=$S($D(^MOZ(WHOIS,"C","L",%WU)):"^MOZ(WHOIS,""C"",""L"",%WU)",1:"^MOZ(""C"",""L"",%WU)") D TAB,DES,RES,LIB
 S %TAB0=1 K %U,%WU,%V,TBL,TBP,TABI Q
TAB S TAB=@TABI F %U=1:1 S TBI=$P(TAB,"/",%U) Q:TBI=""  S TBP(%WU,%U)=$P(TBI,",",2),TBL(%WU,%U)=$P(TBI,",",1),TBDX(%WU,TBP(%WU,%U)+1)=1
 Q
DES S TAB=@TABI D G0ON^%VVIDEO S DX=0,DY=$S(%WU=1:DYC+1,1:DYC+5) X XY,XL W "t" S DXG=1,DYH=DY,BLD=0,LH=78 D TRH^%VVIDEO,G0ON^%VVIDEO S DX=79 X XY W "u" S %V=-1 F %U=1:1 S %V=$N(TBP(%WU,%V)) Q:%V=-1  S DX=TBP(%WU,%V) X XY W:DX>1 "n"
 D G0OFF^%VVIDEO K TAB,%U,%V Q
RES D G0ON^%VVIDEO S DX=0,DY=$S(%WU=1:DYC+3,1:DYC+7) X XY,XL W "m" S DXG=1,DYH=DY,LH=78,BLD=0 D TRH^%VVIDEO
 D G0ON^%VVIDEO W "j" S DX=0,DY=$S(%WU=1:DYC+2,1:DYC+6) X XY,XL W "x" S %V=-1 F %U=1:1 S %V=$N(TBP(%WU,%V)) Q:%V=-1  S DX=TBP(%WU,%V) X XY W:DX>1 "x"
 S DX=79 X XY W "x" S DX=0,DY=$S(%WU=1:DYC+3,1:DYC+7),%V=-1 F %U=1:1 S %V=$N(TBP(%WU,%V)) Q:%V=-1  S DX=TBP(%WU,%V) X XY W:DX>1 "v"
 D G0OFF^%VVIDEO Q
LIB S DY=$S(%WU=1:DYC+2,1:DYC+6) D REV^%VVIDEO S %V=-1 F %U=1:1 S %V=$N(TBL(%WU,%V)) Q:%V=-1  S DX=TBP(%WU,%V)+1 X XY W TBL(%WU,%V)
 D NORM^%VVIDEO Q
RFSH S %LUBAT=0 S:'($D(%TAB0)) %TAB0=0 Q:%TAB0=0  S %OTAB=%TAB,@%TT@($J,0,EDCL)="^"_X,%TAB=0,YA="MOZ" D ^%MZANAL,^%MZINEV
 K OPC S LI=-1 F %U=1:1 S LI=$N(^OPC($J,LI)) Q:LI=-1  D T0
 G:'($D(OPC)) FRF S LI=^OPC($J),EDP=$P(LI,"^",1),X=$P(LI,"^",2),EDRP=$P(LI,"^",3),EDCL=$P(LI,"^",4),XOP=$P(LI,"^",5)
 D CR^%MZED S ID=$N(OPC(-1)),(X,OX)=OPC(ID),OEDCL=EDCL,OID=ID,@%TT@($J,0,EDCL)=ID_"^"_X,EDP=$L(X)+1,ID=$N(OPC(ID)) G:ID=-1 FRF D CR^%MZED S @%TT@($J,0,OEDCL)=OID_"^"_OX,@%TT@($J,0,EDCL)=ID_"^"_OPC(ID)
FRF S LI=^OPC($J),EDP=$P(LI,"^",1),X=$P(LI,"^",2),EDRP=$P(LI,"^",3),EDCL=$P(LI,"^",4) D RF^%MZED S %TAB=0 K LI,OPC,%U,OX,^OPC($J),OID,OEDCL Q
T0 S ID=$S(%U=1:1,%U=5:2,1:0),Y=$P(@%TT@($J,0,LI),"^",2,999) I (ID'=0)&(Y'="") S OPC(ID)=Y
 K @%TT@($J,0,LI) Q

