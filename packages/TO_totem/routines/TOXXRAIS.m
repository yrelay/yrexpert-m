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
;! HL002 ! HL     ! 16/07/12 ! Propulsé par Yexpert le                        !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOXXRAIS^INT^1^59547,74877^0
TOXXRAIS ;
 K ^PILAVER($J),^TBOPT($J),^PILVU($J)
 S ^PILVU($J)=19_","_17_"/"_1_","_19_"/"_0,^PILAVER($J)=0,LOPT=$P($T(LOPT),";;",2)
 F %U=1:1 S OPT=$P(LOPT,",",%U) Q:OPT=""  S ^TBOPT($J,$$^%QZCHW($P(OPT,"/",1)))=$P(OPT,"/",2)
LOPT ;;Condition/COND,Action/ACT,Temps et couts/TPS,Consignes/CONS,Premisses/PREM,Resultantes/RESU
QU S TPL=^PILAVER($J) G:TPL=0 QUS
 K AVER S CONCUR=^PILAVER($J,TPL),%U=1 F Y1="AVER","OBJ","TWREF","ART","NUFA" S @Y1=$P(CONCUR,"^",%U),%U=%U+1
 D:ART'=ARTAFF WART^TOXXVERI
 S TRS=$S(OBJ="ART":"^[QUI]RAISON",1:"^[QUI]RAISMAT"),Y1=AVER,^PILAVER($J)=TPL-1 K ^PILAVER($J,TPL) G KNW
QUS S TRS=$S(OBJ="ART":"^[QUI]RAISON",1:"^[QUI]RAISMAT") D BAP S PX=2,PY=22,TBMOV="TBSUIT"
CEL S DX=PX,DY=PY D ^%VZEREVS S PX=$X,PY=$Y G CEL:'($D(TBSUIT(PY,PX))),FIN:X1=1,FIN:X1=6,@SUITTB(TBSUIT(PY,PX))
 
OP1 S DX=5,DY=9 X XY W $J("",42) D ^%VLEC G:Y1="" QUS G:$D(@TRS@(NUFA,TWREF,Y1)) KNW
 S (SFA,YART)=ART,PCH=Y1 D ^TO3VSFAB,^TOTABR G PARA:CONCUR=1,UNKN:CONCUR=0
AMBI S DX=2,DY=22 X XY W $J("",46) X XY W $$^%QZCHW("Abreviation ambigue")," [RETURN] " R *Y1:60 G QU
UNKN S DX=2,DY=22 X XY W $J("",46) X XY W $$^%QZCHW("Inconnu")," [RETURN] " R *Y1:60 G QU
PARA S (AVER,Y1)=PCHCOMP G KNW
FIN Q
 
OPT K SUITTB S DX=1,DY=22 X XY W $J("",47) S DX=-1 F %U=1:1 S DX=$N(TBSUIT(DX)) Q:DX=-1  X XY W TBSUIT(DX) S SUITTB(22,DX)=TBSUIT(DX)
 S TBMOV="SUITTB",PX=$O(TBSUIT("")),PY=22
LEC S DX=PX,DY=PY D ^%VZEREVS S PX=$X,PY=$Y G DEPIL:(X1=1)!(X1=6),DEPIL:PX=2,LEC:X1'=13,LEC:'($D(TBSUIT(PX))) G:TBSUIT(PX)=$$^%QZCHW("Fin") DEPIL G LEC:'($D(^TBOPT($J,TBSUIT(PX))))
 S TPL=^PILAVER($J)+1,^PILAVER($J)=TPL,^PILAVER($J,TPL)=AVER_"^"_OBJ_"^"_TWREF_"^"_ART_"^"_NUFA
 D @(^TBOPT($J,TBSUIT(PX))_"^TOXXRAI2") G QU
DEPIL S TPL=^PILVU($J),TPL(1)=$P(TPL,"/",1),TPL(2)=$P(TPL,"/",2),TPL(3)=$P(TPL,"/",3) G QU:TPL(3)'>0 S LD=$P(TPL(1),",",1),LHA=$P(TPL(1),",",2),PGC=$P(TPL(2),",",1),LIGC=$P(TPL(2),",",2)+1
 K ^PILVU($J,PGC,LIGC) O $I S DX=51,DY=LIGC X XY W $J("",27)
 I LIGC=LD S LIGC=LHA-1,PGC=PGC-1 D AFFV^TOXXRAI3
PILVU S ^PILVU($J)=TPL(1)_"/"_PGC_","_LIGC_"/"_(TPL(3)-1) G QU
KNW K LIB,COND,ACT,RSF,VAL,TBSUIT
 S (RSF,COND,ACT,VAL)="",AVER=Y1 I '($D(@TRS@(NUFA,TWREF,AVER))) S ADR="EXP" G KNRV
KNWR S RS=@TRS@(NUFA,TWREF,AVER) G FICH:$E(RS,1,6)="^[QUI]" G:$P(RS,"^",1)="ABAQUE" ABAQ G:$P(RS,"(",1)["SYST" SYST G:RS="IMPLICITMODIFICATION" IMPMOD G QU
FICH S ADR=$E(RS,7,9)
KNRV D ^TOXXRAI1 G QU:'($D(TBSUIT)),OPT
ABAQ S ADR="ABAQ" G KNRV
SYST S ADR="SYST" G KNRV
IMPMOD S ADR="IMPMOD" G KNRV
BAP D CUROF^%VVIDEO S DX=2,DY=9 X XY W $J("",46) S DX=2 F DY=12:1:19 X XY W $J("",46)
 D COPY,CLEBA G @OBJ
ART G ART0:TWREF=0 S LIS="A verifier/OP1"_$S($D(^[QUI]TVPAR(NUFA,TWREF,"FAMMAT")):",Matiere/OP2",1:"")_",Liste composants/OP4" G MN1
ART0 S LIS="A verifier/OP1"_$S($D(^[QUI]TVPAR(NUFA,TWREF,"FAMMAT")):",Matiere/OP2",1:"")_",Edition/OP3,Liste composants/OP4" G MN1
MAT S LIS="A verifier/OP1,Article/OP2"
MN1 K TBSUIT,SUITTB S PX=2 F %U=1:1 S DX=$P(LIS,",",%U) Q:DX=""  S DY=$P(DX,"/",2),DX=$P(DX,"/",1),TBSUIT(22,PX)=$$^%QZCHW(DX),SUITTB($$^%QZCHW(DX))=DY,PX=(PX+$L($$^%QZCHW(DX)))+2
 S DY=22,DX=-1 F %U=1:1 S DX=$N(TBSUIT(DY,DX)) Q:DX=-1  X XY W TBSUIT(DY,DX)
 D CURON^%VVIDEO Q
CLEBA S DX=1,DY=22 X XY W $J("",47) S DX=2 X XY Q
 
OP2 S OBJ=$S(OBJ="ART":"MAT",1:"ART") D @(OBJ_"^TOXXRAI5") G QU
OP3 D EDIT^TOXXRAI5 G QU
OP4 D COMP^TOXXRAI5 G QU
 
;HL002 COPY D ZD^%QMDATE4,^%QMDAK0 S DX=2,DY=7 X XY W " Copyright Yrelay   ",%DAT,"  ",HEURE Q
COPY D ZD^%QMDATE4,^%QMDAK0 S DX=2,DY=7 X XY W " Propulsé par Yexpert le ",%DAT,"  ",HEURE Q

