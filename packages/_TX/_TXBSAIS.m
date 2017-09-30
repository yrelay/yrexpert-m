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

;%TXBSAIS^INT^1^59547,74031^0
%TXBSAIS ;
 
 
 
 
 
 
 
DEFART(ART) 
 N GLOB,GLODEFA,i,NBC,NBFIXH,NBFIXB,TITRE
 
 S GLOB=$$TEMP^%SGUTIL
 D INIART(GLOB)
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description de l'article"
 
 S NBC=10,NBFIXH=3,NBFIXB=2
 W /WOPEN(1,1,78,NBC+10)
 
 W /CLR
 
 S @GLODEFA@("FIXH",1,"LIB")="Societe"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$societe^%TXBSAIS"
 S @GLODEFA@("FIXH",2,"LIB")="Service"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$service^%TXBSAIS"
 S @GLODEFA@("FIXH",3,"LIB")="Article"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$ARTICLE^%TXBSAIS"
 S @GLODEFA@("FIXB",1,"LIB")="Mode d'Appro"
 S @GLODEFA@("FIXB",1,"ROUCAL")="$$modappro^%TXBSAIS"
 S @GLODEFA@("FIXB",2,"LIB")="En cours Non Livre"
 S @GLODEFA@("FIXB",2,"ROUCAL")="$$encourl^%TXBSAIS"
 
 S @GLODEFA@("ROULIB")="$$libart^%TXBSAIS"
 S @GLODEFA@("ROUDEF")="$$vdefart^%TXBSAIS"
 S @GLODEFA@("ROUAFF")="$$affi^%TXBSAIS"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,11)
 K @(GLODEFA)
 
 F i=1:1:12 S sto=$$libart(i) I @GLOB@(sto)'="" D PA^%QSGESTI("ARTICLE",ART,$P(sto,"/"),@GLOB@(sto),$P(sto,"/",2))
 K @(GLOB)
 W /WCLOSE
 Q
modappro() Q "J.A.T"
encourl() Q "000"
 
 
libart(i) 
 Q:i=1 "DESIGNATION/1"
 Q:i=2 "DELAI.MOYEN.APPROVISIONNEMENT/1"
 Q:i=3 "DERNIER.PRIX.D.ACHAT/1"
 Q:i=4 "STATUT.ASSURANCE.QUALITE.FOURNISSEUR/1"
 Q:i=5 "LOT.MOYEN.LIVRE/1"
 Q:i=6 "DERNIER.FOURNISSEUR/1"
 Q:i=7 "COMMENTAIRE/1"
 Q:i=8 "COMMENTAIRE/2"
 Q:i=9 "COMMENTAIRE/3"
 Q:i=10 "COMMENTAIRE/4"
 Q:i=11 "COMMENTAIRE/5"
 Q:i=12 "STOCK.PHYSIQUE/1"
 
 
affi(i) 
 Q:i=1 "designation"
 Q:i=2 "delai moyen d'approvisionnement"
 Q:i=3 "dernier prix d'achat"
 Q:i=4 "statut assurance qualite fournisseur"
 Q:i=5 "lot moyen livre"
 Q:i=6 "dernier fournisseur"
 Q:i=7 "commentaire"
 Q:i=8 "commentaire"
 Q:i=9 "commentaire"
 Q:i=10 "commentaire"
 Q:i=11 "commentaire"
 Q:i=12 "stock physique"
 
vdefart(i) 
 N STO S STO=$$libart(i)
 Q $$^%QSCALIN("ARTICLE",ART,$P(STO,"/"),$P(STO,"/",2))
 
 
 
INIART(GLO) 
 N I,V1,V2
 
 
 F I=1:1:12 S V1=$$libart(I) I '($D(@GLO@(V1))) S @GLO@(V1)=$$vdefart(I)
 I '($D(@GLO@("societe"))) S @GLO@("societe")=$$societe
 I '($D(@GLO@("service"))) S @GLO@("service")=$$service
 I '($D(@GLO@("Article"))) S @GLO@("Article")=$$ARTICLE
 I '($D(@GLO@("Mode Appro"))) S @GLO@("Mode Appro")=$$modappro
 I '($D(@GLO@("En cours livraison"))) S @GLO@("En cours livraison")=$$encourl
 Q
 
 
societe() Q $$^%QSCALIN("CONSTANTES","DESCRIPTION.SOCIETE","SOCIETE",1)
service() Q $$^%QSCALIN("CONSTANTES","DESCRIPTION.SOCIETE","SERVICE",1)
ARTICLE() Q ART

