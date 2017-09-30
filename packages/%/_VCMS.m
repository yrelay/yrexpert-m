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
;! Nomprog     : %VCMS                                                        !
;! Module      : TOTEM                                                        !
;! But         : Consultation modification et suppression Implicites TOTEM    !
;!                                                                            !
;! Description : Gille de saisie des paramètres implicites dans TOTEM.        !
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

;%VCMS^INT^1^59547,74034^0
GECMS(GRIL) 
GO N LIPT,SCR,TPIL S GRIL(1)=GRIL,GRIL="^Z"_GRIL K ^SAV($I),@GRIL@($J) S @GRIL@($J)=1,@GRIL@($J,1)=GRIL(1),@GRIL@($J,1,0,"ACTIVE")=0
 F %U=1:1:^%SCRE(GRIL(1)) S @GRIL@($J,1,"RESUL",%U)="" I $D(^%SCRE(GRIL(1),%U,"INVISIBLE")) S %V=^%SCRE(GRIL(1),%U,"INVISIBLE"),@("@GRIL@($J,1,""RESUL"",%U)="_%V)
 D MEN
LOOP S LIPT=@GRIL@($J) G:LIPT'>0 FIN S SCR=@GRIL@($J,LIPT) D CMS(SCR,LIPT) G LOOP
FIN D ECHON^%VVIDEO Q
CMS(SCR,TPIL) 
 S %AJM="M",NOMTAB=$S($D(^%SCRE(SCR,"GLOSTOC")):^%SCRE(SCR,"GLOSTOC"),1:"^[QUI]"_SCR)
CMSS I @GRIL@($J,TPIL,0,"ACTIVE")="AUTO1" S @GRIL@($J,"OPT")=@GRIL@($J,TPIL,0,"OPT"),ROUTI="C3^%VMULTGE(.IFLAG)" D ^%VRESMUL(SCR),^%VAFIGRI,^%VAFISCR,MEN^%VCMSCOR(.CONT),AFMOD^%VCMSCOR($$^%QZCHW("Consulter")) S %LIS="AUTO1" G RGET
 I @GRIL@($J,TPIL,0,"ACTIVE")=1 S ROUTI="C3^%VMULTGE(.IFLAG)" D ^%VRESMUL(SCR),^%VAFIGRI,^%VAFISCR,MEN,MEN^%VCMSCOR(.CONT),AFMOD^%VCMSCOR($$^%QZCHW("Consulter")) S %LIS=1 G RGET
 I @GRIL@($J,TPIL,0,"ACTIVE")="L" D ^%VRESMUL(SCR),^%VAFIGRI,^%VAFISCR,MENL,MEN^%VCMSLIS(.CONT),AFMOD^%VCMSCOR($$^%QZCHW("Consulter")) S %LIS="L" G RGET
 S ROUTI="^%VMULTGE(.IFLAG)" K RESUL,PATOUCH,DEJALU,AFRESU S %U=-1 F %V=1:1 S %U=$N(@GRIL@($J,TPIL,"AFRESU",%U)) Q:%U=-1  S AFRESU(%U)=@GRIL@($J,TPIL,"AFRESU",%U)
 S %U=0,%V=^%SCRE(SCR)
LP S %U=%U+1 G:%U>%V LPS S RESUL(%U)=@GRIL@($J,TPIL,"RESUL",%U),DEJALU(%U)="",PATOUCH(%U)=$S(($D(^%SCRE(SCR,%U))#10)=1:"",1:1) I $D(^%SCRE(SCR,%U,"PATOUCH")),^%SCRE(SCR,%U,"PATOUCH")=1 S PATOUCH(%U)=1
 G LP
LPS S PS=$S($D(^%SCRE(SCR,"POSITION")):^%SCRE(SCR,"POSITION"),1:"-1,-1,80,24"),%U=1 F %V="%LIXG","%LIYH","%LIXD","%LIYB" S @%V=$P(PS,",",%U),%U=%U+1
 D:MODTM CONTLIM
 I @GRIL@($J,TPIL,0,"ACTIVE")="AUTO" D ^%VCURWAY(SCR) S ABENDSCR=0,ROUTI="^%VMULTGE(.IFLAG)" G COR
 D ^%VAFIGRI,^%VAFISCR,MEN,AFMOD^%VCMSCOR($$^%QZCHW("Consulter")) S CMS=0 D ^%VATYPA,^%VCURWAY(SCR)
GET S %AJM="C" D ^%VMODISC S %AJM="M",%V=^%SCRE(SCR) F %U=1:1:%V S PATOUCH(%U)="" I $D(^%SCRE(SCR,%U,"PATOUCH")),^%SCRE(SCR,%U,"PATOUCH")=1 S PATOUCH(%U)=1
 G:ABENDSCR CTRLF G COR:CTRLF=1,LIS:CTRLF="L"
COR D ^%VCMSCOR(.CONT) S %LIS=$S(@GRIL@($J,TPIL,0,"ACTIVE")="AUTO":"AUTO",1:"")_1 G RGET
LIS D ^%VCMSLIS(.CONT) S %LIS="L" G RGET
RGET G:'($D(CONT)) CTRLA
 G @(CONT):(CONT="CTRLA")!(CONT="CTRLF"),BP
CTRLA G CTRLF:%LIS="AUTO1" S @GRIL@($J,TPIL,0,"ACTIVE")=0 G CMSS
CTRLF K @GRIL@($J,TPIL) S @GRIL@($J)=TPIL-1,LIS=$ZP(^BASP($J,"")) D ^%VEFFSCR(%LIXG,%LIYH,%LIXD,LIS) G FINAJ
BP D ^%VSAVMUL(SCR) S @GRIL@($J,TPIL,0,"ACTIVE")=%LIS,SCR=CONT G:SCR["^" PG S TPIL=TPIL+1,@GRIL@($J)=TPIL
 D GTAB^%VAJOUT(SCR) S @GRIL@($J,TPIL)=SCR,@GRIL@($J,TPIL,0,"ACTIVE")=0
 S %V=^%SCRE(SCR) F %U=1:1:%V S @GRIL@($J,TPIL,"RESUL",%U)="" I $D(^%SCRE(SCR,%U,"INVISIBLE")) S @("@GRIL@($J,TPIL,""RESUL"",%U)="_^%SCRE(SCR,%U,"INVISIBLE"))
 G FINAJ
FINAJ Q
MEN S MS="Consulter^*GET,Modifier^*MOD,Ajouter^*AJ,Dupliquer^*DUP,Supprimer^*SUP,Page^*PAG",@GRIL@($J,"OPT")=MS Q
MENL S MS="Modifier^*MOD,Ajouter^*AJ,Dupliquer^*DUP,Supprimer^*SUP,Page^*PAG",@GRIL@($J,"OPT")=MS Q
PG D @SCR G FINAJ
POINT(GRIL,TBR) 
 N LIPT,SCR,TPIL S GRIL(1)=GRIL,GRIL="^Z"_GRIL K @GRIL@($J) S @GRIL@($J)=1,@GRIL@($J,1)=GRIL(1),@GRIL@($J,1,0,"ACTIVE")="AUTO" D MENL
 F %U=1:1:^%SCRE(GRIL(1)) S @GRIL@($J,1,"RESUL",%U)=$S($D(@TBR@(%U)):@TBR@(%U),1:"")
 
 S @GRIL@($J,1,0,"OPT")=MS,@GRIL@($J,"OPT")=MS D ADR^%VAFIGRI(GRIL(1)) G LOOP
 
CONTLIM S:%LIXG<0 %LIXG=0
 S:%LIYH<0 %LIYH=0
 S:%LIYB>23 %LIYB=23
 S:%LIXD>79 %LIXD=79
 Q
 
NEW(GRIL) 
 N %AJM,%DIFL,%NOMC,%NFU,%P,%PCH,%PCOUR,%PP1,%PP2,%Q,%TAB,%TABTRA,%U,%V,%X,%LIS,%LIXD,%LIXG,%LIYB,%LIYH,%LLI,%NF1,%EXIST,%LIB1,%NCH,%REFS,%RQS,%YADOL
 N ABENDSCR,C,MS,MSG,NOMTAB,REFUSE,ROUTI,RS,SCR1,Y1,YCP,ACCOR,I,IC,II,IN,INL,ISN,ISNUM,LL,LLS,NOM,OK,ROU,STOPUC,UU
 N E,J,Y,YCH,YH1,YY,Z1,ZZ1,XCP,XD1,XG1,XX,PS,AD,AM,AN,AX,AY,CA,CDR,CMS,COD,CONT,CTR,CTRLF,DEP,DX,DY,ESCMV,ICC,ICCK,ICX,IFLAG,IK,IW,LI,LIS,LX,LXD,LXG,PAG,PFE,PL,PS,SCH,MOD,X1
 N RESUL,PATOUCH,DEJALU,m,AFRESU,OR,TAB
 D GO
 Q

