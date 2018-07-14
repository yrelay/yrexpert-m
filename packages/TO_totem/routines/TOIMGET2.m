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

;TOIMGET2^INT^1^59547,74872^0
TOIMGET2 ;
 
 S:'($D(@%TBEV@("%NUA"))) @%TBEV@("%NUA")="?" S:@%TBEV@("%NUA")="" @%TBEV@("%NUA")="?" S VU=$S(@%TBEV@("%NUA")="?":1,1:0),TOZEC=^TOZE($I,"C"),TOZEA=^TOZE($I,"A"),%LIEU=$$^%QZCHW("Implicites")
 S %TABRA="^[QUI]RAISON(NUFA,TWREF)",%TABTV="^[QUI]TVPAR(NUFA,TWREF)" D ^TO3WLIEU G:'($D(^[QUI]TRI(YA))) FIN
 
 S NTABN="IMPLICITES",NCLE=3,PNUM=2,F1=18,NFOR=1,NTRI="",PARA=$$^%QZCHW(" "),CONDIT=0 S:@%TBEV@("%NUA")'["?" NTRI=@%TBEV@("%NUA")-1
 I '($D(^[QUI]FULL(YA,"DATE"))) D ZD^%QMDATE4,^%QMDAK0 S ^[QUI]TVPAR(NUFA,TWREF,"DATE")=%DAT_$$^%QZCHW(" a ")_HEURE,^[QUI]RAISON(NUFA,TWREF,"DATE")="IMPLICITMODIFICATION",^[QUI]FULL(YA,"DATE")=1
LOPAR S PNUM=2 S:'($D(VU)) VU=1 S NTRI=$O(^[QUI]TRI(YA,NTRI)) G:NTRI="" FIN G:(NTRI'=@%TBEV@("%NUA"))&(VU=0) LOPAR G:%ABEND'=0 FIN G:NTRI="" FIN
 S VU=1,PRX=^[QUI]TRI(YA,NTRI)
 S SOURCE=$E(PRX,2,$L(PRX)-1),PARA=$P(PRX,",",2),PARAP=$P(PARA,"""",2)
 G:$D(^V($I,YA,PARAP)) LOPAR
 I (PARAP'["$ARG")&(PARAP'["%VAL") S ANC=PARAP D ^TOEVCOUR
RETERR Q:%ABEND=1  S $ZT=TOZEC
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR=1 YAERR S CONDIT=RES1 G ROLO
NOLO S ATEST="^[QUI]CIMPLICI"_PRX,CATEST=@ATEST,@("CONDIT="_CATEST) K CATEST
ROLO G:CONDIT=0 LOPAR
 S %PAAAF=1 I $D(@("^[QUI]BLOCIMPL"_PRX)) S RBL=PRX D ^TO3GBLIM G:^SAVE($I,"OK")=0 BLIMP D ^TO3VBLIM G RBLI
 S $ZT=TOZEA
 S AFFECT="^[QUI]AIMPLICI"_PRX I @AFFECT="" S CONDIT=0 G LOPAR
 D SIFON G:%ABEND LOPAR
 G:SIF SIF1
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR=1 YAERR S AFFECT="%RESUL",%RESUL="RES1"
SIF1 G:%ABEND=1 LOPAR S CAFFECT=@AFFECT,@("(^V($I,YA,PARAP),VPA)="_CAFFECT) K CAFFECT S ^[QUI]TVPAR(NUFA,TWREF,PARAP)=VPA
 I (PARAP["$ARG")!((PARAP["%ARGIN")!(PARAP["%VALAB")) G LOPAR
 S ^[QUI]RAISON(NUFA,TWREF,PARAP)="^[QUI]IMPLICI"_PRX,%POR=PARAP D TRI
RBLI S ^NBRGLEV($I,NUFA,"COUR")=^NBRGLEV($I,NUFA,"COUR")+1
 I PARAP=$$^%QZCHW("ARRET"),VPA=1 D ABEND G LOPAR
 I $D(^[QUI]EXPGIMP(PARAP,VPA))!$D(^[QUI]IGNORER(YA,PARAP,VPA)) S OPARA=PARA,%MODA=$$^%QZCHW("ART"),PARA=PARAP D ^TO3PASYS S PARA=OPARA K OPARA
 I ^TOZE($I,"META") D ^TOCTREVR
 G INCR
FIN K UNDEFCI Q
AVERTI D POCLEPA^%VVIDEO,^%VSQUEAK W "* ",PARA," * non defini, nous aurons peut-etre des problemes" H 3 Q
ABEND S %ABEND=1,DX=10,DY=9 X XY
 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO,CAG^%VVIDEO
 W $$^%QZCHW("A R R E T") D NORM^%VVIDEO
 W !,!,?5 D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO W $$^%QZCHW("de l'etude "),NUFA,$$^%QZCHW(" sur "),YA D NORM^%VVIDEO H 5 S DE=7,FI=$Y
 D ^%ABNETTO
 Q
SIFON S SIF=0
 Q:@AFFECT'["$"
 S CONTAF=@AFFECT
 G:CONTAF'["$$" FIN
 S SIF=1,ROUTI="^"_$P($P(CONTAF,"/",1),"$$",2),EXPFONC=$S($E(CONTAF,1)="(":$E(CONTAF,2,$L(CONTAF)-1),1:CONTAF)
 S ROUTI=$S(ROUTI="^FACT":"FACT^TOCALCU",ROUTI="^FACTOR":"FACT^TOCALCU",ROUTI="^EXPONENT":"^EXP",ROUTI="^PUISSAN":"^PUIS",1:ROUTI)
 D @ROUTI
 S AFFECT="%RESUL",%RESUL="%RESULTAT"
 K CONTAF,EXPFONC,ROUTI
 Q
ORDEVA S $ZT="G FINO",^[QUI]ORDEVAL(NUFA,TWREF,$$^%QZCHW("ART"),@^CPTPAR(1))=%POR_"^^"_VPA
FINO Q
INCR S $ZT="G FINO",@^CPTPAR(1)=@^CPTPAR(1)+1 G LOPAR
TRI S $ZT="G FINO",^[QUI]ORDEVAL(NUFA,TWREF,$$^%QZCHW("ART"),@^CPTPAR(1))=%POR_"^"_NTRI_"^"_VPA G FINO
END S $ZT=TOZEA
 K TOZEA,TOZEC,UNDEFCI,NTRI,PARA,CONDIT,HEURE,PRX,SOURCE,PARAP,ATEST,CATEST,AFFECT,VPA,%MODA,CONTAF,%RESUL,%RESULTAT,%POR,EXPFONC,ROUTI Q
BLIMP S %ABEND=2,ET=^PILETUD($I,0),^PILETUD($I,ET)=NUFA_"^"_TWREF_"^1^IMPL^"_NTRI_"^"_QUI_"^^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))_"^"_YA_"^"_YB_"^0^0" G END
BR D AFF^%VTIME
YAERR S zzz=xxx Q
TRICH S TB="^[QUI]TVPAR(""TOT86080033"",0)",P=-1 F U=1:1 S P=$N(@TB@(P)) Q:P=-1  S ^[QUI]TVPAR(NUFA,TWREF,P)=@TB@(P),^V($I,YA,P)=@TB@(P)
 Q

