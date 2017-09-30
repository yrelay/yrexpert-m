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

;LKTXINU2^INT^1^59547,74868^0
LKTXINU2 W *
 
 
 
 
 
 
 
 
LNODE ;;|"A1"||
 ;;|"A2"||
 ;;|"A3"||
 ;;
 
INU ;;|"LKZPAR"|PAR^LKST1|
 ;;|"LKEX"|EXINU^LKTXINU2|
 ;;|"TABLEL","TRANSCOD"|TRCOD^LKST1|
 ;;|"TABLEL","HEADER"|HDR^LKST1|
 ;;|"TABLEL","VT"|VT^LKST1|
 ;;
EXINU ;;|1,0,"LIGNE.1","D"|1|
 ;;|1,0,"LIGNE.1","F"|48|
 ;;|1,0,"LIGNE.1","T",1|EXT|
 ;;|1,0,"LIGNE.1","T",2|MPARTIE^LKEXZ(" ",2,17)|
 ;;|1,0,"LIGNE.1","T",3|TRAN^LKTRAN("TRANSCOD")|
 ;;|1,0,"LIGNE.1","T",4|CON^LKTRAN|
 ;;|1,0,"LIGNE.1","T",5|KILLMV^LKEXZ|
 ;;|1,0,"LIGNE.1","T",6|INV^LKEXZ|
 ;;|1,0,"LIGNE.1","T",7|GROUPC^LKEXZ1(256)|
 ;;
 
 
INU1 ;;|"LKZPAR"|PARINU1^LKTXINU2|
 ;;|"LKEX"|EXINU1^LKTXINU2|
 ;;
PARINU1 ;;|EDGE|EDGE1^LKTXINU2|
 ;;|MODE|NOINC NOSTO|
 ;;
EDGE1(NIV,X,Y) 
 N A,B
 I X'="" Q 1-NIV
 Q 0-NIV
 
EXINU1 ;;|1,0,"%MARQUE","T",1|CST^LKEXZ("***GAMME***")|
 ;;|1,0,"NOM","T",1|POP^LKEXZ("RLP")|
 ;;|1,0,"NOM","T",1|EXTR^LKEXZ(1,4)|
 ;;|1,0,"NOM","T",2|ALPHA|
 ;;|1,0,"NUMERO.DU.RELEVE","T",1|EXTR^LKEXZ(1,4)|
 ;;|1,0,"NUMERO.DU.RELEVE","T",2|ALPHA|
 ;;|1,0,"DATE","T",1|EXTR^LKEXZ(5,14)|
 ;;|1,0,"DATE","T",2|A7I^LKEXZ|
 ;;|1,0,"NUMERO.DE.MACHINE","T",1|EXTR^LKEXZ(15,21)|
 ;;|1,0,"NUMERO.DE.MACHINE","T",2|ALPHA|
 ;;|1,0,"REFERENCE.FABRIQUEE","T",1|EXTR^LKEXZ(22,30)|
 ;;|1,0,"REFERENCE.FABRIQUEE","T",2|ALPHA|
 ;;|1,0,"NUMERO.EQUIPE","T",1|EXTR^LKEXZ(31,31)|
 ;;|1,0,"NUMERO.EQUIPE","T",2|ALPHA|
 ;;|1,0,"OPERATEUR","T",1|EXTR^LKEXZ(32,36)|
 ;;|1,0,"OPERATEUR","T",2|ALPHA|
 ;;|1,0,"EFFECTIF","T",1|EXTR^LKEXZ(37,38)|
 ;;|1,0,"EFFECTIF","T",2|NUM|
 ;;|1,0,"NUMERO.OUTILLAGE","T",1|EXTR^LKEXZ(39,42)|
 ;;|1,0,"NUMERO.OUTILLAGE","T",2|ALPHA|
 ;;|1,0,"MATIERE.A","T",1|EXTR^LKEXZ(43,44)|
 ;;|1,0,"MATIERE.A","T",2|ALPHA|
 ;;|1,0,"MATIERE.B.COEXTRUSION","T",1|EXTR^LKEXZ(45,46)|
 ;;|1,0,"MATIERE.B.COEXTRUSION","T",2|ALPHA|
 ;;|1,0,"LOT.MATIERE.A","T",1|EXTR^LKEXZ(47,56)|
 ;;|1,0,"LOT.MATIERE.A","T",2|ALPHA|
 ;;|1,0,"LOT.MATIERE.B","T",1|EXTR^LKEXZ(57,66)|
 ;;|1,0,"LOT.MATIERE.B","T",2|ALPHA|
 ;;|1,0,"TIRAGE","T",1|EXTR^LKEXZ(67,70)|
 ;;|1,0,"TIRAGE","T",2|NUM^LKEXZ(".",2)|
 ;;|1,0,"VITESSE.VIS","T",1|EXTR^LKEXZ(71,74)|
 ;;|1,0,"VITESSE.VIS","T",2|NUM^LKEXZ(".",2)|
 ;;|1,0,"VITESSE.DOSEUR","T",1|EXTR^LKEXZ(75,78)|
 ;;|1,0,"VITESSE.DOSEUR","T",2|NUM^LKEXZ(".",2)|
 ;;|1,0,"INTENSITE.A.COUPLE","T",1|EXTR^LKEXZ(79,80)|
 ;;|1,0,"INTENSITE.A.COUPLE","T",2|NUM|
 ;;|1,0,"TEMPERATURE.MASSE","T",1|EXTR^LKEXZ(81,83)|
 ;;|1,0,"TEMPERATURE.MASSE","T",2|NUM|
 ;;|1,0,"PRESSION.DE.MASSE","T",1|EXTR^LKEXZ(84,86)|
 ;;|1,0,"PRESSION.DE.MASSE","T",2|NUM|
 ;;|1,0,"VIDE.AVANT","T",1|EXTR^LKEXZ(87,89)|
 ;;|1,0,"VIDE.AVANT","T",2|NUM^LKEXZ(".",2)|
 ;;|1,0,"VIDE.ARRIERE","T",1|EXTR^LKEXZ(90,92)|
 ;;|1,0,"VIDE.ARRIERE","T",2|NUM^LKEXZ(".",2)|
 ;;|1,0,"FOURREAU.TEMPERATURE.1","T",1|EXTR^LKEXZ(93,95)|
 ;;|1,0,"FOURREAU.TEMPERATURE.1","T",2|NUM|
 ;;|1,0,"FOURREAU.TEMPERATURE.2","T",1|EXTR^LKEXZ(96,98)|
 ;;|1,0,"FOURREAU.TEMPERATURE.2","T",2|NUM|
 ;;|1,0,"FOURREAU.TEMPERATURE.3","T",1|EXTR^LKEXZ(99,101)|
 ;;|1,0,"FOURREAU.TEMPERATURE.3","T",2|NUM|
 ;;|1,0,"FOURREAU.TEMPERATURE.4","T",1|EXTR^LKEXZ(102,104)|
 ;;|1,0,"FOURREAU.TEMPERATURE.4","T",2|NUM|
 ;;|1,0,"FOURREAU.TEMPERATURE.5","T",1|EXTR^LKEXZ(105,107)|
 ;;|1,0,"FOURREAU.TEMPERATURE.5","T",2|NUM|
 ;;|1,0,"FOURREAU.TEMPERATURE.6","T",1|EXTR^LKEXZ(108,110)|
 ;;|1,0,"FOURREAU.TEMPERATURE.6","T",2|NUM|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.1","T",1|EXTR^LKEXZ(111,113)|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.1","T",2|NUM|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.2","T",1|EXTR^LKEXZ(114,116)|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.2","T",2|NUM|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.3","T",1|EXTR^LKEXZ(117,119)|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.3","T",2|NUM|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.4","T",1|EXTR^LKEXZ(120,122)|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.4","T",2|NUM|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.5","T",1|EXTR^LKEXZ(123,125)|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.5","T",2|NUM|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.6","T",1|EXTR^LKEXZ(126,128)|
 ;;|1,0,"OUTILLAGE.TEMPERATURE.6","T",2|NUM|
 ;;|1,0,"TEMPERATURE.VIS","T",1|EXTR^LKEXZ(129,131)|
 ;;|1,0,"TEMPERATURE.VIS","T",2|NUM|
 ;;|1,0,"TEMPERATURE.ATELIER","T",1|EXTR^LKEXZ(132,133)|
 ;;|1,0,"TEMPERATURE.ATELIER","T",2|NUM|
 ;;|1,0,"TEMPERATURE.EAU","T",1|EXTR^LKEXZ(134,136)|
 ;;|1,0,"TEMPERATURE.EAU","T",2|NUM|
 ;;|1,0,"TEMPERATURE.PROFIL","T",1|EXTR^LKEXZ(137,139)|
 ;;|1,0,"TEMPERATURE.PROFIL","T",2|NUM|
 ;;|1,0,"NOM.DE.L'ECHANTILLONNEUR","T",1|EXTR^LKEXZ(140,154)|
 ;;|1,0,"NOM.DE.L'ECHANTILLONNEUR","T",2|ALPHA|
 ;;|1,0,"LONGUEUR","T",1|EXTR^LKEXZ(155,158)|
 ;;|1,0,"LONGUEUR","T",2|NUM|
 ;;|1,0,"POIDS","T",1|EXTR^LKEXZ(159,162)|
 ;;|1,0,"POIDS","T",2|NUM|
 ;;|1,0,"NOM.BIS","T",1|EXTR^LKEXZ(163,177)|
 ;;|1,0,"NOM.BIS","T",2|ALPHA|
 ;;|1,0,"INCIDENT","T",1|EXTR^LKEXZ(178,184)|
 ;;|1,0,"INCIDENT","T",2|INCIDENT^LKTXINU2|
 ;;|1,0,"POIDS.AU.METRE","T",1|EXTR^LKEXZ(185,188)|
 ;;|1,0,"POIDS.AU.METRE","T",2|NUM|
 ;;|1,0,"DEBIT.EXTRUDE","T",1|EXTR^LKEXZ(189,192)|
 ;;|1,0,"DEBIT.EXTRUDE","T",2|NUM|
 ;;
 
 ;;|1,0,"ANNEE","T",1|EXTR^LKEXZ(5,6)|
 ;;|1,0,"MOIS","T",1|EXTR^LKEXZ(7,8)|
 ;;|1,0,"JOUR","T",1|EXTR^LKEXZ(9,10)|
 ;;|1,0,"HEURE","T",1|EXTR^LKEXZ(11,12)|
 ;;|1,0,"MINUTE","T",1|EXTR^LKEXZ(13,14)|
 ;;|1,0,"REMISE.EN.MARCHE","T",1|EXTR^LKEXZ(178,178)|
 ;;|1,0,"REMISE.EN.MARCHE","T",2|NUM|
 ;;|1,0,"REGLAGE","T",1|EXTR^LKEXZ(179,179)|
 ;;|1,0,"REGLAGE","T",2|NUM|
 ;;|1,0,"PANNE.MACHINE","T",1|EXTR^LKEXZ(180,180)|
 ;;|1,0,"PANNE.MACHINE","T",2|NUM|
 ;;|1,0,"CHANGEMENT.OUTILLAGE","T",1|EXTR^LKEXZ(181,181)|
 ;;|1,0,"CHANGEMENT.OUTILLAGE","T",2|NUM|
 ;;|1,0,"ESSAIS","T",1|EXTR^LKEXZ(182,182)|
 ;;|1,0,"ESSAIS","T",2|NUM|
 ;;|1,0,"MICRO.COUPURE","T",1|EXTR^LKEXZ(183,183)|
 ;;|1,0,"MICRO.COUPURE","T",2|NUM|
 ;;|1,0,"BRULAGE.MATIERE","T",1|EXTR^LKEXZ(184,184)|
 ;;|1,0,"BRULAGE.MATIERE","T",2|NUM|
 
INCIDENT(V) 
 N I,J,A
 S A=$P($T(INCID),";;",2)
 S I=1
 F J=1:1:$L(A,"/") D INCID1
 I I=1 S V(1)="RAS"
 S V=""
 Q 0
INCID1 I $E(V,J,J)=1 S V(I)=$P(A,"/",J),I=I+1
 Q
INCID ;;REMISE.EN.MARCHE/REGLAGE/PANNE.MACHINE/CHANGEMENT.OUTILLAGE/ESSAIS/MICRO.COUPURE/BRULAGE.MATIERE
 
 
INU2 ;;|"LKZPAR"|PARINU2^LKTXINU2|
 ;;|"TABATT"|EXINU1^LKTXINU2|
 ;;|"TABLEL","VT"|VT2^LKTXINU2|
 ;;|"TABLEL","REP"|REP^LKTXINU2|
 ;;
 
VT2 ;;|"ENT"|INOVAC|
 ;;
 
REP ;;|"GAMME"|MOZ|
 ;;|"OPERATION"|MOZOP|
 ;;|"ARTICLE"|ARTICLE|
 ;;|"AG"|GAMME.MOZART|
 ;;|"GO"|OPERATION.MOZART|
 ;;
PARINU2 ;;|EDGE|EDGERQ^LKTXINU2|
 ;;|LAST|LASTRQ^LKTXINU2|
 ;;|MODE|NOINC |
 ;;
 
EDGERQ(NIV,X,Y) 
 I X="%MARQUE" Q 1
 Q 0
LASTRQ(NIV,X,Y) 
 I Y="" Q -1
 I Y="%MARQUE" Q -1
 Q 0

