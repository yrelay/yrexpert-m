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
;! Nomprog     : SOURCPT2                                                     !
;! Module      : Souris (SOUR)                                                !
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

SOURCPT2 ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="Comprehension du S-F sur la souris" D 4^%VZCD S DX=0,DY=8 X XY
 K ^GETABAC2($I) S ARTI="SOURIS",YA=ARTI K ^[QUI]TIMCOMP(ARTI),^DEDUIT($I) D INT^%QMDAK0,ZD^%QMDATE4 S ^[QUI]TIMCOMP(ARTI,%DAT)=HEURE D ^TO3DELIM
 S TABIMP="^[QUI]IMPLICI"
 D ^SOURPARA,BEG^%ABPARAR,^TO3FOFON,^TO3GPAR,^TO3DLIGI,RECABR
 K ^[QUI]PAR(ARTI) D INT^%QMDAK0 S ^[QUI]TIMCOMP(ARTI,%DAT)=^[QUI]TIMCOMP(ARTI,%DAT)_"^"_HEURE D ^%VSQUEAK Q
RECABR D ^TOVERIEX
 K FLTAB S (TABNAM,NOMTAB)="^[QUI]IMPLICI" D GETNAMFU
 S ETUD="IMPL",NTAB="^[QUI]IMPLICI(ARTI,",IPREM=2,NCLE=3,PNUM=2,F1=18,NFOR=1 D PREPA,L^TO3GABRI,^TO39GRAN,^TO39GBIS,^TOGETRI K ^NIVPAR($I,ARTI),^REFTREE($I,ARTI),^ORDNIV($I,ARTI),^NFISIMP($I,ARTI),^ESTFONCT,^NOFONCT D KILL
FIN Q
PREPA S LT=$L(NTAB),%L=$L("^[QUI]F"),FONTAB="^[QUI]F"_$E(NTAB,%L,LT-1),ADEL=$E(NTAB,%L,LT-1)_")",WDEB=2,WAB="WAB",(WB1,WAB1)=ARTI F SS=2:1:NCLE S @("WAB"_SS)=-1
 Q
KILL F %UU=1:1:NCLE K @("WB"_%UU)
 F %UU=1:1:NFOR K @("F"_%UU)
 K %UU Q
GETNAMFU 
 D ^%VTNAMFU S:%NFU="" %NFU=NOMTAB
 S FLTAB=%NFU K %NF1,%NFU Q
Y S %DUP=0 K ^PLUCOL($I) G AJB
 S CCOL=($X-9)\(ESPC+1),DYC=$Y,DXC=((ESPC+1)*CCOL)+10,DX=DXC,^PLUCOL($I)=^PLUCOL($I)_"^"_DP_"/"_DXC,%DUP=0,DX=70,DY=1 X XY W "       " D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXC,DY=DYC X XY
 G AJB
DEPCOL I '($D(^PLUCOL($I))) S ODX=DX,ODY=DY D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Aucune colonne a dupliquer n'est connue ! [RETURN] ") R *RET D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") S DX=ODX,DY=ODY X XY G AJB
 D ^TOWDEPCO X XY G AJB
PB D MORE^%ABCALDP,^TOWAFGRI,^TOWLIGNU,^TOWEMPGR,PGE^TOWGRPAG,AFFICH^TOWGRPAG S DX=10,DY=8 X XY G AJB
RET D SUIT^TOWOCGRI,^TOWGRETO G AJB
PH S DXC=$X,DYC=$Y,POSC=$X-9,C=$E(C,1,POSC-1)_"*"_$E(C,POSC+1,299) I '($D(^GRPH($I,DXC))) S DY=DYC+1,^GRPH($I,DXC,DY)=$C(X1) X XY W $C(X1) S DX=DXC,DY=DYC X XY W "*" X XY G AJB
 S NDY=-1,BDY=DYC+1 F TT=0:0 S NDY=$N(^GRPH($I,DXC,NDY)) Q:NDY=-1  S BDY=NDY
 S NDY=BDY+1,DY=NDY,^GRPH($I,DXC,DY)=$C(X1),DX=DXC X XY W $C(X1) S DX=DXC,DY=DYC X XY W "*" X XY G AJB
BEGSH S BL="" F UU=1:1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S LBL=$L(BL),DX=$S(LBL'<69:10,1:LBL+10) X XY G AJB
GETLIM S BL="" F UU=69:-1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S %TBL=$L(BL),%DCAR=(79-%TBL)-1 Q
ENDSH S BL="" F UU=69:-1 S CC=$E(C,UU) Q:CC=""  Q:$A(CC)>32  S BL=BL_" "
 S LBL=$L(BL),DX=$S(LBL=0:79,1:79-LBL) X XY G AJB
PARA S DXC=$X,DYC=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D SUIT^TOWOCGRI,^TOWGPARA,CLEPAG^%VVIDEO,^%ABAFIGR,^%ABAFSCR S DE=5,FI=18 D ^%ABNETTO,^TOWAFGRI,^TOWEMPGR,^TOWLIGNU K RESUL D POCLEPA^%VVIDEO W $$^%QZCHW("(CTRLH) Aide memoire") D AFFICH^TOWGRPAG S DX=DXC,DY=DYC X XY G AJB

