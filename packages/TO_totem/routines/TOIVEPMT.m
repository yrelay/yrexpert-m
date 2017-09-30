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

;TOIVEPMT^INT^1^59547,74872^0
TOIVEPMT ;
 
 S %LIEU=$$^%QZCHW("Mat en stock") D ^TO3WLIEU K ^M($I,%MC),IMT S FMS=$N(^[QUI]MATSTOCK(%MC,-1)) Q:FMS=-1
 S %MC(1)=FMS,TYPART(FMS)="MAT",%NOM="^[QUI]MATSTOCK(%MC,FMS,IMT(""NF""))",YA=FMS,^[QUI]TOIVMAT(%MC(1),%ART,%MC)=1
 K ^V($I,YA) S ^V($I,YA,$$^%QZCHW("ARTICLE"))=%ART,^M($I,%MC,$$^%QZCHW("ARTICLE"))=%ART,^M($I,%MC,"FAMMAT")=%MC(1)
S30 S IMT("NF")=-1 F IMT("%FF")=1:1 S IMT("NF")=$N(^[QUI]MATSTOCK(%MC,FMS,IMT("NF"))) Q:IMT("NF")=-1  D S1
 F IMT("III")=$$^%QZCHW("PRIX"),$$^%QZCHW("QTE.STOCK"),$$^%QZCHW("UNITE.STOCK") I '($D(^V($I,YA,IMT("III")))) S ^V($I,YA,IMT("III"))="",^M($I,%MC,IMT("III"))=""
 K RS,RRS,%RS Q
S1 K %RS I $D(@%NOM)=10 D ^%VKMULNG G SUIT
 S RS=@%NOM D ^%VKMULC
SUIT K RRS S IMT("III")=-1 F IMT("%FF")=1:1 S IMT("III")=$N(%RS(IMT("III"))) Q:IMT("III")=-1  S RRS(IMT("III"))=%RS(IMT("III"))
 K %RS F IMT("III")=1:3:13 I $D(RRS(IMT("III"))),RRS(IMT("III"))'="",'($D(^V($I,YA,RRS(IMT("III"))))) D S40
 G S41
S40 S ^V($I,YA,RRS(IMT("III")))=RRS(IMT("III")+1),^M($I,%MC,RRS(IMT("III")))=RRS(IMT("III")+1)
 Q
S41 S IMT("JJJ")=15
 F IMT("III")=$$^%QZCHW("PRIX"),$$^%QZCHW("QTE.STOCK"),$$^%QZCHW("UNITE.STOCK") S IMT("JJJ")=IMT("JJJ")+1 I '($D(^V($I,YA,IMT("III")))),$D(%RS(IMT("JJJ"))),%RS(IMT("JJJ"))'="" S ^V($I,YA,IMT("III"))=%RS(IMT("JJJ")),^M($I,%MC,IMT("III"))=%RS(IMT("JJJ"))
 S ^V($I,YA,$$^%QZCHW("MATIERE"))=%MC,^M($I,%MC,$$^%QZCHW("MATIERE"))=%MC
 Q
S2 K %RS S IMT("TOZEC")=^TOZE($I,"C"),IMT("TOZEA")=^TOZE($I,"A")
 S NTABN=$$^%QZCHW("MATIERE EN STOCK"),NCLE=3,PNUM=2,F1=18,NFOR=1,IMT("NTRI")="",IMT("PARA")=$$^%QZCHW(" "),IMT("CONDIT")=0
LOPAR S PRX="("""_YA_""","_$P(^[QUI]IREPFICH(YA,%REG),"^",2)_")",SOURCE=$E(PRX,2,$L(PRX)-1),PARA=$P(PRX,",",2),PARAP=$P(PARA,"""",2) G:$D(^V($I,YA,PARAP)) END I (PARAP'["$ARG")&(PARAP'["%VAL") S ANC=PARAP D ^TOEVCOUR
RETERR Q:%ABEND=1  S $ZT=TOZEC
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR=1 YAERR S CONDIT=RES1 G ROLO
NOLO S ATEST="^[QUI]CIMPMAT"_PRX,CATEST=@ATEST,@("CONDIT="_CATEST) K CATEST
ROLO I CONDIT=0 S %HALT=0 G END
 S %HALT=1,%PAAAF=1 I $D(@("^[QUI]BLOCIMPL"_PRX)) S RBL=PRX D ^TO3GBLIM G:^SAVE($I,"OK")=0 BLIMP D ^TO3VBLIM G RBLI
 S $ZT=TOZEA
 S AFFECT="^[QUI]AIMPMAT"_PRX I @AFFECT="" S CONDIT=0 G END
 D SIFON G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR=1 YAERR S AFFECT="%RESUL",%RESUL="RES1"
SIF1 G:%ABEND=1 END S CAFFECT=@AFFECT,@("(^V($I,YA,PARAP),VPA)="_CAFFECT),^M($I,%MC,PARAP)=VPA K CAFFECT
RBLI I PARAP=$$^%QZCHW("ARRET"),VPA=1 D ABEND G END
 I $D(^[QUI]EXPGIMP(PARAP,VPA))!$D(^[QUI]IGNORER(YA,PARAP,VPA)) S OPARA=PARA,%MODA=$$^%QZCHW("ART"),PARA=PARAP D ^TO3PASYS S PARA=OPARA K OPARA
 G END
FIN K UNDEFCI Q
ABEND S %ABEND=1,DX=10,DY=9 X XY D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO,CAG^%VVIDEO W $$^%QZCHW("A R R E T") D NORM^%VVIDEO
 W !,!,?5 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO W $$^%QZCHW("de l'etude "),NUFA,$$^%QZCHW(" sur "),YA D NORM^%VVIDEO H 5 S DE=7,FI=$Y D ^%ABNETTO Q
SIFON S SIF=0 Q:@AFFECT'["$"
 S CONTAF=@AFFECT G:$E(CONTAF,1,2)'="$$" FIN
 S SIF=1,ROUTI="^"_$E($P(CONTAF,"/",1),3,299),EXPFONC=CONTAF,ROUTI=$S(ROUTI="^TOVALIAB":"^TOIVALIM",1:ROUTI) D @ROUTI S AFFECT="%RESUL",%RESUL="%RESULTAT"
 K CONTAF,EXPFONC,ROUTI Q
END K UNDEFCI,NTRI,PARA,CONDIT,HEURE,PRX,SOURCE,PARAP,ATEST,CATEST,AFFECT,VPA,%MODA,CONTAF,%RESUL,%RESULTAT,%POR,EXPFONC,ROUTI Q
BLIMP S %ABEND=2,ET=^PILETUD($I,0),^PILETUD($I,ET)=NUFA_"^"_TWREF_"^1^IMPL^"_NTRI_"^"_QUI_"^^"_^V($I,YA,$$^%QZCHW("QUANTITE"))_"^"_YA_"^"_YB_"^0^0" Q
YAERR S zzz=xxx Q

