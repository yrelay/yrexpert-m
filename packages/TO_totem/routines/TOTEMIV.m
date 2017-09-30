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

;TOTEMIV^INT^1^59547,74876^0
TOTEMIV ;
 
 K ^V($I),^TPBLIMP($I),^PILETUD($I),^POSICOMP($I),^PHASADM($I),^GLOETUD($I),^NBRGLEV($I),^TENTATIV($I),^AIGNOR($I) S BATCH=0 I $D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)) S INT=$$^%QZCHW(" E X E C U T I O N ") D ^TONOEXEC Q
 
BEG K ^IGNOR($I),^BLOCI($I),^INDEF($I),^BISIMP($I),^BLOC($I),^CPTBLOC($I),^CPTEUR($I),^ORDEVAL($I) S ^CPTPAR(1)="^[QUI]CPTEUR(NUFA,TWREF,""ART"")",^CPTBLOC($I)=1,^CPTBLOC($I,"BLOC")=0
 K ^EXIGRAPH($I),^VBIS($I),^VALGIV($I),^NEXSUN($I),NUDEC,TREETUD,NEXSUN,NSIM,TPRES,YBCOUR,LIPRES,COPRES,^TPRES($I),^TPRESV($I) S $ZT="" I '($D(^TOZE($I,"EXEC"))) S ^TOZE($I,"EXEC")=0
 D CURRENT^%IS,^TOTPOP K VAL,PAR,PARP,XART,QUANTI,TNOMEN,V
CADRE S %ABEND=0 D ^TOTCADRE S:'($D(^PILETUD($I))) ^PILETUD($I)=1 S NET=^PILETUD($I),^PILETUD($I,0)=NET,^PILETUD($I)=NET+1,^PILETUD($I,NET)=NUFA
 D ^TO3EXGET Q:OUT
XXX S ^NBRGLEV($I,NUFA,"COUR")=0,^NBRGLEV($I,NUFA,"OLD")=0,%ABEND=0,A1="^TO3NOM1",%LIA="EXPL",%BTW=0,%NUA="?",%UPH=0,%UMC=0
NOM1 S OUT=0,%ABEND=0 D ^TO3ARTHE,^TO3NOM1 G:%ABEND=2 PIL G:%ABEND=1 YYY
NOM2 S %ABEND=0 D ^TO3NOM2 G:%ABEND=2 PIL G:%ABEND=1 YYY D ^TO3GETRL G:%ABEND=1 YYY I %PSUP=1 K %PSUP D ^TO3NOM2
 S ET=^PILETUD($I,0) K ^PILETUD($I,ET) G ZZ
PIL S ETS=$ZP(^PILETUD($I,"")) G:(ETS="")!(ETS=0) ZZ S ETR=^PILETUD($I,ETS),%U=1,^PILETUD($I,0)=ETS F IT="NUFA","%BTW","%U012","%LIA","%NUA","QUI","IDA","QT","YA","YB","%UPH","%UMC" S @IT=$P(ETR,"^",%U),%U=%U+1
 G @%U012
0 K DON S RS=$P(IDA,":",2),%CAR="/" D ^%QZCHNBC S %NBCAR=%NBCAR+1 F %U=1:1:%NBCAR S DON(%U)=$P(RS,"/",%U)
 S TWREF=0,^V($I,YA,$$^%QZCHW("QUANTITE"))=QT,^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))=QT,^[QUI]TREEWORK(NUFA,TWREF)=YA_"^"_YB_"^"_QT,A1="^TO3NOM1" S:%LIA="" %LIA="?" K IDA,QT G XXX
1 G NOM1
2 G NOM2
ZZ D KILL1
YYY G:('($D(^[QUI]TREEWORK(NUFA,0))))&(BATCH'=0) TBATCH G:'($D(^[QUI]TREEWORK(NUFA,0))) END S NBETU=0,NUET=-1,(ID0,IDTOT)=$P(^[QUI]TREEWORK(NUFA,0),"^",4) D STANDAR
WW S TPIL=$ZP(^PILETUD($I,"")) G:(TPIL=0)!(TPIL="") EDIT G PIL
FIN K ^ARBTHEO($I),^COMPNOM($I) Q
EDIT K ^ETUDIE(NUFA) G:BATCH'=0 TBATCH K V,%M I $D(^EXIGRAPH($I)),^TOZE($I,"GRAPH")=1 D ^TOPTRESG
 S DX=0,DY=10 X XY W $$^%QZCHW("Voulez vous examiner l'etude ? ") R *REP:60 G:REP'=79 FIN D KILL,CLEPAG^%VVIDEO,RETOT^TOXXVERI G END
STANDAR S NIV=2,ADR="TRAIT^TOTEMIII",NOMTREE="^[QUI]TREEWORK(NUFA" D ^%QCAGTU1
 Q
TRAIT D ^TO3GREF,ZD^%QMDATE4,INT^%QMDAK0 S DATAC=@NOM,YB=$P(DATAC,"^",2),IDTOT=$P(DATAC,"^",4),YA=$P(DATAC,"^",1),^[QUI]ANTETUDE(YB,NUFA,TWREF)=IDTOT_"^"_TWREF_"^"_%DAT_"^"_HEURE,REFID=IDTOT,POSTREE=TWREF,ARTCT=YB,ARTET=YA D AFF^TO3RETUD
END Q
KILL I '(DTM) K (%1WW,%NUBATCH,NUFA,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS,%PROGEX) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%1WW","%NUBATCH","NUFA","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","%PROGEX","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 I '(DTM) K (%1WW,YA,YB,TEMPO,XART,%NUBATCH,TREETUD,BATCH,NUFA,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS,%PROGEX) G KILL2
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%1WW","YA","YB","TEMPO","XART","%NUBATCH","TREETUD","BATCH","NUFA","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","%PROGEX","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL2 D CURRENT^%IS,VARSYS^%QCSAP
 Q
TBATCH D ^TOAFRBAT G WW

