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

;%EMSPDEF^INT^1^59547,73869^0
EMSPDEF(TEMP) 
 
 
 
 
 
 
 
 
 
 
 
 N %I,CA,CH,CPT,NUM,ELEM,TYP,DERX,DERY,ORX,ORY,SAUV
 S ELEM=$$CONCAS^%QZCHAD(TEMP,"ELEM")
 
 S CPT=$ZP(@ELEM@(""))+0
 
 I $D(@TEMP@("ORX")) S ORX=@TEMP@("ORX"),ORY=@TEMP@("ORY"),DERX=@ELEM@($ZP(@ELEM@("")),"D2X"),DERY=@ELEM@($ZP(@ELEM@("")),"D2Y") G AFF
 
 D CLEPAG^%VVIDEO
ORI D MSG^%VZEATT($$^%QZCHW("Veuillez indiquer par un [RETURN] le point d'origine des axes"))
 
 D MIRE^%VZAMIRE("NOLIB",0,2,0,23,0,.CH,.ORX,.ORY,.CA)
 I CA=1 Q
 I CA'=13 G ORI
 S DERX=ORX,DERY=ORY
 
AFF D REAFF(ELEM,ORX,ORY)
CAR 
 D POCLEPA^%VVIDEO X XY W $$^%QZCHW("CTRLH = aide")
 D POSIT^%VZAMIRE("LET",0,.CH,.DERX,.DERY,.CA)
 
 I CH'="" G DEF
 I CA=1 G STOP
 
 I CA=6 G FIN
 
 I CA=8 D AIDE G AFF
 
 I CA=18 G AFF
 
 G CAR
 
DEF 
 I (((CH'="D")&(CH'="A"))*(CH'="S"))&(CH'="M") G CAR
 
 G @CH
 
STOP 
 K @(TEMP) Q
 
FIN 
 I CPT=0 G STOP
 S @TEMP@("TYPE")="SPECIFIQUE",@TEMP@("CPT")=CPT
 S @TEMP@("ORX")=ORX,@TEMP@("ORY")=ORY
 Q
 
D 
 D MSG^%VZEATT($$^%QZCHW("Droite")) H 1
 S NUM=$$NOUV^%EMSPGES(ELEM) G:NUM="" CAR
 
 D INIT^%EMSPDRT(ELEM,NUM)
 
 D DEF^%EMSPDRT(ELEM,NUM,1,"",.CPT,.DERX,.DERY)
 G AFF
 
A 
 D MSG^%VZEATT($$^%QZCHW("Arc de cercle")) H 1
 S NUM=$$NOUV^%EMSPGES(ELEM) G:NUM="" CAR
 
 D INIT^%EMSPARC(ELEM,NUM)
 
 D DEF^%EMSPARC(ELEM,NUM,1,"",.CPT,.DERX,.DERY)
 G AFF
 
M 
 I CPT=0 G NUL
 S NUM=$$EXIST^%EMSPGES(ELEM,.TYP) I NUM="" G CAR
 I TYP="DROITE" D COOR^%EMSPDRT(ELEM,NUM)
 I TYP="ARC" D COOR^%EMSPARC(ELEM,NUM)
 G AFF
 
S 
 I CPT=0 G NUL
 S NUM=$$EXIST^%EMSPGES(ELEM,.TYP) I NUM="" G CAR
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression")_" ? ")'=1 G CAR
 S DERX=@ELEM@(NUM,"D1X"),DERY=@ELEM@(NUM,"D1Y")
 S SAUV("P2X")=@ELEM@(NUM,"P2X"),SAUV("P2Y")=@ELEM@(NUM,"P2Y")
 
 K @ELEM@(NUM) S CPT=CPT-1
 D REAFF(ELEM,ORX,ORY)
 I $O(@ELEM@(NUM))="" K SAUV G CAR
 
 
I 
 D MSG^%VZEATT($$^%QZCHW("Insertion... Veuillez taper A / D / CTRLA pour abandonner"))
 D POSIT^%VZAMIRE("LET",0,.CH,.DERX,.DERY,.CA)
 I CA=1 G STOP
 I (CH'="A")&(CH'="D") G I
 I CH="D" D INIT^%EMSPDRT(ELEM,NUM),DEF^%EMSPDRT(ELEM,NUM,0,"SAUV",.CPT,.DERX,.DERY)
 I CH="A" D INIT^%EMSPARC(ELEM,NUM),DEF^%EMSPARC(ELEM,NUM,0,"SAUV",.CPT,.DERX,.DERY)
 I '($D(@ELEM@(NUM))) G I
 
 D REAFF(ELEM,ORX,ORY)
 I '($D(SAUV)) S DERX=@ELEM@($ZP(@ELEM@("")),"D2X"),DERY=@ELEM@($ZP(@ELEM@("")),"D2Y") G CAR
 
 
 F %I=$ZP(@ELEM@("")):-1:NUM+1 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(ELEM,%I),$$CONCAT^%QZCHAD(ELEM,%I+1))
 
 S NUM=NUM+1
 K @ELEM@(NUM)
 G I
 
NUL D ^%VZEAVT($$^%QZCHW("Aucun element n'a ete defini")) G CAR
 
 
REAFF(GLO,ORX,ORY) 
 N %N,NUM,CLE,D1X,D1Y,D2X,D2Y
 D CLEPAG^%VVIDEO
 S DY=ORY F DX=0:1:79 X XY W "-"
 S DX=ORX F DY=0:1:23 X XY W "|"
 S DX=ORX,DY=ORY X XY W "+"
 
 S NUM=""
 F %N=0:0 S NUM=$O(@GLO@(NUM)) Q:NUM=""  D AFFI
 Q
AFFI 
 F CLE="D1X","D1Y","D2X","D2Y" S @CLE=@GLO@(NUM,CLE)
 I @GLO@(NUM)="DROITE" D DROITE^%VGRA(D1X,D1Y,D2X,D2Y,NUM)
 I @GLO@(NUM)="ARC" D ARC^%VGRA(D1X,D1Y,D2X,D2Y,@GLO@(NUM,"ANG")*$S(@GLO@(NUM,"OR")="-":-1,1:1),NUM)
 Q
 
AIDE 
 N A,I,DX,DY
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Aide"),0)
 D CARSP^%VVIDEO(2,3,16,75)
 S DY=5
 F I=1:1 S A=$T(FUN+I) Q:A=""  D ECR($P(A,";;",2))
 D ^%VZEAVT("")
 Q
ECR(A) 
 S DY=DY+1,DX=5 X XY D BLD^%VVIDEO
 W $$^%QZCHW($P($P(A,"#",2),"#"))
 D NORM^%VVIDEO
 S DX=20 X XY W $$^%QZCHW($P(A,"#/",2))
 Q
FUN ;;
 ;;#CTRLA#/Abandonner
 ;;#CTRLF#/Sauvegarder et calculer le developpe
 ;;#CTRLR#/Reafficher
 ;;#D#/Definir une droite
 ;;#A#/Definir un arc de cercle
 ;;#S#/Supprimer un element existant et insertion d'elements
 ;;#M#/Modifier les valeurs effectives d'un element existant
 ;;

