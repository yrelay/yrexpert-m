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
;! Nomprog     : TO3TABAC                                                     !
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

TO3TABAC ;
 
 S %UCI=^TABIDENT($I,"%UCI"),QUCOM=%UCI K ^GRILDVU($I),^[QUI]GRISELEC(ARTI),^GETABAC2($I) S NBGRVU=0,ONBGR=NBGRVU,^[QUI]GRISELEC(ARTI)=0
 F LOOP=1:1 D TRABA Q:ONBGR=NBGRVU  S ONBGR=NBGRVU
FINI K ^GROUVU($J)
 S TYP=-1 F VV=1:1 S TYP=$N(^GETABAC2($I,TYP)) Q:TYP=-1  S QUW=$S(TYP="P":QUI,1:QUCOM),NUGROU=-1 F WW=1:1 S NUGROU=$N(^GETABAC2($I,TYP,NUGROU)) Q:NUGROU=-1  S SSGRO=-1 F YY=1:1 S SSGRO=$N(^GETABAC2($I,TYP,NUGROU,SSGRO)) Q:SSGRO=-1  D SEL
 G FINII
SEL S NUGR=-1
 F HH=1:1 S NUGR=$N(^[QUW]SSGRGRI(NUGROU,SSGRO,NUGR)) Q:NUGR=-1  I $D(^[QUW]GROUGRIL(NUGR)) S ^[QUI]GRISELEC(ARTI,NUGR)=$P(^[QUW]GROUGRIL(NUGR),"|",2) D UNITEP,UNIT D:'($D(^GROUVU($J,NUGROU))) KEMP S ^[QUI]GRISELEC(ARTI)=^[QUI]GRISELEC(ARTI)+1
 G END
KEMP S ^GROUVU($J,NUGROU)=1,GRI=$P($P(^[QUW]GROUGRIL(NUGR),"|",2),"^",1),TK="^[QUI]KEMPLOI(ARTI,PP)"
 F TB="PARAGRIL","GRILRESU" S TY=$S($E(TB)="G":"R",1:"P"),BT="^[QUW]"_TB,PP=-1 F %U=1:1 S PP=$N(@BT@(NUGR,PP)) Q:PP=-1  S NU=$S($D(@TK@("VU")):@TK@("VU"),1:1),@TK@("VU")=NU+1,@TK@(NU)=$$^%QZCHW("Abaque ")_GRI_" ("_TY_")"
 Q
FINII K ^GROUVU($J),%NORM,%UCI,A,CP,CYY,FONCT,HH,IT,ITYP,LIG,LISPAR,LOOP,NBGRVU,NORM,NPAR,NUGR,NUGRIL,NUGROU,ONBGR,PP,QU,QUCOM,QUW,RAB,REFGR,RR,RS,RSCRC,TT,TYP,TYPNORM,VALI,VV,WW,YY G FIN
TRABA K ^GETABAC($I),^GETGROUP($I) S NUGROU=-1,QU=QUI
 ;HL2 LOPQU F UU=0:0 S NUGROU=$N(^[QU]DEFGROUP(NUGROU)) Q:NUGROU=-1  D TRAIT
LOPQU F UU=0:0 S NUGROU=$N(^DEFGROUP(NUGROU)) Q:NUGROU=-1  D TRAIT
 G:QU=QUCOM XXX S QU=QUCOM G LOPQU
SUIT S NORM=$S($D(^[QUI]FLIMPLI(ARTI,TYPNORM))!$D(^[QUI]EXPL(ARTI,TYPNORM)):1,1:0) G END
XXX S TYP=-1
 F UU=0:0 S TYP=$N(^GETABAC($I,TYP)) Q:TYP=-1  S NUGROU=-1 F VV=0:0 S NUGROU=$N(^GETABAC($I,TYP,NUGROU)) Q:NUGROU=-1  S SSGRO=-1 F WW=0:0 S SSGRO=$N(^GETABAC($I,TYP,NUGROU,SSGRO)) Q:SSGRO=-1  S ^GRILDVU($I,TYP,NUGROU,SSGRO)=1 W "#" D GETIMP I NUGR'=-1 D DEP
 G FIN
GETIMP S QUW=$S(TYP="C":QUCOM,1:QUI),NUGR=$N(^[QUW]SSGRGRI(NUGROU,SSGRO,-1)) G:NUGR=-1 FIN
 S TYPNORM=$P(^GETABAC($I,TYP,NUGROU,SSGRO),"|",3),NORM=$P(^GETABAC($I,TYP,NUGROU,SSGRO),"|",4),SIGN=$P(^GETABAC($I,TYP,NUGROU,SSGRO),"|",5),TYPNORM=$S((TYPNORM=$$^%QZCHW("SANS"))!((TYPNORM=$$^%QZCHW("TOUS"))!((TYPNORM=$$^%QZCHW("TOUTES"))!(TYPNORM=""))):0,1:TYPNORM)
YYY S ITYP=$S(TYP="C":0,1:1),PARA="%VALABAC."_NUGROU_"."_SSGRO_"."_ITYP,^[QUI]DELIMP(ARTI,PARA)=1,FONCT="$TOVALIAB("_NUGROU_";"_SSGRO_";"_ITYP_";"_TYPNORM_")",^[QUI]FULL(ARTI,PARA)=1
 S RS="",$P(RS,"^",18)=FONCT,^[QUI]FLIMPLI(ARTI,PARA,1)=RS
 S ^[QUI]DELIMP(ARTI,PARA)=1 G END
FIN Q
TRAIT 
 S NBP=-1
 F VV=1:1 S NBP=$N(^[QU]DEFGROUP(NUGROU,"P",NBP)) Q:NBP=-1  S REFGR=^[QU]DEFGROUP(NUGROU,"P",NBP) F UU=1:1 S PP=$P(REFGR,"/",UU) Q:PP=""  I ('($D(^[QUI]FLIMPLI(ARTI,PP))))&('($D(^[QUI]EXPL(ARTI,PP)))) G END
 S TYP=$S(QU=QUI:"P",1:"C")
 S %NAMG=-1 F WW=0:0 S %NAMG=$N(^[QU]SSGROUP(NUGROU,%NAMG)) Q:%NAMG=-1  S %TYPN=-1 F ZZ=0:0 S %TYPN=$N(^[QU]SSGROUP(NUGROU,%NAMG,%TYPN)) Q:%TYPN=-1  D AAA
 G FIN
AAA S SSGRO=^[QU]SSGROUP(NUGROU,%NAMG,%TYPN),TYPNORM=%TYPN I $D(^GRILDVU($I,TYP,NUGROU,SSGRO)) G FIN
 D TRTYP
 I AFF=1 S ^GETABAC($I,TYP,NUGROU,SSGRO)="||"_TYPNORM_"||"_SIGN,^GETABAC2($I,TYP,NUGROU,SSGRO)=1,NBGRVU=NBGRVU+1
 Q
DEP 
 
JJJ S ITYP=$S(TYP["C":0,1:1),VALI="%VALABAC."_NUGROU_"."_SSGRO_"."_ITYP,QUW=$S(TYP["C":QUCOM,1:QUI)
 S LIG=-1
 F RR=0:0 S LIG=$N(^[QUW]RESUGRIL(NUGR,LIG)) Q:LIG=-1  S RAB=^[QUW]RESUGRIL(NUGR,LIG),^[QUI]RELATION(ARTI,RAB,VALI)=1,^[QUI]FULL(ARTI,RAB)=1 I ('($D(^[QUI]FLIMPLI(ARTI,RAB))))&('($D(^[QUI]EXPL(ARTI,RAB)))) S ^[QUI]EXPL(ARTI,RAB)="ABAC" D GETASS
 
 G END
END Q
TRTYP S AFF=0,SIGN="="
TRTYP1 
 
 I TYPNORM="" S TYPNORM=$$^%QZCHW("SANS")
 I TYPNORM["=" S SIGN=$S(TYPNORM["'=":"'=",1:"="),%NORM=$P(TYPNORM,SIGN,2),TYPNORM=$P(TYPNORM,SIGN,1) S:%NORM="" TYPNORM=$$^%QZCHW("SANS")
 I (TYPNORM=$$^%QZCHW("SANS"))!((TYPNORM=$$^%QZCHW("TOUTES"))!(TYPNORM=$$^%QZCHW("TOUTE"))) S AFF=1,NORM=0 G END
 I ('($D(^[QUI]FLIMPLI(ARTI,TYPNORM))))&('($D(^[QUI]EXPL(ARTI,TYPNORM)))) G END
 S AFF=1
 S NORM=1 G END
GETASS I '($D(^[QUI]EXPGIMP(RAB))) G END
 S %CP=RAB,%TYEXP="ABAC" D ^%AB3GPSY G END
UNIT S LIG=-1 F RR=0:0 S LIG=$N(^[QUW]RESUGRIL(NUGR,LIG)) Q:LIG=-1  S RAB=^[QUW]RESUGRIL(NUGR,LIG) D UNITZ
 G END
UNITZ I $D(^[QUW]GRILRESU(NUGR,RAB,"EXP")) S ^[QUI]UNITEXP(ARTI,RAB,NUGR)=^[QUW]GRILRESU(NUGR,RAB,"EXP")
 I $D(^[QUW]GRILRESU(NUGR,RAB,"ECR")) S ^[QUI]UNITECR(ARTI,RAB,NUGR)=^[QUW]GRILRESU(NUGR,RAB,"ECR")
 Q
 Q
UNITEP S QUW=$S(TYP="C":QUCOM,1:QUI),PARA=-1 F %WW=1:1 S PARA=$N(^[QUW]PARAGRIL(NUGR,PARA)) Q:PARA=-1  D UNITE2
 G END
UNITE2 I $D(^[QUW]PARAGRIL(NUGR,PARA,"ECR")) S ^[QUI]UNITECR(ARTI,PARA,NUGR)=^[QUW]PARAGRIL(NUGR,PARA,"ECR")
 
 I $D(^[QUW]PARAGRIL(NUGR,PARA,"EXP")) S ^[QUI]UNITEXP(ARTI,PARA,NUGR)=^[QUW]PARAGRIL(NUGR,PARA,"EXP")
 G END

