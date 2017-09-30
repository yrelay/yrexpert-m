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

;%QSATTRI^INT^1^59547,73880^0
QSATTRI(O,BA,XG,YH,LA,HA) 
 
 
 
 
 
 D MODE(O,BA,XG,YH,LA,HA,0) Q
 
MODE(O,BA,XG,YH,LA,HA,MODE) 
 N PAQ,ROUTAFF,SELECT,VISU
MODEGO S ROUTAFF="REAFF^%QSATTRI"
MODEGO2 S (VISU,SELECT,PAQ)=0
 I '($D(^OAFF)) S ^OAFF="Ordre affichage QSGBASE et QSAJCMS"
 I '($D(^OAFF($I))#10) S ^OAFF($I)=0
 D GO^%QSATTR1("INIT^%QSATTR3",^OAFF($I)#3)
 Q
 
 
 
 
 
ORDRE(O,BA,XG,YH,LA,HA,MODE,AFF) 
 N PAQ,ROUTAFF,SELECT,VISU
 S (VISU,SELECT,PAQ)=0,ROUTAFF="REAFF^%QSATTRI"
 D GO^%QSATTR1("INIT^%QSATTR3",AFF)
 Q
 
 
 
 
 
SELT(O,BA,TABLE) 
 D SELECT(O,BA,1,1,78,20,TABLE) Q
SELECT(O,BA,XG,YH,LA,HA,TABLE,JEU) 
 S:'($D(JEU)) JEU=0
 D SELECT2(O,BA,XG,YH,LA,HA,TABLE,0,JEU) Q
SELECT2(O,BA,XG,YH,LA,HA,TABLE,PAQ,JEU) 
 N MODE,VISU,SELECT
 S:'($D(JEU)) JEU=0
 S VISU=0,SELECT=1,MODE=2 S:'($D(ROUTAFF)) ROUTAFF="REAFF^%QSATTRI"
 D GO^%QSATTR1("INITS^%QSATTR3(TABLE,PAQ,JEU)",2) Q
 
 
 
 
 
 
 
LIS(O,BA,LISTE) 
 D LISTE(O,BA,0,1,79,20,LISTE) Q
LISTE(O,BA,XG,YH,LA,HA,LISTE) 
 D LISTE2(O,BA,XG,YH,LA,HA,LISTE,0) Q
LISTE2(O,BA,XG,YH,LA,HA,LISTE,PAQ) 
 I (LISTE="*")!(LISTE="") D QSATTRI(O,BA,XG,YH,LA,HA) Q
 I '($$EX^%QMLILA(LISTE)) D ^%VZEAVT($$^%QZCHW("Liste inexistante")) Q
 N NUM,S K ^TABL($J)
 S NUM="" F S=1:1 S NUM=$O(^[QUI]ZLILA(LISTE,NUM)) Q:NUM=""  S ^TABL($J,NUM,^[QUI]ZLILA(LISTE,NUM))=""
 I PAQ D PAQUET(O,BA,XG,YH,LA,HA,"^TABL($J)") Q
 D SELECT(O,BA,XG,YH,LA,HA,"^TABL($J)") Q
 
 
 
 
 
 
PAQUT(O,BA,TABLE) 
 D PAQUET(O,BA,1,1,78,20,TABLE) Q
PAQUET(O,BA,XG,YH,LA,HA,TABLE,JEU) 
 N INDICE
 S:'($D(JEU)) JEU=0 D POCLEPA^%VVIDEO
 S INDICE=$$^%VZAME1("Quel est l'indice de l'ensemble des attributs : ") S:'($D(ROUTAFF)) ROUTAFF="REAFF^%QSATTRI"
 Q:INDICE=""  D SELECT2(O,BA,XG,YH,LA,HA,TABLE,1,JEU) Q
 
 
 
 
 
PAQDIA(O,BA,XG,YH,LA,HA,DIA,TABLE,JEU) 
 N INDICE
 S:'($D(JEU)) JEU=0 D POCLEPA^%VVIDEO
 S:'($D(ROUTAFF)) ROUTAFF="REAFF^%QSATTRI"
 S INDICE=$$CHIND^%QSATTR5(DIA,XG,YH,LA,HA) Q:INDICE=""
 I INDICE="?" S INDICE=1
 D SELECT2(O,BA,XG,YH,LA,HA,TABLE,1,JEU) Q
 
 
 
 
 
DIALOGUE(O,BA,DIA,NJEU) 
 
 
 
 
 
 
 
 D DIA^%QSATTR5(O,BA,DIA,NJEU) Q
 
VISU(O,BA,XG,YH,LA,HA) 
 D VISUM(O,BA,XG,YH,LA,HA,0) Q
 
 
 
VISUM(O,BA,XG,YH,LA,HA,MODE) 
 N PAQ,ROUTAFF,SELECT,VISU
 S VISU=1,(PAQ,SELECT)=0,ROUTAFF="REAFF^%QSATTRI"
 G NORM
 
NORM 
 I '($D(^OAFF)) S ^OAFF="Ordre affichage QSGBASE et QSAJCMS"
 I '($D(^OAFF($I))#10) S ^OAFF($I)=0
 D GO^%QSATTR1("INIT^%QSATTR3",^OAFF($I)) Q
 
 
;Affiche les attributs d'un individu 
MODEAF(O,BA,XG,YH,LA,HA,MODE,ROUTAFF) 
 N PAQ,SELECT,VISU
 S:ROUTAFF="" ROUTAFF="REAFF^%QSATTRI"
 G MODEGO2
 
 
REAFF D CLEPAG^%VVIDEO,REAFF^%QSATTR6 Q
REAF D CLEPAG^%VVIDEO,^%VZCD(0,79,0,2,0,0,$$^%QZCHW("Dialogue ")_DIA)
 D REAFF^%QSATTR6 Q

