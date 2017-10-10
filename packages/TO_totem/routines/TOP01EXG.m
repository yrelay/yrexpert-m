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

;TOP01EXG^INT^1^59547,74873^0
TOP0EXGE ;
 
 
 
 
 
 
 
 
 
 I BATCH=1 D ^TOP01EBA Q:OUT=1  S %P0=%NUBATCH G DEB21
DEB S %P0=0,DE=22,FI=23 D ^%ABNETTO S OUT=0 G ACQ:$D(XART) K DON S DX=0,DY=22 X XY W "Article [Art ou Art:p1/p2/...] ",!," - " S DX=$X,DY=$Y D ^%VLEC S ZART=Y1 S:ZART="" OUT=1 Q:OUT
 G:'($D(^[QUI]PSRLFILI(ZART))) DEB3 S DX=0,DY=20 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO W "Un instant..." S ARC=ZART D ^TOP01ETU I %NE=0 D ^%VSQUEAK,POCLEPA^%VVIDEO W "Il n'y a pas d'etude TOTEM evaluable pour cet ARC ! [RETURN] " R *RET G DEB
 D ^TOP01LET G:%OK=0 DEB S ZART=^ETUARC($I,%OK),%P0=%OK
DEB3 I $D(^[QUI]FULL($P(ZART,":",1))) S (YA,XART,YB)=$P(ZART,":",1) G DEB2
DEB4 S YYBB=$P(ZART,":",1) I '($D(^[QUI]ACOMMEB(YYBB))) G DEB
 S (XART,YA)=$P(^[QUI]ACOMMEB(YYBB),"^",1),(PERE,YB)=YYBB G DEB2
DEB2 I ZART["?" D ^TOLISTEX K XART G DEB
 D VERICP Q:OUT
 S DE=22,FI=23 D ^%ABNETTO
RQTE D POCLEPA^%VVIDEO W "   Quantite : " S DX=$X D ^%VLEC S QTTE=Y1 I (QTTE="")!(QTTE=0) S OUT=1 G FIN
 S PCH=QTTE D TO^%QZNBN1 I '(ISNUM) D ^%VSQUEAK G RQTE
DEB21 S TWREF=0,^V($I,YA,$$^%QZCHW("QUANTITE"))=QTTE,^[QUI]UNITE(YA,$$^%QZCHW("QUANTITE"))="",^[QUI]TREEWORK(NUFA,0)=YA_"^"_YB_"^"_QTTE,^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))=QTTE S:%P0'=0 $P(^[QUI]TREEWORK(NUFA,0),"^",10)=$P(^ETUARC($I,%P0),"^",2)
 I $P(ZART,":",2)'="" D GETVPA G FIN
FIN Q
ACQ D ^TOINDGET,NOM^TOTBSBIS D:TWREF=0 COMP D COMP2 K ^V($I,YA) I $D(^IGNOR($I,YA)) D ^TOPIGNOR
 S @^CPTPAR(1)=1,^V($I,YA,$$^%QZCHW("QUANTITE"))=^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),%POR=$$^%QZCHW("QUANTITE") D ^TORDEVAR,INCR^TORDEVAR S ^V($I,YA,"PERE")=PERE,^[QUI]TVPAR(NUFA,TWREF,"PERE")=PERE,%POR="PERE" D ^TORDEVAR,INCR^TORDEVAR
 S:'($D(%P0)) %P0=0 D:$D(^[QUI]IMPBIS(YA)) ^TOPREPBI K ^ABANDON($I) S %LIEU="Explicites" D ^TO3WLIEU D:TWREF'=0 ^TOPARIMP I (%P0'=0)&(TWREF=0) D ^TOP01IMP G P0S
 I BATCH=0,TWREF=0,'($D(DON)) D POCLEPA^%VVIDEO W "Voulez-vous avoir acces a l'ensemble des parametres (O/N) ? " R *REP S REP=$C(REP) I REP="O" D ^TOPARGET Q:%ABEND=1
P0S S NPAR=1,ORD=-1,PARS="PARP(YA)",IDSTO=YB,^[QUI]TVPAR(NUFA,TWREF,"ARTICLE")=YA,^V($I,YA,"ARTICLE")=YA,%POR="ARTICLE" D ^TORDEVAR,INCR^TORDEVAR S ^V($I,YA,"%MACHINE")=" ",^[QUI]TVPAR(NUFA,TWREF,"%MACHINE")=" "
LOPAR S ORD=$N(^[QUI]EXPLICI(YA,ORD)) D:ORD=-1 TOSTOC G:ORD=-1 END S PARA=$N(^[QUI]EXPLICI(YA,ORD,-1)) G:$D(^V($I,YA,PARA)) NLOPAR S CHP=^[QUI]EXPLICI(YA,ORD,PARA),VPD=$P(CHP,"^",18),HE="HERITE",HERIT=0
GET Q:OUT=1  S TEMPO=$S(BATCH=0:15,1:0) D ^TO3HERIT
 G:HERIT=1 LOPAR S:(BATCH'=0)&('($D(DON(ORD)))) DON(ORD)=VPD G:$D(DON(ORD)) RET S DE=22,FI=23 D ^%ABNETTO S DX=0,DY=22 X XY W "Pour ",YB," quelle est la valeur de ",!,PARA," : " R VPA:TEMPO I VPA["?" D ^TOMEMOIR S DE=22,FI=23 D ^%ABNETTO G GET
 S:VPA="" VPA=VPD D ^TOTVLEG G INVALID:VOK=0 D POCLEPA^%VVIDEO W "Valeur acceptee --> ",VPA S ^V($I,YA,PARA)=VPA,IDSTO=IDSTO_"/"_VPA,^[QUI]TVPAR(NUFA,TWREF,PARA)=VPA,%POR=PARA D ^TORDEVAR S %MODA="ART"
 D:$D(^[QUI]EXPGIMP(PARA,VPA))!$D(^[QUI]IGNORER(YA,PARA,VPA)) ^TO3PASYS D INCR^TORDEVAR G LOPAR
RET S VPA=DON(ORD) K DON(ORD) S:VPA="" VPA=$P(CHP,"^",18) D ^TOTVLEG G:(BATCH'=0)&(VOK=0) REFUS G GET:VOK=0 S ^V($I,YA,PARA)=VPA,^[QUI]TVPAR(NUFA,TWREF,PARA)=VPA,IDSTO=IDSTO_"/"_VPA,%MODA="ART",%POR=PARA D ^TORDEVAR
 D:$D(^[QUI]EXPGIMP(PARA,VPA))!$D(^[QUI]IGNORER(YA,PARA,VPA)) ^TO3PASYS D INCR^TORDEVAR G LOPAR
GETVPA S VALS=$P(ZART,":",2) Q:VALS=""  S POO=1 F BOU=0:1 S POO=$F(VALS,"/",POO) Q:POO=0
 F NOR=1:1:BOU+1 S DO=$P(VALS,"/",NOR),DON(NOR)=DO
 I DON(BOU+1)="" K DON(BOU+1)
 Q
 R RC S DE=5,FI=$Y D ^%ABNETTO Q
INVALID G:BATCH'=0 REFUS D ^%VSQUEAK S DX=10,DY=10 X XY W VPA," est une valeur inacceptable pour ",PARA R RC S FI=10,DE=10 D ^%ABNETTO S:BATCH'=0 OUT=1 G GET
TOSTOC S TT="^[QUI]TREEWORK(NUFA,"_TWREF_")",$P(@TT,"^",4)=IDSTO
 S FCONT=1 Q:NUFA=("Sous-etude "_$I)  D ^TO3DEJFA,^TO3STOC S OUT=FCONT=0 Q
END S DE=22,FI=23 D ^%ABNETTO K BOU,CHP,DO,FCONT,GRAPH,HE,HERIT,IDSTO,NOR,NPAR,ORD,PARS,POO,QTTE,RC,RET,TT,VALS,VOK,YYBB,ZART Q
VERICP Q:^TOZE($I,"EXEC")=1
 I ('($D(^[QUI]UNKN(YA))))&(('($D(^[QUI]AMBI(YA))))&('($D(^[QUI]AMBICYCL(YA))))) Q
 D ^%VSQUEAK,CLEPAG^%VVIDEO S DXG=1,DXD=38,DYH=5,DYB=15,GRAPH=1,MSG="EXECUTION REFUSEE" D TO4^%VZCD S MSG=YA,DY=7,DX=20-($L(MSG)\2) X XY W YA S MSG="Comprehension imparfaite",DY=13,DX=20-($L(MSG)\2) X XY W MSG D POCLEPA^%VVIDEO W " [RETURN] " R *RET:30 S OUT=1 Q
REFUS S %ABEND=1,^CSTEST($I,"UNDEF",PARA_"("""_VPA_""")")=1,^CSTEST($I,"ERREUR")="Valeur du parametre explicite "_PARA_" illegale (article "_YA_")" G FIN
COMP S CP=-1,TB1="^COMPNOM($I,YA)",TB2="^PHASADM($I,NUFA,""COMP"")",TB3="^[QUI]NOMENC(CP)"
 F %U=0:0 S CP=$N(@TB1@(CP)) Q:CP=-1  S @TB2@(CP)=1,^PHASADM($I,NUFA,"COMPOS",CP)=1,FIS=-1 F %U=0:0 S FIS=$N(@TB3@(FIS)) Q:FIS=-1  S ^PHASADM($I,NUFA,"DEFCOMP",FIS,CP)=1
 K TB1,TB2,TB3,CP,FIS Q
COMP2 S ^PHASADM($I,NUFA,"COMP","ART",YB,TWREF)=1,CP=-1,TB1="^[QUI]NOMENC(YA)",TB2="^PHASADM($I,NUFA,TWREF,""COMP"")" F %U=1:1 S CP=$N(@TB1@(CP)) Q:CP=-1  S @TB2@(CP)=1
 D ^TO3RPERE S ^PHASADM($I,NUFA,"COMP","OK",YB)=TWREF,^PHASADM($I,NUFA,TWRP,"COMP","OK",YB)=TWREF K ^PHASADM($I,NUFA,"COMP",YB),^PHASADM($I,NUFA,TWRP,"COMP",YB),TB1,TB2 Q
NLOPAR S IDSTO=IDSTO_"/"_^V($I,YA,PARA) G LOPAR
