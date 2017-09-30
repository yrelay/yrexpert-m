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

;%TXPPRIM^INT^1^59547,74033^0
%TXPPRIM ;;06:45 AM  11 Sep 1992; ; 03 Sep 92  6:22 PM
 
 
PUSHLIST(ARB,NOEUD,NOMLISTE,ELEMENT) 
 
 S @ARB@(NOEUD,"LISTE",NOMLISTE,ELEMENT)=""
 Q
PULLISTE(ARB,NOEUD,NOMLISTE,ELEMPREC,DERSOM) 
 
 ;;w !!!!
 N %ELEMENT,%PERE
 ;;w " pull liste noeud : ",NOEUD,"  ",ELEMPREC
 S %ELEMENT=$O(@ARB@(NOEUD,"LISTE",NOMLISTE,ELEMPREC))
 ;;i %ELEMENT'="" w " on a trouve ",%ELEMENT r *%xxx q %ELEMENT
 I %ELEMENT'="" Q %ELEMENT
 S %PERE=$$PERE^%QARBCON(ARB,NOEUD) I (%PERE="")!(%PERE=NOEUD) Q %ELEMENT
 
 S DERSOM=%PERE
 S %ELEMENT="" Q $$PULLISTE(ARB,%PERE,NOMLISTE,%ELEMENT,DERSOM)
 
BELOLISTE(ARB,NOEUD,NOMLISTE,ELEMENT) 
 
 
 N %ELEMPREC,%ELEMENT,%ib,stop,%SUCCES,DERSOM
 S DERSOM=NOEUD
 S %ELEMPREC="",%SUCCES=0 Q:ELEMENT="" %SUCCES
 F %ib=1:1 S %ELEMENT=$$PULLISTE(ARB,DERSOM,NOMLISTE,%ELEMPREC,.DERSOM) D test Q:stop=1  S %ELEMPREC=%ELEMENT
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
 N %N S %N=NOEUD
PULLM2 Q:$D(@ARB@(%N,"MATRICE",NOMMAT,X,Y)) @ARB@(%N,"MATRICE",NOMMAT,X,Y) S %N=$$PERE^%QARBCON(ARB,%N) Q:%N="" "" G PULLM2
 
 
 
 
 
PUSHVAL(ARB,NOEUD,NOMATTRI,INDICE,VALEUR) 
 S @ARB@(NOEUD,"ATTRIBUT",NOMATTRI,INDICE)=VALEUR
 Q
 
 
 
PULLVAL(ARB,NOEUD,NOMATTRI,INDICE) 
 N %N S %N=NOEUD
PULLV2 Q:$D(@ARB@(%N,"ATTRIBUT",NOMATTRI,INDICE)) @ARB@(%N,"ATTRIBUT",NOMATTRI,INDICE) S %N=$$PERE^%QARBCON(ARB,%N) Q:%N="" "" G PULLV2
 ;
 ;

