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

;TOP0PTLR^INT^1^59547,74874^0
TOP0PTLR ;
 
 
 
 
 
 
POS ;;CRT#1,21,26;ALLIAGE#1,27,33;NOMBRE.DE.FACE.DE.PLACAGE#1,45,46;POURCENTAGE.DE.PLACAGE#1,47,48;ALLIAGE.DE.COUVERTURE#1,49,56,CHG;ETAT#1,57,62;ARC#1,81,95
 ;;CLIENT.A.FACTURER#2,64,93;EPAISSEUR.NOMINALE#3,24,29,DEC;LARGEUR.NOMINALE#3,30,36,DEC;LONGUEUR.NOMINALE#3,37,42,DEC;DIAGONALE.NOMINALE#3,50,53,DEC;ADRESSE.FACTURATION#3,63,95;DATE.AU.PLUS.TOT#5,96,100,AS;DATE.AU.PLUS.TARD#3,96,100,AS
 ;;DIAMETRE.INTERIEUR.NOMINAL#3,43,45,DEC;DIAMETRE.EXTERIEUR.NOMINAL#3,46,49,DEC;POIDS.UNITAIRE.NOMINAL#3,54,58,DEC
 ;;EPAISSEUR.MAXI#5,24,29,DEC;LARGEUR.MAXI#5,30,36,DEC;LONGUEUR.MAXI#5,37,42,DEC;DIAGONALE.MAXI#5,50,53,DEC;DIAMETRE.INTERIEUR.MAXI#5,43,45,DEC;DIAMETRE.EXTERIEUR.MAXI#5,46,49,DEC;POIDS.UNITAIRE.MAXI#5,56,59,DEC
 ;;EPAISSEUR.MINI#7,24,29,DEC;LARGEUR.MINI#7,30,36,DEC;LONGUEUR.MINI#7,37,42,DEC;DIAGONALE.MINI#7,50,53,DEC;DIAMETRE.INTERIEUR.MINI#7,43,45,DEC;DIAMETRE.EXTERIEUR.MINI#7,46,49,DEC;POIDS.UNITAIRE.MINI#7,56,59,DEC
 ;;EPAISSEUR.VISEE#8,24,29,DEC;LARGEUR.VISEE#8,30,36,DEC;LONGUEUR.VISEE#8,37,42,DEC;DIAGONALE.VISEE#8,50,53,DEC;DIAMETRE.INTERIEUR.VISE#8,43,45,DEC;DIAMETRE.EXTERIEUR.VISE#8,43,46,DEC;POIDS.UNITAIRE.VISE#8,53,56,DEC
 ;;VILLE.PAYS.FACTURATION#4,63,91
 ;;CLIENT.DESTINATAIRE#5,63,91;ADRESSE.LIVRAISON#6,63,91;VILLE.PAYS.LIVRAISON#7,63,91;POIDS.COMMANDE#8,62,67,DEC;POIDS.MAXIMAL#8,68,73,DEC;POIDS.MINIMAL#8,74,79,DEC;QUANTITE#9,65,70;CODE.NORME.1#11,30,32
 ;;CODE.NORME.2#11,33,35;REFERENCE.COMMANDE.CLIENT#16,21,33;DOCUMENT#13,21,67;NUMERO.CLIENT#8,86,91;NUMERO.PRODUIT#8,92,98
 ;;QUANTITE.MAXIMALE#9,71,76;QUANTITE.MINIMALE#9,77,82;FAMILLE#7,96,100;PHE#4,92,95;CODE.PAYS.DESTINATAIRE#12,62,68;CODE.HABILLAGE#11,55,57;POIDS.COLIS#11,58,62;FORMAT.PLATEAU#9,25,26;LONGUEUR.PLATEAU#9,28,31,DEFPL
 ;;ALLIAGE.REALISE#1,36,42,CHG;ETAT.REALISE#1,62,67
 ;;SCALPAGE#9,40,43;QUALITE#9,47,47;RECHAUFFAGE#9,61,62;CODE.EMBALLAGE#11,51,54
 ;;RECEPTION#11,37,40;CODE.DE.QUALITE#11,42,44
 ;;CODE.DE.QUALITE.CLAIR#12,21,67
 ;;DOCUMENT.1#14,21,67;DOCUMENT.2#15,21,67;DOCUMENT#13,21,67;DOCUMENT.3#16,34,67

