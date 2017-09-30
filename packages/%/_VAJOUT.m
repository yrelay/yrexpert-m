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
;! Nomprog     : %VAJOUT                                                      !
;! Module      : TOTEM                                                        !
;! But         : Gestion des explicites TOTEM                                 !
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

;%VAJOUT^INT^1^59547,74034^0
GEAJOUT(GRIL) 
 N SCR,TPIL S GRIL(1)=GRIL,GRIL="^A"_GRIL K ^SAV($I),@GRIL@($J) S @GRIL@($J)=1,@GRIL@($J,1)=GRIL(1),@GRIL@($J,1,0,"ACTIVE")=0
 F %U=1:1:^%SCRE(GRIL(1)) S @GRIL@($J,1,"RESUL",%U)="" I $D(^%SCRE(GRIL(1),%U,"INVISIBLE")) S %V=^%SCRE(GRIL(1),%U,"INVISIBLE"),@("@GRIL@($J,1,""RESUL"",%U)="_%V)
 D MENAJ
LOOP S TPIL=@GRIL@($J) G:TPIL'>0 FIN S SCR=@GRIL@($J,TPIL) D AJOUT(SCR,TPIL) G LOOP
FIN D ECHON^%VVIDEO Q
AJOUT(SCR,TPIL) 
 S:'($D(@GRIL@($J,TPIL,0,"ACTIVE"))) @GRIL@($J,TPIL,0,"ACTIVE")=0
 K ^PRESCR($I,SCR) S %AJM="A",^PRESCR($I,SCR)=0 D GTAB(SCR) S %V=^%SCRE(SCR),%U=0 K RESUL,PATOUCH,DEJALU,AFRESU S %U=-1 F %V=1:1 S %U=$N(@GRIL@($J,TPIL,"AFRESU",%U)) Q:%U=-1  S AFRESU(%U)=@GRIL@($J,TPIL,"AFRESU",%U)
 S %U=0,%V=^%SCRE(SCR)
LP S %U=%U+1 G:%U>%V LPS S RESUL(%U)=@GRIL@($J,TPIL,"RESUL",%U),DEJALU(%U)="",PATOUCH(%U)="" I $D(^%SCRE(SCR,%U,"PATOUCH")),^%SCRE(SCR,%U,"PATOUCH")=1 S PATOUCH(%U)=1
 G LP
LPS G LPSS:'(@GRIL@($J,TPIL,0,"ACTIVE")),LPSS:'($D(^%SCREC(SCR,"GERQS"))) S %U="" F %V=1:1 S %U=$O(^%SCREC(SCR,"GERQS",%U)) Q:%U=""  S PS="S RESUL(%U)="_^%SCREC(SCR,"GERQS",%U) X PS
LPSS S PS=$S($D(^%SCRE(SCR,"POSITION")):^%SCRE(SCR,"POSITION"),1:"-1,-1,80,24"),%U=1 F %V="%LIXG","%LIYH","%LIXD","%LIYB" S @%V=$P(PS,",",%U),%U=%U+1
 
 D ^%VAFIGRI,^%VAFISCR S CMS=0,ABENDSCR=0 G NEX:@GRIL@($J,TPIL,0,"ACTIVE")=1 D AFMOD^%VCMSCOR($$^%QZCHW("Ajout"))
GET D:$D(^%SCRE(SCR,"ROUINI")) @^%SCRE(SCR,"ROUINI")
 S ABENDSCR=0 D ^%VMODISC G:ABENDSCR NEX D STO^%VCMSCOR G NEX:ABENDSCR=1
NEX D AFMOD^%VCMSCOR(""),GEMEN
 D LIM,1^%VQUIKMN(XG1,XD1,YH1,"^BASP($I)",CDR,.AD,.CTR,.PFE,.MOD),@("CLFEN^%VVIDEO("_PFE_")") I (CTR="H")!((CTR="J")!(CTR="R")) S @("A=$$"_CTR_"^%VCTRLSC") G NEX
 G END:CTR="A",END:CTR="F" I AD="" D ^%VSQUEAK G NEX
 D AFMOD^%VCMSCOR(MOD) G:$E(AD)="*" @$P(AD,"*",2,99) G BP
PAG D ^%VEFFSCR(%LIXG,$O(^BASP($J,"")),%LIXD,$ZP(^BASP($J,""))) S DX=%LIXG+1,DY=$O(^BASP($J,"")) X XY W "Page : " S DX=$X D ^%VLEC G:Y1="" NEX I '($D(^PRESCR($I,SCR,Y1))) D ^%VSQUEAK G PAG
 S RF=^PRESCR($I,SCR,Y1) I '($D(@RF)) S DX=%LIXG+1,DY=$O(^BASP($J,"")) X XY W "Cette page n'existe plus...[RETURN]" R *X:^TOZE($I,"ATTENTE") G PAG
 S %PCOUR=Y1,%V=^%SCRE(SCR) F %U=1:1:%V S @GRIL@($J,TPIL,"RESUL",%U)=RESUL(%U)
 S %U=-1 F %V=1:1 S %U=$N(AFRESU(%U)) Q:%U=-1  S @GRIL@($J,TPIL,"AFRESU",%U)=AFRESU(%U)
 D ^%VNEWPAG(SCR,Y1,%LIXG,%LIYH,"^PRESCR($I,SCR)"),MEN,MEN^%VCMSCOR(.CONT) I (CONT="CTRLA")!(CONT="CTRLF") D MENAJ G NEX
 D ^%VCMS(CONT)
 K RESUL S %V=^%SCRE(SCR) F %U=1:1:%V S RESUL(%U)=@GRIL@($J,TPIL,"RESUL",%U)
 K AFRESU S %U=-1 F %V=1:1 S %U=$N(@GRIL@($J,TPIL,"AFRESU",%U)) Q:%U=-1  S AFRESU(%U)=@GRIL@($J,TPIL,"AFRESU",%U)
 D GTAB(SCR),LIM^%VAFIGRI(SCR),MENAJ G NEX
BP I ABENDSCR D ^%VSQUEAK G NEX
 S %V=^%SCRE(SCR) F %U=1:1:%V S @GRIL@($J,TPIL,"RESUL",%U)=RESUL(%U)
 S %U=-1 F %V=1:1 S %U=$N(AFRESU(%U)) Q:%U=-1  S @GRIL@($J,TPIL,"AFRESU",%U)=AFRESU(%U)
 S @GRIL@($J,TPIL,0,"ACTIVE")=1,SCR=AD G:SCR["^" PG S TPIL=TPIL+1,@GRIL@($J)=TPIL D GTAB(SCR) S @GRIL@($J,TPIL)=SCR,@GRIL@($J,TPIL,0,"ACTIVE")=0
 S %V=^%SCRE(SCR) F %U=1:1:%V S @GRIL@($J,TPIL,"RESUL",%U)="" I $D(^%SCRE(SCR,%U,"INVISIBLE")) S @("@GRIL@($J,TPIL,""RESUL"",%U)="_^%SCRE(SCR,%U,"INVISIBLE"))
 G FINAJ
END K @GRIL@($J,TPIL) S @GRIL@($J)=TPIL-1
 D CLFEN^%VVIDEO(%LIXG+1,%LIYH+1,(%LIYB-%LIYH)-1,(%LIXD-%LIXG)-1)
FINAJ Q
LIM I '($D(^%SCRE(SCR,"POSOPT"))) S XD1=%LIXD,XG1=%LIXG,YH1=%LIYB,CDR=0 Q
 S XG1=^%SCRE(SCR,"POSOPT"),XD1=$P(XG1,",",2),YH1=$P(XG1,",",3),CDR=$P(XG1,",",4),XG1=$P(XG1,",",1) Q
MEN S MS="MODIFIER^*MOD,DUPLIQUER^*DUP,SUPPRIMER^*SUP",@GRIL@($J,"OPT")=MS Q
MENAJ S MS="AJOUT^*GET,FIN^*END",@GRIL@($J,"OPT")=MS Q
GEMEN K ^BASP($I) N OPT,NOPT,IT,U S NOPT=0,OPT=@GRIL@($J,"OPT"),IT="" F U=1:1 S IT=$P(OPT,",",U) Q:IT=""  S NOPT=NOPT+1,^BASP($I,NOPT)=IT
 S OPT=$S($D(^%SCRE(SCR,"OPTIONS")):^%SCRE(SCR,"OPTIONS"),1:"") F U=1:1 S IT=$P(OPT,",",U) Q:IT=""  S NOPT=NOPT+1,^BASP($I,NOPT)=$TR(IT,":","^")
 Q
GTAB(SC) 
 S NOMTAB=$S($D(^%SCRE(SC,"GLOSTOC")):^%SCRE(SC,"GLOSTOC"),1:"^[QUI]"_SC) Q
ENCOUR(GRIL) 
 N SCR,TPIL S %AJM="A",GRIL(1)=GRIL,GRIL="^A"_GRIL K @GRIL@($J) S @GRIL@($J)=1,@GRIL@($J,1)=GRIL(1),@GRIL@($J,1,0,"ACTIVE")=0
 F %U=1:1:^%SCRE(GRIL(1)) S @GRIL@($J,1,"RESUL",%U)="" I $D(^%SCRE(GRIL(1),%U,"INVISIBLE")) S @GRIL@($J,1,"RESUL",%U)=RESUL(%U)
 D MENAJ G LOOP
PG D @SCR G FINAJ
 
 
POINT(GRIL,TBR) 
 N SCR,TPIL S GRIL(1)=GRIL,GRIL="^A"_GRIL K ^SAV($I),@GRIL@($J) S @GRIL@($J)=1,@GRIL@($J,1)=GRIL(1),@GRIL@($J,1,0,"ACTIVE")=0
 F %U=1:1:^%SCRE(GRIL(1)) S @GRIL@($J,1,"RESUL",%U)=$S($D(@TBR@(%U)):@TBR@(%U),1:"") I $D(^%SCRE(GRIL(1),%U,"INVISIBLE")) S %V=^%SCRE(GRIL(1),%U,"INVISIBLE"),@("@GRIL@($J,1,""RESUL"",%U)="_%V)
 D MENAJ
 G LOOP

