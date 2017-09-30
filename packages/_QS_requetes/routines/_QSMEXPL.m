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

;%QSMEXPL^INT^1^59547,73882^0
%QSMEXPL ;
 
 
 
 
 S %PROG=$T(+0)
 X ^TOLISRAM(1) Q
FUN ;;EXPLOITATION DE LA BASE
 ;;#Schemas de donnees#;;CLEPAG^%VVIDEO,^%QSMODME
 ;;Gestion des #regimes calendaires#;;^%QMDRMEN
 ;;#Autotest#;;^%QSINDIS;;~$$OKR^%INCOIN("INDIS")
 ;;#Integrite# et nettoyage des informations;;^%QSXGEN
 ;;#Reanalyse# syntaxique de SF;;CLEPAG^%VVIDEO,^%QSREASF
 ;;#Copie# de donnees et de connaissance;;^%QMCPMEN
 ;;#Sauvegarde et restauration# de donnees et de connaissances;;^%QMCPOM
 ;;Passerelles #externes#;;^LKMMEN1
 ;;Gestion des #impressions#;;CLEPAG^%VVIDEO,^%QSMIMP
 ;;Transformation des #traitements en programmes#;;CLEPAG^%VVIDEO,^%TLIACOX
FUNC ;;
 ;;Definition, verification et installation de schema de donnees
 ;;Definifion de calendriers
 ;;Test des Requetes et des Traitements sur le modele geometrique
 ;;Verification de l'integrite de la base de donnees utilisateurs (equivalence entre versions redondantes de l'information des repertoires) et suppression de 
 ;;Reanalyse syntaxique de Savoir-Faire (Traitements, requetes, conditions de transitions, variables actives, regles de Savoir-Comparer)
 ;;Recopie de vocabulaire, de donnees et de connaissance d'un service a un autre
 ;;Ecriture et lecture sur fichier de donnees et de connaissances
 ;;Recuperation dans DKBMS de donnees issues d'autres systemes d'information
 ;;Redirection des impressions DKBMS (sur fichier ou imprimante), edition de fichier
 ;;Transformation des traitements en programmes executables pour optimisation des performances
 ;
 ;

