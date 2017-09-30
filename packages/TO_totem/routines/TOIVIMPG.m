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

;TOIVIMPG^INT^1^59547,74872^0
TOIVIMPG ;
 
 I $D(TYPART(YA)),TYPART(YA)="MAT" D S2^TOIVEPMT Q
 S TOZEC=^TOZE($I,"C"),TOZEA=^TOZE($I,"A"),%LIEU=$$^%QZCHW("Implicites") D ^TO3WLIEU S NTABN="IMPLICI",NCLE=3,PNUM=2,F1=18,NFOR=1,NTRI="",PARA=$$^%QZCHW(" "),CONDIT=0
LOPAR S PRX="("""_YA_""","_$P(^[QUI]IREPFICH(YA,%REG),"^",2)_")",SOURCE=$E(PRX,2,$L(PRX)-1),PARA=$P(PRX,",",2),PARAP=$P(PARA,"""",2) G:$D(^V($I,YA,PARAP)) END I (PARAP'["$ARG")&(PARAP'["%VAL") S ANC=PARAP D ^TOEVCOUR
RETERR Q:%ABEND=1  S $ZT=TOZEC
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR=1 YAERR S CONDIT=RES1 G ROLO
NOLO S ATEST="^[QUI]CIMPLICI"_PRX,CATEST=@ATEST,@("CONDIT="_CATEST) K CATEST
ROLO I CONDIT=0 S %HALT=0 G END
 S %HALT=1,%PAAAF=1 I $D(@("^[QUI]BLOCIMPL"_PRX)) S RBL=PRX D ^TO3GBLIM G:^SAVE($I,"OK")=0 BLIMP D ^TO3VBLIM G RBLI
 S $ZT=TOZEA
 S AFFECT="^[QUI]AIMPLICI"_PRX I @AFFECT="" S CONDIT=0 G END
 D SIFON G:SIF SIF1 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR=1 YAERR S AFFECT="%RESUL",%RESUL="RES1"
SIF1 G:%ABEND=1 END S CAFFECT=@AFFECT,@("(^V($I,YA,PARAP),VPA)="_CAFFECT) K CAFFECT
RBLI I PARAP=$$^%QZCHW("ARRET"),VPA=1 D ABEND G END
 I $D(^[QUI]EXPGIMP(PARAP,VPA))!$D(^[QUI]IGNORER(YA,PARAP,VPA)) S OPARA=PARA,%MODA=$$^%QZCHW("ART"),PARA=PARAP D ^TO3PASYS S PARA=OPARA K OPARA
 G END
FIN K UNDEFCI Q
ABEND S %ABEND=1,DX=10,DY=9 X XY D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO,CAG^%VVIDEO W $$^%QZCHW("A R R E T") D NORM^%VVIDEO W !,!,?5 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO W $$^%QZCHW("de l'etude "),NUFA,$$^%QZCHW(" sur "),YA D NORM^%VVIDEO H 5 S DE=7,FI=$Y D ^%ABNETTO Q
SIFON S SIF=0 Q:@AFFECT'["$"  S CONTAF=@AFFECT G:$E(CONTAF,1,2)'="$$" FIN S SIF=1,ROUTI="^"_$E($P(CONTAF,"/",1),3,299),EXPFONC=CONTAF D @ROUTI S AFFECT="%RESUL",%RESUL="%RESULTAT" K CONTAF,EXPFONC,ROUTI Q
END K UNDEFCI,NTRI,PARA,CONDIT,HEURE,PRX,SOURCE,PARAP,ATEST,CATEST,AFFECT,VPA,%MODA,CONTAF,%RESUL,%RESULTAT,%POR,EXPFONC,ROUTI Q
BLIMP S %ABEND=2,ET=^PILETUD($I,0),^PILETUD($I,ET)=NUFA_"^"_TWREF_"^1^IMPL^"_NTRI_"^"_QUI_"^^"_^V($I,YA,$$^%QZCHW("QUANTITE"))_"^"_YA_"^"_YB_"^0^0" Q
YAERR S zzz=xxx Q
FA W *

