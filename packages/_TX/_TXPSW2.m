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

;%TXPSW2^INT^1^59547,74033^0
%TXPSW2 ;;05:10 PM  29 Apr 1993; ; 10 Mar 93  9:28 AM
 
 
 
 
 
DEFETU 
 N GLOB,GLODEFA
 S GLOB="^[QUI]etu(ETUDE)"
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description de l'Etude"
 
 S NBC=12,NBFIXH=1,NBFIXB=2
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW2"
 S @GLODEFA@("FIXB",1,"LIB")="Etat de l'etude"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$etetu^%TXPSW2"
 S @GLODEFA@("FIXB",2,"LIB")="Valeur"
 S @GLODEFA@("FIXB",2,"ROUCAL")="$$valetu^%TXPSW2"
 
 S @GLODEFA@("ROULIB")="$$libetu^%TXPSW2"
 S @GLODEFA@("ROUDEF")="$$vdefetu^%TXPSW2"
 S @GLODEFA@("ROUAFF")="$$libetu^%TXPSW2"
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
 Q:i=1 "YXP"
 Q:i=2 "Mise au Point"
 Q:i=3 "Tests generaux TXP1"
 Q:i=4 $$DATEX^%QMDATE($H)
 Q:i=5 $$DATEX^%QMDATE($H)
 Q:i=6 23
 Q:i=7 "SEMAINES"
 Q:i=8 $$DATEX^%QMDATE($H)
 Q:i=9 "Couvrir la periode suivante"
 
 
etetu() Q "Non encore activee"
 
valetu() Q $S($D(@etu@("Valeur")):@etu@("Valeur"),1:VLIMI)
 
 
 
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
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW2"
 S @GLODEFA@("FIXH",2,"LIB")="Atelier"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$atelier^%TXPSW2"
 S @GLODEFA@("FIXH",3,"LIB")="Article"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$article^%TXPSW2"
 S @GLODEFA@("FIXB",1,"LIB")="Valeur Jauge"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$valjg^%TXPSW2"
 S @GLODEFA@("FIXB",2,"LIB")="Etat de cet article"
 S @GLODEFA@("FIXB",2,"ROUCAL")="$$etart^%TXPSW2"
 
 S @GLODEFA@("ROULIB")="$$libart^%TXPSW2"
 S @GLODEFA@("ROUDEF")="$$vdefart^%TXPSW2"
 S @GLODEFA@("ROUAFF")="$$libart^%TXPSW2"
 
 
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,12)
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
 Q:i=12 "Etat initial"
 
vdefart(i) 
 Q:i=1 "   "
 Q:i=2 "95.8"
 Q:i=3 "17"
 Q:i=4 "  "
 Q:i=5 0
 Q:i=6 250
 Q:i=7 3000
 Q:i=8 170
 Q:i=9 1
 Q:i=10 0
 Q:i=11 100000
 
 Q:i=12 "vide"
 
 
 
INIART(GLO) 
 N I,V1,V2
 
 
 F I=1:1:12 S V1=$$libart(I) I '($D(@GLO@(V1))) S @GLO@(V1)=$$vdefart(I)
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
 
 S NBC=12,NBFIXH=2,NBFIXB=2
 
 S @GLODEFA@("FIXH",1,"LIB")="Etude"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$etude^%TXPSW2"
 S @GLODEFA@("FIXH",2,"LIB")="Atelier"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$atelier^%TXPSW2"
 S @GLODEFA@("FIXB",1,"LIB")="Etude atelier"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$etetat^%TXPSW2"
 S @GLODEFA@("FIXB",2,"LIB")="Valeur Atelier"
 S @GLODEFA@("FIXB",2,"ROUCAL")="$$valat^%TXPSW2"
 
 S @GLODEFA@("ROULIB")="$$libdat^%TXPSW2"
 S @GLODEFA@("ROUDEF")="$$vdefat^%TXPSW2"
 S @GLODEFA@("ROUAFF")="$$libdat^%TXPSW2"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,6)
 K @(GLODEFA)
 Q
libdat(i) 
 Q:i=1 "Commentaire" Q:i=2 "Cout de lancement"
 Q:i=3 "Cout de l'heure de production Normale"
 Q:i=4 "Cout de l'heure de production Exceptionnelle"
 Q:i=5 "Nombre d'Heures Normales"
 Q:i=6 "Nombre de Periodes"
 
vdefat(i) 
 Q:i=1 "atelier standard" Q:i=2 150 Q:i=3 179 Q:i=4 250 Q:i=5 200 Q:i=6 @etu@("Nombre de Periodes")
valat() Q $S($D(@etuat@("Valeur Atelier")):@etuat@("Valeur Atelier"),1:VLIMI)
etetat() Q "Non encore activee"
 
 
 
INIATT(GLO) 
 N I,V1,V2
 F I=1:1:6 S V1=$$libdat(I) I '($D(@GLO@(V1))) S @GLO@(V1)=$$vdefat(I)
 I '($D(@GLO@("Etude"))) S @GLO@("Etude")=$$etude
 I '($D(@GLO@("Atelier"))) S @GLO@("Atelier")=$$atelier
 I '($D(@GLO@("Etude atelier"))) S @GLO@("Etude atelier")=$$etetat
 I '($D(@GLO@("Valeur atelier"))) S @GLO@("Valeur atelier")=$$valat
 Q
 
etude() Q ETUDE
atelier() Q ATELIER
article() Q ARTICLE
contr() Q CONTRAINTE

