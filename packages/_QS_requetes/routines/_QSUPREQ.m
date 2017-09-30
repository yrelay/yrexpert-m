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

;%QSUPREQ^INT^1^59547,73883^0
%QSUPREQ(REQ,MOD) 
 
 
 
 
 
 
 
 
 
 
 
 
 N L,%L
 Q:'($D(^[QUI]RQS1(REQ)))
 
 I MOD S L="" F %L=0:0 S L=$O(^[QUI]RQS1(REQ,"ACTIVATIONS",L)) Q:L=""  D SUPI2^%QS0SUPP(L)
 
 D SUPSTRU(REQ)
 
 D SX^%QSGESTK("RQS",REQ),SUPP^%TLQUER("q."_REQ)
 Q
 
 
SUPSTRU(REQ) 
 N L,%L
 Q:'($D(^[QUI]RQS1(REQ)))
 S L=""
SUPS1 S L=$O(^[QUI]RQS1(REQ,"CONTRAINTES",L)) G:L="" SUPS2
 D:$D(^[QUI]RQS1(REQ,"CONTRAINTES",L,"TETE")) KILL^%ANA(^[QUI]RQS1(REQ,"CONTRAINTES",L,"TETE"))
 I $D(^[QUI]RQS1(REQ,"CONTRAINTES",L,"TABATT")) S %L=^[QUI]RQS1(REQ,"CONTRAINTES",L,"TABATT") I %L'="" K ^[QUI]RQSDON("RQS","ATT",%L)
 G SUPS1
SUPS2 S L=""
 F %L=0:0 S L=$O(^[QUI]RQS1(REQ,"VARIABLES",L)) Q:L=""  D:$D(^[QUI]RQS1(REQ,"VARIABLES",L,"TETE")) KILL^%ANA(^[QUI]RQS1(REQ,"VARIABLES",L,"TETE"))
 D KILL^%ANA($$^%QCAZG("^[QUI]RQS1(REQ,""COMPILATION"")"))
 K ^[QUI]RQS1(REQ)
 Q
 ;

