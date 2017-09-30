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

;%QSCOX^INT^1^59547,73881^0
QSCOX ;
 
 
 
 
 
TR ;;|"ARC-------> LOT"|AL|
 ;;|"ARC-------> RELIQUAT"|AR|
 ;;|"LOT-------> ARC"|LA|
 ;;|"RELIQUAT--> ARC"|RA|
 ;;
TR1 ;;|"ARC^LOT"|AL|
 ;;|"ARC^RELIQUAT"|AR|
 ;;|"LOT^ARC"|LA|
 ;;|"RELIQUAT^ARC"|RA|
 ;;
LIENS ;;|"P0","LOT"|AL|
 ;;|"LOT","P0"|LA|
 ;;|"RELIQUAT","P0"|RA|
 ;;|"P0","RELIQUAT"|AR|
 ;;
 
AL ;;|"BS"|P0|
 ;;|"S","P0","BD"|LOT|
 ;;|"S","P0","BDI"|LOT|
 ;;|"S","P0","LO"|ARC|
 ;;|"S","P0","R","COMPOSANT"|P2|
 ;;|"S","P0","TS"|1|
 ;;|"S","P1","BD"|OPERATION.LOT|
 ;;|"S","P1","BDI"|OPERATION.LOT|
 ;;|"S","P1","LO"|OPERATION|
 ;;|"S","P1","TS"|1|
 ;;|"S","P2","BD"|GAMME.LOT|
 ;;|"S","P2","BDI"|GAMME.LOT|
 ;;|"S","P2","LO"|COMPOSANT|
 ;;|"S","P2","R","OPERATION"|P1|
 ;;|"S","P2","TS"|1|
 ;;
 
AR ;;|"BS"|P0|
 ;;|"S","P0","BD"|RELIQUAT|
 ;;|"S","P0","BDI"|RELIQUAT|
 ;;|"S","P0","LO"|ARC|
 ;;|"S","P0","R","COMPOSANT"|P2|
 ;;|"S","P0","TS"|1|
 ;;|"S","P1","BD"|OPERATION.RELIQUAT|
 ;;|"S","P1","BDI"|OPERATION.RELIQUAT|
 ;;|"S","P1","LO"|OPERATION|
 ;;|"S","P1","TS"|1|
 ;;|"S","P2","BD"|GAMME.RELIQUAT|
 ;;|"S","P2","BDI"|GAMME.RELIQUAT|
 ;;|"S","P2","LO"|COMPOSANT|
 ;;|"S","P2","R","OPERATION"|P1|
 ;;|"S","P2","TS"|1|
 ;;
 
LA ;;|"BS"|LOT|
 ;;|"S","GAMME.LOT","BD"|COMPOSANT|
 ;;|"S","GAMME.LOT","BDI"|P2|
 ;;|"S","GAMME.LOT","LO"|GAMME.LOT|
 ;;|"S","GAMME.LOT","R","OPERATION.LOT"|OPERATION.LOT|
 ;;|"S","GAMME.LOT","TS"|1|
 ;;|"S","LOT","BD"|ARC|
 ;;|"S","LOT","BDI"|P0|
 ;;|"S","LOT","LO"|LOT|
 ;;|"S","LOT","R","GAMME.LOT"|GAMME.LOT|
 ;;|"S","LOT","TS"|1|
 ;;|"S","OPERATION.LOT","BD"|OPERATION|
 ;;|"S","OPERATION.LOT","BDI"|P1|
 ;;|"S","OPERATION.LOT","LO"|OPERATION.LOT|
 ;;|"S","OPERATION.LOT","TS"|1|
 ;;
 
RA ;;|"BS"|RELIQUAT|
 ;;|"S","GAMME.RELIQUAT","BD"|COMPOSANT|
 ;;|"S","GAMME.RELIQUAT","BDI"|P2|
 ;;|"S","GAMME.RELIQUAT","LO"|GAMME.RELIQUAT|
 ;;|"S","GAMME.RELIQUAT","R","OPERATION.RELIQUAT"|OPERATION.RELIQUAT|
 ;;|"S","GAMME.RELIQUAT","TS"|1|
 ;;|"S","RELIQUAT","BD"|ARC|
 ;;|"S","RELIQUAT","BDI"|P0|
 ;;|"S","RELIQUAT","LO"|RELIQUAT|
 ;;|"S","RELIQUAT","R","GAMME.RELIQUAT"|GAMME.RELIQUAT|
 ;;|"S","RELIQUAT","TS"|1|
 ;;|"S","OPERATION.RELIQUAT","BD"|OPERATION|
 ;;|"S","OPERATION.RELIQUAT","BDI"|P1|
 ;;|"S","OPERATION.RELIQUAT","LO"|OPERATION.RELIQUAT|
 ;;|"S","OPERATION.RELIQUAT","TS"|1|
 ;;

