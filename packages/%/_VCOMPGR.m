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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VCOMPGR^INT^1^59547,74034^0
GECOMPGR ;
 
 D ^%VGETSCR Q:'($D(^SC($J)))
DEB S SCR="",%I=0 K ^LISTE($J) D ^%VID
LDEB S $ZT="G ERREUR^%VCOMPG2"
 S %I=%I+1,SCR=$O(^SC($J,SCR)) G FDEB:SCR="" W !,SCR D ^%VCOMPLI(SCR),COMP(SCR),^%VCURWAY(SCR),^%VCPPALL W:'(PB) " OK !" G LDEB
FDEB D RERREUR^%VCOMPG2 Q
ALL 
 K ^SC($J) S SCR="" F %U=1:1 S SCR=$O(^%SCRE(SCR)) Q:SCR=""  I SCR'[",COMMENT" S ^SC($J,SCR)=""
 G DEB
DAZ(SCR) 
 K ^SC($J) F %U=1:1 S SCR=$O(^%SCRE(SCR)) Q:SCR=""  I SCR'[",COMMENT" S ^SC($J,SCR)=""
 G DEB
COMP(SC) 
 S PB=0 K ^%SCREC(SC) S SC2=SC,SC1=$I_SC,MU=1,NU=1 I ($D(^%SCRE(SC))#10)'=1 S PB=1 W " Probleme" Q
 S %V=^%SCRE(SC) F %U=1:1:%V D TR
 S SC=SC_",COMMENT" G:'($D(^%SCRE(SC))) NC S %V=^%SCRE(SC)
 F %U=1:1:%V D @$S($E(^%SCRE(SC,%U,1))="~":"TRK",1:"TR")
NC 
 G:IBMPC SCP1
 S ^%SCREC(SC1,1)=$$WROFF^%VVIDEO1_$$CUROF^%VVIDEO1_^%SCREC(SC1,1),^%SCREC(SC1,NU-1)=^%SCREC(SC1,NU-1)_$$CURON^%VVIDEO1_$$WRON^%VVIDEO1
 G SCP2
SCP1 S ^%SCREC(SC1,1)="D CUROF^%VVIDEO "_^%SCREC(SC1,1),^%SCREC(SC1,NU-1)=^%SCREC(SC1,NU-1)_" D CURON^%VVIDEO"
SCP2 S ^%SCREC(SC1)=$ZP(^%SCREC(SC1,""))
 S LIM=$S($D(^%SCRE(SC2,"POSITION")):^%SCRE(SC2,"POSITION"),1:"-1,-1,80,24") S:LIM="" LIM="-1,-1,80,24" S DXG=$P(LIM,",",1)+1,DYH=$P(LIM,",",2)+1,DXD=$P(LIM,",",3)-1,DYB=$P(LIM,",",4)-1,LG=(DXD-DXG)+1,NU=1
 G:IBMPC=0 SCP3
 F %U=DYH:1:DYB S ^%SCREC(SC2,"EFF",NU)="S DX="_DXG_",DY="_%U_" X XY W """_$J("",LG)_"""",NU=NU+1
 S ^%SCREC(SC2,"EFF",1)="D CUROF^%VVIDEO "_^%SCREC(SC2,"EFF",1),^%SCREC(SC2,"EFF",NU-1)=^%SCREC(SC2,"EFF",1)_" D CUROF^%VVIDEO"
 G SCP4
SCP3 F %U=DYH:1:DYB S ^%SCREC(SC2,"EFF",NU)=$$XY^%VVIDEO1(DXG,%U)_$J("",LG),NU=NU+1
 S ^%SCREC(SC2,"EFF",1)=$$WROFF^%VVIDEO1_$$CUROF^%VVIDEO1_^%SCREC(SC2,"EFF",1),^%SCREC(SC2,"EFF",NU-1)=^%SCREC(SC2,"EFF",1)_$$CUROF^%VVIDEO1_$$WROFF^%VVIDEO1
SCP4 S NU=1,ZZ="",%U=^%SCREC(SC1) F %V=1:1:%U S %W=^%SCREC(SC1,%V) D SC2
 I ZZ'="" S ^%SCREC(SC2,NU)=ZZ,NU=NU+1
 K ^%SCREC(SC1) S ^%SCREC(SC2)=NU-1
 S MU=$ZP(^%SCREC(SC2,"RES",""))+0,^%SCREC(SC2,"RES")=MU G FIN:MU=0 S ^%SCREC(SC2,"RES",MU)=^%SCREC(SC2,"RES",MU)_$S(IBMPC:" D CURON^%VVIDEO",1:",$$CURON")
FIN Q
SC2 S LG=$L(ZZ)+$L(%W) I LG>509 S ^%SCREC(SC2,NU)=ZZ,ZZ="",NU=NU+1
 S ZZ=ZZ_$S(IBMPC:" "_%W,1:%W) Q
TRK S ZZ="",IDT=^%SCRE(SC,%U,1),ID=$P(IDT,"~",2) D:$D(^%SCRE(SC,%U,"MODAFF")) MOD S:$P(IDT,"~",2)'="KL" ZZ=ZZ_$S(IBMPC:" D G0ON^%VVIDEO",1:$$G0ON^%VVIDEO1) G @ID
K S DX=^%SCRE(SC,%U,2),DY=^%SCRE(SC,%U,3),LH=$P(IDT,"~",3),LV=$P(IDT,"~",4)
 G:IBMPC K2
 S ZZ=ZZ_$$XY^%VVIDEO1(DX,DY)_$$CARSPE^%VVIDEO("l")_$TR($J("",LH-2)," ",$$CARSPE^%VVIDEO("q"))_$$CARSPE^%VVIDEO("k"),^%SCREC(SC1,NU)=ZZ,NU=NU+1
 S LI=LV-2 F %UV=1:1:LI S DY=DY+1,ZZ=$$XY^%VVIDEO1(DX,DY)_$$CARSPE^%VVIDEO("x")_$$XY^%VVIDEO1((DX+LH)-1,DY)_$$CARSPE^%VVIDEO("x"),^%SCREC(SC1,NU)=ZZ,NU=NU+1
 S ZZ=$$XY^%VVIDEO1(DX,DY+1)_$$CARSPE^%VVIDEO("m")_$TR($J("",LH-2)," ",$$CARSPE^%VVIDEO("q"))_$$CARSPE^%VVIDEO("j")_$$G0OFF^%VVIDEO1_$$NORM^%VVIDEO1,^%SCREC(SC1,NU)=ZZ,NU=NU+1 Q
K2 S ZZ=ZZ_" S DX="_DX_",DY="_DY_" X XY W $$CARSPE^%VVIDEO(""l""),$TR($J("""","_(LH-2)_"),"" "",$$CARSPE^%VVIDEO(""q"")),$$CARSPE^%VVIDEO(""k"")",^%SCREC(SC1,NU)=ZZ,NU=NU+1
 S LI=LV-2 F %UV=1:1:LI S DY=DY+1,ZZ="S DX="_DX_",DY="_DY_" X XY W $$CARSPE^%VVIDEO(""x"") S DX="_((DX+LH)-1)_" X XY W $$CARSPE^%VVIDEO(""x"")",^%SCREC(SC1,NU)=ZZ,NU=NU+1
 S ZZ="S DX="_DX_",DY="_(DY+1)_" X XY W $$CARSPE^%VVIDEO(""m""),$TR($J("""","_(LH-2)_"),"" "",$$CARSPE^%VVIDEO(""q"")),$$CARSPE^%VVIDEO(""j"") D G0OFF^%VVIDEO,NORM^%VVIDEO",^%SCREC(SC1,NU)=ZZ,NU=NU+1 Q
KL S IDT=^%SCRE(SC,%U,1),DXG=$P(IDT,"~",3),DXD=$P(IDT,"~",4),DYH=$P(IDT,"~",5),DYB=$P(IDT,"~",6),DX=DXG,DY=DYH,LH=(DXD-DXG)+1,LV=(DYB-DYH)+1
 G:IBMPC KL2
 S ZZ=ZZ_$$REV^%VVIDEO1_$$XY^%VVIDEO1(DX,DY)_$J("",LH),^%SCREC(SC1,NU)=ZZ,NU=NU+1
 S LI=LV-2 F %UV=1:1:LI S DY=DY+1,ZZ=$$XY^%VVIDEO1(DX,DY)_" "_$$XY^%VVIDEO1((DX+LH)-1,DY)_" ",^%SCREC(SC1,NU)=ZZ,NU=NU+1
 S ZZ=$$XY^%VVIDEO1(DX,DYB)_$J("",LH)_$$NORM^%VVIDEO1,^%SCREC(SC1,NU)=ZZ,NU=NU+1 Q
KL2 S ZZ=ZZ_" D REV^%VVIDEO S DX="_DX_",DY="_DY_" X XY W """_$J("",LH)_"""",^%SCREC(SC1,NU)=ZZ,NU=NU+1
 S LI=LV-2 F %UV=1:1:LI S DY=DY+1,ZZ="S DX="_DX_",DY="_DY_" X XY W ""  "" S DX="_((DX+LH)-1)_" X XY W "" """,^%SCREC(SC1,NU)=ZZ,NU=NU+1
 S ZZ="S DX="_DX_",DY="_DYB_" X XY W """_$J("",LH)_""" D NORM^%VVIDEO",^%SCREC(SC1,NU)=ZZ,NU=NU+1 Q
KSP S PP="" F %UV=1:1 S PP=$O(^%SCRE(SC,%U,4,PP)) Q:PP=""  S IDT=^%SCRE(SC,%U,4,PP),ID=$P(IDT,"~",2) D @ID S ZZ=""
 I IBMPC S ^%SCREC(SC1,NU-1)=^%SCREC(SC1,NU-1)_" D G0OFF^%VVIDEO,NORM^%VVIDEO" Q
 S ^%SCREC(SC1,NU-1)=^%SCREC(SC1,NU-1)_$$G0OFF^%VVIDEO1_$$NORM^%VVIDEO1 Q
L S DX=$P(IDT,"~",5),DY=$P(IDT,"~",6),LG=$P(IDT,"~",4) G @$P(IDT,"~",3)
H G:IBMPC H2
 S ZZ=ZZ_$$XY^%VVIDEO1(DX,DY)_$TR($J("",LG)," ",$$CARSPE^%VVIDEO("q")),^%SCREC(SC1,NU)=ZZ,NU=NU+1 Q
H2 S ZZ=ZZ_" S DX="_DX_",DY="_DY_" X XY W $TR($J("""","_LG_"),"" "",$$CARSPE^%VVIDEO(""q""))",^%SCREC(SC1,NU)=ZZ,NU=NU+1 Q
V S LI=(DY+LG)-1
 G:IBMPC V2
 F %W=DY:1:LI S ^%SCREC(SC1,NU)=ZZ_$$XY^%VVIDEO1(DX,%W)_$$CARSPE^%VVIDEO("x"),NU=NU+1,ZZ=""
 Q
V2 F %W=DY:1:LI S ^%SCREC(SC1,NU)=ZZ_" S DX="_DX_",DY="_%W_" X XY W $$CARSPE^%VVIDEO(""x"")",NU=NU+1,ZZ=""
 Q
KS 
 S DX=$P(IDT,"~",4),DY=$P(IDT,"~",5)
 I IBMPC S ^%SCREC(SC1,NU)="S DX="_DX_",DY="_DY_" X XY W $$CARSPE^%VVIDEO("""_$P(IDT,"~",3)_""")",NU=NU+1 Q
 S ^%SCREC(SC1,NU)=$$XY^%VVIDEO1(DX,DY)_$$CARSPE^%VVIDEO($P(IDT,"~",3)),NU=NU+1 Q
TR S ZZ="",MD=$S((MU=1)&IBMPC:" D CUROF^%VVIDEO",MU=1:"$$CUROF,",1:"")
 S DX=^%SCRE(SC,%U,2),DY=^%SCRE(SC,%U,3)
 S:IBMPC=0 ZZ=$$XY^%VVIDEO1(DX,DY) S:IBMPC ZZ="S DX="_DX_",DY="_DY_" X XY"
 S LI=^%SCRE(SC,%U,1) S:LI'="" LI=$$^%QZCHW(LI) G:'($D(^%SCRE(SC,%U,"MODAFF"))) TRS D MOD
TRS G TRT:LI=""
 S:IBMPC=0 ZZ=ZZ_LI_$$NORM^%VVIDEO1 S:IBMPC ZZ=ZZ_" W """_LI_""" D NORM^%VVIDEO"
 S ^%SCREC(SC1,NU)=ZZ,NU=NU+1
TRT Q:SC[",COMMENT"  Q:$D(^%SCRE(SC,%U,"INVISIBLE"))  S ESP=$S($D(^%SCRE(SC,%U,"ESPACE")):^%SCRE(SC,%U,"ESPACE"),1:"-1,80"),XG=$P(ESP,",",1),XD=$P(ESP,",",2)
 S:IBMPC=0 WW="W $$XY("_DX_","_DY_"),"_MD_"$$GECADFLD(RESUL("_%U_"),"_(DX+$L(LI))_","_DY_","_XG_","_XD_")"_$S(MD="":"",1:",$$NORM")
 S:IBMPC WW="S DX="_DX_",DY="_DY_" X XY"_MD_" D GECA2(RESUL("_%U_"),"_(DX+$L(LI))_","_DY_","_XG_","_XD_")"_$S(MD="":"",1:" D NORM^%VVIDEO")
 S ^%SCREC(SC,"RES",MU)=WW,MU=MU+1
 Q
MOD S MOD=^%SCRE(SC,%U,"MODAFF") F %W=1:1 S %UV=$P(MOD,",",%W) Q:%UV=""  D MODS
 Q
MODS G:%UV'="GRD" MODS2
 N LL
 S LL=$S(IBMPC:" S MSG="""_LI_""",DXG="_DX_",DYH="_DY_" D BIG^%VVIDEO",1:$$BIG^%VVIDEO1(LI,DX,DY))
 S ZZ=ZZ_LL,MD=MD_LL,LI=""
 Q
MODS2 S:IBMPC=0 @("%UW="_"$$"_%UV_"^%VVIDEO1") S:IBMPC %UW=" D "_%UV_"^%VVIDEO"
 S ZZ=ZZ_%UW S:SC'[",COMMENT" MD=MD_$S(IBMPC:%UW,1:"$$"_%UV_",")
 Q
AFF W !,"Grille : " R SCR Q:$A(SCR)<32  I '($D(^%SCRE(SCR))) W " ???" G AFF
 S EX=$S(IBMPC:"X ^%SCREC(SCR,%U)",1:"W ^%SCREC(SCR,%U)")
 D CLEPAG^%VVIDEO O $I S NU=^%SCREC(SCR) F %U=1:1:NU S $X=250 X EX
 R *%L
 Q
STAR(ST) 
 K ^SC($J) S GR=$ZP(^%SCRE(ST)) F %U=1:1 S GR=$O(^%SCRE(GR)) Q:GR=""  Q:$E(GR,1,$L(ST))'=ST  I GR'[",COMMENT" S ^SC($J,GR)=""
 G DEB
ADR(GRILLE) 
 K ^SC($J) S GR="" F %U=1:1 S GR=$O(@GRILLE@(GR)) Q:GR=""  I GR'["COMMENT" S ^SC($J,GR)=""
 G DEB

