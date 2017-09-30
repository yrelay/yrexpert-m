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

;%VAUTOST^INT^1^59547,74034^0
VVAUTOST ;
 
 
 S:'($D(^TOZE($I,"FULL"))) ^TOZE($I,"FULL")=0 I ^TOZE($I,"FULL")=1 G FULL
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) G FULL
 D AUTOST(.NOMTAB,.SCR,.RESUL) I ABENDSCR=1 D AFR Q
 S %REFS=NOM,%NF1=$P(NOMTAB,"]",2),%NFU="" S:%NF1="" %NF1=$P(NOMTAB,"^",2)
 I $D(^NAMEFUL(%NF1)) S %NFU="^[QUI]"_$P(^NAMEFUL(%NF1),"^",1)
 D GETFRESU(.RESUL,.FRESU) D:%NFU'="" AUTOST(.%NFU,.SCR,.FRESU) I ABENDSCR=1 K @(%REFS) D AFR Q
 S:'($D(%RQS)) %RQS=0 D:%RQS ^%QSSTOC D AFR
 K %NCH,%11,%12,%RQS Q
AFR K AFRESU S %12=-1 F %11=1:1 S %12=$N(FRESU(%12)) Q:%12=-1  S AFRESU(%12)=FRESU(%12) K FRESU(%12)
 Q
 
AUTOST(NOMTAB,SCR,RESUL) Q:('($D(NOMTAB)))!('($D(SCR)))
 S %RQS=0,%NCH=^%SCRE(SCR),%YADOL=0,%EXIST=0,INL=1,LLS=0
 F I=1:1:%NCH S LLS=(LLS+$L(RESUL(I)))+1 S:$D(^%SCRE(SCR,I,"QUERY"))!$D(^%SCRE(SCR,I,"LIEN")) %RQS=1
 I LLS>500 G LONG
 S IN="",RS="" F IC=1:1 Q:'($D(RESUL(IC)))  S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC)),ISN=$S($D(^%SCRE(SCR,IC))=11:"IND",1:"RES") D @ISN G:ABENDSCR=1 FIN
 S NOM=NOMTAB_"("_IN_")" G LONG:$L(NOM)>250,REFINS:IN=""
 G:$D(@NOM) EXIST S @NOM=RS
FIN Q
LONG 
 D ^%VZEAVT($$^%QZCHW("Vos donnees sont un peu abondantes")_"..."_$$^%QZCHW("Stockage refuse")) S ABENDSCR=1
 Q
RES S RS=RS_$S($D(^%SCREC(SCR,"GERQS",IC)):$C(26),1:RESUL(IC))_"^" Q
IND I RESUL(IC)="" D REFUS Q
 S IN=IN_$S(IN="":""""_$$ADR^%QZCHDG(RESUL(IC))_"""",1:","_""""_$$ADR^%QZCHDG(RESUL(IC))_"""")
 Q
REFINS 
REFUS S ABENDSCR=1,%U=^%SCRE(SCR)
 F %V=1:1:%U I ($D(^%SCRE(SCR,%V))#10)=1 S DX=^%SCRE(SCR,%V,2)+$L(^%SCRE(SCR,%V,1)),DY=^%SCRE(SCR,%V,3) X XY D BLK^%VVIDEO,REV^%VVIDEO X XY W " " D NORM^%VVIDEO
 D ^%VZEAVT($$^%QZCHW("Il faut absolument des informations dans ces zones")_"..."),^%VAFIGRI,^%VAFISCR Q
EXIST S ABENDSCR=1 D ^%VZEAVT($$^%QZCHW("Fiche deja existante...Stockage refuse")) Q
 
GETFRESU(RESUL,FRESU) 
 D ^%VTFRESU Q
FULL D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Stockage refusee"),"....." H 2 Q

