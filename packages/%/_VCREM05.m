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

;%VCREM05^INT^1^59547,74034^0
GECREM05 ;
 K ^POSENR($I) S NEXT=-1
 N PAGE S PAGE=1,LI=5,LILIM=22
EXP F %U=1:1 S NEXT=$N(LIBEL(NEXT)) Q:NEXT=-1  S ^POSENR($I,LI)=NEXT,LI=LI+1
FEXP D CLEPAG^%VVIDEO S DY=-1,DX=2 F %U=1:1 S DY=$N(^POSENR($I,DY)) Q:DY=-1  X XY W ^POSENR($I,DY),?30,"= ",CHAR(LIBEL(^POSENR($I,DY)))
DEB S DEBP=4,DY=5,DX=32 S:DY>21 DY=21 X XY S MPASX=0,MPASY=1,NXI=31,NXS=33,NYI=4,NYS=22 X XY
 S %FL=0,C=""
LEC D ECHOFF^%VVIDEO X XY S C="" D ^%VZECUR G:(X1=1)!(X1=6) FIN G:X1=7 GOMME S:C="" PX=$X,PY=$Y G:(C="")&('($D(^POSENR($I,PY)))) LEC G HLP:X1=8,MOD:X1=9,13:X1=13,LEC:$A(X1)<32 W $C(X1)
 S PAR=LIBEL(^POSENR($I,PY)),YG=$C(X1)_$E(CHAR(PAR),2,599),DX=$X X XY S PCX=$X-1,PCY=$Y D BEG^%VLEC
XXX I (CTRLA=1)!(CTRLF=1) S C="" G FIN
XX1 S C=Y1,CHAR(PAR)=C,DX=PX,DY=PY+1 G LEC
13 S PAR=LIBEL(^POSENR($I,PY)),Y1=CHAR(PAR) G XX1
MOD S (CTRLA,CTRLF)="",PAR=LIBEL(^POSENR($I,PY)),YG=CHAR(PAR),DX=$X,DY=$Y X XY S PCX=$X,PCY=$Y O 0 D MFLD^%VLEC G XXX
FIN Q
HLP D POCLEPA^%VVIDEO W DEF(LIBEL(^POSENR($I,PY)))," [RETURN] " R *X:60 D POCLEPA^%VVIDEO S DX=32,DY=PY G LEC
EFF S DX=32,DY=PY X XY W "                          " X XY G LEC
GOMME G:'($D(^POSENR($I,$Y))) LEC S ADY=$Y,PY=$Y,PY=ADY,PAR=^POSENR($I,PY),CHAR(LIBEL(PAR))="" G EFF
END Q

