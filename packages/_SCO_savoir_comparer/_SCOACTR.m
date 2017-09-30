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

;%SCOACTR^INT^1^59547,73888^0
%SCOACTR ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CONTPAR(REPS,OBS,DESACAD,ARPREM,VISU) N M,RI
 S M=""
 I VISU D POCLEPA^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("Controle des parametres") H 2 D NORM^%VVIDEO
 I REPS="" S M="Repertoire reference non defini..." G FINCPAR
 I OBS="" S M="Individu reference non defini" G FINCPAR
 I (DESACAD<0)!(DESACAD>1) S M="Taux de desaccord incorrect" G FINCPAR
 I (ARPREM'=$$^%QZCHW("OUI"))&(ARPREM'=$$^%QZCHW("NON")) S M="Valeur incorrecte pour Arret sur 1er individu..." G FINCPAR
 S RI=$$NOMINT^%QSF(REPS)
 I RI="" S M="Nom interne du repertoire reference non defini..." G FINCPAR
 I '($$IR^%QSGE5(RI,OBS)) S M="Individu reference inconnu dans le repertoire reference ..." G FINCPAR
FINCPAR D:VISU POCLEPA^%VVIDEO
 Q M
 
 
 
 
 
 
 
 
 
 
 
 
 
CONTDOM(LISDOM,LISRSOU,LISRCIB,VISU) 
 N I,DOM,REP,M,RC,RS
 S M=""
 I VISU D POCLEPA^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("Controle sur les domaines") H 2 D NORM^%VVIDEO
 I '($D(@LISDOM)) S M=$$^%QZCHW("Aucun domaine n'a ete defini") G FCONTDOM
 S DOM=""
BDOM S DOM=$O(@LISDOM@(DOM))
 G:DOM="" FCONTDOM
 I '($D(^[QUI]SCOMDOM(DOM))) S M=DOM_" n'est pas un domaine" G FCONTDOM
 S RS=""
BSOU S RS=$O(^[QUI]SCOMDOM(DOM,"REP.SOURCE",RS))
 G:RS="" RCIB
 S @LISRSOU@(RS)=""
 G BSOU
RCIB I '($D(@LISRSOU)) S M="Aucun repertoire reference n'a ete defini" G FCONTDOM
 S RC=""
BCIB S RC=$O(^[QUI]SCOMDOM(DOM,"REP.CIBLE",RC))
 G:RC="" BDOM
 S @LISRCIB@(RC)=""
 G BCIB
FCONTDOM D:VISU POCLEPA^%VVIDEO
 Q M
 
CONTCIB(LISTCIB,LISICB,VISU) 
 K @(LISICB)
 N M,LIG,CH,PART1,PART2,REPI,IND,ADR
 I VISU D POCLEPA^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("Recuperation des individus cibles") H 2 D NORM^%VVIDEO
 S M="",LIG=""
BLIST S LIG=$O(@LISTCIB@(LIG))
 G:LIG="" FCONTCIB
 S CH=@LISTCIB@(LIG)
 S PART1=$P(CH,"^"),PART2=$P(CH,"^",2)
 I PART1="" S M=$$^%QZCHW("Un repertoire ne peut etre egal a chaine vide") G FCONTCIB
 I PART2'="" G SUITIND
 I '($$REPM^%QSGEST9(PART1)) S M=PART1_$$^%QZCHW(" n'est pas un repertoire du schema de donnees") G FCONTCIB
 S REPI=$$NOMINT^%QSF(PART1) I REPI="" S M=$$^%QZCHW("Aucun nom interne pour ")_PART1 G FCONTCIB
 S IND="",LISTIND=$$LISTIND^%QSGEST6(REPI)
 F I=0:0 S IND=$O(@LISTIND@(IND)) Q:IND=""  S @LISICB@(PART1,IND)=""
 G BLIST
SUITIND 
 I PART2=$$^%QZCHW("LISTE") G LISTE
INDI S REPI=$$NOMINT^%QSF(PART2) I REPI="" S M=$$^%QZCHW("Aucun nom interne pour ")_PART2 G FCONTCIB
 I '($$IR^%QSGEST5(REPI,PART1)) S M=PART1_$$^%QZCHW(" n'existe pas dans le repertoire ")_PART2 G FCONTCIB
 S @LISICB@(PART2,PART1)=""
 G BLIST
LISTE I '($$IR^%QSGEST5("L0",PART1)) S M=PART1_$$^%QZCHW(" n'est pas une liste") G FCONTCIB
 S REPI=$$BASE^%QSGEST7(PART1) I REPI="" S M=$$^%QSCHW("Impossible de trouver le repertoire de la liste")_PART1 G FCONTCIB
 S ADR=$$ADRLIS^%QSGEST7(PART1) I ADR="" S M=$$^%QSCHW("Impossible de trouver les individus de la liste")_PART1 G FCONTCIB
 S IND="" F I=0:0 S IND=$O(@ADR@(IND)) Q:IND=""  S @LISICB@($$NOMLOG^%QSF(REPI),IND)=""
 G BLIST
FCONTCIB I '($D(@LISICB)) S M=$$^%QZCHW("Aucuns individus cibles n'a ete trouve")
 D:VISU POCLEPA^%VVIDEO
 Q M

