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

;%QWINMO1^INT^1^59547,73886^0
QWINMO1 ;
 
 
 
 
 
 N A,%A,ADRES,CH,CONTR,DX,DY,FDM,FDMI,FININD,I,J,INDIV,LIB,LIBT,LOPT
 N LREP,MODE,NMODE,OLD,PER,PIL,RAATT,RATT,REP,REPI,RIIND,RIND,SAUV,SEL
 N HFHA,HFMI,HFBA,LECR,LFGA,LFDR,ORD,LATT,LONGM,STOP,YBA,MODEL,IOPT,RESQ
 S MODEL=$$MODEL^%QSMODEL
 S HFHA=3,HFMI=7,HFBA=(($S(SUB="C-IBM PC":23,1:24)-HFHA)-HFMI)-1,YBA=HFHA+HFMI,LFGA=80,LECR=80,LFDR=LECR
 K ^M($J)
 
 
 S A=""
 F %A=0:0 S A=$O(^[QUI]RQSAUTOR(WHOIS,A)) Q:(A="")!(A="z")  I (A'="ATTRIBUT")&(A'="LIEN") S J=$$NOMINT^%QSF(A) I J'="",'($D(^[QUI]RQSFILS(J))) S LREP(A)=""
 D INIT2^%QUCHOIP("LREP",1,"",0,HFHA,LFGA,HFMI,LECR)
INIT S (FDM,FDMI,PIL)=0,(INDIV,RIND,A)=""
 D CLEPAG^%VVIDEO,AFF^%QWINMOA
SEL S REP=$$UN^%QUCHOIP I REP="" D END^%QUCHOIP,CLEPAG^%VVIDEO K ^M($J) Q
 S REPI=$$NOMINT^%QSF(REP),FININD=0,PIL=PIL+1
 D CLFGA^%QWINMOA,AFREP^%QWINMOA(REP)
 
SELI 
 I FDM D CLFDR^%QWINMOA
 D POCLEPA^%VVIDEO
 W $$^%QZCHW("Individu : ") S FDMI=1,DX=$X,DY=$Y D ^%VLEC
TESTS I CTRLA!(Y1="") S FININD=1 G MOIN
 I "*?"[$E(Y1,$L(Y1)) S Y1=$$CHOIX^%QWINMOA D:FDMI CLIND^%QWINMOA D:FDM CLFDR^%QWINMOA G:Y1="" SELI G TESTS
 S INDIV=Y1,RIND=$S(PIL>1:$P(PIL(PIL-1),"^",5)_",",1:"")_$$M^%QAX(INDIV)
 I $$EXIRI^%QWSTOL(REPI,RIND) S MODE="C" G SSEL
 I '($$IR^%QSGEST5(REPI,RIND)) G TEST2
 D POCLEPA^%VVIDEO,^%VSQUEAK
 S RESQ=$$MES^%VZEOUI($$^%QZCHW("Cet individu existe dans DKBMS, voulez-vous le charger")_" ? ","O")
 I RESQ'=1 G SELI
 D POCLEPA^%VVIDEO
 S MODE="C" D AJOUTER^%QWSTOI("INIT",REPI,RIND) G SSEL
TEST2 
 G:'($$^%QSAJCM3) SELI
 S MODE="A"
 D AJOUTER^%QWSTOI("INIT",REPI,RIND)
SSEL D AFIND^%QWINMOA(INDIV),CLIND^%QWINMOA
 G:(PIL'>1)!(MODE'="A") SELO
 
 S OLD=PIL(PIL-1)
SSELOR D POCLEPA^%VVIDEO S ORD=$$^%VZAME1($$^%QZCHW("Numero d'ordre ? "))
 S:ORD="" ORD=INDIV
 I '($$OKLINK^%QWSTOI("INIT",$P(OLD,"^",2),$P(OLD,"^",5),RATT,ORD,INDIV,$P(OLD,"^",5))) D ^%VZEAVT($$^%QZCHW("Numero non valide")) G SSELOR
 D POCLEPA^%VVIDEO
 D LINK^%QWSTOI("INIT",$P(OLD,"^",2),$P(OLD,"^",5),RATT,ORD,INDIV,$P(OLD,"^",5))
 G SELO
MOIN 
MOINS I FDM D CLFDR^%QWINMOA S FDM=0
 I FDMI D CLIND^%QWINMOA S FDMI=0
 D POCLEPA^%VVIDEO S PIL=PIL-1 D CLHIE^%QWINMOA(PIL+1) G:PIL>0 MSM
 I FININD D AFF^%QUCHOIP G SEL
 S PIL=PIL+1 D CLFGA^%QWINMOA,AFREP^%QWINMOA(REP) G SELI
MSM S FININD=0,OLD=PIL(PIL),INDIV=$P(OLD,"^",1),REPI=$P(OLD,"^",2),REP=$P(OLD,"^",3),MODE=$P(OLD,"^",4),RIND=$P(OLD,"^",5)
 
 
SELO K LOPT,^M($J),^ML($J)
 S ^M($J,1)=$$^%QZCHW("Attributs")_"^ATTRI"
 S ^M($J,2)=$$^%QZCHW("Supprimer")_"^SUPPR"
SELOS S I=3,A="",LONGM=22,STOP=0
 F %A=0:0 Q:STOP=1  S A=$O(^[QUI]RQSLIEN(REPI,A)) Q:A=""  D REMP
 G:PIL=1 SS1
SS1 S PIL(PIL)=$$M^%QAX(INDIV)_"^"_REPI_"^"_REP_"^"_MODE_"^"_RIND
LOC S DX=0,DY=22 D CLEBAS^%VVIDEO
 O $I D ^%VQUIKMN(0,79,22,"^M($J)",.ADRES,.CONTR)
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 G:ADRES="" MOIN
 F IOPT="ATTRI","SUPPR","SUIT" G:ADRES=IOPT @IOPT
 G LIENS
 
ATTRI 
 D ^%QWINMO3(MODEL,REPI,RIND,0,YBA,HFBA,LECR,LECR)
 S DX=0,DY=YBA D CLEBAS^%VVIDEO
 S FDM=1,NMODE=$S($$EXIRI^%QWSTOL(REPI,RIND):"C",1:"A")
 I NMODE'=MODE S MODE=NMODE G SELO
 G LOC
 
SUPPR 
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de cet individu")_" ? ")'=1 D POCLEPA^%VVIDEO G LOC
 D SUPR^%QWSTOI(REPI,RIND)
 G MOIN
 
SUIT 
 K LOPT,^M($J) S LONGM=0,I=0,A=SAUV
 F %A=0:0 S A=$O(^[QUI]RQSLIEN(REPI,A)) Q:A=""  D REMP
 G LOC
 
LIENS 
 S CH=LOPT(ADRES),RAATT=$P(CH,"^",3)
 G:$P(RAATT,".")'="LIEN" LS3S
 
 S RIIND=$$NOML^%QSGES20($P(CH,"^",5),INDIV,$P(RAATT,".",2,999),RIND)
 D ^%QWINMO3(MODEL,$P(CH,"^",1),RIIND,0,YBA,HFBA,LECR,LECR)
 S FDM=1
 G MSM
 
LS3S 
 S INDIV="",RATT=RAATT,REPI=$P(CH,"^",1)
 S PIL(PIL)=PIL(PIL)_"^"_REPI_"^"_RATT
 S PIL=PIL+1
 S REP=$$NOMLOG^%QSF(REPI) G:($P(CH,"^",2)=3)!($P(CH,"^",2)=4) LS4
 
 D AFREP^%QWINMOA(REP) G SELI
LS4 
 I '($$^%QWINMO2) S PIL=PIL-1,REPI=$P(PIL(PIL),"^",2) D CLFGA^%QWINMOA,AFREP^%QWINMOA($$NOMLOG^%QSF(REPI)) G SELI
 G MOINS
CONT G:"AF"[CONTR MOIN D ^%VSQUEAK G LOC
 
REMP 
 Q:($P(A,".")="LIEN")!($P(A,".")="INVERSE")
 S CH=^[QUI]RQSLIEN(REPI,A),J=$P(CH,"^",1)
 Q:(J=1)!(J=5)
 S LIB=$P(CH,"^",2),LIBT=$$^%QZCHW($$NOMLOG^%QSF(LIB))
 I (LONGM+$L(A))>73 S I=I+1,^M($J,I)=$$^%QZCHW("Suite")_"^SUIT",SAUV=$ZP(^[QUI]RQSLIEN(REPI,A)),STOP=1 Q
 S I=I+1,^M($J,I)=A_"^"_I,LOPT(I)=LIB_"^"_J_"^"_A
 S LONGM=(LONGM+$L(A))+2 Q

