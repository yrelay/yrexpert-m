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

;%LXRAP^INT^1^59547,73871^0
LEXRAP ;
 
 
 
 
 
 
 
 
 
 
MENU N MENU,ADRES,CONTR,VRES,MODIF
 S VRES=1
 S MENU="21^10^79"
 S MENU(1)=$$^%QZCHW("Resultats")_"^VISRES"
 S MENU(1,"COM")=$$^%QZCHW("Visualisation des resultats obtenus par le rapprochement")
 S MENU(2)=$$^%QZCHW("Mots.Inusites")_"^INUSIT"
 S MENU(2,"COM")=$$^%QZCHW("Visualisation des mots non employes detectes lors du rapprochement")
 S MENU(3)=$$^%QZCHW("Rapprochement")_"^RAPPRO"
 S MENU(3,"COM")=$$^%QZCHW("Rapprochement effectif entre le lexique et DKBMS")
MENUB D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Rapprochement du lexique et de DKBMS"),0)
ACTS S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,"MENU",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F")
 I CONTR'="" D ^%VSQUEAK G ACTS
 D:ADRES'="" @ADRES
 G MENUB
 
RAPPRO 
 N CTOT,CNEMP,DX,DY,MOT,LRES,LNEMP,LMOT,LUSE,LVID,POUR,PPOUR,L,%L,I,%I,OB,TB
 D ^%QCAGLK("^[QUI]LXRAP")
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Rapprochement effectif"),0)
 S DX=3,DY=4
 S LVID=$J(" ",70)
 S LRES=$$^%QZCHW("mot reserve")
 S LNEMP=$$^%QZCHW("mot non employe")
 S LUSE=$$^%QZCHW("Recherche des mots utilises dans")_" "
 D PREPAR
 S CTOT=0,CNEMP=0
 D POCLEPA^%VVIDEO
 S DX=3,DY=4
 S MOT=""
BMOT S MOT=$O(^[QUI]TOLEX(MOT)) G:MOT="z" FIN G:MOT="" FIN
 S CTOT=CTOT+1
 X XY W LVID
 X XY W MOT," "
 I $D(^[QUI]ZSYSMORE(MOT)) W LRES G BMOTF
 I $P(^[QUI]TOLEX(MOT),"^",1)["Mot reserve" W LRES G BMOTF
 G:$D(@LMOT@(MOT)) BMOTF
 S ^[QUI]LXRAP("NEMP",MOT)=""
 W LNEMP
 S CNEMP=CNEMP+1
BMOTF S DY=DY+1 S:DY>21 DY=4
 G BMOT
 
FIN S DY=4
 K @(LMOT)
 S ^[QUI]LXRAP("RES","TOT")=CTOT,^[QUI]LXRAP("RES","NEMP")=CNEMP
 S POUR=CNEMP/CTOT
 I POUR=1 S POUR=100 G FIN2
 S POUR=POUR*100
 G:POUR'["." FIN2
 S PPOUR=$E($P(POUR,".",2),1,2)+0
 I $E(PPOUR,2)=0 S PPOUR=$E(PPOUR)
 S POUR=$P(POUR,".")_"."_PPOUR
FIN2 S ^[QUI]LXRAP("RES","POURC")=POUR
 D:VRES VISRES
 Q
 
PREPAR 
 N NUM,NUM2,REP,NUM3
 S LMOT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(LMOT)
 
 D MSG^%VZEATT(LUSE_$$^%QZCHW("les abaques"))
 S NUM=""
BPREP1 S NUM=$O(^[QUI]EVALGRIL(NUM)) G:NUM="" BPREP3 S NUM2=""
BPREP2 S NUM2=$O(^[QUI]EVALGRIL(NUM,NUM2)) G:NUM2="" BPREP1
 G:($D(^[QUI]EVALGRIL(NUM,NUM2))#10)'=1 BPREP2
 S @LMOT@(^[QUI]EVALGRIL(NUM,NUM2))="" G BPREP2
 
BPREP3 S NUM=$O(^[QUI]GRILRESU(NUM)) G:NUM="" BPREP45 S MOT=""
BPREP4 S MOT=$O(^[QUI]GRILRESU(NUM,MOT)) G:MOT="" BPREP3
 S @LMOT@(MOT)="" G BPREP4
 
BPREP45 S NUM=$O(^[QUI]STRUCT(NUM)) G:NUM="" BPREP5
 I NUM="z" S NUM="" G BPREP5
 S @LMOT@(NUM)="" G BPREP45
 
BPREP5 
 D MSG^%VZEATT(LUSE_$$^%QZCHW("les repertoires"))
 S NUM=$O(^[QUI]QUERY2(NUM)) G:NUM="" BPRTRT
 S @LMOT@(NUM)="",MOT=""
BPREP6 S MOT=$O(^[QUI]QUERY2(NUM,MOT)) G:MOT="" BPREP5
 S @LMOT@(MOT)=""
 G BPREP6
 
 
BPRTRT D MSG^%VZEATT(LUSE_$$^%QZCHW("les traitements"))
 S NUM=""
BPRT2 S NUM=$O(^[QUI]QUERY2("TRAITEMENT","ATTRIBUT.UTILISE",NUM)) G:NUM="" BPRREQ S NUM2=""
BPRT3 S NUM2=$O(^[QUI]QUERY2("TRAITEMENT","ATTRIBUT.UTILISE",NUM,NUM2)) G:NUM2="" BPRT2 S @LMOT@(NUM2)="" G BPRT3
 
BPRREQ D MSG^%VZEATT(LUSE_$$^%QZCHW("les requetes"))
 S OB=""
BPRQ2 S OB=$O(^[QUI]RQS1(OB)) G:OB="" PREPTOT
 I $D(^[QUI]RQS1(OB,"CONTRAINTES")) S L="" F %L=0:0 S L=$O(^[QUI]RQS1(OB,"CONTRAINTES",L)) Q:L=""  I $D(^[QUI]RQS1(OB,"CONTRAINTES",L,"TABATT")) D r2
 G BPRQ2
r2 S TB=^[QUI]RQS1(OB,"CONTRAINTES",L,"TABATT") Q:TB=""
 S MOT="" F I=1:1 S MOT=$O(^[QUI]RQSDON("RQS","ATT",TB,MOT)) Q:MOT=""  S @LMOT@(MOT)=""
 Q
PREPTOT 
 D MSG^%VZEATT(LUSE_$$^%QZCHW("TOTEM")_" : 1 ")
 D TOUS^%LXRAPTO(LMOT)
 G PREPF
 S NUM=""
BTOT1 S NUM=$O(^[QUI]FULL(NUM)) G:NUM="" TOT2 S @LMOT@(NUM)="",MOT=""
BTOT11 S MOT=$O(^[QUI]FULL(NUM,MOT)) G:MOT="" BTOT1 S @LMOT@(MOT)="" G BTOT11
 
TOT2 D MSG^%VZEATT(LUSE_$$^%QZCHW("TOTEM")_" : 2 ")
BTOT2 S NUM=$O(^[QUI]PHASE(NUM)) G:NUM="" TOT3 S @LMOT@(NUM)="",NUM2=""
BTOT3 S NUM2=$O(^[QUI]PHASE(NUM,NUM2)) G:NUM2="" BTOT2 S @LMOT@(NUM2)="",NUM3=""
BTOT4 S NUM3=$O(^[QUI]PHASE(NUM,NUM2,NUM3)) G:NUM3="" BTOT3 S MOT=""
BTOT5 S MOT=$O(^[QUI]PHASE(NUM,NUM2,NUM3,MOT)) G:MOT="" BTOT4 S @LMOT@(MOT)="" G BTOT5
 
TOT3 D MSG^%VZEATT(LUSE_$$^%QZCHW("TOTEM")_" : 3 ")
 S NUM=""
BTOT30 S NUM=$O(^[QUI]DESMACH(NUM)) G:NUM="" TOT4 S @LMOT@(NUM)="",MOT=""
BTOT31 S MOT=$O(^[QUI]DESMACH(NUM,MOT)) G:MOT="" BTOT30 S @LMOT@(MOT)="" G BTOT31
TOT4 D INTERNE^TORAPLEX(LMOT)
 
PREPF D POCLEPA^%VVIDEO
 Q
 
 
VISRES D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("resultat du rapprochement"),0)
 S DX=4,DY=10 X XY
 I ('($D(^[QUI]LXRAP("RES","NEMP"))))!(('($D(^[QUI]LXRAP("RES","TOT"))))!('($D(^[QUI]LXRAP("RES","POURC"))))) D ^%VZEAVT($$^%QZCHW("Resultats inconnus")) Q
 W ^[QUI]LXRAP("RES","NEMP")," ",$$^%QZCHW("mots non employes")," "
 W $$^%QZCHW("sur")," "
 W ^[QUI]LXRAP("RES","TOT")," ",$$^%QZCHW("au total"),", "
 W $$^%QZCHW("soit")," ",^[QUI]LXRAP("RES","POURC")," %"
 D POCLEPA^%VVIDEO
 D ^%VZEAVT(" ")
 Q
 
 
INUSIT N CHOIX
 S ENSMOT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ENS") K @(ENSMOT)
 S MODIF=0
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Mots non employes et suppression eventuelle"),0)
 I '($D(^[QUI]LXRAP("NEMP"))) D ^%VZEAVT("Liste inexistante") Q
 D INIT^%QUCHOIP("^[QUI]LXRAP(""NEMP"")",1,"",1,5,75,18)
 D AFF^%QUCHOIP
SUPPR 
 K @(ENSMOT)
 D ^%QUCHOYP(ENSMOT)
 G:'($D(@ENSMOT)) FINUSIT
 D POCLEPA^%VVIDEO
 I '($$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez vous la suppression de ce(s) mot(s) ?"))) G FINUSIT
 S MOT=""
BSUPPR S MOT=$O(@ENSMOT@(MOT))
 I MOT="" G FINUSUP
 S CTR=$$SUPP^%LXSUPP(MOT)
 I CTR=2 D POCLEPA^%VVIDEO W $$^%QZCHW("Suppression interdite")_" : "_MOT_" "_$$^%QZCHW("est un mot reserve.") H 5
 I CTR'=2 S MODIF=1 K ^[QUI]LXRAP("NEMP",MOT) S ^[QUI]LXRAP("RES","TOT")=^[QUI]LXRAP("RES","TOT")-1,^[QUI]LXRAP("RES","NEMP")=^[QUI]LXRAP("RES","NEMP")-1,^[QUI]TOLEX=^[QUI]TOLEX-1
 G BSUPPR
 
FINUSUP 
 D END^%QUCHOIP
 G:MODIF=0 FINUSIT
 S CNEMP=^[QUI]LXRAP("RES","NEMP"),CTOT=^[QUI]LXRAP("RES","TOT")
 S POUR=CNEMP/CTOT
 I POUR=1 S POUR=100 G FIN2
 S POUR=POUR*100
 G:POUR'["." FIN2
 S PPOUR=$E($P(POUR,".",2),1,2)+0
 I $E(PPOUR,2)=0 S PPOUR=$E(PPOUR)
 S POUR=$P(POUR,".")_"."_PPOUR
 S ^[QUI]LXRAP("RES","POURC")=POUR
FINUSIT 
 Q

