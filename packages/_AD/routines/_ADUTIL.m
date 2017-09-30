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

;%ADUTIL^INT^1^59547,73865^0
%ADUTIL ;
 
 
 
 
 
 
 
 
 
 
INIT 
 N LIG,MEN,%IM,CH
 S LIG=0
 F LIG=0:1 S CH=$P($T(LMENU+LIG),";;",2) Q:CH=""  F %IM=1:1 S MEN=$P(CH,"/",%IM) Q:MEN=""  I $D(^MN(MEN)) S ^MN(MEN,"STATUT")="RESERVE"
 F LIG=0:1 S CH=$P($T(LMNINUS+LIG),";;",2) Q:CH=""  F %IM=1:1 S MEN=$P(CH,"/",%IM) Q:MEN=""  I $D(^MN(MEN)) S ^MN(MEN,"STATUT")="RESERVE"
 Q
 
MAKETAB(GLO) 
 N LIG,MEN,%IM,CH
 S MEN="" F %IM=0:0 S MEN=$O(^MN(MEN)) Q:MEN=""  S @GLO@(MEN)=""
 S LIG=0
 F LIG=0:1 S CH=$P($T(LMENU+LIG),";;",2) Q:CH=""  F %IM=1:1 S MEN=$P(CH,"/",%IM) Q:MEN=""  K @GLO@(MEN)
 Q
 
 
LMENU ;;EXPLOIT/GENERAL//
 ;;LUDICIELS DE FORMATION/MODEPAS//
 ;;RAISONNEMENT SUIVI PAR TOTEM//
 ;;SYNTHESE/SUPETUDE/SYNTETUD//
 ;;SYSTACC/SYSCONF/SYSTAC//
 ;;SYSTWAIT/SYSTED/SYSTEME// 
 ;;TOTEM/TOTYCOMP/DIVERS//
 ;;
 ;; menus inutiles pour la distribution
LMNINUS ;;%SY3/%SY1/%SY2/%SY4//
 ;;APPRENTISSAGE//
 ;;BATCH/ARTICLES/AST//
 ;;CONFIG/CLIENT/COMMANDES//
 ;;COPICLI/CROSS//
 ;;DOCUMGLO/DOCUMENTATION//
 ;;EVALUATION/DOCUMROU/EDISF//
 ;;FAMILLE/EXPLICITES//
 ;;GAMME//
 ;;IMPLICITES/GENRAL/GESTIONNAIRE MENU//
 ;;LOCACROS/JEUX/LEXIQUE//
 ;;MESSAGERIE/MATIERE//
 ;;NAMEFUL/Modif. des Tarifs//
 ;;OPCROSS/NOMENCLATURE/NOTE//
 ;;REGLAGE IMPRIMANTE/PRODUCTION//
 ;;SATCABLE/REPGRA/RM//
 ;;STOCK/SECTIONS/SOUS-FAMILLE//
 ;;SYSCONF/SYSTAC//
 ;;TAIC/TEXTES//
 ;;TREECROS/TRANSFERT//
 ;;UTILISATEUR/Touches de fonction/USINE//
 ;;ZSVG//
 ;

