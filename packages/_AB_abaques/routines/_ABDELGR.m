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
;! HL002 ! HL     ! 26/08/12 ! Pour acceder a ^["YXP"] -> creer $ZDIRECTORY   !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ABDELGR^INT^1^59547,73864^0
%ABDELGR ;
 
 G:'($D(^TACOMPIL($I))) FIN S %UCI=^TABIDENT($I,"%UCI"),QU=QUI,CONF=0,QUCOM=%UCI D CLEPAG^%VVIDEO,REV^%VVIDEO,BLD^%VVIDEO S MSG=$$^%QZCHW(" SUPPRESSIONS de DEFINITIONS & CONTENUS d'ABAQUES "),DY=2,DX=40-($L(MSG)\2) X XY W MSG D NORM^%VVIDEO S DX=5,DY=DY+2 X XY
 S SP=$$^%QZCHW(" ") F UU=1:1:40 S SP=SP_"_"
 S PG=-1 F UU=0:0 S PG=$N(^TACOMPIL($I,PG)) Q:PG=-1  S LG=-1 F VV=0:0 S LG=$N(^TACOMPIL($I,PG,LG)) Q:LG=-1  D QUES
 G FIN
QUES S RF=^TACOMPIL($I,PG,LG),Y1=$P(RF,"^",1),TYP=$P(RF,"^",2),SPP=$E(SP,1,40-$L(Y1))_$$^%QZCHW(" ")
 W !,Y1,SPP,$$^%QZCHW("(O/N) ? ")
REP R *REP
 S REP=$C(REP) G:REP=$$^%QZCHW("O") SUIT G:REP=$$^%QZCHW("N") FIN S DX=$X-1,DY=$Y X XY W $$^%QZCHW(" ") X XY G REP
SUIT W " OK ! " G:TYP[$$^%QZCHW("P") DEL
 G DELCOM
DEL K ^[QUI]SCRC(Y1),^[QUI]STRUCT(Y1),^[QUI]OCGRIL(Y1),^[QUI]PRONUM(Y1),^[QUI]STRUCT(Y1_"/COMMENT") S Y2=Y1_"/COMMENT" K ^[QUI]STRUCT(Y2),^[QUI]OCGRIL(Y2) W ?40,$$^%QZCHW("Destruction effectuee !")
 S KI=QUI,SCR=Y1,NORM=-1
TABCP F UU=0:0 S NORM=$N(^[KI]REFABAC(SCR,NORM)) Q:NORM=-1  S IDENT=-1 F VV=0:0 S IDENT=$N(^[KI]REFABAC(SCR,NORM,IDENT)) Q:IDENT=-1  D MAJTAB
 G FIN
DELCOM S CONF=0,ID=-1 K ^[QUCOM]SCRC(Y1),^[QUCOM]STRUCT(Y1) F UU=0:0 S ID=$N(^TABIDENT(ID)),%PCH=ID D ^%QZNBN1 G SS:'(ISNUM) I $D(^TABIDENT(ID,$$^%QZCHW("MACHINE"))) S QP=^TABIDENT(ID,$$^%QZCHW("MACHINE")) K ^[QP]OCGRIL(Y1),^[QP]PRONUM(Y1) S KI=QP,SCR=Y1 D TABCP
SS W $$^%QZCHW("Destruction effectuee !") G FIN
MAJTAB S NUGR=^[KI]REFABAC(SCR,NORM,IDENT),GROUP=$P(^[KI]GROUGRIL(NUGR),"|",1)
 K ^[KI]REFABAC(SCR,NORM,IDENT),^[KI]GROUGRIL(NUGR),^[KI]DEFGROUP(GROUP,"R",NUGR),^[KI]INTERGRI(NUGR),^[KI]GRUPLET(NUGR),^[KI]EVALGRIL(NUGR),^[KI]PARAGRIL(NUGR),^[KI]RESUGRIL(NUGR),^[KI]ABDEJEV(NUGR),^[KI]GRTYPN(NUGR)
 K ^[KI]SSGRGRI(GROUP,1,NUGR),^[KI]GRTYPN(NUGR),^[KI]GRILRESU(NUGR),^[KI]TIMCPGR(SCR,NORM,IDENT),^[KI]SSGROUP(GROUP,SCR,NORM)
 K ^[KI]DEFGROUP(GROUP,"R",NUGR) K:'($D(^[KI]DEFGROUP(GROUP,"R"))) ^[KI]DEFGROUP(GROUP)
FIN Q
LISTE S:'($D(QU)) QU=QUI S %QU=QU,QUCOM=%UCI,Y1=-1,I=1 D CLEPAG^%VVIDEO,CUROF^%VVIDEO
 
 S DXG=0,DXD=39,DYH=0,DYB=4,TIT=$$^%QZCHW("Liste d'abaques connues a ce jour")
 
 D ^%AB3CADR
 ;HL002 S HA=0,DX=10,DY=6,NBA=13,NBE=1 X XY F QU=QUI,QUCOM F I=1:1 S Y1=$N(^[QU]SCRC(Y1)) Q:Y1=-1  I (Y1'="z")&(Y1'="GAMLAC") S DY=DY+1 X XY W Y1 W:QU=QUCOM "(C)" S NBE=NBE+1 I NBE'<NBA D TEMP G:HA=1 FF
 S HA=0,DX=10,DY=6,NBA=13,NBE=1 X XY F QU=QUI,QUCOM F I=1:1 S ZDOK=$$ZDIRECTORY^%GTM(QU) S:$D(ZDOK) Y1=$N(^[QU]SCRC(Y1)) S ZDOK=$$ZDIRECTORY^%GTM(QUI) Q:Y1=-1  I (Y1'="z")&(Y1'="GAMLAC") S DY=DY+1 X XY W Y1 W:QU=QUCOM "(C)" S NBE=NBE+1 I NBE'<NBA D TEMP G:HA=1 FF
 D POCLEPA^%VVIDEO W "[RETURN] " R *X S QU=%QU G FF
TEMP D POCLEPA^%VVIDEO W $$L10^%QSLIB1 R *REP
 D TOUCHE^%INCCLAV(REP,.REP)
 I REP=1 S HA=1,QU=%QU G FF
 S DE=6,FI=20 D ^%ABNETTO S NBE=1,DX=10,DY=6 X XY G FF
FF Q

