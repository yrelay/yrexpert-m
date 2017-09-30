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

;%QSAJCMS^INT^1^59547,73880^0
%QSAJCMS(MODEL) 
 
 
 
 
 
 
 
 N A,%A,ADRES,CH,CONTR,DX,DY,FDM,FDMI,FININD,I,J,INDIV,LIB,LIBT,LOPT
 N LREP,MODE,NMODE,OLD,PER,PIL,RAATT,RATT,REP,REPI,RIIND,RIND,SAUV,SEL
 N HFHA,HFMI,HFBA,LECR,LFGA,LFDR,ORD,LATT,LONGM,STOP,YBA,DIA,DIAL,NJEU
 K ^M($J)
 S HFHA=3,HFMI=7,HFBA=(($S(SUB="C-IBM PC":23,1:24)-HFHA)-HFMI)-1,YBA=HFHA+HFMI,LFGA=80,LECR=80,LFDR=LECR
 S DIAL="",A=""
 F %A=0:0 S A=$O(^[QUI]RQSAUTOR(WHOIS,A)) Q:(A="")!(A="z")  I (A'="ATTRIBUT")&(A'="LIEN") S J=$$NOMINT^%QSF(A) I J'="",'($D(^[QUI]RQSFILS(J))) S LREP(A)=""
 D INIT2^%QUCHOIP("LREP",1,"",0,HFHA,LFGA,HFMI,LECR)
INIT S FDM=0,FDMI=0,PIL=0,INDIV="",RIND="",A=""
 D CLEPAG^%VVIDEO,AFF^%QSAJCM4
SEL S REP=$$UN^%QUCHOIP I REP="" D CLEPAG^%VVIDEO K ^M($J) Q
 S REPI=$$NOMINT^%QSF(REP),FININD=0,PIL=PIL+1 D CLFGA^%QSAJCM4,AFREP^%QSAJCM4(REP)
SELI I FDM D CLFDR^%QSAJCM4
 D POCLEPA^%VVIDEO
 W $$^%QZCHW("Individu : ") S FDMI=1,DX=$X,DY=$Y D ^%VLEC
TESTS I CTRLA!(Y1="") S FININD=1 G MOIN
 I "*?"[$E(Y1,$L(Y1)) S Y1=$$CHOIX^%QSAJCM4 D:FDMI CLIND^%QSAJCM4 D:FDM CLFDR^%QSAJCM4 G:Y1="" SELI G TESTS
 S INDIV=Y1,RIND=$S(PIL>1:$P(PIL(PIL-1),"^",5)_",",1:"")_$$M^%QAX(INDIV)
 I $$IR^%QSGEST5(REPI,RIND) S MODE="C" G SSEL
 G:$$COD^%QAX="" CR
 
 
CR G:'($$^%QSAJCM3) SELI
SSEL D AFIND^%QSAJCM4(INDIV),CLIND^%QSAJCM4
 G:(PIL'>1)!(MODE'="A") SELO
 S OLD=PIL(PIL-1)
 D POCLEPA^%VVIDEO S ORD=$$^%VZAME1($$^%QZCHW("Numero d'ordre ? "))
 D POCLEPA^%VVIDEO
 S:ORD="" ORD=INDIV
 D ADDO^%QSGEST3($P(OLD,"^",2),$P(OLD,"^",5),ORD,RATT,REPI,INDIV)
 G SELO
MOIN D SIGNAL^%QSAJCM4
MOINS I FDM D CLFDR^%QSAJCM4 S FDM=0
 I FDMI D CLIND^%QSAJCM4 S FDMI=0
 D POCLEPA^%VVIDEO S PIL=PIL-1 D CLHIE^%QSAJCM4(PIL+1) G:PIL>0 MSM
 I FININD D AFF^%QUCHOIP G SEL
 S PIL=PIL+1 D CLFGA^%QSAJCM4,AFREP^%QSAJCM4(REP) G SELI
MSM S FININD=0,OLD=PIL(PIL),INDIV=$P(OLD,"^",1),REPI=$P(OLD,"^",2),REP=$P(OLD,"^",3),MODE=$P(OLD,"^",4),RIND=$P(OLD,"^",5)
SELO K LOPT,^M($J),^ML($J)
 S ^M($J,1)=$$^%QZCHW("Attributs")_"^ATTRI",^M($J,2)=$$^%QZCHW("Supprimer")_"^SUPPR",^M($J,3)=$$^%QZCHW("Dialogue")_"^DIA",^M($J,4)=$$^%QZCHW("Repertoires")_"^RETREP"
SELOS S I=4,A="",LONGM=43,STOP=0
 F %A=0:0 Q:STOP=1  S A=$O(^[QUI]RQSLIEN(REPI,A)) Q:A=""  D REMP
 G:PIL=1 SS1
 D AJOUTL^%QSAJCM2
SS1 S PIL(PIL)=$$M^%QAX(INDIV)_"^"_REPI_"^"_REP_"^"_MODE_"^"_RIND
LOC S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,79,22,"^M($J)",.ADRES,.CONTR)
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 G:ADRES="" MOIN
ATTR G:ADRES'="ATTRI" RETREP
 
 D ^%QSINDIV(MODEL,REPI,RIND,0,YBA,HFBA,LECR,LECR)
 S DX=0,DY=YBA D CLEBAS^%VVIDEO
 S FDM=1,NMODE=$S($$IR^%QSGEST5(REPI,RIND):"C",1:"A")
 I NMODE'=MODE S MODE=NMODE G SELO
 G LOC
RETREP 
 G:ADRES'="RETREP" LS1
 G INIT
LS1 G:ADRES'="SUPPR" LS11
 
 S PER=$S((PIL-1)=0:REPI,1:$P(PIL(PIL-1),"^",2)),LATT=$S((PIL-1)=0:"",1:RATT) G:$$^%QSUPRIM(REPI,LATT,PER,RIND) MOIN G LOC
LS11 G:ADRES'="DIA" LS2
 
DEM S DX=0,DY=22 D CLEBAS^%VVIDEO
 I ($O(^[QUI]TLDIAL(""))="")!($O(^[QUI]TLDIAL(""))="z") D ^%VZEAVT($$^%QZCHW("Aucun dialogue")) G LOC
 S NJEU="",DIA=$$^%VZAME1("Nom du dialogue : "_$S(DIAL="":"",1:"["_DIAL_"] ")) G:CTRLA=1 LOC S:DIA="" DIA=DIAL G:DIA="" LOC
 D:DIA="?" AFDIA I DIA="" D AFF2^%QSAJCM4 G LOC
 I '($D(^[QUI]TLDIAL(DIA))) D ^%VZEAVT("Dialogue inexistant") G DEM
 S DIAL=DIA
 D EXT^%TLTRDIA(DIA,REPI,RIND,NJEU),AFF2^%QSAJCM4 G LOC
AFDIA 
 D CLFDR^%QSAJCM4
 D CHOIXD^%TLTRDIA(.DIA),CLEPAG^%VVIDEO Q
LS2 G:ADRES'="SUIT" LS3
 
 K LOPT,^M($J) S LONGM=0,I=0,A=SAUV
 S STOP=0 F %A=0:0 Q:STOP  S A=$O(^[QUI]RQSLIEN(REPI,A)) Q:A=""  D REMP
 G LOC
 
LS3 S CH=LOPT(ADRES),RAATT=$P(CH,"^",3)
 G:$P(RAATT,".")'="LIEN" LS3S
 
 S RIIND=$$NOML^%QSGES20($P(CH,"^",5),INDIV,$P(RAATT,".",2,999),RIND)
 D ^%QSINDIV(MODEL,$P(CH,"^",1),RIIND,0,YBA,HFBA,LECR,LECR)
 S FDM=1
 G MSM
LS3S S PIL=PIL+1,INDIV="",RATT=RAATT,REPI=$P(CH,"^",1)
 S PIL(PIL-1)=PIL(PIL-1)_"^"_REPI_"^"_RATT
 S REP=$$NOMLOG^%QSF(REPI) G:(($P(CH,"^",2)=3)!($P(CH,"^",2)=4))!($P(CH,"^",2)=5) LS4
 
 D AFREP^%QSAJCM4(REP) G SELI
LS4 
 I '($$^%QSAJCM2) S PIL=PIL-1,REPI=$P(PIL(PIL),"^",2) D CLFGA^%QSAJCM4,AFREP^%QSAJCM4($$NOMLOG^%QSF(REPI)) G SELI
 G MOINS
CONT G:"AF"[CONTR MOIN D ^%VSQUEAK G LOC
 
REMP 
 Q:($P(A,".")="LIEN")!($P(A,".")="INVERSE")
 S CH=^[QUI]RQSLIEN(REPI,A),J=$P(CH,"^",1)
 Q:J=1
 S LIB=$P(CH,"^",2),LIBT=$$^%QZCHW($$NOMLOG^%QSF(LIB))
 I (LONGM+$L(A))>73 S I=I+1,^M($J,I)=$$^%QZCHW("Suite")_"^SUIT",SAUV=$ZP(^[QUI]RQSLIEN(REPI,A)),STOP=1 Q
 S I=I+1,^M($J,I)=A_"^"_I,LOPT(I)=LIB_"^"_J_"^"_A
 S LONGM=(LONGM+$L(A))+2 Q
AUTO N MM S MM=$$MODEL^%QSMODEL
 I MM="" D M^%QSAJCM4($$ERMODEL^%QSMODEL) Q
 D ^%QSAJCMS(MM) Q

