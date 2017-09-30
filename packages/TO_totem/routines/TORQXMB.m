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

;TORQXMB^INT^1^59547,74875^0
TORQXMB(LISTE,DIA) 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,LLISTE,REP,LCRIT,REQUETE,LETUDE,LTRANSF,CTR,TEMP,LILA,LILAT,NL,STO,CARD,RI,RVISU,MODE
 S MODE=2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LILA=$$CONCAS^%QZCHAD(TEMP,"LILA")
 
 S LLISTE=$$CONCAS^%QZCHAD(TEMP,"LLISTE")
 
 S PRIS=$$CONCAS^%QZCHAD(TEMP,"PRIS")
 S RI=$$RI^TORQXIN
 
 D R1("DATE.ETUDE.TOTEM",LLISTE)
 
 D R2(LLISTE)
 
 D R3(LLISTE)
 
 S LTRANSF=$$CHOIX^%QS0SEL1(LLISTE,$$^%QZCHW("Quelle liste de transfert ?"))
 I LTRANSF="" D FIN Q 1
 
 
 S:$$^%QSCALVA("L0",LTRANSF,"BASE")'="ETUDE.TOTEM" LETUDE=$$RAVO^%QSGE6($$RI^TORQXIN,"LISTE",LTRANSF,1)
 
 
 S:$$^%QSCALVA("L0",LTRANSF,"BASE")="ETUDE.TOTEM" LETUDE=$$ADRLIS^%QSGEST7(LTRANSF)
 G:DIA=0 SSDIAL G SUIT
 
TTES(LETUDE,LILA,MODE,RI,LISTE,DIA) 
 
SUIT S NL=$$NOM^%QSGES11("TMP")
 S STO=$$STO^%QSGES11(NL)
 D COPY^%QSGES11(NL,RI,.CARD,LETUDE)
 D CREER^%QSGES11(RI,NL,"TMP",CARD,"SEL.ETUDE","","")
 
 
 S LILAT="ATTRIBUTS.ETUDE.TOTEM"
 K ^[QUI]ZLILA(LILAT)
 S @LILA@(1)="REPERTOIRE.RECEPTEUR"
 S @LILA@(2)="INDIVIDU.RECEPTEUR"
 S @LILA@(3)="GAMME"
 S @LILA@(4)="NOMENCLATURE"
 S @LILA@(5)="STATUS"
 D ADD^%QMLILA(LILAT,LILA)
 S ^[QUI]ZLILA(LILAT,1,"TITRE")="Rep.Rec"
 S ^[QUI]ZLILA(LILAT,2,"TITRE")="Ind.Rec"
 S ^[QUI]ZLILA(LILAT,3,"TITRE")="Gamme",^[QUI]ZLILA(LILAT,3,"LONGUEUR")=5
 S ^[QUI]ZLILA(LILAT,4,"TITRE")="Nomenc",^[QUI]ZLILA(LILAT,4,"LONGUEUR")=5
 S ^[QUI]ZLILA(LILAT,5,"TITRE")="Status",^[QUI]ZLILA(LILAT,5,"LONGUEUR")=5
 
 
 
 
 S RVISU="VISU^TORQXVI"
A D CHOY^%QS0LEC3(NL,LILAT,0,MODE,LISTE,.CTR,0,RVISU,"AFF^TORQXMB","POCLEPA^%VVIDEO")
 I $O(@LISTE@(""))="" D DEL^%QSGES11(NL) Q 1
 S DIA=1 D ^TORQY6(LISTE,DIA,.TEST) S:$O(@LISTE@(""))="" TEST=0
 G:'(TEST) A
 D DEL^%QSGES11(NL)
 Q:'($D(LLISTE)) 1 I $$^%QCAZG("CTR")'="" D FIN Q 1
 D FIN Q 0
 
AFF D CLEPAG^%VVIDEO,AFF2^%QS0LEC3,AFFICH^%QUAPAGM Q
 
FIN K @(TEMP) Q
 
 
R1(ATT,LLISTE) 
 N ADR,CAR
 D ^%QSEXIST("L0",$$LISTIND^%QSGEST6("L0"),ATT,0,LLISTE,.CAR)
 Q
 
R2(LLISTE) 
 N ADR,LL,LIS
 S LIS=""
 
 
 F LL=1:1 S LIS=$$NXTRAVOI^%QSTRUC8("L0","SOURCE","TRANSFERT TOTEM --> DKBMS",1,LIS) Q:LIS=""  S @LLISTE@(LIS)=""
 Q
 
R3(LLISTE) 
 N ADR,LL,LIS
 S LIS=""
 
 
 F LL=1:1 S LIS=$$NXTRAVOI^%QSTRUC8("L0","OBJET","ETUDE.TOTEM",1,LIS) Q:LIS=""  S @LLISTE@(LIS)=""
 Q
 
SSDIAL 
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Controles des etudes a transferer"))
 N J S ETUDE="",PREM=0,CARD=0
 F J=1:1 S ETUDE=$O(@LETUDE@(ETUDE)) Q:ETUDE=""  D POCLEPA^%VVIDEO,MSG^%VZEATT($$^%QZCHW("Etude : ")_ETUDE) S TEST=1 D TESTS^TORQY6(ETUDE,DIA,.TEST) S:(TEST=0)&(PREM=0) PREM=1 D:TEST=0 SAVE(ETUDE,.PREM) S:TEST=1 @LISTE@(ETUDE)=""
 Q 1
 
SAVE(ETUDE,PREM) 
 
 
 S DX=40,DY=23 X XY W $$^%QZCHW("PROBLEME")
 I PREM=1 S NOML=$$NOM^%QSGES11("TRF"),ADR=$$STO^%QSGES11(NOML),SOURCE="TRANSFERT TOTEM --> DKBMS",AUTRE="TRANSFERT IMPOSSIBLE" D CREER^%QSGES11("ETUDE.TOTEM",NOML,"TRF",CARD,SOURCE,ADR,AUTRE) S PREM=2
 S DX=50,DY=23 X XY D BLD^%VVIDEO W NOML D NORM^%VVIDEO
 D STOCK^%QSGES11(NOML,ETUDE) Q
 
TEST S LISTE="^TUTU"
 S AB=$$^TORQXMB(LISTE)
 Q
TESTI D CRE^TORQXIN("TOT88030041","P1","7543L01,BDE","BDE:66/88/","RAS","RQS88030224")
 Q

