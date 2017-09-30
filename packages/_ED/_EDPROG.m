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

;%EDPROG^INT^1^59547,73869^0
%EDPROG ;
 
 
 
DEBSESS 
 S %TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA")
 O %PORT U %PORT
 S %9O="VERTICALE"
 S %FONC="INIT" D ^%PBPZ
 Q
FINSESS 
 S %FONC="PRINTER" D ^%PBPZ
 C %PORT
 K %9STR,%9X,%9X1,%9X2,%9Y,%9Y1,%9Y2,%9EPA,%TERM,%FONC,%PORT,%9O
 Q
DEBPAGE 
 Q
FINPAGE 
 S %FONC="CLEAR" D ^%PBPZ
 Q
TRAIT(X1,Y1,X2,Y2) 
 S (%9X1,%9X)=X1,(%9Y1,%9Y)=Y1,%9X2=X2,%9Y2=Y2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
EPAIS(EPA) 
 S %9EPA=EPA
 S %FONC="EPAISSEUR" D ^%PBPZ Q
TAILLE(T) 
 S %9T=T
 S %FONC="TAILLE" D ^%PBPZ Q
TEXTE(X,Y,STR) 
 S (%9X1,%9X)=X,(%9Y1,%9Y)=Y,%9STR=STR
 S %FONC="TEXT" D ^%PBPZ Q
TEST 
 D DEBSESS,DEBPAGE
 D EPAIS(5E-2),TRAIT(1,1,10,10)
 D TAILLE(12)
 D TEXTE(10,10,"coucou")
 D EPAIS(1E-1),TRAIT(10,10,20,1)
 D FINPAGE,FINSESS Q

