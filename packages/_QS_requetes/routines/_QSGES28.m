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

;%QSGES28^INT^1^59547,73881^0
%QSGES28 ;;07:38 PM  9 Sep 1993; ; 10 Sep 93  8:51 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
REMPLACE(REP,IND1,IND2) 
 N NIV,REPP,LPERF,PER1,PER2,ORD,ORDTMP,NOMTMP
 Q:$$IR^%QSGE5(REP,IND2) 0
 Q:'($$IR^%QSGE5(REP,IND1)) 0
 Q:$L(IND1,",")'=$L(IND2,",")
 S NIV=^[QUI]RQSNCLES(REP)
 I NIV=1 S ORD="",SIMPLE=1 G REJETON
 D PEREFILS^%QSGEL2(REP,.REPP,.LPERF)
 S PER2=$P(IND2,",",1,NIV-1)
 Q:'($$IR^%QSGE5(REPP,PER2)) 0
 S PER1=$P(IND1,",",1,NIV-1),NOM1=$P(IND1,",",NIV),NOM2=$P(IND2,",",NIV)
 S ORD=$$GETORD(REPP,PER1,LPERF,NOM1)
 I ORD'=NOM1 G:PER1=PER2 CPLEX Q:$$OAIR^%QSGE5(REPP,PER2,LPERF,ORD)  G REJETON
 S ORD=NOM2
REJETON D RECOP^%QSGES25(REP,IND1,IND2,ORD,1)
 D SX^%QSGESTK(REP,IND1)
 Q 1
 
 
CPLEX 
 F ORDTMP=1:1 Q:'($$OAIR^%QSGE5(REPP,PER1,LPERF,ORDTMP))
 F NOMTMP=1:1 Q:'($$IR^%QSGE5(REP,PER1_","_NOMTMP))
 D RECOP^%QSGES25(REP,IND1,PER1_","_NOMTMP,ORDTMP,1)
 D SX^%QSGESTK(REP,IND1)
 D RECOP^%QSGES25(REP,PER1_","_NOMTMP,IND2,ORD,1)
 D SX^%QSGESTK(REP,PER1_","_NOMTMP)
 Q 1
 
 
 
GETORD(REPP,PERE,LPERF,NOM) 
 N ORD,%O
 S ORD="" F %O=0:0 S ORD=$$NXTRIAO^%QSTRUC8(REPP,PERE,LPERF,ORD) Q:ORD=""  Q:$$VALEUR^%QSTRUC8(REPP,PERE,LPERF,ORD)=NOM
 Q ORD

