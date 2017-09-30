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

;%VCREM03^INT^1^59547,74034^0
GECREM03 ;
 
LIGNE S M1=M,(C,PX,PY)=""
 K ^INTER($J) D POCLEPA^%VVIDEO W "No de Comment et Code : " S DX=$X D ^%VLEC G:Y1="" FIN
 S COD=$P(Y1,",",2),NCH=$P(Y1,",",1),PAY=$P(Y1,",",3)+0,PAX=$P(Y1,",",4) G LIGNE:COD="",@$A(COD)
73 ;;
I I NCH="" S NCH=$S($D(^MASQUE(M1,"MASQUE",PAGE)):^MASQUE(M1,"MASQUE",PAGE)+1,1:1)
 G GET
77 ;;
M G:'($D(^MASQUE(M1,"MASQUE",PAGE,NCH))) LIGNE S LIB=^MASQUE(M1,"MASQUE",PAGE,NCH,1) G LIGNE:$E(LIB,1)="~",GET
83 ;;
S G:'($D(^MASQUE(M1,"MASQUE",PAGE,NCH))) LIGNE D DEUX^%VCREM07(M1,PAGE,NCH),^%VAFIMAS(M,PAGE,TB) G LIGNE
82 ;;
R G:'($D(^MASQUE(M1,"MASQUE",PAGE,NCH))) LIGNE S:PAY=0 PAY=-1 D DECAL2^%VCREM07(M1,PAGE,NCH,PAX,PAY),^%VAFIMAS(M,PAGE,TB) G LIGNE
80 ;;
P G:'($D(^MASQUE(M1,"MASQUE",PAGE,NCH))) LIGNE S:PAY=0 PAY=1 D DECAL2^%VCREM07(M1,PAGE,NCH,PAX,PAY),^%VAFIMAS(M,PAGE,TB) G LIGNE
63 ;;
 G:'($D(^MASQUE(M1,"MASQUE",PAGE,NCH))) LIGNE D POCLEPA^%VVIDEO W ^MASQUE(M1,"MASQUE",PAGE,NCH,1) H 2 G LIGNE
GET S MPASX=1,MPASY=1,NXI=0,NXS=79,NYI=0,NYS=23,(DX,PX)=40,(DY,PY)=12,C=""
LP X XY D ^%VCREM04("NOLIB",.C) G LIGNE:X1=1,FIG:X1=6,KA:X1=11,TR:X1=12,LIGNE:X1<32
 S YG=$C(X1),(PX,PCX)=$X,(PCY,PY)=$Y W YG D BEG^%VLEC G:CTRLA!(CTRLF!(Y1="")) LIGNE S C=Y1 G SUITE
FIG D POCLEPA^%VVIDEO W "Figure quelconque " D ^%VTFIG,POCLEPA^%VVIDEO G:'($D(^INTER($J))) LIGNE S C="~KSP~",PX=0,PY=22 G SUITE
KA K KAX,KAY,DYL,DXL D KA1 X XY D ^%VCREM04("NOLIB",.C) G:X1'=11 LIGNE D KA1 X XY D ^%VCREM04("NOLIB",.C) G:X1'=11 LIGNE D KA1 F TB="KAX","KAY" S II=$ZP(@TB@("")) G:II'=2 LIGNE
 S DXD=$N(KAX(2,-1)) K KAX S II=-1 F I=1,2 S II=$N(DXL(DXD,II)),KAX(I)=II
 S DYD=$N(KAY(2,-1)) K KAY S II=-1 F I=1,2 S II=$N(DYL(DYD,II)),KAY(I)=II
 S (DXG,PX)=$N(DXL(-1)),(DYH,PY)=$N(DYL(-1)),LH=(KAY(2)-KAY(1))+1,LV=(KAX(2)-KAX(1))+1,DXD=(DXG+LH)-1,DYB=(DYH+LV)-1,C="~K~"_LH_"~"_LV_"~" D POCLEPA^%VVIDEO W "carre (S)imple, carre (L)arge ? " R *X S X=$C(X) G:(X'="S")&(X'="L") LIGNE G @(X_1)
S1 S C="~K~"_LH_"~"_LV_"~" D CARS^%VVIDEO G SUITE
L1 S C="~KL~"_DXG_"~"_DXD_"~"_DYH_"~"_DYB D CARL^%VVIDEO G SUITE
KA1 S DXL($X)=$S($D(DXL($X)):DXL($X)+1,1:1),KAX(DXL($X),$X)=1,DYL($Y)=$S($D(DYL($Y)):DYL($Y)+1,1:1),KAY(DYL($Y),$Y)=1,(DX,DXL($X,$Y))=$X,(DY,DYL($Y,$X))=$Y W "+" Q
TR S (DX,DXL1)=$X,(DY,DYL1)=$Y W "+" X XY D ^%VCREM04("NOLIB",.C) G:X1'=12 LIGNE S DXL2=$X,DYL2=$Y G:'((DXL1=DXL2)!(DYL1=DYL2)) LIGNE G LIGNE:(DXL1=DXL2)&(DYL1=DYL2),DXC:DXL1=DXL2,DYC:DYL1=DYL2
DXC W "+" S TL="V",PX=DXL2,PR=$S(DYL1<DYL2:1,1:2),PR2=$S(PR=1:2,1:1),PY=@("DYL"_PR),LD=(@("DYL"_PR2)-@("DYL"_PR))+1,C="~L~"_TL_"~"_LD,DXG=PX,DYH=PY,LV=LD D TRV^%VVIDEO G SUITE
DYC W "+" S TL="H",PY=DYL2,PR=$S(DXL1<DXL2:1,1:2),PR2=$S(PR=1:2,1:1),PX=@("DXL"_PR),LD=(@("DXL"_PR2)-@("DXL"_PR))+1,C="~L~"_TL_"~"_LD,DXG=PX,DYH=PY,LH=LD D TRH^%VVIDEO G SUITE
 D ^%VZECUR1
 G LIGNE:((((((PX<1)!PX)>79)!PY)<1)!PY)>20
SUITE D @(COD_1) G LIGNE
M1 S LI=^MASQUE(M1,"MASQUE",PAGE,AC,3) K ^MASQUE(M1,"MASQUE",PAGE,NCH) S ^MASQUE(M1,"MASQUE",PAGE,NCH,1)=C,^MASQUE(M1,"MASQUE",PAGE,NCH,2)=PX,^MASQUE(M1,"MASQUE",PAGE,NCH,3)=PY D MOD,^%VAFIMAS(M,PAGE,TB) Q
I1 S IL=$S($D(^MASQUE(M1,"MASQUE",PAGE)):^MASQUE(M1,"MASQUE",PAGE),1:0),^MASQUE(M1,"MASQUE",PAGE)=IL+1
 F IC=IL:-1:NCH S IK=IC+1 K ^MASQUE(M1,"MASQUE",PAGE,IK) S NOMTREE="^MASQUE("""_M1_""",""MASQUE"","_PAGE_","_IC,%TREECOP="^MASQUE("""_M1_""",""MASQUE"","_PAGE_","_IK D ^%QCAGLC
 K ^MASQUE(M1,"MASQUE",PAGE,NCH) S ^MASQUE(M1,"MASQUE",PAGE,NCH,1)=C,^MASQUE(M1,"MASQUE",PAGE,NCH,2)=PX,^MASQUE(M1,"MASQUE",PAGE,NCH,3)=PY,IC=NCH
 S %V=-1 F %U=0:0 S %V=$N(^INTER($J,%V)) Q:%V=-1  S ^MASQUE(M1,"MASQUE",PAGE,NCH,4,%V)=^INTER($J,%V)
 D MOD Q
MOD D POCLEPA^%VVIDEO W "Mode affichage : " R MOD Q:$A(MOD)<32  S ^MASQUE(M1,"MASQUE",PAGE,IC,"MODAFF")=MOD Q
FIN Q

