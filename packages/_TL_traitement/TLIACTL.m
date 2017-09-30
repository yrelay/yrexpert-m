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

;TLIACTL^INT^1^59547,74869^0
TLIACTL ;
 
 
 
 
 
PNOM 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Parcours de nomenclature"))
 D:MODAF'=0 ^%VZEATT
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VARTEMP")
 K @(TEMPO)
 S @TEMPO@(1)="IN",@TEMPO@(2)="O",@TEMPO@(3)="ORD",@TEMPO@(4)="NIV"
 S @TEMPO@(5)="LIE",@TEMPO@(6)="PAR",@TEMPO@(7)="ETIQ",@TEMPO@(8)="SEN"
 S @TEMPO@(9)="LLIST",@TEMPO@(10)="TTYP",@TEMPO@(11)="NOE",@TEMPO@(12)="OBJ"
 S @TEMPO@(13)="BA",@TEMPO@(14)="PARTIE",@TEMPO@(15)="LI"
 S @TEMPO@(16)="STOP",@TEMPO@(17)="NVIRG",@TEMPO@(18)="GLOSTO"
 S @TEMPO@(19)="RETOURGO",@TEMPO@(20)="RETOUROK",@TEMPO@(21)="ATTR"
 S @TEMPO@(22)="NOEUACT",@TEMPO@(23)="TETE",@TEMPO@(24)="DEJ"
 S @TEMPO@(25)="REPD",@TEMPO@(26)="TEMPL",@TEMPO@(27)="TEMPOLI"
 S @TEMPO@(28)="VARO",@TEMPO@(29)="INIV",@TEMPO@(30)="VNIV"
 S @TEMPO@(31)="B",@TEMPO@(32)="IN",@TEMPO@(33)="NB",@TEMPO@(34)="TEMPODJ"
 S @TEMPO@(35)="CLE",@TEMPO@(36)="OR",@TEMPO@(37)="%LL",@TEMPO@(38)="GCLE"
 S @TEMPO@(39)="L",@TEMPO@(39)="ARRET"
 S @TEMPO@(40)="PERE"
 D EMPV^%ANGEPIL(TEMPO) K @(TEMPO)
 S VARO=$$RED^%ANA($$RED^%ANA(ACTI,1),"TEXTE")
 I $D(CXT(VARO)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_VARO_$$^%QZCHW(" deja utilisee")) S ECHEC=1 G MAJIV
 S PERE=$$RED^%ANA($$RED^%ANA(ACTI,2),"TEXTE")
 I $D(CXT(PERE)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_ORD_$$^%QZCHW(" deja utilisee")) S ECHEC=1 G MAJIV
 S ORD=$$RED^%ANA($$RED^%ANA(ACTI,3),"TEXTE")
 I $D(CXT(ORD)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_ORD_$$^%QZCHW(" deja utilisee")) S ECHEC=1 G MAJIV
 S NIV=$$RED^%ANA($$RED^%ANA(ACTI,4),"TEXTE")
 I $D(CXT(NIV)) D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_NIV_$$^%QZCHW(" deja utilisee")) S ECHEC=1 G MAJIV
 S LIE=$$RED^%ANA($$RED^%ANA(ACTI,5),"TEXTE")
 S REPD=$$REPD^%QSGEL2(CXT("@","BASE"),LIE)
 I REPD="" D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien inexistant")) S ECHEC=1 G MAJIV
 I REPD'=CXT("@","BASE") D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Lien non involutif")) S ECHEC=1 G MAJIV
 S ETIQ=$$SUBST^%ANARBR2($$RED^%ANA(ACTI,6),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(ETIQ="") D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer etiquette")) S ECHEC=1 G MAJIV
 S PAR=$$RED^%ANA(ACTI,7)
 I PAR=0 S PAR="PROFONDEUR" G SENS
 S PAR=$$SUBST^%ANARBR2(PAR,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer parcours")) S ECHEC=1 G MAJIV
 I PAR="" S PAR="PROFONDEUR" G SENS
 I PAR'=$$^%QZCHW("LARGEUR") S PAR="PROFONDEUR" G SENS
 S PAR="LARGEUR"
SENS S SEN=$$RED^%ANA(ACTI,8)
 I SEN=0 S SEN="EN.MONTANT" G DEJAVU
 S SEN=$$SUBST^%ANARBR2(SEN,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer sens")) S ECHEC=1 G MAJIV
 I SEN="" S SEN="EN.MONTANT" G DEJAVU
 I SEN'=$$^%QZCHW("EN.DESCENDANT") S SEN="EN.MONTANT" G DEJAVU
 S SEN="EN.DESCENDANT"
DEJAVU S DEJ=$$RED^%ANA(ACTI,9)
 I DEJ=0 S DEJ="SANS.REPETITION" G CHELEM
 S DEJ=$$SUBST^%ANARBR2(DEJ,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer arret")) S ECHEC=1 G MAJIV
 I DEJ="" S DEJ="SANS.REPETITION" G CHELEM
 I DEJ'=$$^%QZCHW("AVEC.REPETITION") S DEJ="SANS.REPETITION" G CHELEM
 S DEJ="AVEC.REPETITION"
 
CHELEM 
 S TEMPL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOMEN")
 I '($D(@TEMPL)) S @TEMPL=0
 S @TEMPL=@TEMPL+1
 S TEMPL=$$CONCAS^%QZCHAD(TEMPL,@TEMPL)
 K @(TEMPL)
 S TEMPOLI=$$CONCAS^%QZCHAD(TEMPL,"LISTE.IND")
 S TEMPCLE=$$CONCAS^%QZCHAD(TEMPL,"LISTE.CLE")
 S TEMPODJ=$$CONCAS^%QZCHAD(TEMPL,"DEJA.VU")
 S LLIST=$$CONCAS^%QZCHAD(TEMPL,"LISTET")
 S INIV=1,@TEMPOLI@(1,"NB")=1
 S B=CXT("@","BASE"),O=CXT("@","OBJET")
 S @TEMPODJ@(O)=""
 S @TEMPOLI@(1,"EN.COURS")=O
 S @TEMPOLI@(1,"OBJ",1)=O,@TEMPOLI@(1,"OBJ",1,"NIV")=1
 S @TEMPOLI@(1,"OBJ",1,"ORD")=1
 S @TEMPOLI@(1,"NB")=1,@TEMPOLI@(2,"NB")=0
 S OR=1,@TEMPCLE@(1,O,1)="""1"""
 S @TEMPCLE@(1,O,1,"P")=""
 K @(LLIST)
BFILS D MVG^%QSCALVA(B,O,LIE,LLIST,.TTYP)
 G:@LLIST=0 SUIVANT
 S CLE=@TEMPCLE@(INIV,O,OR)
 S IN="",NB=@TEMPOLI@(INIV+1,"NB")
BFILSS S IN=$O(@LLIST@(IN))
 G:IN="" BFILSF
 G:DEJ="AVEC.REPETITION" BFILSS2
 G:$D(@TEMPODJ@(@LLIST@(IN))) BFILSS
BFILSS2 S NB=NB+1
 S @TEMPOLI@(INIV+1,"OBJ",NB)=@LLIST@(IN)
 S @TEMPOLI@(INIV+1,"OBJ",NB,"ORD")=IN
 
 S @TEMPOLI@(INIV+1,"OBJ",NB,"PERE")=O
 
 S @TEMPCLE@(INIV+1,@LLIST@(IN),IN)=CLE_","""_NB_""""
 S @TEMPCLE@(INIV+1,@LLIST@(IN),IN,"P")=O
 S @TEMPODJ@(@LLIST@(IN))=""
 G BFILSS
 
BFILSF S @TEMPOLI@(INIV+1,"NB")=NB
 K @(LLIST)
SUIVANT S O=$O(@TEMPOLI@(INIV,"OBJ",@TEMPOLI@(INIV,"EN.COURS")))
 I O'="" S @TEMPOLI@(INIV,"EN.COURS")=O,OR=@TEMPOLI@(INIV,"OBJ",O,"ORD"),O=@TEMPOLI@(INIV,"OBJ",O) G BFILS
 S INIV=INIV+1
 G:'($D(@TEMPOLI@(INIV,"OBJ"))) APCH
 S @TEMPOLI@(INIV,"EN.COURS")=""
 S:'($D(@TEMPOLI@(INIV+1))) @TEMPOLI@(INIV+1,"NB")=0
 G SUIVANT
 
 
APCH 
 
 K @(TEMPODJ)
 G:PAR="LARGEUR" TRTNOM^%TLIACTM
 K @(TEMPOLI)
 S TEMPOLI=$E(TEMPOLI,1,$L(TEMPOLI)-1)_","
 S INIV=""
BNAPCH S INIV=$O(@TEMPCLE@(INIV))
 G:INIV="" TRTNOM^%TLIACTM
 S O=""
BOAPCH S O=$O(@TEMPCLE@(INIV,O))
 G:O="" BNAPCH
 S OR=""
BORAPCH S OR=$O(@TEMPCLE@(INIV,O,OR))
 G:OR="" BOAPCH
 
 S @(TEMPOLI_@TEMPCLE@(INIV,O,OR)_")="""_O_"^"_OR_"^"_@TEMPCLE@(INIV,O,OR,"P")_"""")
 G BORAPCH
 
 
MAJIV D DEPV^%ANGEPIL
 G RETBOUCA^%TLIACTI
 
 
ADTEMP 
 S TEMPL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOMEN")
 Q
 ;
 ;

