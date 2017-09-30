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

;%VCMSAJ^INT^1^59547,74034^0
GECMS(GRIL) 
 N LIPT,SCR S GRIL(1)=GRIL,GRIL="^W"_GRIL K @GRIL@($J) S @GRIL@($J)=1,@GRIL@($J,1)=GRIL(1),@GRIL@($J,1,0,"ACTIVE")=0
 F %U=1:1:^%SCRE(GRIL(1)) S @GRIL@($J,1,"RESUL",%U)=RESUL(%U),@GRIL@($J,1,"AFRESU",%U)=AFRESU(%U)
 S @GRIL@($J,1,0,"ACTIVE")=1 D MEN
LOOP S LIPT=@GRIL@($J) G:LIPT'>0 FIN S SCR=@GRIL@($J,LIPT) D CMS(SCR,LIPT) G LOOP
FIN Q
CMS(SCR,TPIL) 
 S NOMTAB=$S($D(^%SCRE(SCR,"GLOSTOC")):^%SCRE(SCR,"GLOSTOC"),1:"^[QUI]"_SCR)
CMSS I @GRIL@($J,TPIL,0,"ACTIVE")=1 S ROUTI="C3^%VMULTGE(.IFLAG)" D ^%VRESMUL(SCR),^%VAFIGRI,^%VAFISCR,MEN,MEN^%VCMSCOR(.CONT) G RGET
 S ROUTI="^%VMULTGE(.IFLAG)" K RESUL,PATOUCH,DEJALU,AFRESU S %U=-1 F %V=1:1 S %U=$N(@GRIL@($J,TPIL,"AFRESU",%U)) Q:%U=-1  S AFRESU(%U)=@GRIL@($J,TPIL,"AFRESU",%U)
 S %U=0,%V=^%SCRE(SCR)
LP S %U=%U+1 G:%U>%V LPS S RESUL(%U)=@GRIL@($J,TPIL,"RESUL",%U),DEJALU(%U)="",PATOUCH(%U)="" I $D(^%SCRE(SCR,%U,"PATOUCH")),^%SCRE(SCR,%U,"PATOUCH")=1 S PATOUCH(%U)=1
 G LP
LPS S PS=$S($D(^%SCRE(SCR,"POSITION")):^%SCRE(SCR,"POSITION"),1:"-1,-1,80,24"),%U=1 F %V="%LIXG","%LIYH","%LIXD","%LIYB" S @%V=$P(PS,",",%U),%U=%U+1
 D ^%VAFIGRI,^%VAFISCR,MEN S CMS=0 D ^%VATYPA,^%VCURWAY(SCR)
GET D ^%VMODISC G:ABENDSCR CTRLF D ^%VCMSCOR(.CONT)
RGET G @(CONT):(CONT="CTRLA")!(CONT="CTRLF"),BP
CTRLA S @GRIL@($J,TPIL,0,"ACTIVE")=0 G CMSS
CTRLF K @GRIL@($J,TPIL) S @GRIL@($J)=TPIL-1,LIS=$ZP(^BASP($J,"")) D ^%VEFFSCR(%LIXG,%LIYH,%LIXD,LIS) G FINAJ
BP D ^%VSAVMUL(SCR) S @GRIL@($J,TPIL,0,"ACTIVE")=1,TPIL=TPIL+1,@GRIL@($J)=TPIL,SCR=^GOCC($J,POY,POX) D GTAB^%VAJOUT(SCR) S @GRIL@($J,TPIL)=SCR,@GRIL@($J,TPIL,0,"ACTIVE")=0
 S %V=^%SCRE(SCR) F %U=1:1:%V S @GRIL@($J,TPIL,"RESUL",%U)="" I $D(^%SCRE(SCR,%U,"INVISIBLE")) S @GRIL@($J,TPIL,"RESUL",%U)=@^%SCRE(SCR,%U,"INVISIBLE")
 G FINAJ
FINAJ Q
MEN S MS="Modifier/MOD,Ajouter/AJ,Dupliquer/DUP,Supprimer/SUP",@GRIL@($J,"OPT")=MS Q
 ;

