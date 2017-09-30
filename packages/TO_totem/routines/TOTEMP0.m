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

;TOTEMP0^INT^1^59547,74876^0
TOTEMP0 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S ^TORQS($J)=0
 D WHOIS^TOWWHOIS
 K ^V($I),^IDEMARC($I),^TPBLIMP($I),^PILETUD($I),^POSICOMP($I),^PHASADM($I),^GLOETUD($I),^NBRGLEV($I),^TENTATIV($I),^AIGNOR($I) S BATCH=0
 I $D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)) S INT=$$^%QZCHW(" E X E C U T I O N ") D ^TONOEXEC Q
BEG S:'($D(^TORQS($J))) ^TORQS($J)=0
 
 K ^PILETUD($I),^IGNOR($I),^BLOCI($I),^INDEF($I),^BISIMP($I),^BLOC($I),^CPTBLOC($I),^CPTEUR($I),^ORDEVAL($I) S ^CPTPAR(1)="^[QUI]CPTEUR(NUFA,TWREF,""ART"")",^CPTBLOC($I)=1,^CPTBLOC($I,"BLOC")=0
 K ^EXIGRAPH($I),^VBIS($I),^VALGIV($I),^NEXSUN($I),NUDEC,TREETUD,NEXSUN,NSIM,TPRES,YBCOUR,LIPRES,COPRES,^TPRES($I),^TPRESV($I) S $ZT="" I '($D(^TOZE($I,"EXEC"))) S ^TOZE($I,"EXEC")=0
 D CURRENT^%IS
 I $D(^KLNTOT($J)) D ^%LNKPOP G BEG0
 D ^TOTPOP
BEG0 K VAL,PAR,PARP,XART,QUANTI,TNOMEN,V
CADRE S %ABEND=0 D ^TOTCADRE,^TOWWHOIS S:'($D(^PILETUD($I))) ^PILETUD($I)=1 S NET=^PILETUD($I),^PILETUD($I,0)=NET,^PILETUD($I)=NET+1,^PILETUD($I,NET)=NUFA
 D ^TOP01EXG G:OUT ABEND1
XXX S ^NBRGLEV($I,NUFA,"COUR")=0,^NBRGLEV($I,NUFA,"OLD")=0,%ABEND=0,%TBEV=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABEV")
 S @%TBEV@("NUFA")=NUFA,@%TBEV@("%ABEND")=%ABEND,@%TBEV@("%LIA")="EXPL",@%TBEV@("%BTW")=0,@%TBEV@("%NUA")="?",@%TBEV@("%UPH")=0,@%TBEV@("%UMC")=0,@%TBEV@("YA")=YA,@%TBEV@("YB")=YB
NOM1 S OUT=0,@%TBEV@("%ABEND")=0,%ABEND=0 D ^TO3ARTHE,^TOP01NOM G:%ABEND=2 PIL G:%ABEND=1 ABEND1
NOM2 S %ABEND=0,@%TBEV@("%ABEND")=0 D ^TO3NOM2 G:%ABEND=2 PIL G:%ABEND=1 ABEND1 D ^TO3GETRL G:%ABEND=1 ABEND1 I %PSUP=1 K %PSUP D ^TO3NOM2
 S ET=^PILETUD($I,0) K ^PILETUD($I,ET) G ZZ
ABEND1 S ET=^PILETUD($I,0) K ^PILETUD($I,ET) G YYY
PIL 
 S %TBEV=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABEV") K @(%TBEV)
 S ETS=$ZP(^PILETUD($I,"")) G:(ETS="")!(ETS=0) ZZ S ETR=^PILETUD($I,ETS),%U=1,^PILETUD($I,0)=ETS F IT="NUFA","%BTW","%U012","%LIA","%NUA","QUI","IDA","QT","YA","YB","%UPH","%UMC" S VIT=$P(ETR,"^",%U),@IT=VIT,@%TBEV@(IT)=VIT,%U=%U+1
 S XART=YA K %BTW,%U012,%LIA,%NUA,%UPH,%UMC,VIT,ETS,ETR,%U,IT D ^TO3WNUFA,^TOWWHOIS G @@%TBEV@("%U012")
0 K DON S RS=$P(IDA,":",2),%CAR="/" D ^%QZCHNBC S %NBCAR=%NBCAR+1 F %U=1:1:%NBCAR S DON(%U)=$P(RS,"/",%U)
 S TWREF=0,^V($I,YA,$$^%QZCHW("QUANTITE"))=QT,^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))=QT,^[QUI]TREEWORK(NUFA,TWREF)=YA_"^"_YB_"^"_QT,A1="^TOP01NOM" S:@%TBEV@("%LIA")="" @%TBEV@("%LIA")="?" K IDA,QT G XXX
1 G NOM1
2 G NOM2
ZZ K ET,ETS D KILL1
YYY K ^ETUDIE(NUFA) I $D(^[QUI]TREEWORK(NUFA,0)) S NBETU=0,NUET=-1,(ID0,IDTOT)=$P(^[QUI]TREEWORK(NUFA,0),"^",4) D STANDAR
WW S TPIL=$ZP(^PILETUD($I,"")) G:(TPIL=0)!(TPIL="") EDIT K TPIL G PIL
FIN K ^ARBTHEO($I),^COMPNOM($I) Q
 
EDIT I '($D(^[QUI]TREEWORK(NUFA))) G END
 I $D(^TORQS($J)) S LISTE=^ETUARC($I,%NUBATCH),ARC=$P(LISTE,"^",2),BASE=$P(LISTE,"^",5),LISTE=$P(LISTE,"^",4)
 D:$$CNX^TORQXIN ^TONRIND($P(NUFA,".",1),BATCH,$$^%QCAZG("BASE"),$$^%QCAZG("ARC"),$$^%QCAZG("LISTE"))
 G:BATCH'=0 TBATCH K V,%M I $D(^EXIGRAPH($I)),^TOZE($I,"GRAPH")=1 D ^TOPTRESG
 S DX=0,DY=10 X XY W $$^%QZCHW("Voulez vous examiner l'etude ? ") R *REP:60 G:REP'=79 FIN D KILL,CLEPAG^%VVIDEO,RETOT^TOXXVERI G END
STANDAR S NIV=2,ADR="TRAIT^TOTEMP0",NOMTREE="^[QUI]TREEWORK(NUFA" D ^%QCAGTU1
 Q
TRAIT D ^TO3GREF,ZD^%QMDATE4,INT^%QMDAK0 S DATAC=@NOM,YB=$P(DATAC,"^",2),IDTOT=$P(DATAC,"^",4),YA=$P(DATAC,"^",1),^[QUI]ANTETUDE(YB,NUFA,TWREF)=IDTOT_"^"_TWREF_"^"_%DAT_"^"_HEURE,REFID=IDTOT,POSTREE=TWREF,ARTCT=YB,ARTET=YA D AFF^TO3RETUD
 D ^TOEVTPCT(YA,NUFA,TWREF) G END
 F TB="^[QUI]COUT(NUFA,TWREF)","^[QUI]DUREE(NUFA,TWREF)" D DUCT
 G END
DUCT S TBF="",TBR="???",TBK=-1 F %U=1:1 S TBK=$N(@TB@(TBK)) Q:TBK=-1  S TBR=TBR+@TB@(TBK)
 G:TB["DUREE" DUCTA G:(TBR'="???")&(TBR'=0) DUCTA S RS=$P(IDTOT,"/",2,500) D ^TO5SAVTR,^TO42EVCT,^TO5RESTR
DUCTA S @TB=TBR_"/"_TBF K %U,TBR,TBK
END Q
KILL I '(DTM) K (%1WW,%TBEV,%NUBATCH,%PROGEX,NUFA,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%1WW","%TBEV","%NUBATCH","%PROGEX","NUFA","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 I '(DTM) K (%1WW,%TBEV,%PROGEX,YA,YB,TEMPO,XART,%NUBATCH,TREETUD,BATCH,NUFA,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS) G KILL2
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%1WW","%TBEV","%PROGEX","YA","YB","TEMPO","XART","%NUBATCH","TREETUD","BATCH","NUFA","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL2 D CURRENT^%IS,VARSYS^%QCSAP
 Q
TBATCH 
 S NUFAPP=NUFA,NUFAP=$P(NUFA,".",1),FILLE=0
 S NUFA=NUFAP F N=1:1 S NUFA=$O(^[QUI]TREEWORK(NUFA)) Q:NUFA="z"  Q:NUFA=""  Q:NUFA'[NUFAP  D ^TOAFRBAT S:NUFA="" NUFA=^CSTEST($I,"ETUDE.COMPLET") D:$$CNX^TORQXIN ^TONRBAT S FILLE=1
 I FILLE=1 S NUFA=NUFAPP G END
 
 S NUFA=NUFAPP D ^TOAFRBAT
 
 
 D:$$CNX^TORQXIN ^TONRBAT
 G END

