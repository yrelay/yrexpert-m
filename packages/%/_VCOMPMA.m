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

;%VCOMPMA^INT^1^59547,74034^0
GECOMPMA ;
 D ^%VGETMAS Q:'($D(^SC($J)))  S SCR="" F %I=1:1 S SCR=$O(^SC($J,SCR)) Q:SCR=""  W !,SCR D COMP(SCR),DESC(SCR) W:'(PB) " OK !"
 Q
DESC(SC) 
 K ^MASQUE(SC,"LIB"),^MASQUE(SC,"DESCC"),^MASQUE(SC,"WAY")
 S PG="",NU=1 F %I=1:1 S PG=$O(^MASQUE(SC,"DESC",PG)) Q:PG=""  S %V=^MASQUE(SC,"DESC",PG),%V=^MASQUE(SC,"DESC",PG),NU=1 F %U=1:1:%V D DD
 S PG="",NU=1 F %I=1:1 S PG=$O(^MASQUE(SC,"DESCC",PG)) Q:PG=""  S ^MASQUE(SC,"DESCC",PG)=$ZP(^MASQUE(SC,"DESCC",PG,""))+0 D ^%VCURMAS(SC,PG)
 Q
DD S PAS=$S($D(^MASQUE(SC,"DESC",PG,"PAS")):^MASQUE(SC,"DESC",PG,"PAS"),1:1),LIM=^MASQUE(SC,"DESC",PG,%U,"ESPACE"),DXG=$P(LIM,",",1),DYH=$P(LIM,",",2),DXD=$P(LIM,",",3),DYB=$P(LIM,",",4),NB=((DYB-DYH)-1)\PAS,LIB=^MASQUE(SC,"DESC",PG,%U,1)
 S UC=$S($D(^MASQUE(SC,"DESC",PG,%U,4)):^MASQUE(SC,"DESC",PG,%U,4),1:""),AFF=$S($D(^MASQUE(SC,"DESC",PG,%U,"MODAFF")):^MASQUE(SC,"DESC",PG,%U,"MODAFF"),1:""),MAS="^MASQUE(SC,""DESCC"",PG,NU)"
 S PAT=$S($D(^MASQUE(SC,"DESC",PG,%U,"PATOUCH")):^MASQUE(SC,"DESC",PG,%U,"PATOUCH"),1:"")
 F %W=0:1:NB D DO
 Q
DO S @MAS@(1)=LIB,@MAS@(2)=DXG+1,@MAS@(3)=DYH+(%W*PAS),@MAS@(4)=UC,@MAS@("ESPACE")=DXG_","_DXD S:AFF'="" @MAS@("MODAFF")=AFF S:LIB'="" ^MASQUE(SC,"LIB",PG,LIB,DYH+(%W*PAS))=NU_"^"_(DXG+1)_"^"_DXG_"^"_DXD
 S:PAT'="" @MAS@("PATOUCH")=PAT S NU=NU+1
 Q
COMP(SC) 
 S PB=0 K ^MASQUEC(SC) S NU=1
 G:'($D(^MASQUE(SC,"MASQUE"))) NC
 S PG="" F %II=1:1 S PG=$O(^MASQUE(SC,"MASQUE",PG)) Q:PG=""  S %V=^MASQUE(SC,"MASQUE",PG),NU=1 F %U=1:1:%V D @$S($E(^MASQUE(SC,"MASQUE",PG,%U,1))="~":"TRK",1:"TR")
NC S PG="" F %U=1:1 S PG=$O(^MASQUEC(SC,PG)) Q:PG=""  D EPI
 S ^MASQUEC(SC)=$ZP(^MASQUEC(SC,""))+0 G FIN
EPI S NB=$ZP(^MASQUEC(SC,PG,"")),^MASQUEC(SC,PG,1)=$$WROFF^%VVIDEO1_$$CUROF^%VVIDEO1_^MASQUEC(SC,PG,1),^MASQUEC(SC,PG,NB)=^MASQUEC(SC,PG,NB)_$$CURON^%VVIDEO1_$$WRON^%VVIDEO1,^MASQUEC(SC,PG)=$ZP(^MASQUEC(SC,PG,""))
 S LIM=$S($D(^MASQUE(SC,"MASQUE",PG,"POSITION")):^MASQUE(SC,"MASQUE",PG,"POSITION"),1:"-1,-1,80,24") S:LIM="" LIM="-1,-1,80,24" S DXG=$P(LIM,",",1)+1,DYH=$P(LIM,",",2)+1,DXD=$P(LIM,",",3)-1,DYB=$P(LIM,",",4)-1,LG=(DXD-DXG)+1,NU=1
 F %U=DYH:1:DYB S ^MASQUEC(SC,PG,"EFF",NU)=$$XY^%VVIDEO1(DXG,%U)_$J("",LG),NU=NU+1
 S ^MASQUEC(SC,PG,"EFF",1)=$$WROFF^%VVIDEO1_$$CUROF^%VVIDEO1_^MASQUEC(SC,PG,"EFF",1),^MASQUEC(SC,PG,"EFF",NU-1)=^MASQUEC(SC,PG,"EFF",1)_$$CUROF^%VVIDEO1_$$WROFF^%VVIDEO1
 S NU=1,ZZ="",%U=^MASQUEC(SC,PG) F %V=1:1:%U S %W=^MASQUEC(SC,PG,%V) D SC
 I ZZ'="" S ^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1
 S ^MASQUEC(SC,PG)=NU-1 Q
FIN Q
SC S LG=$L(ZZ)+$L(%W) I LG>509 S ^MASQUEC(SC,PG,NU)=ZZ,ZZ="",NU=NU+1
 S ZZ=ZZ_%W Q
TRK S ZZ="",IDT=^MASQUE(SC,"MASQUE",PG,%U,1),ID=$P(IDT,"~",2) D:$D(^MASQUE(SC,"MASQUE",PG,%U,"MODAFF")) MOD S:$P(IDT,"~",2)'="KL" ZZ=ZZ_$$G0ON^%VVIDEO1 G @ID
K S DX=^MASQUE(SC,"MASQUE",PG,%U,2),DY=^MASQUE(SC,"MASQUE",PG,%U,3),LH=$P(IDT,"~",3),LV=$P(IDT,"~",4)
 S ZZ=ZZ_$$XY^%VVIDEO1(DX,DY)_"l"_$TR($J("",LH-2)," ","q")_"k",^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1
 S LI=LV-2 F %UV=1:1:LI S DY=DY+1,ZZ=$$XY^%VVIDEO1(DX,DY)_"x"_$$XY^%VVIDEO1((DX+LH)-1,DY)_"x",^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1
 S ZZ=$$XY^%VVIDEO1(DX,DY+1)_"m"_$TR($J("",LH-2)," ","q")_"j"_$$G0OFF^%VVIDEO1_$$NORM^%VVIDEO1,^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1 Q
KL S IDT=^MASQUE(SC,"MASQUE",PG,%U,1),DXG=$P(IDT,"~",3),DXD=$P(IDT,"~",4),DYH=$P(IDT,"~",5),DYB=$P(IDT,"~",6),DX=DXG,DY=DYH,LH=(DXD-DXG)+1,LV=(DYB-DYH)+1
 S ZZ=ZZ_$$REV^%VVIDEO1_$$XY^%VVIDEO1(DX,DY)_$J("",LH),^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1
 S LI=LV-2 F %UV=1:1:LI S DY=DY+1,ZZ=$$XY^%VVIDEO1(DX,DY)_" "_$$XY^%VVIDEO1((DX+LH)-1,DY)_" ",^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1
 S ZZ=$$XY^%VVIDEO1(DX,DYB)_$J("",LH)_$$NORM^%VVIDEO1,^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1 Q
KSP S PP="" F %UV=1:1 S PP=$O(^MASQUE(SC,"MASQUE",PG,%U,4,PP)) Q:PP=""  S IDT=^MASQUE(SC,"MASQUE",PG,%U,4,PP),ID=$P(IDT,"~",2) D @ID S ZZ=""
 S ^MASQUEC(SC,PG,NU-1)=^MASQUEC(SC,PG,NU-1)_$$G0OFF^%VVIDEO1_$$NORM^%VVIDEO1 Q
L S DX=$P(IDT,"~",5),DY=$P(IDT,"~",6),LG=$P(IDT,"~",4) G @$P(IDT,"~",3)
H S ZZ=ZZ_$$XY^%VVIDEO1(DX,DY)_$TR($J("",LG)," ","q"),^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1 Q
V S LI=(DY+LG)-1
 F %W=DY:1:LI S ^MASQUEC(SC,PG,NU)=ZZ_$$XY^%VVIDEO1(DX,%W)_"x",ZZ="",NU=NU+1
 Q
KS S DX=$P(IDT,"~",4),DY=$P(IDT,"~",5),^MASQUEC(SC,PG,NU)=$$XY^%VVIDEO1(DX,DY)_$P(IDT,"~",3),NU=NU+1 Q
TR S ZZ="",LI=^MASQUE(SC,"MASQUE",PG,%U,1) Q:LI=""  S LI=$$^%QZCHW(LI)
 S DX=^MASQUE(SC,"MASQUE",PG,%U,2),DY=^MASQUE(SC,"MASQUE",PG,%U,3),ZZ=$$XY^%VVIDEO1(DX,DY)
 G:'($D(^MASQUE(SC,"MASQUE",PG,%U,"MODAFF"))) TRS D MOD
TRS S ZZ=ZZ_LI_$$NORM^%VVIDEO1,^MASQUEC(SC,PG,NU)=ZZ,NU=NU+1 Q
MOD S MOD=^MASQUE(SC,"MASQUE",PG,%U,"MODAFF") F %W=1:1 S %UV=$P(MOD,",",%W) Q:%UV=""  D MODS
 Q
MODS I %UV="GRD" S ZZ=ZZ_$$BIG^%VVIDEO1(LI,DX,DY),LI="" Q
 S @("%UW="_"$$"_%UV_"^%VVIDEO1"),ZZ=ZZ_%UW
 Q
 
AFF W !,"Grille : " R SCR Q:$A(SCR)<32
 I '($D(^MASQUE(SCR,"MASQUE"))) W " ???" G AFF
 D CLEPAG^%VVIDEO O $I S NU=^MASQUEC(SCR) F %U=1:1:NU S $X=250 W ^MASQUEC(SCR,%U)
 O $I Q
 
TRANS W !,"Grille : " R SC Q:$A(SC)<32  I '($D(^%SCRE(SC))) W " ???" G TRANS
 S NOMTREE="^%SCRE("""_SC_",COMMENT""",%TREECOP="^MASQUE(SC,""MASQUE"",1" D ^%QCAGLC S NOMTREE="^%SCRE("""_SC_"""",%TREECOP="^MASQUE(SC,""DESC"",1" D ^%QCAGLC G TRANS

