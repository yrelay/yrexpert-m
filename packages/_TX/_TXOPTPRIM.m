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

;%TXOPTPRIM^INT^1^59547,74032^0
%TXOPTPRIM ;;08:25 PM  26 May 1992
 
 
PUSHLIST(ARB,NOEUD,NOMLISTE,ELEMENT) 
 
 S @ARB@(NOEUD,"LISTE",NOMLISTE,ELEMENT)=""
 Q
PULLISTE(ARB,NOEUD,NOMLISTE,ELEMPREC) 
 
 N %ELEMENT,%PERE
 S %ELEMENT=$O(@ARB@(NOEUD,"LISTE",NOMLISTE,ELEMPREC))
 I %ELEMENT'="" Q %ELEMENT
 S %PERE=$$PERE^%QARBCON(ARB,NOEUD) I (%PERE="")!(%PERE=NOEUD) Q %ELEMENT
 Q $$PULLISTE(ARB,%PERE,NOMLISTE,ELEMPREC)
 
BELOLISTE(ARB,NOEUD,NOMLISTE,ELEMENT) 
 
 N %ELEMPREC,%ELEMENT,%ib,stop,%SUCCES
 S %ELEMPREC="",%SUCCES=0
 F %ib=1:1 S %ELEMENT=$$PULLISTE(ARB,NOEUD,NOMLISTE,%ELEMPREC) D test Q:stop=1  S %ELEMPREC=%ELEMENT
 Q %SUCCES
test 
 I %ELEMENT="" S stop=1 Q
 I %ELEMENT=ELEMENT S stop=1,%SUCCES=1 Q
 S stop=0
 Q
 
 
PUSHMAT(ARB,NOEUD,NOMMAT,X,Y,VALEUR) 
 
 S @ARB@(NOEUD,"MATRICE",NOMMAT,X,Y)=VALEUR
 Q
PULLMAT(ARB,NOEUD,NOMMAT,X,Y) 
 
 N %ELEMENT,%PERE
 I $D(@ARB@(NOEUD,"MATRICE",NOMMAT,X,Y)) S %ELEMENT=@ARB@(NOEUD,"MATRICE",NOMMAT,X,Y) Q %ELEMENT
 S %PERE=$$PERE^%QARBCON(ARB,NOEUD) I (%PERE="")!(%PERE=NOEUD) Q ""
 Q $$PULLMAT(ARB,%PERE,NOMMAT,X,Y)
 
 
PUSHVAL(ARB,NOEUD,NOMATTRI,INDICE,VALEUR) 
 
 S @ARB@(NOEUD,"ATTRIBUT",NOMATTRI,INDICE)=VALEUR
 Q
PULLVAL(ARB,NOEUD,NOMATTRI,INDICE) 
 
 
 N %ELEMENT,%PERE
 I $D(@ARB@(NOEUD,"ATTRIBUT",NOMATTRI,INDICE)) S %ELEMENT=@ARB@(NOEUD,"ATTRIBUT",NOMATTRI,INDICE) Q %ELEMENT
 S %PERE=$$PERE^%QARBCON(ARB,NOEUD) I (%PERE="")!(%PERE=NOEUD) Q ""
 Q $$PULLVAL(ARB,%PERE,NOMATTRI,INDICE)
 ;
 ;

