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

;%TLBAACN^INT^1^59547,74028^0
%TLBAACN ;;03:17 PM  8 Apr 1992;
 
PNOM 
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VTEMP") K @(TEMPO)
 S @TEMPO@(1)="ORD",@TEMPO@(2)="NIV",@TEMPO@(3)="PAR"
 S @TEMPO@(4)="ETIQ",@TEMPO@(5)="SEN",@TEMPO@(6)="DEJ"
 S @TEMPO@(7)="OBJ",@TEMPO@(8)="RPER",@TEMPO@(9)="BA"
 S @TEMPO@(10)="VARO",@TEMPO@(11)="PERE"
 S @TEMPO@(12)="INIV",@TEMPO@(13)="VNIV",@TEMPO@(14)="GCLE"
 S @TEMPO@(15)="CLE",@TEMPO@(16)="ECHGL",@TEMPO@(17)="NB"
 S @TEMPO@(18)="TEMP",@TEMPO@(19)="TEMPL",@TEMPO@(20)="TEMPOLI"
 S @TEMPO@(21)="FILE",@TEMPO@(22)="PILE",@TEMPO@(23)="VU"
 S @TEMPO@(24)="LLIST"
 S @TEMPO@(25)="III"
 S @TEMPO@(26)="IN",@TEMPO@(27)="O",@TEMPO@(28)="TTYP"
 S @TEMPO@(29)="PARTIE",@TEMPO@(30)="STOP",@TEMPO@(31)="NVIRG"
 S @TEMPO@(32)="RETOURGO",@TEMPO@(33)="RETOUROK",@TEMPO@(34)="TETE"
 S @TEMPO@(35)="B",@TEMPO@(36)="OR",@TEMPO@(37)="L"
 S @TEMPO@(38)="PA",@TEMPO@(39)="ITAB",@TEMPO@(40)="TB"
 S @TEMPO@(41)="IFILS",@TEMPO@(42)="FILS",@TEMPO@(43)="VPER"
 S @TEMPO@(44)="MAP",@TEMPO@(45)="GLOSTO"
 D EMPV^%ANGEPIL(TEMPO)
 S MAP=$$GET^%SGVAR("MAP")
 D:(MODAF'=0)&(MODEX'=3) ADD^%TLIFEN("LOG",$$^%QZCHW("  Parcours de nomenclature"))
 D:(MODAF'=0)&(MODEX'=3) ^%VZEATT
 
 G:MODEX'=3 LIRVAR
 
 S ECHEC=@GLOETD@(NIVEAU+1,"ECHEC.LOCAL")
 S VARO=@GLOETD@(NIVEAU+1,"VAR.OBJ"),ORD=@GLOETD@(NIVEAU+1,"VAR.ORDRE")
 S NIV=@GLOETD@(NIVEAU+1,"VAR.NIV"),PERE=@GLOETD@(NIVEAU+1,"VAR.PERE")
 S ETIQ=@GLOETD@(NIVEAU+1,"ETIQUETTE")
 S SEN=@GLOETD@(NIVEAU+1,"SENS"),PAR=@GLOETD@(NIVEAU+1,"PARCOURS")
 S DEJ=@GLOETD@(NIVEAU+1,"DEJ")
 S BA=@GLOETD@(NIVEAU+1,"BASE"),RPER=@GLOETD@(NIVEAU+1,"LIEN")
 S OBJ=@GLOETD@(NIVEAU+1,"INDIVIDU.COURANT")
 G CHELEM
 
LIRVAR S VARO=$$RED($$RED(ACTI,1),"TEXTE")
 S PERE=$$RED($$RED(ACTI,2),"TEXTE")
 S ORD=$$RED($$RED(ACTI,3),"TEXTE")
 S NIV=$$RED($$RED(ACTI,4),"TEXTE")
 K CXT(VARO),CXT(PERE),CXT(ORD),CXT(NIV)
 F III=VARO,PERE,ORD,NIV D PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),III)
 I MODEX=2 F III=VARO,PERE,ORD,NIV D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),III,"","*","SUPPRESSION")
 S III=$$RED(ACTI,5)
 I '($$ATTR^%TLIACT4(III,.RPER,.VPER,.OBJ,.BA)) S ECHEC=1 G MAJIV
 S III=$$REPD^%QSGEL2(BA,RPER)
 I III="" D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien inexistant")) S ECHEC=1 G MAJIV
 I III'=BA D ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien non involutif")) S ECHEC=1 G MAJIV
 S ETIQ=$$SUBST^%ANARBR2($$RED(ACTI,6),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(ETIQ="") D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer etiquette")) S ECHEC=1 G MAJIV
 S PAR=$$RED(ACTI,7)
 I PAR=0 S PAR="PROFONDEUR" G SENS
 S PAR=$$SUBST^%ANARBR2(PAR,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer parcours")) S ECHEC=1 G MAJIV
 S PAR=$S(PAR=$$^%QZCHW("LARGEUR"):"LARGEUR",1:"PROFONDEUR")
SENS S SEN=$$RED(ACTI,8)
 I SEN=0 S SEN="EN.MONTANT" G DEJAVU
 S SEN=$$SUBST^%ANARBR2(SEN,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer sens")) S ECHEC=1 G MAJIV
 S SEN=$S(SEN=$$^%QZCHW("EN.DESCENDANT"):"EN.DESCENDANT",1:"EN.MONTANT")
DEJAVU S DEJ=$$RED(ACTI,9)
 I DEJ=0 S DEJ="SANS.REPETITION" G CHELEM
 S DEJ=$$SUBST^%ANARBR2(DEJ,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer arret")) S ECHEC=1 G MAJIV
 S DEJ=$S(DEJ=$$^%QZCHW("AVEC.REPETITION"):"AVEC.REPETITION",1:"SANS.REPETITION")
 
CHELEM 
 S TEMPL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOMEN")
 I '($D(@TEMPL)) S @TEMPL=0
 S @TEMPL=@TEMPL+1
 S TEMPL=$$CONCAS^%QZCHAD(TEMPL,@TEMPL) K @(TEMPL)
 S TEMPOLI=$$CONCAS^%QZCHAD(TEMPL,"LISTE.IND")
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TMP") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S TABLE=$$CONCAS^%QZCHAD(TEMP,"TABLE")
 S VU=$$CONCAS^%QZCHAD(TEMP,"VU")
 S FILE=$$CONCAS^%QZCHAD(TEMP,"FILE")
 S LLIST=$$CONCAS^%QZCHAD(TEMP,"LLIS")
 
 I PAR="PROFONDEUR" G CHELEM^%TLBAACP
 G CHELEM^%TLBAACO
 
FINIT 
 I (MODAF'=0)&(('(ABANDON))&('(HALT))) D ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin du parcours")) I MAP,MODAF=2 D REAF^%TLBAIF(2)
 G:(('(MAP))!(ABANDON'=2))!HALT FFITRV
 
 S @GLOETD@(NIVEAU+1,"ECHEC.LOCAL")=ECHEC
 S @GLOETD@(NIVEAU+1,"VAR.OBJ")=VARO,@GLOETD@(NIVEAU+1,"VAR.ORDRE")=ORD
 S @GLOETD@(NIVEAU+1,"VAR.NIV")=NIV,@GLOETD@(NIVEAU+1,"VAR.PERE")=PERE
 S @GLOETD@(NIVEAU+1,"PARCOURS")=PAR,@GLOETD@(NIVEAU+1,"DEJ")=DEJ
 S @GLOETD@(NIVEAU+1,"SENS")=SEN,@GLOETD@(NIVEAU+1,"ETIQUETTE")=ETIQ
 S @GLOETD@(NIVEAU+1,"BASE")=BA,@GLOETD@(NIVEAU+1,"LIEN")=RPER
 S @GLOETD@(NIVEAU+1,"INDIVIDU.COURANT")=OBJ
 S @GLOETD@(NIVEAU+1,"VAL.NIVEAU")=VNIV
 G:PAR="PROFONDEUR" SPRO
 S @GLOETD@(NIVEAU+1,"IND.NIVEAU")=INIV
 S @GLOETD@(NIVEAU+1,"IND.SUR.NIVEAU")=NB
 G FFITRV
SPRO S @GLOETD@(NIVEAU+1,"CLE.GROUPEE")=GCLE,@GLOETD@(NIVEAU+1,"CLE")=CLE
 
FFITRV 
 K CXT(VARO),CXT(PERE),CXT(ORD),CXT(NIV)
 F III=VARO,PERE,ORD,NIV D PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),III)
 I MODEX=2 F III=VARO,PERE,ORD,NIV D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),III,"","*","SUPPRESSION")
 D ADTEMP
 S III=@TEMPL
 I III=1 K @(TEMPL)
 I III>1 K @TEMPL@(III) S @TEMPL=III-1
 I MAP G DEPIL^%ANGEPIL
 D DEPV^%ANGEPIL G REBOUCA^%TLIACT1
 
 
MAJIV I MAP G DEPIL^%ANGEPIL
 D DEPV^%ANGEPIL G REBOUCA^%TLIACT1
 
ADTEMP 
 S TEMPL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOMEN")
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

