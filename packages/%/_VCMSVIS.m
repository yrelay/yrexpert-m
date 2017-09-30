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

;%VCMSVIS^INT^1^59547,74034^0
GECMSVIS(SUIT) 
 
 S ROUTI="^%VMULTGE(.IFLAG)" K ^PAGIN($I,SCR) S ^PAGIN($I,SCR)=0 S:'($D(^TOZE($I,"FULL"))) ^TOZE($I,"FULL")=0
 D 0^%VCHOSCR,OPT(1) S %PCOUR=0
 I ^TOZE($I,"FULL")=1 D ^%VTNAMFU S NOMTAB=$S(%NFU="":NOMTAB,1:%NFU)
LOOP K PATOUCH S IFLAG=0 D @ROUTI G CHAN:IFLAG'=0,FIN:ABENDSCR=1 F %U=1:1:^%SCRE(SCR) S PATOUCH(%U)=$S($D(^%SCRE(SCR,%U,"PATOUCH")):1,1:"")
 D DECH^%VCHOSCR,^%VAFISCR,AFPG(%NOMC)
LOOP1 S ABENDSCR=0 D SEL^%VGENMEN(.CHA,.CHCTR),POCLEPA^%VVIDEO I (CHCTR="A")!(CHCTR="F") S SUIT="ABEND" G FIN
 G:CHA="" LOOP1 G @CHA
 G PAG:AD="PAG" S MSG=$$^%QZCHW("Recherche epuisee.. Page courante inconnue [RETURN]"),IFLAG=0,%PCOUR=0
MEFF D ^%VEFFSCR(%LIXG,$O(^BASP($J,"")),%LIXD,$ZP(^BASP($J,""))),^%VCRIFLD(MSG,%LIXG+1,$ZP(^BASP($J,"")),%LIXG+1,%LIXD-1) R *X:^TOZE($I,"ATTENTE")
 D ^%VEFFSCR(%LIXG,$O(^BASP($J,"")),%LIXD,$ZP(^BASP($J,""))) G LOOP1
NEXT S:ROUTI'["C3" ROUTI="C3"_ROUTI G LOOP
CHAN S MSG=$$^%QZCHW("Recherche epuisee")_"..."_$S(%PCOUR=0:$$^%QZCHW("Abandon")_" ",1:"")_$$^%QZCHW("[RETURN]") I %PCOUR=0 S SUIT="ABEND" G FIN
 D OPT(2) G PAG
 S %PCOUR=0,IFLAG=0 G MEFF
PAG S IFLAG=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Page")," : " S DX=$X D ^%VLEC G PAGEX:Y1'="" I IFLAG<0 S SUIT="ABEND" G FIN
 S IFLAG=0 G LOOP1
PAGEX I '($D(^PAGIN($I,SCR,Y1))) D ^%VSQUEAK G PAG
 S RF=^PAGIN($I,SCR,Y1) G:'($D(@RF)) PAG
 S %PCOUR=Y1 D 1^%VCHOSCR,^%VNEWPAG(SCR,%PCOUR,%LIXG,%LIYH,"^PAGIN($I,SCR)") G LOOP1
FIN U 0 Q
ACC S SUIT="OK" G FIN
MEN(SUIT) 
 D 0^%VCHOSCR S IFLAG=0 G LOOP1
NEWOLD 
 S m("OLDF")=NOM,m("OLDN")=NOMTAB_"("_$P(NOM,"(",2,499) Q
AFPG(CP) 
 S (%PCOUR,PAG)=^PAGIN($I,SCR)+1,^PAGIN($I,SCR)=PAG,^PAGIN($I,SCR,PAG)=CP,DY=%LIYH,DX=%LIXG X XY W $J("",7) X XY W "P:",PAG Q
AFMOD(MOD) 
 S DY=%LIYH,DX=%LIXD-13 X XY D REV^%VVIDEO X XY W $E(MOD,1,12)_$J("",12-$L(MOD)) X XY D NORM^%VVIDEO Q
OPT(I) 
 K ^CHX($I) S OPT=$P($T(@("OPT"_I)),";;",2) F %U=1:1 S %V=$P(OPT,",",%U) Q:%V=""  S ^CHX($I,%U)=%V
 D ^%VGENMEN(0,79,23,"^CHX($I)") Q
OPT1 ;;#C#ontinuer^NEXT,#A#ccepter^ACC,#P#age^PAG
OPT2 ;;#A#ccepter^ACC,#P#age^PAG

