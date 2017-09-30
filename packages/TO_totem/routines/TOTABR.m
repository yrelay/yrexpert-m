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

;TOTABR^INT^1^59547,74875^0
TOTABR ;
 
 S ECHEC=0,CONCUR=0 I '($D(^[QUI]FULL(YART,PCH))) G PTHM
 S PCHCOMP=PCH,POSII="?",CONCUR=1 G FINI
PTHM I $D(^[QUI]HM(YART,PCH)) S POSII=^[QUI]HM(YART,PCH),CONCUR=1,PCHCOMP=^[QUI]PAR(YART,POSII) G FIN
 S SEP=".",CONCUR=0,POSII=-1,ECHEC=0
 S CH=PCH,EF="EF" D DECOMP
 S PARP="^[QUI]PARP(YART",EF="EF",DED=1
L F PR=DED:1:%1NPT1 S @("V="_EF_PR),VP="V",C=PARP_","_VP_")",(E,@("D"_PR))=$N(@C) S:@("EG"_PR)="" @("EGC"_PR)=$E(E,1) S EG=$S(@("EG"_PR)="":"EGC",1:"EG") G:(@("D"_PR)=-1)!($E(@("D"_PR),1,@("L"_PR))'=@(EG_PR)) S S @("PARP"_PR)=PARP,PARP=PARP_","_("D"_PR)
 S LIBC="" F UU=1:1:PR S LIBC=LIBC_$S(LIBC="":"",1:".")_@("D"_UU)
 G:('($D(^[QUI]IMPLICI(YART,LIBC))))&('($D(^[QUI]EXPL(YART,LIBC)))) NEX
 S CC1=PARP_",-1)",NX1=$N(@CC1) I NX1'=-1 S CONCUR=2 G FIN
NEX S CC1=PARP_",-1)",NX1=$N(@CC1),CC2=PARP_","""_NX1_""")",NX2=$N(@CC2) I NX2'=-1 S CONCUR=2 G FIN
 S CONCUR=CONCUR+1 G:CONCUR'<2 FIN D FINREF S PARP=@("PARP"_PR),DED=%1NPT+1,EF="D" G L
S I PR=1 G CONCLU
 F UU1=PR:1:%1NPT+1 S @("D"_UU1)=@("EF"_UU1)
 S:PR'=1 PR=PR-1 S EF="D",DED=PR,PARP=@("PARP"_PR) G L
 Q
DECOMP S %1NPT=0,POS=1 F I1=1:1 Q:$F(CH,SEP,POS)=0  S POS=$F(CH,SEP,POS),%1NPT=%1NPT+1
 S %1NPT1=%1NPT+1 F Z1=1:1:%1NPT1 D TRAIT
 S %1NPT2=%1NPT1+1,@("EF"_%1NPT2)="-1",@("EG"_%1NPT2)="",@("L"_%1NPT2)=1 Q
TRAIT S SCH=$P(CH,SEP,Z1),SSCH=SCH+0,@("L"_Z1)=$L(SCH) I SSCH=SCH S @("EG"_Z1)=SCH,@("EF"_Z1)=SCH-1 Q
 S @("EG"_Z1)=SCH S:(SCH'="")&(SCH'=" ") AM=$E(SCH,@("L"_Z1)),AN=$C($A(AM)-1),@("EF"_Z1)=$E(SCH,1,@("L"_Z1)-1)_AN_$C(122) I (SCH="")!(SCH=" ") S @("EF"_Z1)="-1",@("EG"_Z1)=SCH,@("L"_Z1)=1 Q
 Q
FINREF S PARQ=PARP,TWQ=-1 F WWZZ=0:0 S PARQS=PARQ_")",TWQ2=$N(@PARQS@(TWQ)) Q:TWQ2=-1  S PARQ=PARQ_","""_TWQ2_""""
 S POSII=@PARQS Q
CONCLU I CONCUR=0 S ECHEC=1 G FIN
 I CONCUR=1 S ^[QUI]HM(YART,PCH)=POSII,PCHCOMP=^[QUI]PAR(YART,POSII) G FIN
FIN S:CONCUR'<2 ECHEC=1
FINI K %NPT1,%NPT,%NPT2,AM,AN,C,CC1,CC2,CH,DED,E,EF,EG,HT,I1,LIBC,NX1,NX2,PARP,PARQ,PARQS,POS,PR,SCH,SEP,SSCH,TWQ,TWQ2,UU1,VP,WQ,WWZZ,Z1,EF1,EF2,EF3,EF4,EF5,EF6,EF7,EF8,EF9,EF10,EG1,EG2,EG3,EG4,EG5,EG6,EG7,EG8,EG9,EG10 Q
TEST W !,"YART : " R YART Q:YART=""  K ^[QUI]HM(YART)
TEST1 W !,$$^%QZCHW(" Abreviation a determiner : ") R PCH G:PCH="" TEST D ^TOTABR W !,"CONCUR = ",CONCUR,", POSII = ",POSII,!,$$^%QZCHW(" soit : "),PCHCOMP,! G TEST1

