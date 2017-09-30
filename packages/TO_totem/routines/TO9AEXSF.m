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

;TO9AEXSF^INT^1^59547,74871^0
TO9AEXSF ;
 
 K ^POSENR($I) S EGAP=0,NOMTREE="^[QUI]TREEWORK(NUFA",ADR="TRAIT^TO9AEXSF",NIV=2 D ^%QCAGTU1
FIN K DATAC,NOM,NSFA,SFA,SFAISTO,%TYPAR,%TABVAL,TABRA,%TVB1,NEXT,FLAG,I,%TPC,NEXT1,AVER,OSFA,JSFA,SEP,ISFA,%FF,PSFA,TABTV,DD,CAVER,NEX,NN,NSFA,QTC,NUPH,GF,RE,%U,NU,VDIM,LAV,JJJJ,VEXP,%ATP,NBLG,EGAP,LGRES,CTRLA,CTRLF,PER
END Q
TRAIT D ^TO3GREF,CLEPAG^%VVIDEO S LGRES=LILIM,NBLG=0,DATAC=@NOM,NSFA=TWREF,SFA=$P(DATAC,"^",1),SFAIDTO=$P(DATAC,"^",4),%ATP="",%TYPAR=$$^%QZCHW("ART"),%TBVAL="^[QUI]TVPAR(NUFA,NSFA)",%TBV1="^[QUI]ORDEVAL",TABTV="^[QUI]TVPAR(NUFA,NSFA,AVER)",TABRA="^[QUI]RAISON(NUFA,NSFA,AVER)"
 S (CTRLA,CTRLF)="" D EXP Q:CTRLA  S CTRLF="" D IMP Q:CTRLA  S CTRLF="" D FAMMAT Q:CTRLA  S CTRLF="" D MATIERE Q:CTRLA  S CTRLF="" D NOMENC Q:CTRLA  S CTRLF="" D PHASE
FINTR G END
EXP S NEXT=-1,FLAG=1
 F I=1:1 S NEXT=$N(^[QUI]EXPL(SFA,NEXT)) Q:NEXT=-1  S VEXP=^[QUI]EXPL(SFA,NEXT) I (VEXP'["ABAC")&((VEXP'["%%")&(VEXP'="I%%")) S GSM=$$^%QZCHW("PARAMETRES EXPLICITES")_%ATP D AFTYPA,SUR S %ERRETUD=0 D ^TO9EXIM0,AFF G:CTRLA!CTRLF END
 D:DEV="ECR" BASPG G END
IMP S FLAG=1,%TPC=-1 F I=1:1 S %TPC=$N(@%TBV1@(NUFA,NSFA,%TYPAR,%TPC)) Q:%TPC=-1  S NEXT1=@%TBV1@(NUFA,NSFA,%TYPAR,%TPC) D TRIMP G:CTRLA!CTRLF END
 D:DEV="ECR" BASPG G END
FAMMAT S OASFA=SFA Q:'($D(^[QUI]TVPAR(NUFA,NSFA,"FAMMAT")))  S GSM=$$^%QZCHW("FAMILLE MATIERE"),FLAG=1 D AFTYPA S AVER="FAMMAT",%ERRETUD=0 D ^TO9EXIM0,AFF G:CTRLA!CTRLF END
 D:DEV="ECR" BASPG G END
MATIERE Q:'($D(^[QUI]TVPAR(NUFA,NSFA,$$^%QZCHW("MATIERE"))))  S GSM=$$^%QZCHW("MATIERE"),FLAG=1 D AFTYPA S AVER=$$^%QZCHW("MATIERE"),%ERRETUD=0 D ^TO9EXIM0,AFF G:CTRLA!CTRLF END
 D:DEV="ECR" BASPG
EXMAT S CTRLF="",%ATP=$$^%QZCHW(" de matiere ") Q:'($D(^[QUI]TVPAR(NUFA,NSFA,"FAMMAT")))  S JSFA=^[QUI]TVPAR(NUFA,NSFA,"FAMMAT"),%TYPAR="MAT"
 F SEP=$$^%QZCHW(" "),"." S ISFA="" F %FF=1:1 S PSFA=$P(JSFA,SEP,%FF) Q:PSFA=""  S SFA=ISFA_$S(ISFA="":"",1:SEP)_PSFA I $D(^[QUI]FULL(SFA)) S %TBVAL="^[QUI]PARMAT(NUFA,NSFA)",TABTV="^[QUI]PARMAT(NUFA,NSFA,AVER)",TABRA="^[QUI]RAISMAT(NUFA,NSFA,AVER)" D EXP G:CTRLA END S CTRLF="" D IMP G:CTRLA!CTRLF END
 S SFA=OASFA
 D:DEV="ECR" BASPG G END
NOMENC S %ATP=$$^%QZCHW(" de matiere "),%TBVAL="^[QUI]TVPAR(NUFA,NSFA)",TABTV="^[QUI]TVPAR(NUFA,NSFA,AVER)",TABRA="^[QUI]RAISON(NUFA,NSFA,AVER)",SFA=OASFA,SNOM="^[QUI]TREEWORK(NUFA,"_NSFA_")",NN=-1,FLAG=1,GSM=$$^%QZCHW("COMPOSANTS") G:$N(@SNOM@(-1))=-1 END
 F DD=0:0 S NN=$N(@SNOM@(NN)) Q:NN=-1  D:FLAG=1 AFTYPA S CAVER=@("^[QUI]TREEWORK(NUFA,"_NSFA_","_NN_")"),AVER=$P(CAVER,"^",2),QTC=$P(CAVER,"^",3),NEX=NSFA_","_NN,FLAG=FLAG+1 D SUR S %ERRETUD=0 D ^TO9EXIM0,AFF G:CTRLA!CTRLF END
 D:DEV="ECR" BASPG G END
PHASE S NUPH=-1,FLAG=1,GSM=$$^%QZCHW("FABRICATION") F GF=0:0 S NUPH=$N(^[QUI]PHAS(NUFA,NSFA,NUPH)) G:NUPH=-1 END D:FLAG=1 AFTYPA S AVER=NUPH D SUR S %ERRETUD=0 D ^TO9EXIM0,AFF G:CTRLA!CTRLF END D DIM G:CTRLA!CTRLF END
 D:DEV="ECR" BASPG G END
DIM S RE=^[QUI]PHAS(NUFA,NSFA,NUPH),NU=-1 F %U=1:1 S NU=$N(^[QUI]DIM(NUFA,NSFA,RE,NU)) Q:NU=-1  S RF=^[QUI]DIM(NUFA,NSFA,RE,NU),AVER=$P(RF,"|",1)_"/"_NUPH,VDIM=$P(RF,"|",1)_"="_$P(RF,"|",2),%ERRETUD=0 D ^TO9EXIM0,AFF G:CTRLA!CTRLF END
 D:DEV="ECR" BASPG G END
SUR S LAV=$L(AVER),NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="     |-" F JJJJ=1:1:LAV+1 S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_$$^%QZCHW("-")
 S:'($D(^[QUI]CPTEUR("LSTAR"))) ^[QUI]CPTEUR("LSTAR")=0 S ^[QUI]CPTEUR("LSTAR")=^[QUI]CPTEUR("LSTAR")+1,^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_"|",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="     | "_AVER_" |"
 S LAV=$L(AVER),NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="     |-" F JJJJ=1:1:LAV+1 S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_$$^%QZCHW("-")
 S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_"|" I ^[QUI]CPTEUR("LSTAR")>5 S ^[QUI]CPTEUR("LSTAR")=0
 G END
TRIMP S NEXT=$P(NEXT1,"^",1) I $D(^[QUI]FLIMPLI(NEXT)) G AFIMP
 I (NEXT'["$")&((NEXT'["%ARG")&(NEXT'["%VAL")),('($D(^[QUI]EXPL(SFA,NEXT))))&((NEXT'="FAMMAT")&(NEXT'=$$^%QZCHW("MATIERE"))) G AFIMP
 S VEXP=$S($D(^[QUI]EXPL(SFA,NEXT)):^[QUI]EXPL(SFA,NEXT),1:"") I (VEXP["ABAC")!((VEXP["%%")!(VEXP["I%%")) G AFIMP
 G END
AFIMP S GSM=$$^%QZCHW(" PARAMETRES IMPLICITES ")_%ATP D AFTYPA,SUR S %ERRETUD=0 D ^TO9EXIM0,AFF G END
AFTYPA I FLAG=1 S LGRES=LILIM D:DEV'="ECR" ENTET D:DEV="ECR" CLEPAG^%VVIDEO S LGRES=LGRES-4 W !,LSTAR,!,"| ",GSM,?78," |",!,LSTAR
 S AVER=NEXT,FLAG=FLAG+1 G END
AFF G:DEV="IMPR" AFFI I (LGRES-NBLG)<0 D BASPG S LGRES=LILIM S:CTRLA STOP=1 G:CTRLA!CTRLF FAF
 S NBLG=-1 F %NNN=1:1 S NBLG=$N(^POSENR(DOLARI,NBLG)) Q:NBLG=-1  W !,^POSENR(DOLARI,NBLG) S LGRES=LGRES-1 I LGRES=0 D BASPG S LGRES=LILIM S:CTRLA STOP=1 Q:CTRLA!CTRLF
 G FAF
AFFI I (LGRES-NBLG)<0 D ENTET S LGRES=LILIM-5
 S NBLG=-1 F %NNN=1:1 S NBLG=$N(^POSENR(DOLARI,NBLG)) Q:NBLG=-1  W !,^POSENR(DOLARI,NBLG) S LGRES=LGRES-1 I LGRES=0 D ENTET S LGRES=LILIM-5
FAF W:DEV="IMPR" ! K ^POSENR(DOLARI) S NBLG=0 G END
ENTET S EGAP=EGAP+1 H 5 U IMPR W #,$$^%QZCHW("  date  "),%DAT,$$^%QZCHW("   "),HEURE,?65,$$^%QZCHW("Page : "),"  ",EGAP
 S %CH=$$^%QZCHW("EXPLICATION DE L'ETUDE No : ")_NUFA,%LGR=40+($L(%CH)\2) D ^%QZCHBK W !,!,%CH,!
 S LGRES=LILIM-5 G END
BASPG D POCLEPA^%VVIDEO W $$L18^%QSLIB1("(CTRLF) chang. de type de par.") S DX=$X D ^TOLECONE,CLEPAG^%VVIDEO
 Q

