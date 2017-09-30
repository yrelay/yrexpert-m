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

;%QMEXMOD^INT^1^59547,73878^0
%QMEXMOD ;;04:38 PM  9 Dec 1992; 14 Oct 92  5:03 PM ; 16 Dec 92  6:28 PM
 
 
 
 
 
 
 W !,"nom de la liste des NOEUD.LOGIQUEs : ",!
 R LISTE
 W !,"nom du reseau a creer : ",!
 R NOMATN
 D MAKE(LISTE,NOMATN)
 Q
 
MAKE(LISTE,NOMATN) 
 N R,REPNODE,REPETAT,REPLIEN,NODE,ETAT,LIE,ETATLIE,NOMLIEN,PRED,ICOND,%ICOND
 
 S REPNODE="NOEUD.I",REPETAT="ETAT.RESEAU",REPLIEN=$$LIENI^%QSGEL3
 D SX^%QSGESTK("RESEAU",NOMATN)
 S R=$$CREER^%QSGEIND("RESEAU",NOMATN,"",1,.MSG)
 D PA^%QSGESTI("RESEAU",NOMATN,"TYPE.ATN","RESEAU HEVEA",1)
 S NODE=""
NXNODE S NODE=$$SUIVL^%QS0XG1(LISTE,NODE) Q:NODE=""
 S ETAT=$$TRANSFO(NOMATN,NODE)
 I '($$IR^%QSGE5("ETAT.RESEAU",ETAT)) D COPY(NODE,ETAT)
 S LIE=""
BCLLIE S LIE=$$NXTRIAO^%QSTRUC8(REPNODE,NODE,"TRANSITION",LIE) G:LIE="" NXNODE
 S ETATLIE=$$TRANSFO(NOMATN,LIE)
 I '($$IR^%QSGE5(REPETAT,ETATLIE)) D COPY(LIE,ETATLIE)
 W !,"liaison de ",ETAT,"  et  ",ETATLIE
 D ADDS^%QSGES26(REPETAT,ETAT,"ETAT.PRECEDE",REPETAT,ETATLIE)
 S NOML2=$$NOML1^%QSGES20(NODE,LIE,"TRANSITION",LIE)
 S NOMLIEN=$$NOML1^%QSGES20(ETAT,ETATLIE,"ETAT.PRECEDE",ETATLIE)
 
 G:$$^%QSCALIN(REPLIEN,NOML2,"CONDITION.TRANSITION",1)="" BCLLIE
 S PRED=$$NOMPRED(NOMATN,NODE,LIE,$$^%QSCALIN(REPLIEN,NOML2,"CONDITION.TRANSITION",1))
 W !," -> creation du predicat ",PRED
 D PA^%QSGESTI(REPLIEN,NOMLIEN,"PREDICAT",PRED,1)
 G:NOML2="" BCLLIE
 S ICOND="",%ICOND=0
BCLLI S ICOND=$$NXTRIAO^%QSTRUC8(REPLIEN,NOML2,"CONDITION.TRANSITION",ICOND)
 G:ICOND="" BCLLIE
 S %ICOND=%ICOND+1
 S ^[QUI]RQSGLO("PRED",PRED,%ICOND)=$$VALEUR^%QSTRUC8(REPLIEN,NOML2,"CONDITION.TRANSITION",ICOND)
 G BCLLI
 
COPY(NODE,ETAT) 
 S R=$$CREER^%QSGEIND("ETAT.RESEAU",ETAT,"",1,.MSG)
 W !," creation de ",ETAT
 F ATT="COMMENTAIRE.PROLOGUE","REGLE","COMMENTAIRE.EPILOGUE" S ORD="" F %ORD=0:0 S ORD=$$NXTRIAO^%QSTRUC8(REPNODE,NODE,ATT,ORD) Q:ORD=""  D PA^%QSGESTI(REPETAT,ETAT,ATT,$$VALEUR^%QSTRUC8(REPNODE,NODE,ATT,ORD),ORD)
 D COPY^%QCAGLC("^[QUI]QUERYT(""NOEUD.I"","""_NODE_""")","^[QUI]QUERYT(""ETAT.RESEAU"","""_ETAT_""")")
 Q
 
 
TRANSFO(ATN,NODE) 
 Q ATN_","_NODE
 
 
 
 
NOMPRED(ATN,NODE1,NODE2,PREMLIG) 
 N DEBUT,I
 S DEBUT=PREMLIG
 F I=" ","=","'",">","<" S DEBUT=$P(DEBUT,I)
 
 Q ATN_"."_$$GEN^%QCAPOP("PRD")
 ;

