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

;%TXOTRE^INT^1^59547,74032^0
%TXOTRE ;
 
 
 
 
 N M,MOTR,MM,LIGNE
 F M=1:1 S LIGNE=$P($T(TAB+M),";;",2) Q:LIGNE=""  F MM=1:1 S MOTR=$P(LIGNE,"/",MM) Q:MOTR=""  D AJMOTR^%LXUCRES(QUI,MOTR)
 Q
TAB ;;
 ;;NOM.ABONNE/LOCALITE/ADRESSE/CODE.POSTAL/VILLE/TELEPHONE/TELEX
 ;;CODE.INTERNE/INTERLOCUTEUR/NOM.FAMILLE/NOM.JEUNE.FILLE/PRENOM/SEXE
 ;;DATE.NAISSANCE/NUMERO.SECU/SITUATION.FAMILLE/MUTUELLE/PAYS
 ;;NUMERO.TELEPHONE/PROFESSION/PROFESSION.CONJOINT/NUMERO.CHAMBRE
 ;;PERSONNE.A.PREVENIR/ENVOYEE.PAR/LIEU.CONSULTATION
 ;;PRESCRIPTION.MEDICALE/DATE.ENTREE/MEDECIN/INDICATION.OPERATOIRE
 ;;DATE.OPERATION/PI/TENSION.ARTERIELLE/AUP/BIO/OBSERVATION/CYCLE/DUREE
 ;;REGLES/MEDECIN.TRAITANT/MOTIF/PLAINTE.PRINCIPALE/INDICATION.PROPOSEE
 ;;INDICATION.RETENUE/DATE.PREVUE/ENTREE/OPERATION/DATE.OPERATION
 ;;GROUPE.SANGUIN/RHESUS/TAILLE/POIDS/ATCD.MEDICAL/ATCD.CHIRURGICAL
 ;;ATCD.OBSTETRICAL/RUBEOLE/TOXOPLASMOSE/DIABETE/HTA/PHLEBITE/NEPHROP
 ;;AUTRES/ALLERGIE/INFLAMMATION.URINAIRE/CARDIOP/AC.AV/DATE/LIEU/TERME
 ;;GROSSESSE/ACCOUCHEMENT/ENFANT/SUITES/TABAC/ALCOOL/JUMEAUX
 ;;DATE.PR/LUXATION.HANCHE/MALFORMATION/INCOMPATIBILITE.RHESUS.ABO

