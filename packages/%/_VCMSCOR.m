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
;! HL002 ! HL     ! 10/07/12 ! PB caractères parasites sur terminal-gnome     !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VCMSCOR^INT^1^59557,70275^0
GECMSCOR(SUIT) 
 K ^PRESCR($I,SCR) S ^PRESCR($I,SCR)=0 S:'($D(^TOZE($I,"FULL"))) ^TOZE($I,"FULL")=0
 D 0^%VCHOSCR
 I ^TOZE($I,"FULL")=1 D ^%VTNAMFU S NOMTAB=$S(%NFU="":NOMTAB,1:%NFU)
LOOP K PATOUCH S IFLAG=0 D @ROUTI G CHAN:IFLAG'=0,FIN:ABENDSCR=1 F %U=1:1:^%SCRE(SCR) S PATOUCH(%U)=$S($D(^%SCRE(SCR,%U,"PATOUCH")):1,1:"")
 D DECH^%VCHOSCR,^%VAFISCR,AFPG(%NOMC)
LOOP1 S ABENDSCR=0 D AFMOD("")
 D GEMEN^%VAJOUT,LIM^%VAJOUT S:'($D(MSG)) MSG="" D ^%VCRIFLD($J("",$L(MSG)),%LIXG+1,%LIYB,%LIXG+1,%LIXD-1)
LOOP11 
 D 1^%VQUIKMN(XG1,XD1,YH1,"^BASP($I)",CDR,.AD,.CTR,.PFE,.MOD),@("CLFEN^%VVIDEO("_PFE_")") I (CTR="R")!((CTR="J")!(CTR="H")) S @("A=$$"_CTR_"^%VCTRLSC") G LOOP11
 I (CTR="A")!(CTR="F") S SUIT="CTRL"_CTR,%PCOUR=-1 G FIN
 I AD="" D ^%VSQUEAK G LOOP1
 I IFLAG'<0 D AFMOD(MOD) G:$E(AD)="*" @$P(AD,"*",2,99) G BP
 G PAG:AD="*PAG" S MSG=$$^%QZCHW("Recherche epuisee.. Page courante inconnue")_" [RETURN]",IFLAG=0,%PCOUR=0
MEFF D MSGE(MSG) G LOOP1
CHAN S:ROUTI'["C3" ROUTI="C3"_ROUTI G LOOP:IFLAG'<0
 S MSG=$$^%QZCHW(" Recherche epuisee...")_" [RETURN]",%PCOUR=0,IFLAG=0 G MEFF
PAG S IFLAG=0 D @("CLFEN^%VVIDEO("_PFE_")") S DX=$P(PFE,",",1),DY=$P(PFE,",",2) X XY W $$^%QZCHW("Page")," : " S DX=$X D ^%VLEC G:Y1="" LOOP1 I '($D(^PRESCR($I,SCR,Y1))) D ^%VSQUEAK G PAG
 S RF=^PRESCR($I,SCR,Y1) I '($D(@RF)) D MSGE($$^%QZCHW("Cette page n'existe plus...")) G PAG
 S %PCOUR=Y1 D 1^%VCHOSCR,^%VNEWPAG(SCR,%PCOUR,%LIXG,%LIYH,"^PRESCR($I,SCR)") G LOOP1
DUP 
 G LOOP1:%PCOUR=0 D ACCOR G:'(ACCOR) LOOP1 S ABENDSCR=0 D CONSOR
 D ^%VMODISC G LOOP1:ABENDSCR=1
 D DUPL I '(OK) K OR G LOOP1
 D STO,^%VDUPGRI D:$D(NOM) AFPG(NOMTAB_"("_$P(NOM,"(",2,599)),NEWOLD G LOOP1
MOD 
 G LOOP1:%PCOUR=0 D ACCOR G:'(ACCOR) LOOP1 S ABENDSCR=0 D ^%VMODISC G LOOP1:ABENDSCR=1
 D CONSOR,MODI I '(OK) K OR G LOOP1
 D DEL,STO,^%VMODGRI K ^PRESCR($I,SCR,%PCOUR) D:$D(NOM) AFPG(NOMTAB_"("_$P(NOM,"(",2,599)),NEWOLD K OR G LOOP1
SUP 
 G LOOP1:%PCOUR=0 D ACCOR G:'(ACCOR) LOOP1 D ^%VSQUEAK S MSG=$$^%QZCHW("Confirmer SVP")_" ["_$E(MOD)_"] " D @("CLFEN^%VVIDEO("_PFE_")")
 D ^%VCRIFLD(MSG,%LIXG+1,%LIYB,%LIXG+1,%LIXD-1)
 G LOOP1:'($$^%VLEC1CA($A($E(MOD)),.X1))
 D CONSOR,DEL G LOOP1:'(OK)
 D 1^%VCHOSCR K ^PRESCR($I,SCR,%PCOUR)
 S MSG=$$^%QZCHW("Suppression en cours...") D ^%VCRIFLD(MSG,%LIXG+1,%LIYB,%LIXG+1,%LIXD-1),^%VSUPGRI,POCLEPA^%VVIDEO
 D DECH^%VCHOSCR S %PCOUR=0 G LOOP1
GET D 1^%VCHOSCR S MSG=$$^%QZCHW("Recherche en cours....")
 D ^%VCRIFLD(MSG,%LIXG+1,%LIYB,%LIXG+1,%LIXD-1) G CHAN
BP G LOOP1:%PCOUR=0 S SUIT=AD G FIN
FIN U 0 Q
AJ 
 D ACCOR G:'(ACCOR) LOOP1 S OAJCMS=$S($D(%AJCMS):%AJCMS,1:"") D ^%VSAVMUL(SCR) S CMS=0 D ENCOUR^%VAJOUT(SCR),^%VRESMUL(SCR),^%VAFIGRI,^%VAFISCR,MEN^%VCMS S %AJM="M",%AJCMS=OAJCMS,ABENDSCR=0 G LOOP1
IMPR S ADX=$X,ADY=$Y D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours...") D ^%VIMPSCR,POCLEPA^%VVIDEO S DX=ADX,DY=ADY X XY G LOOP1
ACCOR S ACCOR=1 G:SCR'="RESTEST" ACC2 S B="GO" D ^%INCUPA2 S ACCOR=$S(B="???":0,1:1) G END
ACC2 I ^TOZE($I,"FULL")=1 S ACCOR=0 G END
 I $D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)) S ACCOR=0 G END
END Q
MEN(SUIT) 
 D 0^%VCHOSCR S IFLAG=0 G LOOP1
NEWOLD 
 S m("OLDF")=NOM,m("OLDN")=NOMTAB_"("_$P(NOM,"(",2,499) Q
AFPG(CP) 
 I %LIXG<0 S %LIXG=0 ;HL 
 S (%PCOUR,PAG)=^PRESCR($I,SCR)+1,^PRESCR($I,SCR)=PAG,^PRESCR($I,SCR,PAG)=CP,DY=%LIYH,DX=%LIXG X XY W $J("",7) X XY W "P:",PAG Q
AFMOD(MOD) 
 I %LIYH<0 S %LIYH=0 ;HL 
 ;HL002 S DY=%LIYH,DX=%LIXD-13 X XY D REV^%VVIDEO X XY W $E(MOD,1,12)_$J("",12-$L(MOD)) X XY D NORM^%VVIDEO Q
 S DY=%LIYH,DX=%LIXD-14 X XY D REV^%VVIDEO X XY W $E(MOD,1,12)_$J("",12-$L(MOD)) X XY D NORM^%VVIDEO Q
STO S ROU=$S($D(^%SCRE(SCR,"ROUSTOC")):^%SCRE(SCR,"ROUSTOC"),1:"^%VAUTOST") S:ROU="" ROU="^%VAUTOST" D @ROU Q
DEL S ROU=$S($D(^%SCRE(SCR,"ROUSUP")):^%SCRE(SCR,"ROUSUP"),1:"$$KIL") S:ROU="" ROU="$$KIL" S @("OK="_ROU) Q
KIL() 
 K @(m("OLDN")),@(m("OLDF")) S %RQS=0,%NCH=^%SCRE(SCR) F %U=1:1:%NCH I $D(^%SCRE(SCR,%U,"QUERY"))!$D(^%SCRE(SCR,%U,"LIEN")) S %RQS=1
 D:%RQS ^%QSKILL Q 1
MODI S ROU=$S($D(^%SCRE(SCR,"ROUMOD")):^%SCRE(SCR,"ROUMOD"),1:"$$MODJ") S:ROU="" ROU="$$MODJ" S @("OK="_ROU) Q
MODJ() 
 D TESTO Q OK
 
DUPL S ROU=$S($D(^%SCRE(SCR,"ROUDUP")):^%SCRE(SCR,"ROUDUP"),1:"$$DUPJ") S:ROU="" ROU="$$DUPJ" S @("OK="_ROU) Q
DUPJ() 
 Q 1
MSGE(X) 
 D ^%VCRIFLD(X,%LIXG+1,%LIYB,%LIXG+1,%LIXD-1) R *X:^TOZE($I,"ATTENTE") D ^%VCRIFLD($J("",$L(X)),%LIXG+1,%LIYB,%LIXG+1,%LIXD-1) Q
 
CONSOR 
 K OR S %U=-1 F %V=1:1 S %U=$N(AFRESU(%U)) Q:%U=-1  S OR(%U)=AFRESU(%U)
 Q
 
TESTO 
 N %V,%U,IN,LLS,I
 S INL=1,LLS=0,OK=1
 F I=1:1:^%SCRE(SCR) S LLS=(LLS+$L(RESUL(I)))+1
 I LLS>500 G LONG
 S IN="" F I=1:1 Q:'($D(RESUL(I)))  S RESUL(I)=$$GETLBLAN^%VTLBLAN(RESUL(I)) D:$D(^%SCRE(SCR,I))=11 IND G:OK=0 FINST
 G LONG:$L(NOMTAB_"("_IN_")")>250,REFUS:IN=""
FINST Q
LONG 
 D ^%VZEAVT($$^%QZCHW("Vos donnees sont un peu abondantes")_"..."_$$^%QZCHW("Stockage refuse")) G AFF
IND I RESUL(I)="" G REFUS
 S IN=IN_$S(IN="":""""_$$ADR^%QZCHDG(RESUL(I))_"""",1:","_""""_$$ADR^%QZCHDG(RESUL(I))_"""")
 Q
REFUS F %V=1:1:^%SCRE(SCR) I ($D(^%SCRE(SCR,%V))#10)=1 S DX=^%SCRE(SCR,%V,2)+$L(^%SCRE(SCR,%V,1)),DY=^%SCRE(SCR,%V,3) X XY D BLK^%VVIDEO,REV^%VVIDEO X XY W " " D NORM^%VVIDEO
 D ^%VZEAVT($$^%QZCHW("Il faut absolument des informations dans ces zones")_"...")
AFF 
 S %U=-1 F %V=1:1 S %U=$N(OR(%U)) Q:%U=-1  S RESUL(%U)=OR(%U)
 D ^%VAFIGRI,^%VAFISCR
 S OK=0 Q

