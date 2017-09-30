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

;%SGNETQ0^INT^1^59547,73890^0
%SGNETQ0 ;;04:54 PM  2 Nov 1993; 26 Oct 93  7:13 PM ; 02 Nov 93  4:57 PM
 
 
 
 
 N VERIF
 S VERIF=$$TEMP^%SGUTIL
 S CRNET="^TEST(1)" K @(CRNET) S @CRNET=0
 Q:'($$^%SGNETQM)
 D INIEXI^%SGNETQA
 D UN
 D:@VERIF@("SGNETQA") DEUX
 D:@VERIF@("SUPPSF") TROIS
 D:@VERIF@("SGNETQL") LIENS
 D:@VERIF@("PARASITES") PARASITE
 D:@VERIF@("QUERY") SIX
 D:@VERIF@("SUPPREP") SUPPREP
 I EXIABA D VZEAVT("Vous devez faire une recomprehension de vos abaques")
 I EXISDX D VZEAVT("Vous devez faire une recomprehension de vos objets graphiques")
 I EXITOT D VZEAVT("Vous devez faire une validation et une comprehension TOTEM")
 D VZEAVT("Vous devez reanalyser tout le SF et refaire une comprehension des reseaux semantiques")
 S ^TOZE($I,"ATTENTE")=90000
 Q
 
UN D MSG^%VZEATT("nettoyage standard")
 D INTERNE^%SGNETQI
 D CLEPAG^%VVIDEO
 Q
 
 
 
DEUX D MSG^%VZEATT("suppression des globals regenerables")
 D INTERNE^%SGNETQA(0,0,0,0,0,0)
 D CLEPAG^%VVIDEO
 Q
 
TROIS 
 
TROIS1 
 
 
 D MSG^%VZEATT("sauvegarde de tout le SF")
 N LISTE,LISTATT,BASE,GLILA,LPF,LINVO,REPLIEN
 N ENSTRT,ENSPRD,LSAISIE
 D ON^%VZEATT
 S EPRD=$$TEMP^%SGUTIL,ETTL=$$TEMP^%SGUTIL,EMOD=$$TEMP^%SGUTIL,EFOR=$$TEMP^%SGUTIL,ERQS=$$TEMP^%SGUTIL,EPSV=$$TEMP^%SGUTIL,EMSQ=$$TEMP^%SGUTIL
 S LSAISIE=$$TEMP^%SGUTIL
 S BASE="RESEAU",LPF="ETAT.RESEAU",REPNODE="ETAT.RESEAU",LINVO="ETAT.PRECEDE"
 S REPLIEN=$$LIENI^%QSGEL3
 S LISTE=$$GEN^%QCAPOP("LTN"),BASE="RESEAU",LPF="ETAT.RESEAU",REPNODE="ETAT.RESEAU"
 D CREERL^%QS0XG1(LISTE,BASE,"^[QUI]ZLIGTRA("""_LISTE_""")","ARCHIVAGE","RESEAU")
 S ATN="" F %A=0:0 S A=$$NXTRI^%QSTRUC8(BASE,ATN) Q:ATN=""  D AJOUT^%QS0XG1(LISTE,ATN)
 S LISTATT=$$GEN^%QCAPOP("LTN")
 S GLILA(1)=LPF,GLILA(2)=LINVO
 D ADD^%QMLILA(LISTATT,"GLILA")
 S RES=$$ARCHIDON^%SGPDOU(LISTE,LISTATT,4,"reseaux.ind","tous les reseaux")
 S L="" F %IL=0:0 S L=$$SUIVL^%QS0XG1(RES,L) Q:L=""  D ELIML^%QS0XG1(L)
 D ELIML^%QS0XG1(RES)
 D ELIML^%QS0XG1(LISTE)
 D DEL^%QMLILA(LISTATT)
 
TROIS2 
 S EPRD=$$TEMP^%SGUTIL,ETTL=$$TEMP^%SGUTIL,EMOD=$$TEMP^%SGUTIL,EFOR=$$TEMP^%SGUTIL,ERQS=$$TEMP^%SGUTIL,EPSV=$$TEMP^%SGUTIL,EMSQ=$$TEMP^%SGUTIL
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]TTL(TRT)) Q:TRT=""  S @ETTL@(TRT)=""
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]RQSGLO("PRED",TRT)) Q:TRT=""  S @EPRD@(TRT)=""
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]EDMOD(TRT)) Q:TRT=""  S @EMOD@(TRT)=""
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]EDFORMAT(TRT)) Q:TRT=""  S @EFOR@(TRT)=""
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]RQSGLO("SR","DEF",TRT)) Q:TRT=""  S @EMSQ@(TRT)=""
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]LKY2(TRT)) Q:TRT=""  S @EPSV@(TRT)=""
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]RQS1(TRT)) Q:TRT=""  S @ERQS@(TRT)=""
 S RES=$$FILE^%SGPKOUT("toutsf.arc",ETTL,EMOD,EFOR,ERQS,EPSV,EMSQ,EPRD,1,"tout le SF hors TOTEM",0,.MES)
 
 
TROIS3 
 S LISTE=$$GEN^%QCAPOP("LTN"),BASE="SAISIE.I"
 D CREERL^%QS0XG1(LISTE,BASE,"^[QUI]ZLIGTRA("""_LISTE_""")","ARCHIVAGE","RESEAU")
 S PRD="" F %I=0:0 S PRD=$$NXTRI^%QSTRUC8("SAISIE.I",PRD) Q:PRD=""  D AJOUT^%QS0XG1(LISTE,PRD)
 S RES=$$ARCHIDON^%SGPDOU(LISTE,LISTATT,1,"saisies.ind","toutes les saisies")
 D ELIML^%QS0XG1(LISTE)
 D OFF^%VZEATT
 D CLEPAG^%VVIDEO
 
 
TROIS4 
 
 S BASE="RESEAU"
 S ATN="" F %A=0:0 S ATN=$$NXTRI^%QSTRUC8(BASE,ATN) Q:ATN=""  W !,"suppression de",ATN D SX^%QSGESTK(BASE,ATN)
 
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]TTL(TRT)) Q:TRT=""  D SUPP^%TLGEST(TRT)
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]RQSGLO("PRED",TRT)) Q:TRT=""  D SUPP^%PSPRGES(TRT)
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]EDMOD(TRT)) Q:TRT=""  D SUPP^%EDDGEST(TRT)
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]EDFORMAT(TRT)) Q:TRT=""  D SUPP^%EDFGEST(TRT)
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]RQSGLO("SR","DEF",TRT)) Q:TRT=""  K ^[QUI]RQSGLO("SR","DEF",TRT)
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]LKY2(TRT)) Q:TRT=""  K ^LKY2(TRT),^[QUI]LKYENR2(TRT),^[QUI]LYATR2(TRT),^[QUI]LKYPROT(TRT)
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]RQS1(TRT)) Q:TRT=""  D ^%QSUPREQ(TRT,1)
 D CLEPAG^%VVIDEO
 Q
 
 
SUPPREP 
 
 S REP="" F %R=0:0 S REP=$O(@VERIF@("SUPPREP",REP)) Q:REP=""  S IND="" F %I=0:0 S IND=$$NXTRI^%QSTRUC8(REP,IND) Q:IND=""  D SX^%QSGESTK(REP,IND)
 Q
 
 
LIENS 
 D MSG^%VZEATT("suppression des liens inutiles")
 D ^%SGNETQL
 D CLEPAG^%VVIDEO
 Q
 
 
PARASITE 
 D MSG^%VZEATT("suppression des carateres de controle")
 D VERIF^%UTSTCN
 D REPARE^%UTSTCN
 D CLEPAG^%VVIDEO
 Q
 
 
SIX 
 D MSG^%VZEATT("reconstruction des QUERYS")
 D ^%QSXREPV
 K ^[QUI]QUERY2,^[QUI]QUERY3,^[QUI]QUERY4
 D REPARV^%QSXREPA,CARDM^%QSXREPA,^%QMTRAQS
 Q
 
VZEAVT(MES) S @CRNET=@CRNET+1
 S @CRNET@(@CRNET)=MES Q
 
 
CR 
 S XG=1,YH=2,DV=18,DH=78
 D CLFEN^%VVIDEO(XG,YH,DV,DH),CARSA^%VVIDEO(XG,YH,DH,DV)
 D REAFF2^%QULIMO3(1,1,"^TEST(1)",XG,YH,DH,DV,0)
 D VISU^%QULIMO(XG,YH,DH,DV,"^TEST(1)",1)
 Q
 ;

