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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TO3IMBIS^INT^1^59547,74870^0
TO3IMBIS ;
 
 S %LIEU=$$^%QZCHW("Implicites"),%TABRA="^[QUI]RAISON(NUFA,TWREF)",%TABTV="^[QUI]TVPAR(NUFA,TWREF)" D ^TO3WLIEU G:'($D(^BISIMP($I,NUFA,TWREF,YA))) END
 S TOZEC=^TOZE($I,"C"),TOZEA=^TOZE($I,"A"),NTABN="IMPLICI",NCLE=3,PNUM=2,F1=18,NFOR=1,NTRI="",PARA=$$^%QZCHW(" "),CONDIT=0,PSEP=0
LOPAR S NTRI=$O(^BISIMP($I,NUFA,TWREF,YA,NTRI)) G:%ABEND'=0 END G:NTRI="" END
 S (PRX,RBIS)=^BISIMP($I,NUFA,TWREF,YA,NTRI) G:$E(PRX,1,2)'="!!" LOPAT S %PIND=1 D ^TOINDBIS G LOPAS
LOPAT S %PIND=0,(BISI,PARAP,PBIS)=$P(RBIS,"""",4)
LOPAS S SOURCE=$E(RBIS,2,$L(RBIS)-1) I $D(^V($I,YA,PBIS)) K ^BISIMP($I,NUFA,TWREF,YA,NTRI) G LOPAR
 D TSDEF G:'(TSDEF) LOPAR I (PBIS'["$ARG")&(PBIS'["%VAL") S ANC=PBIS D ^TOEVCOUR
 D TESCOND G LOPAR
TESCOND 
RETERR Q:%ABEND=1  S $ZT=TOZEC G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S CONDIT=1 G ROLO
NOLO S ATEST="^[QUI]CIMPLICI"_RBIS,CATEST=@ATEST,@("CONDIT="_CATEST) K CATEST
ROLO I CONDIT=0 K ^BISIMP($I,NUFA,TWREF,YA,NTRI) Q
 S PARAP=PBIS G:'($D(@("^[QUI]BLOCIMPL"_RBIS))) NBLO S RBL=RBIS,PARAP=PBIS D ^TO3GBLIM G:^SAVE($I,"OK")=0 BLIMP D ^TO3VBLIM G:BISI=PBIS RBLI
 S ^V($I,YA,PBIS)=^V($I,YA,BISI),^[QUI]RAISON(NUFA,TWREF,PBIS)=^[QUI]RAISON(NUFA,TWREF,BISI),^[QUI]TVPAR(NUFA,TWREF,PBIS)=^V($I,YA,PBIS)
 K ^[QUI]RAISON(NUFA,TWREF,BISI),^V($I,YA,BISI),^[QUI]TVPAR(NUFA,TWREF,BISI),^PHASADM($I,NUFA,TWREF,"BLOC",RBL) G RBLI
NBLO S $ZT=TOZEA,AFFECT="^[QUI]AIMPLICI"_RBIS,%PAAAF=1 D SIFON Q:%PAAAF=0  G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S AFFECT="%RESUL",%RESUL="RES1"
SIF1 S CAFFECT=@AFFECT,@("^V($I,YA,PBIS)="_CAFFECT),^[QUI]TVPAR(NUFA,TWREF,PBIS)=^V($I,YA,PBIS),%POR=PBIS D ORD S @%TBEV@("CARDIMP")=@%TBEV@("CARDIMP")+1,PSEP=1 K CAFFECT
 I (PBIS'["$ARG")&((PBIS'["%ARGIN")&(PBIS'["%VALAB")) S ^[QUI]RAISON(NUFA,TWREF,PBIS)="^[QUI]IMPLICI"_RBIS
 I PBIS=$$^%QZCHW("ARRET"),^V($I,YA,PBIS)=1 D ABEND Q
RBLI I $D(^[QUI]EXPGIMP(PBIS,^V($I,YA,PBIS)))!$D(^[QUI]IGNORER(YA,PBIS,^V($I,YA,PBIS))) S OPARA=PARA,%MODA=$$^%QZCHW("ART"),PARA=PBIS,VPA=^V($I,YA,PBIS) D ^TO3PASYS S PARA=OPARA K OPARA
 S ^NBRGLEV($I,NUFA,"COUR")=^NBRGLEV($I,NUFA,"COUR")+1 K ^BISIMP($I,NUFA,TWREF,YA,NTRI) D INCR Q
FIN 
 G END
AVERTI D POCLEPA^%VVIDEO,^%VSQUEAK W "* ",PARA," * non defini, nous aurons peut-etre des problemes" H 3 Q
ABEND S DX=10,%ABEND=1,DY=9 X XY D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO,CAG^%VVIDEO W $$^%QZCHW("A R R E T") D NORM^%VVIDEO W !,!,?5 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO W $$^%QZCHW("de l'etude "),NUFA,$$^%QZCHW(" sur "),YA D NORM^%VVIDEO H 5 S DE=7,FI=$Y D ^TONETTOI Q
END K %PAAAF,BISI,TOZEA,TOZEC,PARAP,PARA,CONDIT,SOURCE,TSDEF,ATEST,CATEST,RBL,AFFECT,CAFFECT,%POR,DE,FI,CONTAF,ROUTI,EXPFONC,%RESUL,%RESULTAT,PND,RBIS,UU,PSEP,DE,FI,NTRI,OPARA,PBIS,VPA Q
SIFON S SIF=0 Q:@AFFECT'["$"  S CONTAF=@AFFECT G:CONTAF'["$$" FINO S SIF=1,ROUTI="^"_$P($P(CONTAF,"/",1),"$$",2),EXPFONC=$S($E(CONTAF,1)="(":$E(CONTAF,2,$L(CONTAF)-1),1:CONTAF) D @ROUTI S AFFECT="%RESUL",%RESUL="%RESULTAT" K CONTAF,EXPFONC,ROUTI Q
FINO Q
ORD S $ZT="G FINO",^[QUI]ORDEVAL(NUFA,TWREF,$$^%QZCHW("ART"),@^CPTPAR(1))=%POR_"^^"_^V($I,YA,%POR) G FINO
TRI S $ZT="G FINO",^[QUI]ORDEVAL(NUFA,TWREF,$$^%QZCHW("ART"),@^CPTPAR(1))=%POR_"^"_NTRI_"^"_VPA G FINO
INCR S $ZT="G FINO",@^CPTPAR(1)=@^CPTPAR(1)+1 G FINO
TSDEF S TSDEF=1,TDEF="^INDEF($I,NUFA,TWREF,"_SOURCE_")",PND=-1
 F UU=0:0 S PND=$N(@TDEF@(PND)) G:PND=-1 BISI D TEST I TSDEF=0 G FINT
BISI S RF=$P(SOURCE,",",2,999),FIC=^[QUI]REPFICH(YA,"IMPLICI",RF),TDEF="^[QUI]INDEFIND("""_YA_""","_FIC_")",%U=""
 F UU=0:0 S %U=$O(@TDEF@(%U)) G:%U="" FINT S PND=@TDEF@(%U) I '($D(@PND)) S TSDEF=0 G FINT
FINT K TDEF,PND Q
TEST 
 S CPI=$P($P(PND,",",2),"""",2) G:$D(^PHASADM($I,NUFA,"COMP","OK",CPI)) TES10 I CPI'["~",$D(^PHASADM($I,NUFA,"COMP","NOK",CPI)) S @PND="Indefini" G TES11
TES10 I '($D(@PND)) S TSDEF=0 Q
TES11 K @TDEF@(PND) Q
 Q
 K TDEF,PND Q
BLIMP S %ABEND=2,ET=^PILETUD($I,0),^PILETUD($I,ET)=NUFA_"^"_TWREF_"^2^IMPL^"_NTRI_"^"_QUI_"^^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))_"^"_YA_"^"_YB_"^1^1" Q
YAERR S zzz=xxx Q

