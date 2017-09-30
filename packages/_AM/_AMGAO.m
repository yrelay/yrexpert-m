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

;%AMGAO^INT^1^59547,73865^0
%AMGAO ;;05:45 PM  10 Aug 1993;
 
 
 
 
OBJ D ^%funckey("")
 S FTF=$O(^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",""))
 S NBTOT=$ZP(^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",""))
 D FKOBJ
 S MENUCOUR=CHOBJ
 D ^%funckey(MENUCOUR)
OBJ2 
 S MENURET="OBJ2^%AMGAO"
 R *xx
 G:xx=27 FIN
 G:xx=2 CTRLB
 G:xx=5 CTRLE
 G:xx=13 AUTOM
 I $D(@TCHOBJ@(xx)) S OPT=@TCHOBJ@(xx) G FIND
 G OBJ2
 
FIND 
 S TYPE=@TCHOBJ@(xx)
 S RES=$$FIND^%AMGAO2(TYPE,.NJRN,.NINST)
 
 I RES=-1 G OBJ2
 I RES=0 D NOFOUND^%AMGA2 G OBJ2
 G POP
 
CTRLB S LIG=@GJOURN@(INST)
 S TYPE=$P(LIG,$C(0),2)
 G:'($D(^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE))) @MENURET
 D ^%funckey(""),longwin^%funckey()
 
 W /WOPEN(0,0,79,24,"","","","","tc")
 S A1=$P(LIG,$C(0),3),A2=$P(LIG,$C(0),4),A3=$P(LIG,$C(0),5),A4=$P(LIG,$C(0),6),A5=$P(LIG,$C(0),7)
 S NBKEY=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"NBCLEFS")
 I '($D(^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"CTRB"))) D NODISPO^%AMGA2 G CTRLBF
 S CTRB=""
CTRLBL S CTRB=$O(^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"CTRB",CTRB))
 G:CTRB="" CTRLBF
 S ROUT=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"CTRB",CTRB)
 S:NBKEY=1 @("RES="_ROUT_"(A1,A2)")
 S:NBKEY=2 @("RES="_ROUT_"(A1,A2,A3)")
 S:NBKEY=3 @("RES="_ROUT_"(A1,A2,A3,A4)")
 S:NBKEY=4 @("RES="_ROUT_"(A1,A2,A3,A4,A5)")
 S:NBKEY=5 @("RES="_ROUT_"(A1,A2,A3,A4,A5,A6)")
 S:NBKEY=6 @("RES="_ROUT_"(A1,A2,A3,A4,A5,A6,A7)")
 I RES=0 D ECHEC^%AMGA2 G CTRLBF
 G CTRLBL
CTRLBF W /WCLOSE
 D shortwin^%funckey("")
 D ^%funckey(MENUCOUR)
 G @MENURET
 
 
CTRLL D ^%funckey(""),longwin^%funckey()
 W /WOPEN(0,0,79,24,"","","","","tc")
 S NJRN=$$VISU^%AMGVIS(JRN)
 W /WCLOSE
 D shortwin^%funckey("")
 D ^%funckey(MENUCOUR)
 G:NJRN=JRN @MENURET
 S JRN=NJRN,INST=$ZP(@GJOURN@(""))
 G POP2
 
 
 
AGAIN I '($D(@LAST)) W *7 G @MENURET
 S TX=@LAST,TYPE=$P(TX,$C(0),2)
 G AUTOM2
 
 
AUTOM S TX=@GJOURN@(INST),TYPE=$P(TX,$C(0),2)
 
AUTOM2 I TYPE'="TEXTE",$D(^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE)),$$FIND^%AMFIND2(JRN,INST,.NJRN,.NINST,TYPE,profondeur,^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TYPE,"NBCLEFS"),$P(TX,$C(0),3),$P(TX,$C(0),4),$P(TX,$C(0),5),$P(TX,$C(0),6),$P(TX,$C(0),7),$P(TX,$C(0),8)) G POP
 W *7 G @MENURET
 
 
CTRLE G:'($D(@DEFETU@("fille",INST))) @MENURET
 S NJRN=@DEFETU@("fille",INST,1) G:'($$EXIETU^%AMG(NJRN)) @MENURET
 S JRN=NJRN,INST=$ZP(@GJOURN@("")) G POP2
 
POP S JRN=NJRN,INST=NINST
POP2 D ^%funckey(""),AFFKEY^%AMGA1 G NXFEN^%AMGA1
 
 
 
FIN D ^%funckey(""),AFFKEY^%AMGA1 G ACT^%AMGA1
 
 
 
 
FKOBJ 
 G FK2
 S ITF=21,NBTF=0
 S TCHOBJ=$$TEMP^%SGUTIL
 S CHOBJ=""
 S TF=""
 S CHOBJ=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TF,"TEXTE"),@TCHOBJ@(ITF)=TF,ITF=$S(ITF'=26:ITF+1,1:ITF+2),NBTF=NBTF+1
 F %TF=0:0 S TF=$O(^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TF)) Q:TF=""  S CHOBJ=CHOBJ_","_^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TF,"TEXTE"),@TCHOBJ@(ITF)=TF,ITF=$S(ITF'=26:ITF+1,1:ITF+2),NBTF=NBTF+1
 Q
FK2 
 S ITF=21,NBTF=0
 S TCHOBJ=$$TEMP^%SGUTIL
 S CHOBJ="",TF=""
 S TF=$O(^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.OBJET",TF)),TTF=^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.OBJET",TF),CHOBJ=^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TTF,"TEXTE"),@TCHOBJ@(ITF)=TTF
 S ITF=$S(ITF'=26:ITF+1,1:ITF+2)
 F %TF=0:0 S TF=$O(^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.OBJET",TF)) Q:TF=""  S TTF=^%RQSGLO("EXPLIC",@MOTEUR,"TOUCHE.OBJET",TF),CHOBJ=CHOBJ_","_^%RQSGLO("EXPLIC",@MOTEUR,"OBJET",TTF,"TEXTE"),@TCHOBJ@(ITF)=TTF,ITF=$S(ITF'=26:ITF+1,1:ITF+2),NBTF=NBTF+1
 Q
 ;
 ;

