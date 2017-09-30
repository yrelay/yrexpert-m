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

;TO3NFORM^INT^1^59547,74870^0
TO3NFORM ;
 
 K FOR Q:'($D(^PHASADM($I,NUFA,TWREF,"FORM")))  S TB0="^PHASADM($I,NUFA,TWREF,""FORM"")",FOR("NPH")=-1,TBG="^GLOETUD($I,NUFA,TWREF,""FORM"",%N11,YA)",%N11=0,%LIEU=$$^%QZCHW("Temps & couts") D ^TO3WLIEU
LNPH S FOR("NPH")=$N(@TB0@(FOR("NPH"))) G:FOR("NPH")=-1 BIS G:'($D(@TB0@(FOR("NPH"),0))) LNPH S FOR("NMA")=-1,FOR("VM")=0
LNMA S FOR("NMA")=$N(@TB0@(FOR("NPH"),0,FOR("NMA"))) G:FOR("NMA")=-1 FIMA S FOR("VM")=1,FOR("RMA")=@TB0@(FOR("NPH"),0,FOR("NMA")),%IND=0 G:'($D(@TB0@(FOR("NPH"),0,FOR("NMA"),"IND"))) LNMB S %IND=1,FOR("IN")=-1 K ^INDPH($J)
 F %U=1:1 S FOR("IN")=$N(@TB0@(FOR("NPH"),0,FOR("NMA"),"IND",FOR("IN"))) Q:FOR("IN")=-1  S FOR("VIN")=@TB0@(FOR("NPH"),0,FOR("NMA"),"IND",FOR("IN")),^V($I,YA,FOR("IN"))=FOR("VIN"),^INDPH($J,FOR("IN"))=FOR("VIN")
LNMB S (FOR("SEC"),FOR("SECI"))=$P(FOR("RMA"),"|",1)
 S ^V($I,YA,$$^%QZCHW("%MACHINE"))=FOR("SEC"),FOR("%TAUX")=$P(FOR("RMA"),"|",2),FOR("RF")=$P(FOR("RMA"),"|",3),FOR("RFI")=$P(FOR("RMA"),"|",4) K FOR("RMA") S FOR("%U")=2
 F FOR("IT")="PH","OG","OP" S @FOR("IT")=$P(FOR("RF"),"^",FOR("%U")),FOR("%U")=FOR("%U")+1
 S FOR("%U")=2 F FOR("IT")="PH","OG","OP" S @FOR("IT")@(1)=$P(FOR("RFI"),"^",FOR("%U")),FOR("%U")=FOR("%U")+1
 S ANC=$E(OG_"   "_PH_"   "_OP,1,60) D ^TOEVCOUR
 D GETSEC I '(FOR("GSECT")) S (FOR("COUT"),FOR("COUTS"),FOR("DURP"),FOR("DURUS"),FOR("DUREE"),FOR("RAIS"))="???",FOR("COND")=0 D AFF G LNMA
 K FOR("x") S NTABN="FORMULES",NCLE=5,PNUM=1,F1=17,F2=19,NFOR=2,FOR("COND")=-1,FOR("TSDEF")=0,FOR("CONDA0")=0
LOCOND S $ZT=^TOZE($I,"C"),FOR("COND")=$N(@TBG@(PH(1),OP(1),FOR("SEC"),FOR("COND"))) G:FOR("COND")=-1 LNMA S FOR("CHP")=^[QUI]FORMULE(YA,PH(1),OP(1),FOR("SEC"),FOR("COND")) D SUITE G:%ABEND'=0 END G:FOR("CONDIT")'=0 LNMA
 S FOR("CONDA0")=FOR("CONDA0")+1 F FOR("%U")="COUTS","COUT","DURP","DURUS","RAIS" S FOR(FOR("%U"))="???"
 D AFF1 G LOCOND
BIS G:(%N11=1)!(%N10=0) END S %N11=1 G:'($D(@TBG)) END G LNPH
FIMA S:'($D(FOR("TSDEF"))) FOR("TSDEF")=0 S:'($D(FOR("CONDA0"))) FOR("CONDA0")=0 I (%N10=1)&((FOR("TSDEF")=0)&(%N11=1)),FOR("CONDA0")'=0 D ^TOMACFIN K @TB0@(FOR("NPH")) G LNPH
 G:$D(@TB0@(FOR("NPH"),0))!(FOR("VM")=0) LNPH D ^TOMACFIN G LNPH
SUITE S FOR("CONDIT")=""
RETERR Q:%ABEND=1  S $ZT=^TOZE($I,"C"),SOURCE=""""_YA_""","""_PH(1)_""","""_OP(1)_""","""_FOR("SEC")_""","""_FOR("COND")_"""",RBIS="("_SOURCE_")",TSDEF=1 D:%N11=1 ^TOTSDEFA("FORMULE") S:'(TSDEF) FOR("TSDEF")=FOR("TSDEF")+1 Q:'(TSDEF)
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S FOR("CONDIT")=0 G ROLO
NOLO S FOR("COND1")=^[QUI]CFORMULE(YA,PH(1),OP(1),FOR("SEC"),FOR("COND")),@("FOR(""CONDIT"")="_FOR("COND1"))
ROLO Q:FOR("CONDIT")=0
 S FOR("RAIS")="^[QUI]FORMULE("""_YA_""","""_PH(1)_""","""_OP(1)_""","""_FOR("SEC")_""","""_FOR("COND")_""")",FOR("ZW")=1,(FOR("VUPR"),FOR("VUUS"))=0,$ZT=^TOZE($I,"A")
BLOP I '($D(^[QUI]BLOCOPER(YA,PH(1),OP(1),FOR("SEC"),FOR("COND")))) G NORM
 S $ZT="" D ^TONAUTOP Q:%ABEND=1  I '(BLOCPH) S (FOR("COUT"),FOR("COUTS"),FOR("DURP"),FOR("DURUS"),FOR("DUREE"))="???" D AFF Q
 G:^SAVE($I,"OK")=0 COLB S:'($D(^COUTOT($I))) ^COUTOT($I)=0_"|"_0_"^"_0 S FOR("RCT")=^COUTOT($I),FOR("COUT")=$P(FOR("RCT"),"|",1),FOR("COUTS")=FOR("COUT")*^V($I,YA,$$^%QZCHW("QUANTITE"))
 S FOR("DUREE")=$P(FOR("RCT"),"|",2),FOR("DURP")=$P(FOR("DUREE"),"^",1),FOR("DURUS")=$P(FOR("DUREE"),"^",2) D AFF Q
NORM D ^TONFORAF Q:%ABEND'=0
 D SOMME,AFF Q
UNITE S FOR("LG")=$L($P(FOR("CHP"),"^",FOR("ZZ")+1)),FOR("UT")=$P(FOR("CHP"),"^",FOR("ZZ")+1),FOR("UTF")=$E("FRANCS",1,FOR("LG")),FOR("UTT")=$E("TEMPS",1,FOR("LG"))
 S TA=$S((FOR("UT")=FOR("UTF"))&(FOR("ZZ")=17):"FOR(""x"",""COUP"")",(FOR("UT")=FOR("UTT"))&(FOR("ZZ")=17):"FOR(""x"",""DURP"")",1:"???") Q:TA'="???"
 S TA=$S((FOR("UT")=FOR("UTF"))&(FOR("ZZ")=19):"FOR(""x"",""COUTU"")",(FOR("UT")=FOR("UTT"))&(FOR("ZZ")=19):"FOR(""x"",""DURTU"")",1:"FOR(""x"",""BIDON"")") Q
 Q
SOMME S (FOR("COUT"),FOR("COUTS"),FOR("DURP"),FOR("DURUS"))="???",FOR("QUAN")=$S($D(^V($I,YA,$$^%QZCHW("QUANTITE"))):^V($I,YA,$$^%QZCHW("QUANTITE")),1:1)
 S FOR("TH")=FOR("%TAUX")
 S FOR("CUM")=$S($D(FOR("x","COUP",OP))&$D(FOR("x","COUTU",OP)):"FF",$D(FOR("x","COUP",OP))&$D(FOR("x","DURTU",OP)):"FT",$D(FOR("x","DURP",OP))&$D(FOR("x","COUTU",OP)):"TF",$D(FOR("x","DURP",OP))&$D(FOR("x","DURTU",OP)):"TT",1:"FIN")
 G @FOR("CUM")
TT S FOR("DURP")=FOR("x","DURP",OP),FOR("DURUS")=FOR("x","DURTU",OP),FOR("COUTS")=(FOR("DURP")+(FOR("DURUS")*FOR("QUAN")))*FOR("TH"),FOR("COUT")=FOR("COUTS")/FOR("QUAN") G FIN
FT S FOR("DURUS")=FOR("x","DURTU",OP),FOR("DURP")=$S(FOR("TH")=0:"???",FOR("TH")["?":"???",1:FOR("x","COUP",OP)/FOR("TH")),FOR("COUTS")=FOR("x","COUP",OP)+((FOR("DURUS")*FOR("QUAN"))*FOR("TH")),FOR("COUT")=FOR("COUTS")/FOR("QUAN") G FIN
TF S FOR("DURP")=FOR("x","DURP",OP),FOR("DURUS")=$S(FOR("TH")=0:"???",FOR("TH")["?":"?",1:FOR("x","COUTU",OP)/FOR("TH")),FOR("COUTS")=(FOR("DURP")*FOR("TH"))+(FOR("x","COUTU",OP)*FOR("QUAN")),FOR("COUT")=FOR("COUTS")/FOR("QUAN") G FIN
FF S:FOR("TH")=0 FOR("TH")="???"
 S FOR("DURP")=$S(FOR("TH")["?":"???",1:FOR("x","COUP",OP)/FOR("TH")),FOR("DURUS")=$S(FOR("TH")["?":"???",1:FOR("x","COUTU",OP)/FOR("TH")),FOR("COUTS")=FOR("x","COUP",OP)+(FOR("x","COUTU",OP)*FOR("QUAN")),FOR("COUT")=FOR("COUTS")/FOR("QUAN") G FIN
DUR S FOR("DUREE")=$S(FOR("TH")'=0:FOR("COUT")/FOR("TH"),1:"???") Q
AFF K @TB0@(FOR("NPH"),0,FOR("NMA"))
AFF1 S @TB0@(FOR("NPH"),1,FOR("NMA"))=FOR("SECI")_"|"_FOR("COUTS")_"|"_FOR("COUT")_"^"_FOR("DURP")_"^"_FOR("DURUS")_"|"_FOR("RAIS")_"|"_PH_"|"_OP_"|"_OG Q
GETSEC K ^GSECT($I) S (FOR("CAR"),%CAR)=$$^%QZCHW(" "),RS=FOR("SEC"),FOR("GSECT")=0 D ^%QZCHNBC S FOR("NBCAR")=%NBCAR+1
GST S FOR("NU")=FOR("NBCAR"),FOR("GST")="" F FOR("SS")=1:1:FOR("NBCAR") S FOR("GSTP")=$P(FOR("SEC"),FOR("CAR"),FOR("SS")),FOR("GST")=FOR("GST")_$S(FOR("GST")="":"",1:FOR("CAR"))_FOR("GSTP"),^GSECT($I,FOR("NU"))=FOR("GST"),FOR("NU")=FOR("NU")-1
 F FOR("SS")=1:1:FOR("NBCAR") S FOR("GSTP")=^GSECT($I,FOR("SS")) I $D(^[QUI]FORMULE(YA,PH(1),OP(1),FOR("GSTP"))) S FOR("GSECT")=1,FOR("SEC")=FOR("GSTP") G FSECT
 I FOR("CAR")=$$^%QZCHW(" ") K ^GSECT($I) S (FOR("CAR"),%CAR)=".",RS=FOR("SEC") D ^%QZCHNBC S FOR("NBCAR")=%NBCAR+1 G GST
FSECT K ^GSECT($I),%CAR,%NBCAR Q
END K FOR,%CAR,RS,%NBCAR,F1,F2,TA,%TBL,OP,OG,PH
FIN Q
COLB S %ABEND=2,FOR("ET")=^PILETUD($I,0),^PILETUD($I,FOR("ET"))=NUFA_"^"_TWREF_"^"_(%N10+1)_"^FORM^^"_QUI_"^^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))_"^"_YA_"^"_YB_"^1^1" G FIN
YAERR S FOR("zzz")=FOR("xxx") Q

