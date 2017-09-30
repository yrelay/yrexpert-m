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

;%TXDEPL^INT^1^59547,74031^0
%TXDEPL ;
 
 
 
 
 N ADR,X1,OO,UC,MI,RRR,SRDV,PRENO,UU,HORDV,SX,SY
 D HRV^%TXINDH
 S ZDP=DP,ZPX=PX,ZPY=PY,ZDSEM=DSEM,DY=17,DX=0
 D CLEBAS^%VVIDEO,LISRDV^%TXAFFS
 D POCLEPA^%VVIDEO W $$^%QZCHW("Tapez CTRLA pour sortir ou D sur le rendez-vous a deplacer")
LIS S DX=0,DY=19,NXI=-1,NXS=80,NYI=18,NYS=24,MPASX=20,MPASY=1 X XY
 D ^%VZECUR S ADR=$S(X1=1:1,X1=68:68,1:"LIS") G @ADR
 
1 Q
68 S SX=$X,SY=$Y I '($D(TRDV(SX,SY))) D ^%VSQUEAK G LIS
 S NAME=$P(TRDV(SX,SY),"^",1),SRDV=$P(TRDV(SX,SY),"^",2) G:NRDV(NAME)>1 SUIT
 S DNAI=$O(^[QUI]RDV(TAD,SRDV,NAME,"")),COM=$O(^[QUI]RDV(TAD,SRDV,NAME,DNAI,"")),CCITA=^[QUI]RDV(TAD,SRDV,NAME,DNAI,COM)
 F OO=1:1:$L(NAME) W " "
 S WTAD=TAD,WHRDV=SRDV,DEP=1
 Q
 
SUIT S DX=0,DY=17 D CLEBAS^%VVIDEO
 S DX=5 X XY W "Homonymies",!
 S DNAI="",RRR=$P(HRDV,"H",2),HRD=HRDV
SUIT2 G:$P(HRD,"H",2)>(RRR+14) ALORS
 F OO=1:1 S DNAI=$O(^[QUI]RDV(TAD,HRD,NAME,DNAI)) S:DNAI="" MI=$P(HRD,"H",2)+1,HRD=$E(HRD,1,3)_$S($L(MI)>1:MI,1:"0"_MI) G:DNAI="" SUIT2 D PERSON
PERSON 
 S COM="" F UC=0:0 S COM=$O(^[QUI]RDV(TAD,HRD,NAME,DNAI,COM)) Q:COM=""  S PRENO=$P(^[QUI]RDV(TAD,HRD,NAME,DNAI,COM),"^",3) W !,NAME,?$X+5,PRENO,?$X+5,DNAI,?$X+5,COM S HORDV($Y)=DNAI_"^"_COM_"^"_HRD
 Q
 
ALORS D POCLEPA^%VVIDEO W $$^%QZCHW("Tapez CTRLA pour sortir ou D sur le rendez-vous a deplacer")
 S DX=0,DY=19 X XY
 S MPASX=0,MPASY=1,NYI=18,NYS=24 D ^%VZECUR G:(X1'=1)&(X1'=68) ALORS
 S ADR=$S(X1=1:X1,1:X1+1) G @ADR
69 I '($D(HORDV($Y))) D ^%VSQUEAK G ALORS
 S UU=$Y,CCITA=^[QUI]RDV(TAD,$P(HORDV(UU),"^",3),NAME,$P(HORDV(UU),"^",1),$P(HORDV(UU),"^",2)) F OO=1:1:79 W " "
 S WTAD=TAD,WHRDV=$P(HORDV(UU),"^",3),DNAI=$P(HORDV(UU),"^",1),COM=$P(HORDV(UU),"^",2),DEP=1
 Q
 
DEPL 
 N ZON,LIMI,DPU,DSEMU,PXU,PYU,ABAND
 I NAME="RESERVE" S LIBEL=^[QUI]OCCUPE(ZDP,ZDSEM,ZPY,ZPX),%RESERVE=1
 D HRV^%TXINDH
 S DX=0,DY=17,(ZON,LIMI)=$P(HRDV,"H",2)
 D CLEBAS^%VVIDEO,TITRE^%TXAJRV
 S $P(CCITA,"^",1)=$E(HRDV,1,3)_$S($P(HRDV,"H",2)="":15,1:$P(HRDV,"H",2)+15),^[QUI]RDV(TAD,HRDV,NAME,DNAI,COM)=CCITA
 D AJ^%TXGOCC
 S DPU=DP,DSEMU=DSEM,PXU=PX,PYU=PY,DP=ZDP,DSEM=ZDSEM,PX=ZPX,PY=ZPY
 D DEL^%TXGOCC
 K ^[QUI]RDV(WTAD,WHRDV,NAME,DNAI,COM)
 S DP=DPU,DSEM=DSEMU,PX=PXU,PY=PYU,DEP=0,DX=69,DY=0 X XY W "           "
 G:DP'=ZDP FIN
 S DX=ZPX,DY=ZPY I $D(^[QUI]OCCUPE(ZDP,ZDSEM,ZPY,ZPX)) D REV^%VVIDEO X XY W ^[QUI]OCCUPE(ZDP,ZDSEM,ZPY,ZPX) G FIN
 X XY W $S((ZPX#10)=0:"|",1:".")
FIN 
 D NORM^%VVIDEO
 K ZDP,ZPX,ZPY,ZDSEM,WTAD,WHRDV,CCITA,DNAI,COM
 Q

