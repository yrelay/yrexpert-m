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

;%TLBAAC2^INT^1^59547,74028^0
%TLBAAC2 ;
 
TRAITER 
 K @(TEMPO) S @TEMPO@(1)="EXTRT",@TEMPO@(2)="OLISTE"
 S @TEMPO@(3)="BA",@TEMPO@(4)="T",@TEMPO@(5)="OBJ",@TEMPO@(6)="POS"
 S @TEMPO@(7)="SIND",@TEMPO@(8)="ETIQ",@TEMPO@(9)="PARTIE"
 S @TEMPO@(10)="I",@TEMPO@(11)="REP",@TEMPO@(12)="IND"
 S @TEMPO@(13)="ECHGL",@TEMPO@(14)="CXT(""@"",""BASE"")"
 S @TEMPO@(15)="CXT(""@"",""OBJET"")",@TEMPO@(16)="TRLIS"
 S @TEMPO@(17)="TRBOUC",@TEMPO@(18)="HALT"
 S @TEMPO@(19)="DEROUL",@TEMPO@(20)="ODEROUL"
 D EMPV^%ANGEPIL(TEMPO)
 
 S EXTRT=$$^%QCAZG("TRT"),OLISTE=$$^%QCAZG("LISTE"),ODEROUL=DEROUL
 I MODEX=3 S LISTE="TRT" G EXEC
 
 
 S TRT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (TRT="")!(POS=0) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer le nom du traitement")) S ECHEC=1 G MAJ
 I '($$EXISTE^%TLGEST(TRT)) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver le traitement")) S ECHEC=1 G MAJ
 I '($$OKANA^%TLGEST(TRT)) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("   Analyse du traitement incorrect")) S ECHEC=1 G MAJ
 
 I NOM'="$TRAITER" G TRTL
 S BA=$$RED(ACTI,2)
 I BA=0 S OBJ=CXT("@","OBJET"),BA=CXT("@","BASE") G TLTR15
 S BA=$$RED($$RED(BA,1),"TEXTE")
 I BA="" S OBJ=CXT("@","OBJET"),BA=CXT("@","BASE") G TLTR15
 I '($D(CXT(BA,"BASE"))) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Individu symbolique non defini")) S ECHEC=1 G MAJ
 I '($D(CXT(BA,"OBJET"))) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Individu symbolique non defini")) S ECHEC=1 G MAJ
 S OBJ=CXT(BA,"OBJET"),BA=CXT(BA,"BASE")
 
TLTR15 S DEROUL=$$RED(ACTI,3)
 I DEROUL=0 S DEROUL="PROCEDURAL" G TLTRT2
 S DEROUL=$$SUBST^%ANARBR2(DEROUL,.CXT,"ATT^%TLIACT3",.POS)
 S DEROUL=$S(DEROUL=1:"FAIBLEMENT PROCEDURAL",DEROUL=2:"LINEAIRE.REMANENT",DEROUL=3:"ARBRE",DEROUL=4:"ARBRE.REMANENT",DEROUL=5:"ARBRE.RECUSATION",1:"PROCEDURAL")
 
TLTRT2 S LISTE=$$GEN^%QCAPOP("TRT")
 D ^%QSGES11(BA,LISTE,"GDX",0,"","")
 D STOCK^%QSGES11(LISTE,OBJ)
 G EXEC
 
 
TRTL S LISTE=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (LISTE="")!(POS=0) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer le nom de la liste")) S ECHEC=1 G MAJ
 I '($$EX^%QS0(LISTE)) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste ")_LISTE_$$^%QZCHW(" inconnue")) S ECHEC=1 G MAJ
 I $$CARD^%QSGEST7(LISTE)=0 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste vide")) S ECHEC=1 G MAJ
 
EXEC S SIND=0,ETIQ="",PARTIE="",TRBOUC=0,TRLIS=$S(NOM="$TRAITERL":1,1:0)
 D EMPIL^%ANGEPIL("RETOUR^%TLBAAC2")
 G ^%TLBADEB
 
RETOUR 
 I $D(ECHGL),ECHGL>0 S ECHEC=1
 I NOM="$TRAITER" D DEL^%QSGES11(LISTE)
MAJ 
 S TRT=EXTRT,LISTE=OLISTE,DEROUL=ODEROUL
 I (ORIG'="TRAIT")!ABANDON G FTRAITER
 I MODAF=2 D REAF^%TLBAIF(1)
 I MODAF=1 D REAF^%TLBAIF(0)
 
FTRAITER 
 G DEPIL^%ANGEPIL
 
 
AUSCUL 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Auscultation d'un individu"))
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TP")
 K @(TEMPO)
 S @TEMPO@(1)="IN",@TEMPO@(2)="VAR",@TEMPO@(3)="ORD",@TEMPO@(4)="RPER"
 S @TEMPO@(5)="VPER",@TEMPO@(6)="L",@TEMPO@(7)="ETIQ",@TEMPO@(8)="%I"
 S @TEMPO@(9)="LLIST",@TEMPO@(10)="TTYP",@TEMPO@(11)="NOE",@TEMPO@(12)="OBJ"
 S @TEMPO@(13)="BA",@TEMPO@(14)="PARTIE",@TEMPO@(15)="LI"
 S @TEMPO@(16)="STOP",@TEMPO@(17)="ECHGL",@TEMPO@(18)="GLOSTO"
 S @TEMPO@(19)="RETOURGO",@TEMPO@(20)="RETOUROK",@TEMPO@(21)="ATTR"
 S @TEMPO@(22)="NOEUACT",@TEMPO@(23)="TETE",@TEMPO@(24)="ANOM"
 S @TEMPO@(25)="%OORD",@TEMPO@(26)="%VALE",@TEMPO@(27)="%ATTR"
 S @TEMPO@(28)="ORD",@TEMPO@(29)="NORD"
 D EMPV^%ANGEPIL(TEMPO)
 K @(TEMPO)
 S ANOM=$$RED($$RED(ACTI,1),"TEXTE")
 I $D(CXT(ANOM)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_ANOM_$$^%QZCHW(" deja utilisee")) G MAJIV
 S VAR=$$RED($$RED(ACTI,2),"TEXTE")
 I $D(CXT(VAR)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_VAR_$$^%QZCHW(" deja utilisee")) G MAJIV
 S NORD=$$RED($$RED(ACTI,3),"TEXTE")
 I $D(CXT(NORD)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_NORD_$$^%QZCHW(" deja utilisee")) G MAJIV
 S NOE=$$RED(ACTI,4)
 S ETIQ=$$RED($$RED(ACTI,5),"TEXTE")
 I NOE=0 S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET") G SUITIT2
 S VPER=$$RED(NOE,3) I VPER=0 S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET") G SUITIT
 S OBJ=$$RED(VPER,"TEXTE")
 G:$E(OBJ)'="%" SUITI
 S VPER=OBJ,BA=$$^%QCAZG("CXT(OBJ,""BASE"")"),OBJ=$$^%QCAZG("CXT(OBJ,""OBJET"")")
 I (BA="")!(OBJ="") D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")_VPER) G MAJIV
 G SUITIT
SUITI S OBJ=$$OBPROX2^%QSCALVU(OBJ,CXT("@","BASE"),CXT("@","OBJET"),.BA)
 I (BA="")!(OBJ="") D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")) G MAJIV
SUITIT S OBJ=$$OBPROX2^%QSCALVU($$RED($$RED(NOE,1),"TEXTE"),BA,OBJ,.BA)
 I (OBJ="")!(BA="") D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")) G MAJIV
SUITIT2 S ATTR=""
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AUSCULT")
 I '($D(@LLIST)) S @LLIST=0
 S @LLIST=@LLIST+1
 S LLIST=$$CONCAT^%QZCHAD(LLIST,@LLIST)
 K @(LLIST)
BATTR S ATTR=$$NXTRIA^%QSTRUC8(BA,OBJ,ATTR)
 G:ATTR="" BF
 S ORD=""
BORD S ORD=$$NXTRIAO^%QSTRUC8(BA,OBJ,ATTR,ORD)
 G:ORD="" BATTR
 S VAL=$$VALEUR^%QSTRUC8(BA,OBJ,ATTR,ORD)
 S @LLIST@(ATTR_"%^@"_ORD_"%^@"_VAL)=""
 G BORD
 
BF S %LL="",ARRET=0,PARTIE=""
BAUSC I MODEX=3 S %LL=@GLOETD@(NIVEAU+1,"INDIVIDU.COURANT"),ECHEC=@GLOETD@(NIVEAU+1,"ECHEC.LOCAL")
 I MODEX'=3 S %LL=$O(@LLIST@(%LL))
 G:%LL="" FINIT
 G:ARRET!(ABANDON!HALT) FINIT
 S %ATTR=$P(%LL,"%^@"),%VALE=$P(%LL,"%^@",3),%OORD=$P(%LL,"%^@",2)
 S CXT("%",ANOM)=%ATTR,CXT("%",VAR)=%VALE,CXT("%",NORD)=%OORD
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,%VALE,1),PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NORD,%OORD,1),PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ANOM,%ATTR,1)
 D EMPIL^%ANGEPIL("RETIT^%TLBAAC2")
 G ^%TLBADEB
RETIT I ECHGL>0 S ECHEC=1
 G BAUSC
 
FINIT K @(LLIST)
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AUSCULT")
 S @LLIST=@LLIST-1
 I @LLIST=0 K @(LLIST)
 D:(MODAF'=0)&((ABANDON'=1)&(HALT'=1)) ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin iteration"))
 I MODAF=2 D REAF^%TLBAIF(2)
 I ABANDON=2 S @GLOETD@(NIVEAU+1,"INDIVIDU.COURANT")=%LL,@GLOETD@(NIVEAU+1,"ECHEC.LOCAL")=ECHEC
MAJIV G DEPIL^%ANGEPIL
 
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

