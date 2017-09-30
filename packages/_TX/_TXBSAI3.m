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

;%TXBSAI3^INT^1^59547,74031^0
%TXBSAI3 ;;04:32 PM  5 Oct 1993; ; 10 Mar 93  9:28 AM
 
 
 
 
 
 
 
 
DEFCONTR(CNTRA) 
 N GLOB,GLODEFA,i,NBC,NBFIXH,NBFIXB,TITRE
 
 S GLOB=$$TEMP^%SGUTIL
 D INIART(GLOB)
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description du contrat"
 
 S NBC=10,NBFIXH=4,NBFIXB=0
 W /WOPEN(1,1,78,NBC+10)
 
 W /CLR
 
 S @GLODEFA@("FIXH",2,"LIB")="Article"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$art^%TXBSAI3"
 S @GLODEFA@("FIXH",3,"LIB")="Fournisseur"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$frn^%TXBSAI3"
 S @GLODEFA@("FIXH",1,"LIB")="Numero de contrat"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$contr^%TXBSAI3"
 S @GLODEFA@("FIXH",4,"LIB")=" "
 S @GLODEFA@("FIXH",4,"ROUCAL")="$$blanc^%TXBSAI3"
 
 S @GLODEFA@("ROULIB")="$$libart^%TXBSAI3"
 S @GLODEFA@("ROUDEF")="$$vdefart^%TXBSAI3"
 S @GLODEFA@("ROUAFF")="$$affi^%TXBSAI3"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,8)
 K @(GLODEFA)
 
 F i=1:1:8 S sto=$$libart(i) I @GLOB@(sto)'="" D PA^%QSGESTI("CONTRAT",CNTRA,$P(sto,"/"),@GLOB@(sto),$P(sto,"/",2))
 K @(GLOB)
 W /WCLOSE
 Q
 
 
libart(i) 
 Q:i=1 "PRIX.UNITAIRE/1"
 Q:i=2 "PRIX.TOTAL/1"
 Q:i=3 "ASSURANCE.QUALITE.FOURNISSEUR/1"
 Q:i=4 "STOCK.MINI.CHEZ.FOURNISSEUR/1"
 Q:i=5 "QUANTITE.CONTRACTUELLE.TOTALE/1"
 Q:i=6 "QUANTITE.LIVREE.A.CE.JOUR/1"
 Q:i=7 "NOMBRE.MAXI.DE.LIVRAISONS/1"
 Q:i=8 "DELAI.MOYEN.APPROVISIONNEMENT/1"
 
 
affi(i) 
 Q:i=1 "prix unitaire"
 Q:i=2 "prix total"
 Q:i=3 "assurance qualite fournisseur"
 Q:i=4 "stock mini chez fournisseur"
 Q:i=5 "quantite contractuelle totale"
 Q:i=6 "quantite livree a ce jour"
 Q:i=7 "nombre maxi de livraisons"
 Q:i=8 "delai moyen d'approvisionnement"
 
vdefart(i) 
 N STO S STO=$$libart(i)
 Q $$^%QSCALIN("CONTRAT",CNTRA,$P(STO,"/"),$P(STO,"/",2))
 
 
 
INIART(GLO) 
 N I,V1,V2
 F I=1:1:8 S V1=$$libart(I) I '($D(@GLO@(V1))) S @GLO@(V1)=$$vdefart(I)
 I '($D(@GLO@("Article"))) S @GLO@("Article")=$$art
 I '($D(@GLO@("Fournisseur"))) S @GLO@("Fournisseur")=$$frn
 I '($D(@GLO@("Numero de contrat"))) S @GLO@("Numero de contrat")=$$contr
 Q
 
art() Q $P(CNTRA,",")
frn() Q $$^%QSCALVA("CONTRAT",CNTRA,"FOURNISSEUR.RETENU")
contr() Q $P(CNTRA,",",2)
blanc() Q " "
 ;

