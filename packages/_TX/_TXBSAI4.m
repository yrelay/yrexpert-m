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

;%TXBSAI4^INT^1^59547,74031^0
%TXBSAI4 ;;04:10 PM  7 Oct 1993; ; 10 Mar 93  9:28 AM
 
 
 
 
 
 
 
 
DEFCOMM(COMM) 
 N GLOB,GLODEFA,i,NBC,NBFIXH,NBFIXB,TITRE
 
 S GLOB=$$TEMP^%SGUTIL
 D INIART(GLOB)
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description de la commande"
 
 S NBC=10,NBFIXH=5,NBFIXB=0
 W /WOPEN(1,1,78,NBC+10)
 
 
 S @GLODEFA@("FIXH",1,"LIB")="Numero de commande"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$comm^%TXBSAI4"
 S @GLODEFA@("FIXH",2,"LIB")="Article"
 S @GLODEFA@("FIXH",2,"ROUCAL")="$$art^%TXBSAI4"
 S @GLODEFA@("FIXH",3,"LIB")="Fournisseur"
 S @GLODEFA@("FIXH",3,"ROUCAL")="$$frn^%TXBSAI4"
 S @GLODEFA@("FIXH",4,"LIB")="Numero de contrat"
 S @GLODEFA@("FIXH",4,"ROUCAL")="$$contr^%TXBSAI4"
 S @GLODEFA@("FIXH",5,"LIB")=" "
 S @GLODEFA@("FIXH",5,"ROUCAL")="$$blanc^%TXBSAI4"
 
 S @GLODEFA@("ROULIB")="$$libart^%TXBSAI4"
 S @GLODEFA@("ROUDEF")="$$vdefart^%TXBSAI4"
 S @GLODEFA@("ROUAFF")="$$affi^%TXBSAI4"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,4)
 K @(GLODEFA)
 
 F i=1:1:4 S sto=$$libart(i) I @GLOB@(sto)'="" D PA^%QSGESTI("COMMANDE",COMM,$P(sto,"/"),@GLOB@(sto),$P(sto,"/",2))
 K @(GLOB)
 W /WCLOSE
 Q
 
 
libart(i) 
 Q:i=3 "PRIX.UNITAIRE/1"
 Q:i=4 "PRIX.TOTAL/1"
 Q:i=1 "QUANTITE/1"
 Q:i=2 "DATE.DEMANDEE/1"
 
 
affi(i) 
 Q:i=3 "prix unitaire"
 Q:i=4 "prix total"
 Q:i=1 "quantite "
 Q:i=2 "date demandee"
 
vdefart(i) 
 N STO S STO=$$libart(i)
 Q $$^%QSCALIN("COMMANDE",COMM,$P(STO,"/"),$P(STO,"/",2))
 
 
 
INIART(GLO) 
 N I,V1,V2
 F I=1:1:4 S V1=$$libart(I) I '($D(@GLO@(V1))) S @GLO@(V1)=$$vdefart(I)
 I '($D(@GLO@("Article"))) S @GLO@("Article")=$$art
 I '($D(@GLO@("Fournisseur"))) S @GLO@("Fournisseur")=$$frn
 I '($D(@GLO@("Numero de contrat"))) S @GLO@("Numero de contrat")=$$contr
 I '($D(@GLO@("Numero de commande"))) S @GLO@("Numero de commande")=$$comm
 Q
 
art() Q $P(COMM,",")
frn() Q $$^%QSCALVA("CONTRAT",$P(COMM,",",1,2),"FOURNISSEUR.RETENU")
contr() Q $P(COMM,",",2)
comm() Q $P(COMM,",",3)
blanc() Q " "
 ;

