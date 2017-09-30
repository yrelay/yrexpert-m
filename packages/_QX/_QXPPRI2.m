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

;%QXPPRI2^INT^1^59547,73887^0
%QXPPRI2 ;;03:17 PM  21 Jul 1992; ; 21 Jul 92  3:38 PM
 
 
 
 
 
SVMATI(ETU,NOEUD,NOMMAT,X,Y,I) 
 N %ELEMENT,%PERE,NDC,ARB,ARBETU,NI,VOID,SUIV
 S ARB=$$STO^%QXPPRIM(ETU),ARBETU=$$ARBETU^%QXPPRIM(ETU)
 S VOID=$$TEMP^%SGUTIL
 S SUIV=$$TEMP^%SGUTIL
 S NDC=NOEUD,NI=I
NXT S NI=$O(@ARB@(NDC,"MATRICE",NOMMAT,X,Y,NI)) G:NI="" NXTM
 I $D(@VOID@(NI)) G NXT
 I @ARB@(NDC,"MATRICE",NOMMAT,X,Y,NI)=$C(0) S @VOID@(NI)="" G NXT
 S @SUIV@(NI)=""
NXTM S %PERE=$$PERE^%QARBCON(ARBETU,NDC) I (%PERE'="")&(%PERE'=NDC) S NI=I,NDC=%PERE G NXT
 K @(VOID)
 S NI=$O(@SUIV@(I)) K @(SUIV)
 Q NI
 ;
 ;

