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

;%ABCPG02^INT^1^59547,73864^0
%ABCPG02 ;
 
 D KILL1 K ^ERRORGR($I),^INTERVAL($I) S DY=3 D CLEBAS^%VVIDEO S PGEC=-1,LI=-1,%TS="   "
 F UU=0:0 S PGEC=$N(^TACOMPIL($I,PGEC)) Q:PGEC=-1  S LI=-1 F VV=0:0 S LI=$N(^TACOMPIL($I,PGEC,LI)) Q:LI=-1  D COMPR,^%ABCPG05,INT^%QMDAK0 S ^[QUW]TIMCPGR(NOMG,NORM,IDENT)=^[QUW]TIMCPGR(NOMG,NORM,IDENT)_HEURE
FIN D KILL1 Q:'($D(^TACOMPIL($I)))  D ^%ABCPRE2 Q
COMPR K ^PARA($J),^INTERVAL($I) S RGR=^TACOMPIL($I,PGEC,LI),RG=1
 F TT="NOMG","NORM","IDENT","TYPGR","TYPNORM" S @TT=$P(RGR,"^",RG),RG=RG+1
 W !,NOMG,?40,NORM,?60,IDENT,?75,TYPGR K ^[QUI]GRILEROR(NOMG,NORM,IDENT) S %ERROR=1
 S QUW=$S(TYPGR="(P)":QUI,1:%UCI) D INT^%QMDAK0 S ^[QUW]TIMCPGR(NOMG,NORM,IDENT)=%DAT_"^"_HEURE_"^"
 D ^%ABCPGCP K ONUGR I $D(^[QUW]REFABAC(NOMG,NORM,IDENT)) S ONUGR=^[QUW]REFABAC(NOMG,NORM,IDENT) D KILL S NUGR=ONUGR
 I '($D(ONUGR)) D ^%ABCPOPN
 S ^[QUW]REFABAC(NOMG,NORM,IDENT)=NUGR,LIGSEP=^[QUW]STRUCT(NOMG,1,6),NBC=^[QUW]STRUCT(NOMG,1,5),ESPC=^[QUW]STRUCT(NOMG,1,5,1),EVAL=1
 S LIG=-1,NBPAR=0,NBLIG=0 K ^LIGSCRC($I),^LIGPARA($I)
 F %VV="P","R" F UU=0:0 S LIG=$N(^[QUW]STRUCT(NOMG,2,%VV,LIG)) Q:LIG=-1  S NBLIG=NBLIG+1,^LIGSCRC($I,%VV,LIG)=$S('($D(^[QUW]STRUCT(NOMG,2,%VV,LIG,4))):0,^[QUW]STRUCT(NOMG,2,%VV,LIG,4)="O":1,1:0) D ^%ABCPG03 G:AVORT=1 END
 K ^GROUPAR($I) S ^[QUW]PARAGRIL(NUGR)=NBPAR,REFGRO="",PP=-1,NBGP=1,NBP=1,^GROUPAR($I,NBGP)=""
 F UU=0:0 S PP=$N(^[QUW]PARAGRIL(NUGR,PP)) Q:PP=-1  S REFGRO=REFGRO_$S(REFGRO="":"",1:"/")_PP,NBP=NBP+1 I NBP>7 S NBP=1,^GROUPAR($I,NBGP)=REFGRO,NBGP=NBGP+1,REFGRO=""
 I REFGRO'="" S ^GROUPAR($I,NBGP)=REFGRO
 K NBP,NBGP S NUGRO=-1
LGR S NUGRO=$N(^[QUW]DEFGROUP(NUGRO)) G:NUGRO=-1 BB S NBP=-1,VU=1,%CMPAR=-1
LNP S NBP=$N(^[QUI]DEFGROUP(NUGRO,"P",NBP)) G:NBP=-1 AA G:'($D(^GROUPAR($I,NBP))) LGR S %CMPAR=^[QUW]DEFGROUP(NUGRO,"P",NBP)=^GROUPAR($I,NBP),VU=VU*%CMPAR G:%CMPAR=0 LGR G LNP
AA K NBP G:VU=0 LGR G:%CMPAR=-1 LGR S GROGRI=NUGRO G AFGR
BB S GROGRI=$S($D(^[QUW]CPTEUR("GROUPGRIL")):^[QUW]CPTEUR("GROUPGRIL"),1:1),^[QUW]CPTEUR("GROUPGRIL")=GROGRI+1,NBP=-1 F UU=0:0 S NBP=$N(^GROUPAR($I,NBP)) Q:NBP=-1  S ^[QUW]DEFGROUP(GROGRI,"P",NBP)=^GROUPAR($I,NBP)
AFGR K ^GROUPAR($I) S:TYPNORM="" TYPNORM="SANS" I $D(^[QUW]SSGROUP(GROGRI,NOMG,TYPNORM)) S SSGRO=^[QUW]SSGROUP(GROGRI,NOMG,TYPNORM) G AFGRS
 S SSGRO=$S($D(^[QUW]CPTEUR("GROUPGRIL",GROGRI)):^[QUW]CPTEUR("GROUPGRIL",GROGRI)+1,1:1),^[QUW]CPTEUR("GROUPGRIL",GROGRI)=SSGRO,^[QUW]SSGROUP(GROGRI,NOMG,TYPNORM)=SSGRO
AFGRS S ^[QUW]SSGRGRI(GROGRI,SSGRO,NUGR)=1,^[QUW]GROUGRIL(NUGR)=GROGRI_"|"_RGR_"|"_%SCPR_"|"_SSGRO,^[QUW]DEFGROUP(GROGRI,"R",NUGR)=1,DNORM="",SIG1="'=",SIG2="=" F SIG=SIG1,SIG2 I TYPNORM[SIG S DNORM=$P(TYPNORM,SIG,2),TYPNORM=$P(TYPNORM,SIG,1) G AFGRT
AFGRT S:(TYPNORM=$$^%QZCHW("TOUS"))!(TYPNORM=$$^%QZCHW("TOUTES")) TYPNORM=$$^%QZCHW("SANS") S DNORM=$S(DNORM'="":DNORM,1:NORM),^[QUW]GRTYPN(NUGR,TYPNORM,DNORM)=1,^[QUW]EVALGRIL(NUGR)=EVAL,TB="^[QUW]OCGRIL(NOMG,NORM)",PDX=10,PAX=ESPC+1,DDX=((ESPC+1)*(NBC-1))+10,DP=-1,NCAZ=0
 F LL=0:0 S DP=$N(@TB@(DP)) Q:DP=-1  Q:DP["zz"  F XX=PDX:PAX:DDX S UPLET="" D ^%ABCPG04
 S $P(^[QUW]GROUGRIL(NUGR),"|",5)=$S(NBLIG=0:0,1:NCAZ\NBLIG)
END Q
KILL K ^[QUW]REFABAC(NOMG,NORM,IDENT),^[QUW]EVALGRIL(ONUGR),^[QUW]PARAGRIL(ONUGR),^[QUW]RESUGRIL(ONUGR),^[QUW]GRILRESU(ONUGR),^[QUW]GRTYPN(ONUGR),^[QUW]ABDEJEV(ONUGR)
 K ^[QUW]TOCPBORN(ONUGR),^[QUW]TOCPNUPL(ONUGR),^[QUW]TOCPVPAR(ONUGR),^[QUW]TOCPVCOL(ONUGR)
 I $D(^[QUW]GROUGRIL(ONUGR)) S GROGRI=$P(^[QUW]GROUGRIL(ONUGR),"|",1),SSGRO=$P(^[QUW]GROUGRIL(ONUGR),"|",4) K ^[QUW]GROUGRIL(ONUGR) Q:GROGRI=""  K ^[QUW]DEFGROUP(GROGRI,"R",ONUGR) Q:SSGRO=""  K ^[QUW]SSGRGRI(GROGRI,SSGRO,ONUGR)
 Q
ERROR S NBC=3,COL=$S(XX=10:1,XX=33:2,1:3) D PGE^%ABGRPAG S %STOP=1,^ERRORGR($I,NUGR)=""""_NOMG_""","""_NORM_""","""_IDENT_"""",^[QUW]GRILEROR(NOMG,NORM,IDENT,%ERROR)=PGE_"^"_COL_"^"_BRAQ,%ERROR=%ERROR+1
 D ^%VSQUEAK W !,$$^%QZCHW("Erreur : "),BRAQ,$$^%QZCHW("  Page : "),PGE,$$^%QZCHW("  Colonne : "),COL G END
KILL1 I '(DTM) K (TACOMPIL,%PROGEX,DX,DY,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS) G KILL2
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="TACOMPIL","%PROGEX","DX","DY","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL2 D CURRENT^%IS,VARSYS^%QCSAP
 Q

