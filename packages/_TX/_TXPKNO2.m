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

;%TXPKNO2^INT^1^59547,74032^0
%TXPKNO2 ;;04:49 PM  22 Sep 1993; 08 Jan 93  4:47 PM ; 30 Sep 93  2:03 PM
 
INIETU 
 S @etu@("Etude")=ETUDE
 S @etu@("Etat de l'etude")="Non encore activee"
 S @etu@("Valeur")=VLIMI
 S @etu@("Entreprise")="YXP"
 S @etu@("Projet")="Mise au Point"
 S @etu@("Commentaire")="Tests generaux TXP1"
 S @etu@("Date de Creation")=$$DATEX^%QMDATE($H)
 S @etu@("Date de Derniere Mise a Jour")=$$DATEX^%QMDATE($H)
 S @etu@("Nombre de Periodes")=NBPERIOD
 S @etu@("Periodes exprimees en")="SEMAINES"
 S @etu@("Date de Depart")=$$DATE^%QMDATE
 S @etu@("Hypothese de Production")="Couvrir la periode suivante"
 Q
 
 
INIATE 
 S @etuat@("Etude")=ETUDE
 S @etuat@("Atelier")=ATELIER
 S @etuat@("Etude atelier")="Non encore activee"
 S @etuat@("Valeur atelier")=VLIMI
 S @etuat@("Commentaire")=$$GET(REPATE,ATELIER,"COMMENTAIRE","atelier standard")
 S @etuat@("Cout de lancement")=$$GET(REPATE,ATELIER,"COUT.DE.LANCEMENT",150)
 S @etuat@("Cout de l'heure de production Normale")=$$GET(REPATE,ATELIER,"COUT.DE.L.HEURE.PRODUCTION.NORMALE",179)
 S @etuat@("Cout de l'heure de production Exceptionnelle")=$$GET(REPATE,ATELIER,"COUT.DE.L.HEURE.PRODUCTION.EXCEPTIONNELLE",250)
 S @etuat@("Nombre d'Heures Normales")=$$GET(REPATE,ATELIER,"NOMBRE.D.HEURES.NORMALES",200)
 Q
 
 
INIART 
 S @etuata@("Etude")=ETUDE
 S @etuata@("Atelier")=ATELIER
 S @etuata@("Article")=ARTICLE
 S @etuata@("Valeur Jauge")=VLIMI
 S @etuata@("Etat de cet article")="Non Planifie"
 S @etuata@("Commentaire")=$$GET(REPART,ARTICLE,"COMMENTAIRE","   ")
 S @etuata@("Quantite moyenne horaire")=$$GET(REPART,ARTICLE,"QUANTITE.FABRIQUEE.PAR.HEURE","95.8")
 S @etuata@("Prix de Revient")=$$GET(REPART,ARTICLE,"PRIX.DE.REVIENT.COMMERCIAL","17")
 S @etuata@("Poids")=$$GET(REPART,ARTICLE,"POIDS"," ")
 
 S VAL=$$^%QSCALIN(REPATE,ATELIER,"STOCK.DISPONIBLE",ARTICLE)+0
 S @etuata@("Stock Initial")=VAL
 S @etuata@("capacite d'un conteneur")=$$GET(REPART,ARTICLE,"CAPACITE.D.UN.CONTENEUR",250)
 S @etuata@("taille d'un lot de lancement")=$$GET(REPART,ARTICLE,"TAILLE.LOT.DE.LANCEMENT",3000)
 S @etuata@("cout de lancement")=$$GET(REPART,ARTICLE,"COUT.DE.LANCEMENT",170)
 S @etuata@("cout de stockage(%)")=$$GET(REPART,ARTICLE,"COUT.DE.STOCKAGE",1)
 S @etuata@("Valeur Std de Stock Mini")=$$GET(REPART,ARTICLE,"VALEUR.STANDARD.STOCK.MINI",0)
 S @etuata@("Valeur Std de Stock Maxi")=$$GET(REPART,ARTICLE,"VALEUR.STANDARD.STOCK.MAXI",100000)
 
 I @etuata@("capacite d'un conteneur")>@etuata@("taille d'un lot de lancement") S @etuata@("capacite d'un conteneur")=250,@etuata@("taille d'un lot de lancement")=3000
 Q
 
GET(REP,IND,ATT,VDEF) 
 N VAL
 S VAL=$$^%QSCALIN(REP,IND,ATT,1)
 I VAL'="" Q $S(VAL>0:VAL,1:0)
 Q VDEF

