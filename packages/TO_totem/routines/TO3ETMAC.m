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

;TO3ETMAC^INT^1^59547,74870^0
TO3ETMAC ;
 
 K ETM S $ZT="",TPH="^PHASADM($I,NUFA,TWREF,""PHAS"",1,NMA)",TBM="^PHASADM($I,NUFA,TWREF,""MAC"",0)" Q:'($D(@TBM))  K FMATSEL,MATSEL,TAMPON S ETM("SEC")="",NMA=-1
LMA S NMA=$N(@TBM@(NMA)) G:NMA=-1 END0 G:'($D(@TPH)) LMA S ETM("RPH")=@TPH,%IND=0 G:'($D(@TPH@("IND"))) LMB K ^INDPH($J) S %IND=1,ETM("IN")=-1
 F %U=1:1 S ETM("IN")=$N(@TPH@("IND",ETM("IN"))) Q:ETM("IN")=-1  S ETM("VIN")=@TPH@("IND",ETM("IN")),^V($I,YA,ETM("IN"))=ETM("VIN"),^INDPH($J,ETM("IN"))=ETM("VIN")
LMB S CHP=$P(ETM("RPH"),"|",2),ETM("RPH")=$P(ETM("RPH"),"|",1),ETM("%U1")=2 F %U3="PH","OG","OP" S @%U3=$P(ETM("RPH"),"^",ETM("%U1")),ETM("%U1")=ETM("%U1")+1
 S ETM("RPHI")=$P(@TPH,"|",3),ETM("%U1")=2 F %U3="PH","OG","OP" S @%U3@(1)=$P(ETM("RPHI"),"^",ETM("%U1")),ETM("%U1")=ETM("%U1")+1 S:%U3="PH" ^V($I,YA,"%PHASE")=PH(1) S:%U3="OP" ^V($I,YA,"%OPERATION")=OP(1)
SUIT S TB0="^PHASADM($I,NUFA,TWREF,""MAC"",0,NMA,""CH"")",%RS=-1 F UU=1:1 S %RS=$N(@TB0@(%RS)) Q:%RS=-1  S FMATSEL(TWREF,%RS)=@TB0@(%RS)
S1 D ^TO3GMACH S ETM("NBM")=@TBM@(NMA),ETM("VU")=0 G:'($D(MATSEL)) S3
S2 S ETM("%TAUX")=-1
S21 S ETM("%TAUX")=$N(MATSEL(ETM("%TAUX"))) G:ETM("%TAUX")=-1 ALORS S ETM("SEC")=-1
S22 S ETM("SEC")=$N(MATSEL(ETM("%TAUX"),ETM("SEC"))) G:ETM("SEC")=-1 S21 S ETM("VU")=1,@TBM@(NMA,"ADM",ETM("NBM"))=ETM("SEC")_"|"_ETM("%TAUX"),ETM("NBM")=ETM("NBM")+1 G S22
ALORS G:ETM("VU")=1 FIN S ETM("SEC")=-1
S3 S ETM("SEC")=$N(TAMPON(-1)) G:(ETM("SEC")=-1)&(ETM("VU")=1) FIN I ETM("SEC")=-1 S ETM("SEC")=$$^%QZCHW("????"),ETM("%TAUX")=0 G FINS
 S ETM("%TAUX")=0 I $D(^[QUI]SECTION(ETM("SEC"))) S @ETN@("NUM")=$N(^[QUI]SECTION(ETM("SEC"),-1)) Q:@ETN@("NUM")=-1  S ETM("%TAUX")=$P(^[QUI]SECTION(ETM("SEC"),@ETN@("NUM")),"^",5)
FINS S @TBM@(NMA,"ADM",ETM("NBM"))=ETM("SEC")_"|"_ETM("%TAUX"),ETM("NBM")=ETM("NBM")+1
FIN S @TBM@(NMA)=ETM("NBM") G:$D(^PHASADM($I,NUFA,TWREF,"MAC",0,NMA,"CH")) CC S TBA="^PHASADM($I,NUFA,TWREF,""MAC"",0,NMA,""ADM"")",TBA1="^PHASADM($I,NUFA,TWREF,""FORM"",NMA,0)",ETM("NBM")=-1
 F %U1=0:0 S ETM("NBM")=$N(@TBA@(ETM("NBM"))) Q:ETM("NBM")=-1  S @TBA1@(ETM("NBM"))=@TBA@(ETM("NBM"))_"|"_YA_"^"_PH_"^"_OG_"^"_OP_"|"_YA_"^"_PH(1)_"^"_OG_"^"_OP(1) D:%IND IND
 K TBA,TBA1,^PHASADM($I,NUFA,TWREF,"MAC",0,NMA) D END G LMA
CC D END G LMA
END K %NOM,%RS,FMATSEL,MATSEL,TAMPON Q
END0 K TBM,TBO,TPH,ETM,%NOM,%RS,FMATSEL,MATSEL,TAMPON Q
IND S ETM("IN")=-1 F %U=1:1 S ETM("IN")=$N(^INDPH($J,ETM("IN"))) Q:ETM("IN")=-1  S @TBA1@(ETM("NBM"),"IND",ETM("IN"))=^INDPH($J,ETM("IN"))
 Q

