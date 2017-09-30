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

;%QMEXOU^INT^1^59579,34445^0
%QMEXOU ;
 
 
MAKEUC N %AA
 S %AA=1 K @(UCONT)
 
 S @UCONT@("AUTRE",%AA)="CTRB^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Individu"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Visualisation des attributs de l'individu"),@UCONT@("AUTRE",%AA,"CTR")="B",%AA=%AA+1
 
 
 
 S @UCONT@("AUTRE",%AA)="CTRV^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Transition"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Acces aux attributs de l'individu lien"),@UCONT@("AUTRE",%AA,"CTR")="V",%AA=%AA+1
 
 S @UCONT@("AUTRE",%AA)="PRED^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Predicat"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Acces au predicat conditionnant la transition"),@UCONT@("AUTRE",%AA,"CTR")="J",%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="REGLE^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Regle"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Acces a la premiere regle (traitement ou saisie)"),%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="SUPP^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Supprimer"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Suppression de l'etat courant"),%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="INDIV^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Lier"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Ajout d'une liaison a l'individu courant"),@UCONT@("AUTRE",%AA,"CTR")="I",%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="TERM^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Statut"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Caracteristiques de l'etat courant (terminal/Petri/final)"),@UCONT@("AUTRE",%AA,"CTR")="E",%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="CXTACT^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Contexte"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Contexte d'activation du SF associe a l'etat courant"),%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="TRAIT^%QMEXO2",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Traitements"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Module des traitements"),%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="ZOOM^%QMEXO1",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Zoom"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Zoom sur le reseau associe a l'etat courant"),NUMZOOM=%AA,%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="UNZOOM^%QMEXO1",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Abandon"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Retour au reseau precedent"),NUMUNZOO=%AA,%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="DOC^%QMEXO3",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Doc"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Consultation/modification de la documentation associee a l'etat"),%AA=%AA+1
 S @UCONT@("AUTRE",%AA)="CARGEN^%QMEXO3",@UCONT@("AUTRE",%AA,"TXT")=$$^%QZCHW("Reseau"),@UCONT@("AUTRE",%AA,"COM")=$$^%QZCHW("Consultation/modification des caracteristiques du reseau"),%AA=%AA+1
 S @UCONT@("AFF")="$$ABRV^%QMEXO3",@UCONT@("INFO")="$$INFO^%QMEXO3",@UCONT@("FULL")="$$FULL^%QMEXO3"
 S @UCONT@("CUT")="CUT^%QMEXO3"
 S @UCONT@("PASTE")="PASTE^%QMEXO3"
 S @UCONT@("GOTO")="$$GOTO^%QMEXO3"
 S @UCONT@("GOTO","TXT")=$$^%QZCHW("Localiser")
 
 S @UCONT@("GOTO","COM")=$$^%QZCHW("Localiser un etat et se positionner dessus")
 
 S @UCONT@("TRI")="$$POIDS^%QMEXO2"
 Q
 ;
 ;

