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

;%AMFIND2^INT^1^59547,73865^0
%AMFIND2 ;;11:57 AM  10 Aug 1993;
 
 
 
FIND(ETU,INST,NJRN,NINST,TYPE,profondeur,NBKEY,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6) 
 N NINST2,NINST3,A
 N JRN
 S JRN=ETU,NINST=INST
 
 G:TYPE="" FIND2
 S K1=KEY1,K2=KEY2,K3=KEY3,K4=KEY4,K5=KEY5,K6=KEY6
AGA 
 
 
 
 
 
 S NINST2=-1
 I KEY1'="*" S K1=KEY1 D:$D(@GEXEC@(TYPE,K1)) BEST2 G FFILLE
 S K1="" F %K=0:0 S K1=$O(@GEXEC@(TYPE,K1)) Q:K1=""  D BEST2
 G FFILLE
BEST2 I NBKEY=1 S N2=$ZP(@GEXEC@(TYPE,K1,NINST)) S:(N2'="")&(N2>NINST2) NINST2=N2 Q
 I KEY2'="*" S K2=KEY2 Q:'($D(@GEXEC@(TYPE,K1,K2)))  D BEST3 Q
 S K2="" F %K=0:0 S K2=$O(@GEXEC@(TYPE,K1,K2)) Q:K2=""  D BEST3
 Q
BEST3 I NBKEY=2 S N2=$ZP(@GEXEC@(TYPE,K1,K2,NINST)) S:(N2'="")&(N2>NINST2) NINST2=N2 Q
 I KEY3'="*" S K3=KEY3 Q:'($D(@GEXEC@(TYPE,K1,K2,K3)))  D BEST4 Q
 S K3="" F %K=0:0 S K3=$O(@GEXEC@(TYPE,K1,K2,K3)) Q:K3=""  D BEST4
 Q
BEST4 I NBKEY=3 S N2=$ZP(@GEXEC@(TYPE,K1,K2,K3,NINST)) S:(N2'="")&(N2>NINST2) NINST2=N2 Q
 I KEY4'="*" S K4=KEY4 Q:'($D(@GEXEC@(TYPE,K1,K2,K3,K4)))  D BEST5 Q
 S K4="" F %K=0:0 S K4=$O(@GEXEC@(TYPE,K1,K2,K3,K4)) Q:K4=""  D BEST5
 Q
BEST5 I NBKEY=4 S N2=$ZP(@GEXEC@(TYPE,K1,K2,K3,K4,NINST)) S:(N2'="")&(N2>NINST2) NINST2=N2 Q
 I KEY5'="*" S K5=KEY5 Q:'($D(@GEXEC@(TYPE,K1,K2,K3,K4,K5)))  D BEST6 Q
 S K5="" F %K=0:0 S K5=$O(@GEXEC@(TYPE,K1,K2,K3,K4,K5)) Q:K5=""  D BEST6
 Q
BEST6 I NBKEY=5 S N2=$ZP(@GEXEC@(TYPE,K1,K2,K3,K4,K5,NINST)) S:(N2'="")&(N2>NINST2) NINST2=N2 Q
 I KEY6'="*" S K6=KEY6 Q:'($D(@GEXEC@(TYPE,K1,K2,K3,K4,K5,K6)))  D BEST7 Q
 S K6="" F %K=0:0 S K6=$O(@GEXEC@(TYPE,K1,K2,K3,K4,K5,K6)) Q:K6=""  D BEST7
 Q
BEST7 S N2=$ZP(@GEXEC@(TYPE,K1,K2,K3,K4,K5,K6,NINST)) S:(N2'="")&(N2>NINST2) NINST2=N2 Q
 
 
FFILLE 
 S NINST3=$ZP(@DEFETU@("fille",NINST)) S:NINST3="" NINST3=-1
 S:profondeur'="OUI" NINST3=-1
 
 I NINST3>NINST2 S JRN=@DEFETU@("fille",NINST3,1),NINST="" G AGA
 
 I NINST2'=-1 S NINST=NINST2 G TROUVE
 
 
 I '($D(@DEFETU@("pere"))) G ECHEC
 S NETU=@DEFETU@("pere")
 S NINST=$P(NETU,"^",2),JRN=$P(NETU,"^")
 G AGA
 
 
ECHEC S NJRN="",NINST="" Q 0
 
TROUVE S NJRN=JRN
 Q 1
 
 
FIND2 
 G:profondeur'="OUI" FFU0
 I $D(@DEFETU@("fille",NINST-1,1)) S JRN=@DEFETU@("fille",NINST-1,1),NINST=$ZP(@GJOURN@("")) G TROUVE
FFU0 S NINST=$ZP(@GJOURN@(NINST)) G:NINST'="" TROUVE
 I '($D(@DEFETU@("pere"))) G ECHEC
 S NETU=@DEFETU@("pere")
 S NINST=$P(NETU,"^",2),JRN=$P(NETU,"^")
 G TROUVE
 
 
NEXT(JRN,INST,NJRN,NINST,TYPE,profondeur,NBKEY,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6) 
 
 S NINST=INST
 
 G:TYPE="" NEXT2
AGAN 
 
 
 
 
 
 S NINST2=$ZP(@GJOURN@(""))+1
 I KEY1'="*" S K1=KEY1 D:$D(@GEXEC@(TYPE,K1)) BETT2 G NFILLE
 S K1="" F %K=0:0 S K1=$O(@GEXEC@(TYPE,K1)) Q:K1=""  D BETT2
 G NFILLE
BETT2 I NBKEY=1 S N2=$O(@GEXEC@(TYPE,K1,NINST)) S:(N2'="")&(N2<NINST2) NINST2=N2 Q
 I KEY2'="*" S K2=KEY2 Q:'($D(@GEXEC@(TYPE,K1,K2)))  D BETT3 Q
 S K2="" F %K=0:0 S K2=$O(@GEXEC@(TYPE,K1,K2)) Q:K2=""  D BETT3
 Q
BETT3 I NBKEY=2 S N2=$O(@GEXEC@(TYPE,K1,K2,NINST)) S:(N2'="")&(N2<NINST2) NINST2=N2 Q
 I KEY3'="*" S K3=KEY3 Q:'($D(@GEXEC@(TYPE,K1,K2,K3)))  D BETT4 Q
 S K3="" F %K=0:0 S K3=$O(@GEXEC@(TYPE,K1,K2,K3)) Q:K3=""  D BETT4
 Q
BETT4 I NBKEY=3 S N2=$O(@GEXEC@(TYPE,K1,K2,K3,NINST)) S:(N2'="")&(N2<NINST2) NINST2=N2 Q
 I KEY4'="*" S K4=KEY4 Q:'($D(@GEXEC@(TYPE,K1,K2,K3,K4)))  D BETT5 Q
 S K4="" F %K=0:0 S K4=$O(@GEXEC@(TYPE,K1,K2,K3,K4)) Q:K4=""  D BETT5
 Q
BETT5 I NBKEY=4 S N2=$O(@GEXEC@(TYPE,K1,K2,K3,K4,NINST)) S:(N2'="")&(N2<NINST2) NINST2=N2 Q
 I KEY5'="*" S K5=KEY5 Q:'($D(@GEXEC@(TYPE,K1,K2,K3,K4,K5)))  D BETT6 Q
 S K5="" F %K=0:0 S K5=$O(@GEXEC@(TYPE,K1,K2,K3,K4,K5)) Q:K5=""  D BETT6
 Q
BETT6 I NBKEY=5 S N2=$O(@GEXEC@(TYPE,K1,K2,K3,K4,K5,NINST)) S:(N2'="")&(N2<NINST2) NINST2=N2 Q
 I KEY6'="*" S K6=KEY6 Q:'($D(@GEXEC@(TYPE,K1,K2,K3,K4,K5,K6)))  D BETT7 Q
 S K6="" F %K=0:0 S K6=$O(@GEXEC@(TYPE,K1,K2,K3,K4,K5,K6)) Q:K6=""  D BETT7
 Q
BETT7 S N2=$O(@GEXEC@(TYPE,K1,K2,K3,K4,K5,K6,NINST)) S:(N2'="")&(N2<NINST2) NINST2=N2 Q
 
NFILLE 
 S:NINST2=($ZP(@GJOURN@(""))+1) NINST2=-1
 
 
 I $D(@DEFETU@("fille",NINST)) S NINST3=NINST G N2
 S NINST3=$O(@DEFETU@("fille",NINST)) S:NINST3="" NINST3=-1
N2 S:profondeur'="OUI" NINST3=-1
 
 
 I NINST3'=-1,(NINST3<NINST2)!(NINST2=-1) S JRN=@DEFETU@("fille",NINST3,1),NINST=-1 G AGAN
 
 I NINST2'=-1 S NINST=NINST2 G TROUVE
 
 
 I '($D(@DEFETU@("pere"))) G ECHEC
 S NETU=@DEFETU@("pere"),NINST=$P(NETU,"^",2)+1,JRN=$P(NETU,"^") G AGAN
 
 
 
NEXT2 I profondeur'="OUI" G FFNX1
 I $D(@DEFETU@("fille",NINST)) S JRN=@DEFETU@("fille",NINST,1),NINST=$O(@GJOURN@("")) G TROUVE
FFNX1 S NINST=$O(@GJOURN@(NINST)) G:NINST'="" TROUVE
 I '($D(@DEFETU@("pere"))) G ECHEC
 S NETU=@DEFETU@("pere")
 S NINST=$P(NETU,"^",2)+1,JRN=$P(NETU,"^")
 G TROUVE
 
 
 
 
ISSAME(JRN,TYPE,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6) 
 N INST,NJRN,NINST,R
 D INIVAR^%AMG
 S INST=@GJOURN
 S NBKEY=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"NBCLEFS")
 S R=$$FIND(JRN,INST,NJRN,NINST,TYPE,"OUI",NBKEY,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6)
 Q:'(R) 0
 ;

