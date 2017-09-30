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

;%TLDIAL3^INT^1^59547,74028^0
%TLDIAL3() 
 
 
 
MENU(TTLM) 
MENUT N I
 S @TTLM="21^10^79"
 S @TTLM@(1)="Creer"_"^CREAT"
 S @TTLM@(1,"COM")="Creation d'un nouveau traitement"
 S @TTLM@(2)="Modifier"_"^MODIF"
 S @TTLM@(2,"COM")="Consultation/Modification d'un traitement"
 S @TTLM@(3)="Supprimer"_"^SUPPR"
 S @TTLM@(3,"COM")="Suppression d'un traitement"
 S @TTLM@(4)="Activer"_"^ACTIV"
 S @TTLM@(4,"COM")="Activation d'un traitement sur une liste"
 S @TTLM@(5)="Traiter Select."_"^ACTIV2"
 S @TTLM@(5,"COM")="Activation d'un traitement sur certains individus"
 S @TTLM@(6)="Analyser"_"^"_"ANAL"
 S @TTLM@(6,"COM")="Reanalyse de traitements"
 S @TTLM@(7)="Imprimer"_"^IMPRIM"
 S @TTLM@(7,"COM")="Impression de traitements"
 S @TTLM@(8)="Dupliquer"_"^DUPLI"
 S @TTLM@(8,"COM")="Duplication d'un traitement"
 S @TTLM@(9)="Substituer"_"^SUBST"
 S @TTLM@(9,"COM")="Substitution dans un traitement"
 S @TTLM@(10,"COM")="Recherche d'une chaine dans un traitement"
 S @TTLM@(10)="Rechercher"_"^RECH"
 I ICI="TLMENUG" S I=11,@TTLM@(I)="Compiler"_"^COMPIL",@TTLM@(I,"COM")="Compilation de traitements",I=I+1 G SUIMN
 S @TTLM@(11)="+^PLUS",@TTLM@(11,"EQU")="="
 S @TTLM@(11,"COM")="Avancer d'une page"
 S @TTLM@(12)="-^MOINS",@TTLM@(12,"EQU")="_"
 S @TTLM@(12,"COM")="Reculer d'une page"
 S @TTLM@(13)="Page"_"^PAGE"
 S @TTLM@(13,"COM")="Changement de page"
 S @TTLM@(14)="Repere"_"^REPER"
 S @TTLM@(14,"COM")="Voir le repere des pages"
 S I=15
SUIMN S @TTLM@(I)="Mise au point"_"^MAPSF"
 S @TTLM@(I,"COM")="Mettre au point le savoir-faire"
 S I=I+1
 S @TTLM@(I)="Arbre"_"^ARBRE"
 S @TTLM@(I,"COM")="Visualisation de la structure des liens entre les traitements"
 Q

