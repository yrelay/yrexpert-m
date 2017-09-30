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

;%VCMSLIS^INT^1^59547,74034^0
GECMSLIS(SUIT) 
 K ^PRESCR($I,SCR),^GEPAG($I,SCR,TPIL) D MENL^%VCMS S ^PRESCR($I,SCR)=0 S:'($D(^TOZE($I,"FULL"))) ^TOZE($I,"FULL")=0 D GV G DCAD
GV S VAL("PG")=1,VAL("LC")=%LIYH+2,VAL("XDEB")=%LIXG+2,VAL("XFIN")=%LIXD-2,VAL("YFIN")=%LIYB-2,VAL("YDEB")=%LIYH+2,%NCH=^%SCRE(SCR),%U=0,%V=2 K VAL("CHP")
LCH S %U=%U+1 G:%U>%NCH FGV G LCH:$D(^%SCRE(SCR,%U,"INVISIBLE")),LCHA:($D(^%SCRE(SCR,%U))#10)=1,LCHA:$D(^%SCRE(SCR,%U,"LISTE")),LCH
LCHA S VAL("CHP",%V)=%U,%V=%V+1 G LCH
FGV Q
DCAD D CADRE
 I ^TOZE($I,"FULL")=1 D ^%VTNAMFU S NOMTAB=$S(%NFU="":NOMTAB,1:%NFU)
LOOP K PATOUCH S IFLAG=0 D @ROUTI G FLIS:IFLAG<0 D AFPG(%NOMC,1)
 R *X:0 D TOUCHE^%INCCLAV(X,.X) G FLIS:X=1
 S:ROUTI'["C3" ROUTI="C3"_ROUTI G LOOP
FLIS I '($D(^GEPAG($I,SCR,TPIL,"AFF"))) S (SUIT,POX)="CTRLA" G FIN
FLIS1 S IFLAG=0 D ^%VTRPAG(.TRS) I TRS="CTRLA" S (SUIT,POX)="CTRLA" G FIN
 S Y1=TRS G POK
LOOP1 S ABENDSCR=0 D AFMOD^%VCMSCOR(""),GEMEN^%VAJOUT,LIM^%VAJOUT S:'($D(MSG)) MSG="" D ^%VCRIFLD($J("",$L(MSG)),%LIXG+1,%LIYB,%LIXG+1,%LIXD-1)
LOOP11 D 1^%VQUIKMN(XG1,XD1,YH1,"^BASP($I)",CDR,.AD,.CTR,.PFE,.MOD),@("CLFEN^%VVIDEO("_PFE_")") I (CTR="R")!((CTR="J")!(CTR="H")) S @("A=$$"_CTR_"^%VCTRLSC") G LOOP11
 I (CTR="A")!(CTR="F") D CADRE G FLIS1
 G:AD="" LOOP1 I IFLAG'<0 D AFMOD^%VCMSCOR(MOD) G:$E(AD)="*" @$P(AD,"*",2,99) G BP
 G PAG:AD="*PAG" S MSG=$$^%QZCHW("Recherche epuisee.. Page courante inconnue [RETURN]")
MEFF D MSGE^%VCMSCOR(MSG) G LOOP1
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI G LOOP:IFLAG'<0
 S MSG=" Recherche epuisee...[RETURN] " G MEFF
PAG S IFLAG=0 D @("CLFEN^%VVIDEO("_PFE_")") S DX=$P(PFE,",",1),DY=$P(PFE,",",2) X XY W $$^%QZCHW("Page")," : " S DX=$X D ^%VLEC G:Y1="" LOOP1 I '($D(^PRESCR($I,SCR,Y1))) D ^%VSQUEAK G PAG
 S RF=^PRESCR($I,SCR,Y1) I '($D(@RF)) D MSGE^%VCMSCOR($$^%QZCHW("Cette page n'existe plus...[RETURN]")) G PAG
 S %PCOUR=Y1 D 1^%VCHOSCR,^%VNEWPAG(SCR,%PCOUR,%LIXG,%LIYH,"^PRESCR($I,SCR)") G LOOP1
POK S %PCOUR=Y1 D NG^%VNEWPAG(SCR,%PCOUR,%LIXG,%LIYH,"^PRESCR($I,SCR)") G LOOP1
DUP G LOOP1:%PCOUR=0 D ACCOR G:'(ACCOR) LOOP1 S ABENDSCR=0 K OR S %U=-1 F %V=1:1 S %U=$N(AFRESU(%U)) Q:%U=-1  S OR(%U)=AFRESU(%U)
 D ^%VMODISC G LOOP1:ABENDSCR=1 D DUPL I '(OK) K OR G LOOP1
 D STO,^%VDUPGRI,GV,PGLC,AFPG(NOMTAB_"("_$P(NOM,"(",2,599),0),NEWOLD G LOOP1
MOD G LOOP1:%PCOUR=0 D ACCOR G:'(ACCOR) LOOP1 S ABENDSCR=0 D ^%VMODISC G LOOP1:ABENDSCR=1 K OR S %U=-1 F %V=1:1 S %U=$N(AFRESU(%U)) Q:%U=-1  S OR(%U)=AFRESU(%U)
 D MODI I '(OK) K OR G LOOP1
 D DEL,STO,^%VMODGRI,GV,PGLC,NET^%VGETPAG("^GEPAG($I,SCR,TPIL)",%PCOUR) K ^PRESCR($I,SCR,%PCOUR) D AFPG(NOMTAB_"("_$P(NOM,"(",2,599),0),NEWOLD K OR G LOOP1
SUP G LOOP1:%PCOUR=0 D ACCOR G:'(ACCOR) LOOP1 D ^%VSQUEAK S MSG=$$^%QZCHW("Confirmer SVP")_" ["_$E(MOD)_"] " D @("CLFEN^%VVIDEO("_PFE_")")
 D ^%VCRIFLD(MSG,%LIXG+1,%LIYB,%LIXG+1,%LIXD-1)
 K OR S %U=-1 F %V=1:1 S %U=$N(AFRESU(%U)) Q:%U=-1  S OR(%U)=AFRESU(%U)
 G LOOP1:'($$^%VLEC1CA($A($E(MOD)),.X1))
 D DEL G LOOP1:'(OK) D 1^%VCHOSCR K ^PRESCR($I,SCR,%PCOUR) D NET^%VGETPAG("^GEPAG($I,SCR,TPIL)",%PCOUR)
 S MSG=$$^%QZCHW("Suppression en cours...") D ^%VCRIFLD(MSG,%LIXG+1,%LIYB,%LIXG+1,%LIXD-1),^%VSUPGRI,POCLEPA^%VVIDEO
 D DECH^%VCHOSCR S %PCOUR=0 G LOOP1
GET S MSG=$$^%QZCHW("Recherche en cours....") D ^%VCRIFLD(MSG,%LIXG+1,%LIYB,%LIXG+1,%LIXD-1) G CHAN
BP G LOOP1:%PCOUR=0 S SUIT=AD G FIN
FIN U 0 Q
AJ D ACCOR G:'(ACCOR) LOOP1 S OAJCMS=$S($D(%AJCMS):%AJCMS,1:"") D ^%VSAVMUL(SCR) S CMS=0 D ENCOUR^%VAJOUT(SCR),^%VRESMUL(SCR),^%VAFIGRI,^%VAFISCR,MEN^%VCMS S %AJM="M",%AJCMS=OAJCMS,ABENDSCR=0 G LOOP1
IMPR S ADX=$X,ADY=$Y D POCLEPA^%VVIDEO W "Impression en cours..." D ^%VIMPSCR,POCLEPA^%VVIDEO S DX=ADX,DY=ADY X XY G LOOP1
ACCOR S ACCOR=1 G:SCR'="RESTEST" ACC2 S B="GO" D ^%INCUPA2 S ACCOR=$S(B="???":0,1:1) G END
ACC2 I ^TOZE($I,"FULL")=1 S ACCOR=0 G END
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) S ACCOR=0 G END
END Q
MEN(SUIT) 
 S IFLAG=0 G LOOP1
NEWOLD 
 S m("OLDF")=NOM,m("OLDN")=NOMTAB_"("_$P(NOM,"(",2,499) Q
AFPG(CP,VI) 
 S PAG=^PRESCR($I,SCR)+1,^PRESCR($I,SCR)=PAG,%PCOUR=PAG,^PRESCR($I,SCR,PAG)=CP K VAL("VAL") S VAL("VAL",1)=PAG,NU=2,KK=-1,%NCH=^%SCRE(SCR),%U=-1
 F %V=1:1 S %U=$N(VAL("CHP",%U)) Q:%U=-1  S VAL("VAL",%U)=RESUL(VAL("CHP",%U))
 D ^%VGETPAG("VAL","^GEPAG($I,SCR,TPIL)",VI)
 Q
STO S ROU=$S($D(^%SCRE(SCR,"ROUSTOC")):^%SCRE(SCR,"ROUSTOC"),1:"^%VAUTOST") S:ROU="" ROU="^%VAUTOST" D @ROU Q
DEL S ROU=$S($D(^%SCRE(SCR,"ROUSUP")):^%SCRE(SCR,"ROUSUP"),1:"$$KIL") S:ROU="" ROU="$$KIL" S @("OK="_ROU) Q
KIL() 
 K @(m("OLDN")),@(m("OLDF")) Q 1
MODI S ROU=$S($D(^%SCRE(SCR,"ROUMOD")):^%SCRE(SCR,"ROUMOD"),1:"$$MODJ") S:ROU="" ROU="$$MODJ" S @("OK="_ROU) Q
MODJ() 
 Q 1
DUPL S ROU=$S($D(^%SCRE(SCR,"ROUDUP")):^%SCRE(SCR,"ROUDUP"),1:"$$DUPJ") S:ROU="" ROU="$$DUPJ" S @("OK="_ROU) Q
DUPJ() 
 Q 1
CADRE D ^%VEFFSCR(%LIXG+1,%LIYH+1,%LIXD-1,%LIYB-1) S DXG=%LIXG+1,DYH=%LIYH+1,LV=(%LIYB-%LIYH)-1,LH=(%LIXD-%LIXG)-1,BLD=1 D CARS^%VVIDEO Q
PGLC S VAL("PG")=$S($D(^GEPAG($I,SCR,TPIL,"PCOUR")):^GEPAG($I,SCR,TPIL,"PCOUR"),1:VAL("PG")),VAL("LC")=$S($D(^GEPAG($I,SCR,TPIL,"LCOUR")):^GEPAG($I,SCR,TPIL,"LCOUR"),1:VAL("LC")) Q

