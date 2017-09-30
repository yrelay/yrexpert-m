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
;! HL002 ! HL     ! 04/02/07 ! X W * -> X W "*"                               !
;! HL003 ! HL     ! 04/02/07 ! Label AJB n'existe pas.                        !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TO39FORB^INT^1^59547,74869^0
TO39FORB ;
 
 S %BLOC=0 I ADEL["FORMU",XDP[":" S %BLOC=1 G END
 D CORRECT^%ABRECPO I CORRECT=0 S AEXEC=0 G END
 S XPX=1,AEXEC=1,IKS=$N(T(-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(T(IK)) Q:IKS=-1  I IKS'=(IK+1) S PCH=$E(XDP,IK+1,IKS-1) W "*" D ABREV S VPOL(XPX)=VXPX,XPX=XPX+1
 D ^%ABRECON Q
ABREV S ROPC="^TO39FORB" G:$E(PCH,1)="""" PCH
 I PCH["'" S BES($$^%QZCHW("IMPLICI"),PCH)=1 D ^TO39LATB Q
 I PCH["~" D IND^%ABANABR Q
PCH D ^%ABANABR G @AD
CONT S ^[QUI]RANG(ARTI,WB2)=1 G FIN
ZERO I CONCUR=0 G CONCAT
FIN S BES($$^%QZCHW("IMPLICI"),PCH)=1,CONCUR=1,PCHCOMP=PCH D ^TO39KEMP S %BIL=PCHCOMP,%PYT=$$^%QZCHW("P") D ^%ABLIBTY
FIN1 S %RL=0,VXPX="^V($I,YA,"""_PCHCOMP_""")" Q
ESTENT S VXPX=PCH Q
QUIT Q
END Q
CONCAT I $E(PCH,1)="$" S VXPX=PCH G END
 I NOLIT=1 D ^%ABLIEU S ^[QUI]UNKN(WB1,PCH,$E(PCH,1,2)_$R(10000))=ADEL_$$^%QZCHW(" ")_FFF,PCHCOMP=PCH D DEB^TO39KEMP S %BIL=PCH,%PYT="UP" D ^%ABLIBTY G FIN1
 S VXPX=""""_PCH_"""",%BIL=PCH,%PYT=$$^%QZCHW("C") D ^%ABLIBTY G END
 ;HL002 X W *
X W "*"
 S NDY=-1,BDY=DYC+1 F TT=0:0 S NDY=$N(^GRPH($I,DXC,NDY)) Q:NDY=-1  S BDY=NDY
 S NDY=BDY+1,DY=NDY,^GRPH($I,DXC,DY)=$C(X1),DX=DXC X XY W $C(X1) S DX=DXC,DY=DYC X XY W "*" X XY G AJB
BEGSH S BL="" F UU=1:1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S LBL=$L(BL),DX=$S(LBL'<69:10,1:LBL+10) X XY G AJB
GETLIM S BL="" F UU=69:-1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S %TBL=$L(BL),%DCAR=(79-%TBL)-1 Q
ENDSH S BL="" F UU=69:-1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S LBL=$L(BL),DX=$S(LBL=0:79,1:79-LBL) X XY G AJB
PARA S DXC=$X,DYC=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D SUIT^TOWOCGRI,^TOWGPARA,CLEPAG^%VVIDEO,^%ABAFIGR,^%ABAFSCR S DE=5,FI=18 D ^%ABNETTO,^TOWAFGRI,^TOWEMPGR,^TOWLIGNU K RESUL D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXC,DY=DYC X XY G AJB

AJB Q  ;HL003
