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
;! Nomprog     : %QSINTER                                                     !
;! Module      : QS - requete                                                 !
;! But         : Gérer les requetes                                           !
;!                                                                            !
;! Description : $REQUETE                                                     !
;!                                                                            !
;! Compléter les valeurs REQUETE, REPERTOI, LCRIT(1) à LCRIT(n) et ANALYSE=1  !
;! Utliser CRE, ANA, SUP, EXI et ACT poour :                                  !
;! CREER, ANALYSER, SUPPRIMER, vérifier si EXSITE et ACTIVER                  !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSINTER^INT^1^59547,73882^0
%QSINTER ;
 
 
 
 
 
 
 
 
 
CREER(REQ,BASE,VAR,CONT,LVAR,COMM,ANAL) Q:$$EXISTE(REQ) 1
 D ^%QSUPREQ(REQ,1),6^%QSQUEST
 I ANAL Q:$$ANALYSER(REQ) 0 Q 2
 Q 0
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ANALYSER(REQ) N RESANAL D ANAL2^%QS9(REQ,0,0,.RESANAL) Q RESANAL
 
 
 
 
 
 
 
 
 
 
SUPPRIME(REQ,LIST) D ^%QSUPREQ(REQ,LIST) Q
 
 
 
 
 
 
 
EXISTE(REQ) Q $D(^[QUI]RQS1(REQ))'=0
 
 
 
 
 
 
 
 
 
ACTIVE(REQ,LISTE) N BASE,CONT,I,RQSRESUL,VAR,Y1,SPAR
 
 
 
 
 
 
 
 
 
 
 
 
 S DPAR=1 G ACTI
ACTIVEP(REQ,LISTE,LPAR) 
 
 
 
 
 
 
 
 
 
 
 N BASE,CONT,I,RQSRESUL,VAR,Y1,PARAM,SPAR
 
 I LPAR="" S DPAR=1 G ACTI
 S PARAM=LPAR,DPAR=0
ACTI S Y1=$S(LISTE="":^[QUI]RQS1(REQ,"BASE"),1:LISTE)
 S BASE=^[QUI]RQS1(REQ,"BASE"),RQSRESUL=""
 F I=1:1 Q:'($D(^[QUI]RQS1(REQ,"CONTRAINTES",I)))  S CONT(I)=^[QUI]RQS1(REQ,"CONTRAINTES",I),CONT(I,"TETE")=^[QUI]RQS1(REQ,"CONTRAINTES",I,"TETE")
 F I=1:1 Q:'($D(^[QUI]RQS1(REQ,"VARIABLES",I)))  S CONT(I)=^[QUI]RQS1(REQ,"VARIABLES",I),CONT(I,"TETE")=^[QUI]RQS1(REQ,"VARIABLES",I,"TETE")
 D S0^%QSGOREQ Q RQSRESUL
 
 
 
TEST X ^CBL
 S REQUETE="TEST"
 S REPERTOI="CLIENT"
 S LCRIT(1)="CODE.POSTAL = 75120"
 S LCRIT(1,"TETE")=0
 S LCRIT(2)="NOM [ ""BOND"""
 S LCRIT(2,"TETE")=0
 S LCRIT(3)="NUMERO > 31000"
 S LCRIT(3,"TETE")=0
 S ANALYSE=1
 Q
;S REQUETE="DMO.PONCTUATION.PARAM.SIGNE" view "LINK":"RECURSIVE" zl "_QSINTER","_QSGOREQ","_QSRECOP","_QSGOREQ","_QSCALCU","_QSACTIV","_QSACTI2","_QS1CALC","_QSRQEG" D ACT^%QSINTER
TEST2 ;X ^CBL
 S REQUETE="TEST"
 S REPERTOI="ELEMENT"
 S ANALYSE=1
 Q
CRE W !,$$CREER(REQUETE,REPERTOI,.LIND,.LCRIT,.LVAR,"",1) Q
ANA W !,$$ANALYSER(REQUETE) Q
SUP D SUPPRIME(REQUETE,1) Q
EXI W !,$$EXISTE(REQUETE) Q
ACT W !,$$ACTIVE(REQUETE,"") Q

