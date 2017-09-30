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

;TONRBAT^INT^1^59547,74873^0
TONRBAT ;
 
 
 
 
 
 
 N ETUDE,STATUS,I,UNDEF,RI,DEBUT,FIN,DUREE
 S ETUDE=^CSTEST($I,"ETUDE.COMPLET")
 Q:ETUDE=""
 S RI=$$RI^TORQXIN
 S STATUS=$S('($D(^CSTEST($I,"ERREUR"))):"RAS",^CSTEST($I,"ERREUR")="RAS":"RAS",1:"PB")
 D PA^%QSGESTI(RI,ETUDE,"STATUS",STATUS,1)
 D:STATUS="PB" PA^%QSGESTI(RI,ETUDE,"LIBELLE.ERREUR",^CSTEST($I,"ERREUR"),1)
 D PA^%QSGESTI(RI,ETUDE,"HEURE.FIN",^CSTEST($I,"FIN"),1)
 D PA^%QSGESTI(RI,ETUDE,"HEURE.DEBUT",^CSTEST($I,"DEBUT"),1)
 D:($D(^CSTEST($I,"NBRE"))#10)=1 PA^%QSGESTI(RI,ETUDE,"NOMBRE",^CSTEST($I,"NBRE"),1)
 D PA^%QSGESTI(RI,ETUDE,"DATE.ETUDE",$$^%QCAZG("^CSTEST($I,""DATE"")"),1)
 S UNDEF=$O(^CSTEST($I,"UNDEF",""))
 F I=1:1 Q:UNDEF=""  D PA^%QSGESTI(RI,ETUDE,"INDEFINI",^CSTEST($I,"UNDEF",UNDEF),I) S UNDEF=$O(^CSTEST($I,"UNDEF",UNDEF))
 D PA^%QSGESTI(RI,ETUDE,"LANCEMENT.ETUDE","BATCH",1)
DUREE S DEBUT=^CSTEST($I,"DEBUT"),FIN=^CSTEST($I,"FIN")
 S DEBUT=(($P(DEBUT,"H",1)*3600)+($E(DEBUT,4,5)*60))+$P(DEBUT,"'",2)
 S FIN=(($P(FIN,"H",1)*3600)+($E(FIN,4,5)*60))+$P(FIN,"'",2)
 I FIN<DEBUT S FIN=FIN+86400
 S DUREE=FIN-DEBUT
 S DUREE=$$HEURNO2^%QMDATE(DUREE)
 D PA^%QSGESTI(RI,ETUDE,"DUREE.ETUDE",DUREE,1)
 Q
 ;

