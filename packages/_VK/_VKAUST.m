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

;%VKAUST^INT^1^59547,74035^0
AUTOSTO ;
 
 S:'($D(^TOZE($I,"FULL"))) ^TOZE($I,"FULL")=0 I ^TOZE($I,"FULL")=1 G FULL
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) G FULL
 D AUTOST(.NOMTAB,.SCR,.RESUL) S %NF1=$P(NOMTAB,"]",2),%NFU="" S:%NF1="" %NF1=$P(NOMTAB,"^",2) I $D(^NAMEFUL(%NF1)) S %NFU="^[QUI]"_$P(^NAMEFUL(%NF1),"^",1)
 D:$D(%PLUS) @%PLUS
 Q:%NFU=""  D GTSFRESU(.RESUL,.FRESU),AUTOST(.%NFU,.SCR,.FRESU)
 K AFRESU S %12=-1 F %11=1:1 S %12=$N(FRESU(%12)) Q:%12=-1  S AFRESU(%12)=FRESU(%12) K FRESU(%12)
 K %11,%12 Q
 
AUTOST(NOMTAB,SCR,RESUL) Q:('($D(NOMTAB)))!('($D(SCR)))
 S %YADOL=0,%EXIST=0,INL=1,LLS=0 F I=1:1:^%SCRE(SCR) S LLS=(LLS+$L(RESUL(I)))+1 S:RESUL(I)["$" %YADOL=1
 I LLS>500 D POCLEPA^%VVIDEO W " vos donnees sont un peu abondantes... un instant svp" G LONG
 S IN="",RS="" I SCR="VALITOLE" S RS="VALI"_RESUL(1) F UU=2:1:4 S RS=RS_"/"_RESUL(UU)
 F IC=1:1 Q:'($D(RESUL(IC)))  S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC)),ISN=$S($D(^%SCRE(SCR,IC))=11:"IND",1:"RES") D @ISN G:ABENDSCR=1 FIN
 S NOM=NOMTAB_"("_IN_")" G LONG:$L(NOM)>250,REFINS:IN="" S:$D(@NOM) %EXIST=1 S @NOM=RS D:NOMTAB="^[QUI]FLABAC" ^TO3ABIMP D:SCR="TABIDENT" ^STOTABID D:SCR="GRAPHE" ^PTSTOGRA
FIN Q
RES S RS=RS_RESUL(IC)_"^" Q
IND I RESUL(IC)="" D REFUS Q
 S IN=IN_$S(IN="":""""_RESUL(IC)_"""",1:","_""""_RESUL(IC)_"""")
 Q
REFINS D ^%VSQUEAK,POCLEPA^%VVIDEO W "Informations insuffisantes " H 2 S PADMESSA="                            " D PAD^%VZEATT Q
REFUL D ^%VSQUEAK,POCLEPA^%VVIDEO W "Informations trop abondantes : veuillez abreger les champs " H 2
 S DY=24 X XY F ICC=1:1:^%SCRE(SCR) I $D(^%SCRE(SCR,ICC))=11 W "/",^%SCRE(SCR,ICC,1)
 H 2 D ^%VAFIGRI,^%VAFISCR S IC=1,ABENDSCR=0 D ^%VKMODIS G AUTOSTO:ABENDSCR=0 Q
REFUS D ^%VSQUEAK,POCLEPA^%VVIDEO W "Il faut obligatoirement une information dans  ",^%SCRE(SCR,IC,1) H 2 D ^%VAFIGRI,^%VAFISCR S ABENDSCR=0 D LOOP^%VKMODIS G AUTOSTO:ABENDSCR=0 Q
LONG D ^%VKLONS D:NOMTAB="^[QUI]FLABAC" ^TO3ABIMP Q
GTSFRESU(RESUL,FRESU) 
 D ^%VTFRESU Q
FULL D ^%VSQUEAK,POCLEPA^%VVIDEO W "Stockage refusee....." H 2 Q

