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

;TOGTBRES^INT^1^59547,74872^0
TOGTBRES ;
 
 K ^COMPILVU($I),^%ANT($I),^%ANT2($I) S NU=-1 F UU=1:1 S NU=$N(^TACOMPIL($I,NU)) Q:NU=-1  S NUF=^TACOMPIL($I,NU) D T0
 K ^TACOMPIL($I) S NU=-1 F UU=1:1 S NU=$N(^%ANT($I,NU)) Q:NU=-1  D T1
 S NU=-1
T4 S NU=$N(^%ANT2($I,NU)) G:NU=-1 END S NUFA=-1,NBNUF=0
T5 S NUFA=$N(^%ANT2($I,NU,NUFA)) G:NUFA=-1 T4 S NBNUF=NBNUF+1,NBGR=NBNUF\7,NOMTREE="^[QUI]TREEWORK(NUFA",ADR="T6^TOGTBRES" D ^%QCAGTU1 G T5
T6 D ^TO3GREF S YA=$P(@NOM,"^",1),ID=$P(@NOM,"^",4) G:'($D(^TACOMPIL($I,YA))) FIN S ^%ANT($I,NU,TWREF,"A")=ID,RS1=-1
T7 S RS1=$N(^TACOMPIL($I,YA,RS1)) G:RS1=-1 FIN S TB=$S(RS1="A":"^[QUI]TVPAR(NUFA,TWREF)",1:"^[QUI]PARMAT(NUFA,TWREF)"),RS2=-1
T8 S RS2=$N(^TACOMPIL($I,YA,RS1,RS2)) G:RS2=-1 T7 S NUP=^TACOMPIL($I,YA,RS1,RS2),^%ANT($I,NU,TWREF,RS1,NBGR,NUP,NUFA)=RS2_"^"_$S($D(@TB@(RS2)):@TB@(RS2),1:"???") G T8
T0 I $D(^[QUI]TREEWORK(NUF)) S ^%ANT2($I,NU,NUF)=1,^%ANT($I,NU)=NUF G FIN
 S NUFA=NUF,ANT="" F VV=1:1 S NUFA=$N(^[QUI]TREEWORK(NUFA)) Q:(NUFA=-1)!($E(NUFA,1,$L(NUF))'=NUF)  S ANT=ANT_NUFA_"^",^%ANT2($I,NU,NUFA)=1
 S:ANT'="" ^%ANT($I,NU)=ANT G FIN
 Q
T1 S NUFA=$P(^%ANT($I,NU),"^",1),YA=$P(^[QUI]TREEWORK(NUFA,0),"^",1) D ^TO3ARTHE S CPT=-1
T2 S CPT=$N(^COMPNOM($I,YA,CPT)) G:CPT=-1 FIN G:'($D(^[QUI]SYNTETUD(CPT))) T2 S NF=-1,NUP=1
T3 S NF=$N(^[QUI]SYNTETUD(CPT,NF)) G:NF=-1 T2 S RS=^[QUI]SYNTETUD(CPT,NF) F II=1:2:11 S RS1=$P(RS,"^",II),RS2=$P(RS,"^",II+1) I (RS1'="")&(RS2'="") S ^TACOMPIL($I,CPT,RS1,RS2)=NUP,NUP=NUP+1
 G T3
END Q
FIN Q

