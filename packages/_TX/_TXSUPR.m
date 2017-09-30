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

;%TXSUPR^INT^1^59547,74033^0
%TXSUPR ;
 
 
 
 
 N ADR,X1,NAME,SRDV,OCC,DNAI,RRR,OO,UC,COM,PRENO,HORDV,SX,SY
 D HRV^%TXINDH
 S DX=0,DY=17 D CLEBAS^%VVIDEO,LISRDV^%TXAFFS
 D POCLEPA^%VVIDEO W $$^%QZCHW("Tapez CTRLA pour sortir ou S sur le rendez-vous a supprimer")
LIS S DX=0,DY=19,NXI=-1,NXS=80,NYI=18,NYS=24,MPASX=20,MPASY=1 X XY
 D ^%VZECUR S ADR=$S(X1=1:1,X1=83:83,1:"LIS") G @ADR
 
1 Q
83 
 S SX=$X,SY=$Y I '($D(TRDV(SX,SY))) D ^%VSQUEAK G LIS
 S NAME=$P(TRDV(SX,SY),"^",1),SRDV=$P(TRDV(SX,SY),"^",2)
 G:NRDV(NAME)>1 SUIT K ^[QUI]RDV(TAD,SRDV,NAME)
 G SUP
 
SUIT S DX=0,DY=17 D CLEBAS^%VVIDEO
 S DX=5 X XY W "Homonymies",!
 S DNAI="",RRR=$P(HRDV,"H",2),HRD=HRDV
SUIT2 G:$P(HRD,"H",2)>(RRR+14) ALORS
 F OO=1:1 S DNAI=$O(^[QUI]RDV(TAD,HRD,NAME,DNAI)) S:DNAI="" HRD=$E(HRD,1,3)_($P(HRD,"H",2)+1) G:DNAI="" SUIT2 D PERSON
PERSON S COM="" F UC=0:0 S COM=$O(^[QUI]RDV(TAD,HRD,NAME,DNAI,COM)) Q:COM=""  S PRENO=$P(^[QUI]RDV(TAD,HRD,NAME,DNAI,COM),"^",3) W !,NAME,?$X+5,PRENO,?$X+5,DNAI,?$X+5,COM S HORDV($Y)=DNAI_"^"_COM_"^"_HRD
 Q
 
ALORS D POCLEPA^%VVIDEO W $$^%QZCHW("Tapez CTRLA pour sortir ou S sur le rendez-vous a supprimer")
 S DX=0,DY=19 X XY
 S MPASX=0,MPASY=1,NYI=18,NYS=24 D ^%VZECUR
 G:(X1'=1)&(X1'=83) ALORS S ADR=$S(X1=1:X1,1:X1+1) G @ADR
 
84 I '($D(HORDV($Y))) D ^%VSQUEAK G ALORS
 K ^[QUI]RDV(TAD,$P(HORDV($Y),"^",3),NAME,$P(HORDV($Y),"^",1),$P(HORDV($Y),"^",2))
SUP 
 D DEL^%TXGOCC
 S DX=PX,DY=PY,OCC="^[QUI]OCCUPE(DP,DSEM,PY,PX)"
 I $D(@OCC) D REV^%VVIDEO X XY W @(OCC) G FIN
 X XY W $S((((((DX=10)!(DX=18))!(DX=26))!(DX=34))!(DX=42))!(DX=50):"|",1:".")
 G FIN
 
FIN 
 D NORM^%VVIDEO
 S DX=0,DY=17 D CLEBAS^%VVIDEO
 Q

