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

;TOWOCGRI^INT^1^59547,74876^0
TOWOCGRI ;
 
 S PY=8,PX=10,REFUSE=0,RESUCONT=C S:C="" PX=$X,PY=$Y
 I C="?" D ^%ABLISEV S DX=PX,DY=PY,REFUSE=1 X XY W CNULI X XY G FIN
 I C["""" G IDEM
 I $D(^[QU]STRUCT(NOMG,2,PY,4)),^[QU]STRUCT(NOMG,2,PY,4)="O" G VCONT
SSS I $D(^[QU]STRUCT(NOMG,2,PY,1)) D @^[QU]STRUCT(NOMG,2,PY,1) G:REFUSE=1 REFUS
 
 I RESUCONT="",$D(^[QU]STRUCT(NOMG,2,PY,2)) S (RESUCONT,C)=^[QU]STRUCT(NOMG,2,PY,2)
 D ^%ABVERVA D:REFUSE=1 CONF G:REFUSE=1 REFUS S MRES=RESUCONT D REFUS S RESUCONT=MRES D ^%ABAFUCO
SUIT K ^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP) S RESUCONT=C S:$L(RESUCONT)>69 RESUCONT=$E(RESUCONT,1,69) S PY=8,PX=10 S:C'=CBLANC ^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,8,10)=RESUCONT D ^TOWGETPH
 S CX=-1 F UU=0:0 S CX=$N(^GRPH($I,CX)) Q:CX=-1  S CY=-1 F VV=0:0 S CY=$N(^GRPH($I,CX,CY)) Q:CY=-1  S ^[QUW]OCGRIL(NOMG,%ALL,%ETAT,%LARG,DP,CY,CX)=^GRPH($I,CX,CY)
 D ^TOWMAJDP
FIN K RESUCONT,CX,UU,CY Q
REFUS S RESUCONT=$S(PY'>PSEP:CNULS,1:CNULI) D ^%ABAFUCO X XY G FIN
CONF D POCLEPA^%VVIDEO W $$^%QZCHW("Valeur refusee ! Reecrivez la pour confirmer") S DX=$X+1 D ^%VLEC
 I ($E(Y1,1)="$")&($E(C,1)="$"),Y1=C S ^[QU]STRUCT(NOMG,2,PY,3,$E(Y1,2,$L(Y1)))=1,REFUSE=0,MRES=RESUCONT D REFUS S RESUCONT=MRES G FIN
 I $E(Y1,1)="$",$E(Y1,2,$L(Y1))=C S ^[QU]STRUCT(NOMG,2,PY,3,C)=1,REFUSE=0,MRES=RESUCONT D REFUS S RESUCONT=MRES G FIN
 I $E(C,1)="$",$E(C,2,$L(C))=Y1 S ^[QU]STRUCT(NOMG,2,PY,3,Y1)=1,REFUSE=0,MRES=RESUCONT D REFUS S RESUCONT=MRES G FIN
 G FIN
VCONT S CGET=C,CROC1=$E(CGET,1),CROC2=$E(CGET,$L(CGET))
 I (CROC1="[")!(CROC1="]") S C=$E(CGET,2,$L(CGET))
 I (CROC2="[")!(CROC2="]") S C=$E(C,1,$L(C)-1)
 S CSCROC=C,C=$S(C[",":$P(C,",",2),1:C)
 S %PCH=C D ^%QZNBN1 G:'(ISNUM) REFUS
 I (CROC1'="[")&(CROC1'="]") S CROC1="["
 I (CROC2'="[")&(CROC2'="]") S CROC2="]"
 S COLC=($X-9)\(ESPC+1)
 I (COLC'=0)!(DP'=1) G VCS
 I CSCROC["," S CG=$P(CSCROC,",",1),CD=$P(CSCROC,",",2) G:CG="" ALOR S RESUCONT=CROC1_CG_","_CD_CROC2 D ^%ABAFUCO G SUIT
ALOR S RESUCONT="==> ,"_C_CROC2 D ^%ABAFUCO G SUIT
VCS G:CSCROC'["," ALOR I $P(CSCROC,",",1)'="" S RESUCONT=CROC1_CSCROC_CROC2 D ^%ABAFUCO G SUIT
 I (COLC=0)&(DP'=1) S ODP=DP-NBC,ODX=((ESPC+1)*(NBC-1))+10 G:'($D(^[QUW]OCGRIL(NOMG,%NORM,ODP,PY,ODX))) REFUS D REFUS S ONUD=^[QUW]OCGRIL(NOMG,%NORM,ODP,PY,ODX),RESUCONT=CROC1_$E($P(ONUD,",",2),1,$L($P(ONUD,",",2))-1)_","_C_CROC2 D ^%ABAFUCO G SUIT
 I '($D(^[QUW]OCGRIL(NOMG,%NORM,DP,PY,PX-(ESPC+1)))) G REFUS
 S ODX=PX-(ESPC+1),ONUD=^[QUW]OCGRIL(NOMG,%NORM,DP,PY,ODX),RESUCONT=CROC1_$E($P(ONUD,",",2),1,$L($P(ONUD,",",2))-1)_","_C_CROC2 D ^%ABAFUCO G SUIT
IDEM S COLC=($X-9)\(ESPC+1)
 I (COLC=0)&(DP=1) G REFUS
 I (COLC=0)&(DP'=1) S ODP=DP-NBC,ODX=((ESPC+1)*(NBC-1))+10 G:'($D(^[QUW]OCGRIL(NOMG,%NORM,ODP,PY,ODX))) REFUS D REFUS S RESUCONT=^[QUW]OCGRIL(NOMG,%NORM,ODP,PY,ODX) D ^%ABAFUCO G SUIT
 I '($D(^[QUW]OCGRIL(NOMG,%NORM,DP,PY,(PX-ESPC)-1))) G REFUS
 D REFUS S ODX=(PX-ESPC)-1,RESUCONT=^[QUW]OCGRIL(NOMG,%NORM,DP,PY,ODX) D ^%ABAFUCO G SUIT
S W *
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

