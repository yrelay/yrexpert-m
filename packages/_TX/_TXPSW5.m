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

;%TXPSW5^INT^1^59547,74033^0
%TXPSW5 ;;05:52 PM  12 Sep 1992; ; 10 Mar 93  9:28 AM
 
 
 
 
 
DEFETU 
 N GLOB,GLODEFA
 S GLOB="^[QUI]etu(ETUDE)"
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description de l'Etude"
 
 S NBC=10,NBFIXH=1,NBFIXB=2
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW5"
 S @GLODEFA@("FIXB",1,"LIB")="Etat de l'etude"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$etetu^%TXPSW5"
 S @GLODEFA@("FIXB",2,"LIB")="Valeur"
 S @GLODEFA@("FIXB",2,"ROUCAL")="$$valetu^%TXPSW5"
 
 S @GLODEFA@("ROULIB")="$$libetu^%TXPSW5"
 S @GLODEFA@("ROUDEF")="$$vdefetu^%TXPSW5"
 S @GLODEFA@("ROUAFF")="$$libetu^%TXPSW5"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,9)
 K @(GLODEFA)
 Q
 
libetu(i) 
 Q:i=1 "Entreprise"
 Q:i=2 "Projet"
 Q:i=3 "Commentaire"
 Q:i=4 "Date de Creation"
 Q:i=5 "Date de Derniere Mise a Jour"
 Q:i=6 "Nombre de Periodes"
 Q:i=7 "Periodes exprimees en"
 Q:i=8 "Date de Depart"
 Q:i=9 "Hypothese de Production"
vdefetu(i) 
 Q:i=1 "Mserv sarl"
 Q:i=2 "Finalisation"
 Q:i=3 " tests aleatoires"
 Q:i=4 $$DATEX^%QMDATE($H)
 Q:i=5 $$DATEX^%QMDATE($H)
 Q:i=6 $R(23)+1
 Q:i=7 "SEMAINES"
 Q:i=8 $$DATEX^%QMDATE($H)
 Q:i=9 "Couvrir la periode suivante"
 
 
etetu() Q "Non encore activee"
 
valetu() Q VLIMI
 
 
 
INIETU(GETU) 
 N V1,V2
 F I=1:1:9 S V1=$$libetu(I) I '($D(@GETU@(V1))) S @GETU@(V1)=$$vdefetu(I)
 S:'($D(@GETU@("Etat de l'etude"))) @GETU@("Etat de l'etude")=$$etetu
 S:'($D(@GETU@("Valeur"))) @GETU@("Valeur")=$$valetu
 Q
 
 
 
DEFART N GLOB,GLODEFA
 S GLOB=etuata
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description de l'atelier"
 
 S NBC=10,NBFIXH=3,NBFIXB=2
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW5"
 S @GLODEFA@("FIXH",2,"LIB")="Atelier"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$atelier^%TXPSW5"
 S @GLODEFA@("FIXH",3,"LIB")="Article"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$article^%TXPSW5"
 S @GLODEFA@("FIXB",1,"LIB")="Valeur Jauge"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$valjg^%TXPSW5"
 S @GLODEFA@("FIXB",2,"LIB")="Etat de cet article"
 S @GLODEFA@("FIXB",2,"ROUCAL")="$$etart^%TXPSW5"
 
 S @GLODEFA@("ROULIB")="$$libart^%TXPSW5"
 S @GLODEFA@("ROUDEF")="$$vdefart^%TXPSW5"
 S @GLODEFA@("ROUAFF")="$$libart^%TXPSW5"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,11)
 K @(GLODEFA)
 Q
valjg() Q "000"
etart() Q "Non Planifie"
 
 
libart(i) 
 Q:i=1 "Commentaire"
 Q:i=2 "Quantite moyenne horaire"
 Q:i=3 "Prix de Revient"
 Q:i=4 "Poids"
 Q:i=5 "Stock Initial"
 Q:i=6 "capacite d'un conteneur"
 Q:i=7 "taille d'un lot de lancement"
 Q:i=8 "cout de lancement"
 Q:i=9 "cout de stockage(%)"
 Q:i=10 "Valeur Std de Stock Mini"
 Q:i=11 "Valeur Std de Stock Maxi"
 
vdefart(i) 
 Q:i=1 " cochonium   "
 Q:i=2 $R(400)+50
 Q:i=3 $R(170)+2
 Q:i=4 $R(25)+1
 Q:i=5 $R(3)*1000
 Q:i=6 ($R(350)+1)\1
 Q:i=7 $R(6000)+10
 Q:i=8 170
 Q:i=9 $R(4)+1E-1
 Q:i=10 0
 Q:i=11 50000
 
 
 
INIART(GLO) 
 N I,V1,V2
 F I=1:1:11 S V1=$$libart(I) I '($D(@GLO@(V1))) S @GLO@(V1)=$$vdefart(I)
 I '($D(@GLO@("Etude"))) S @GLO@("Etude")=$$etude
 I '($D(@GLO@("Atelier"))) S @GLO@("Atelier")=$$atelier
 I '($D(@GLO@("Article"))) S @GLO@("Article")=$$article
 I '($D(@GLO@("Valeur Jauge"))) S @GLO@("Valeur Jauge")=$$valjg
 I '($D(@GLO@("Etat de cet article"))) S @GLO@("Etat de cet article")=$$etart
 Q
 
 
 
DEFATT N GLOB,GLODEFA
 S GLOB=etuat
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description de l'atelier"
 
 S NBC=10,NBFIXH=2,NBFIXB=2
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW5"
 S @GLODEFA@("FIXH",2,"LIB")="Atelier"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$atelier^%TXPSW5"
 S @GLODEFA@("FIXB",1,"LIB")="Etude atelier"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$etetat^%TXPSW5"
 S @GLODEFA@("FIXB",2,"LIB")="Valeur atelier"
 S @GLODEFA@("FIXB",2,"ROUCAL")="$$valat^%TXPSW5"
 
 S @GLODEFA@("ROULIB")="$$libdat^%TXPSW5"
 S @GLODEFA@("ROUDEF")="$$vdefat^%TXPSW5"
 S @GLODEFA@("ROUAFF")="$$libdat^%TXPSW5"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,5)
 K @(GLODEFA)
 Q
libdat(i) 
 Q:i=1 "Commentaire" Q:i=2 "Cout de lancement"
 Q:i=3 "Cout de l'heure de production Normale"
 Q:i=4 "Cout de l'heure de production Exceptionnelle"
 Q:i=5 "Nombre d'Heures Normales"
 
vdefat(i) 
 Q:i=1 "atelier simulation" Q:i=2 $R(150)+1 Q:i=3 $R(179)+1 Q:i=4 $R(250)+1 Q:i=5 $R(200)+1
valat() Q VLIMI
etetat() Q "Non encore activee"
 
 
 
INIATT(GLO) 
 N I,V1,V2
 F I=1:1:4 S V1=$$libdat(I) I '($D(@GLO@(V1))) S @GLO@(V1)=$$vdefat(I)
 I '($D(@GLO@("Etude"))) S @GLO@("Etude")=$$etude
 I '($D(@GLO@("Atelier"))) S @GLO@("Atelier")=$$atelier
 I '($D(@GLO@("Etude atelier"))) S @GLO@("Etude atelier")=$$etetat
 I '($D(@GLO@("Valeur atelier"))) S @GLO@("Valeur atelier")=$$valat
 Q
 
etude() Q ETUDE
atelier() Q ATELIER
article() Q ARTICLE
contr() Q CONTRAINTE

