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

;%SCOREAN^INT^1^59547,73888^0
SCOREAN ;
 
 
 
 
 
REG D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Reanalyse syntaxique de toutes les regles"),0)
 D POCLEPA^%VVIDEO
 Q:'($$MES^%VZEOUI($$^%QZCHW("OK pour la reanalyse ? "),"N"))
 S DX=0,DY=2 X XY
 D CLEBAS^%VVIDEO
ALL N CTRLA,ABANDON,RES,DOM,ATTR,INDIC,VAL1,VAL2
 S ABANDON=0
 K ^[QUI]PBMANA("SCO")
 S DOM=""
BALL1 S DOM=$O(^[QUI]SCOMPREG(DOM))
 Q:DOM=""
 D DOM
 G BALL1
 
DOM 
 
 S ATTR=""
BALL2 S ATTR=$O(^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR))
 Q:ATTR=""
 S INDIC=""
BALL3 S INDIC=$O(^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC))
 G:INDIC="" BALL2
 S VAL1=""
BALL4 S VAL1=$O(^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC,VAL1))
 G:VAL1="" BALL3
 S VAL2=""
BALL5 S VAL2=$O(^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC,VAL1,VAL2))
 G:VAL2="" BALL4
 S RES=$$REGLE(DOM,ATTR,INDIC,VAL1,VAL2,1,0)
 Q:ABANDON
 R *CTRLA:0
 D TOUCHE^%INCCLAV(CTRLA,.CTRLA)
 I CTRLA=1 D ARRET Q:ABANDON
 G BALL5
 
REGLE(DOM,ATTR,INDIC,VAL1,VAL2,VISU,INTERACT) 
 N CONT,OK,LP,OKTOT,LER,I,J,LP,Y1,COND,P1C,ERRMES,Y1,DX,DY
 S LP=$$^%QCAZG("^[QUI]PBMANA(""SCO"")")+1
 S OKTOT=1,OK=1,ERRMES=0,DX=0,DY=0
 S LER=$$^%QZCHW("Erreur d'analyse dans la condition")
 I VISU W !,! D REV^%VVIDEO W DOM," ",ATTR," ",INDIC," ",VAL1," ",VAL2 D NORM^%VVIDEO
 S P1C=""
 F %I=0:0 S P1C=$O(^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC,VAL1,VAL2,"COND",P1C)) Q:P1C=""  D REMP W:VISU !,"  ",Y1 D UCA^%SCOREG2(0),AFFEC I '(OK) D:'(INTERACT) ERREUR S OK=1,OKTOT=0 W:VISU !,"   ",LER
 W:VISU !,"    ",$$^%QZCHW("ANALYSE")," ",$S(OKTOT=1:"OK",1:$$^%QZCHW("NON")_" OK")
 S ^[QUI]PBMANA("SCO")=LP-1
 Q OKTOT
 
AFFEC 
 I '(OK) S ^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC,VAL1,VAL2,"COND",P1C,"TETE")="" Q
 S ^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC,VAL1,VAL2,"COND",P1C,"TETE")=CONT(P1C,"TETE")
 Q
 
REMP 
 S CONT(P1C)=^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC,VAL1,VAL2,"COND",P1C)
 S Y1=CONT(P1C)
 S CONT(P1C,"TETE")=$S($D(^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC,VAL1,VAL2,"COND",P1C,"TETE")):^[QUI]SCOMPREG(DOM,"NON.EGALITE",ATTR,INDIC,VAL1,VAL2,"COND",P1C,"TETE"),1:"")
 Q
 
ERREUR G:'(OKTOT) ERR2
 S ^[QUI]PBMANA("SCO",LP)=DOM_" "_ATTR_" "_INDIC_" "_VAL1_" "_VAL2
 S LP=LP+1
 S ^[QUI]PBMANA("SCO",LP)=$TR($J(" ",$L(^[QUI]PBMANA("SCO",LP-1)))," ","-"),LP=LP+1
ERR2 S ^[QUI]PBMANA("SCO",LP)=LER_" n "_P1C_" : "_Y1
 S LP=LP+1
 Q
 
ARRET W !,!
 D POCLEPA^%VVIDEO
 S ABANDON=$$MES^%VZEOUI($$^%QZCHW("Arret immediat ?"),"O")
 Q
 
 
VISU N CHOIX
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Regles de Savoir Comparer : pbmes d'analyse"),0)
 I $D(^[QUI]PBMANA("SCO"))'=11 D ^%VZEAVT($$^%QZCHW("Pas de probleme d'analyse rencontre")) Q
 D CARSP^%VVIDEO(0,2,21,79,1)
 D REAFF^%QULIMO3(1,1,"^[QUI]PBMANA(""SCO"")",0,2,79,21)
 D VISU^%QULIMO(0,2,79,21,"^[QUI]PBMANA(""SCO"")",1)
 Q
 
 
DOMAINE(DOM) 
 N CTRLA,ABANDON,RES,ATTR,INDIC,VAL1,VAL2
 S ABANDON=0
 K ^[QUI]PBMANA("SCO")
 D DOM
 Q

