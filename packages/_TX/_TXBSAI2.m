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

;%TXBSAI2^INT^1^59547,74031^0
%TXBSAI2 ;;10:05 AM  11 Oct 1993; ; 10 Mar 93  9:28 AM
 
 
 
 
 
 
 
DEFFRN(FRN) 
 N GLOB,GLODEFA,i,NBC,NBFIXH,NBFIXB,TITRE
 
 S GLOB=$$TEMP^%SGUTIL
 D INIFRN(GLOB)
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE="Description du fournisseur"
 
 S NBC=10,NBFIXH=1,NBFIXB=0
 W /WOPEN(1,1,78,NBC+10)
 
 W /CLR
 
 S @GLODEFA@("FIXH",1,"LIB")="NOM"
 S @GLODEFA@("FIXH",1,"ROUCAL")="$$FRN^%TXBSAI2"
 
 S @GLODEFA@("ROULIB")="$$libart^%TXBSAI2"
 S @GLODEFA@("ROUDEF")="$$vdefart^%TXBSAI2"
 S @GLODEFA@("ROUAFF")="$$affi^%TXBSAI2"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,9)
 K @(GLODEFA)
 
 F i=1:1:7 S sto=$$libart(i) I @GLOB@(sto)'="" D PA^%QSGESTI("FOURNISSEUR",FRN,$P(sto,"/"),@GLOB@(sto),$P(sto,"/",2))
 K @(GLOB)
 W /WCLOSE
 Q
 
 
libart(i) 
 Q:i=1 "ADRESSE/1"
 Q:i=2 "ADRESSE/2"
 Q:i=3 "ADRESSE/3"
 Q:i=4 "ADRESSE/4"
 Q:i=5 "TELEPHONE/1"
 Q:i=6 "TELECOPIE/1"
 Q:i=7 "TELEX/1"
 Q:i=8 "INTERLOCUTEUR/1"
 Q:i=9 "POSTE.INTERLOCUTEUR/1"
 
 
affi(i) 
 Q:i=1 "adresse"
 Q:i=2 "     - "
 Q:i=3 "     - "
 Q:i=4 "     - "
 Q:i=5 "numero de telephone"
 Q:i=6 "telecopie"
 Q:i=7 "telex"
 Q:i=8 "interlocuteur"
 Q:i=9 "numero de poste"
 
vdefart(i) 
 N STO S STO=$$libart(i)
 Q $$^%QSCALIN("FOURNISSEUR",FRN,$P(STO,"/"),$P(STO,"/",2))
 
 
 
INIFRN(GLO) 
 N I,V1,V2
 F I=1:1:6 S V1=$$libart(I) I '($D(@GLO@(V1))) S @GLO@(V1)=$$vdefart(I)
 I '($D(@GLO@("Nom"))) S @GLO@("Nom")=$$FRN
 Q
 
 
FRN() Q FRN

