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

;%QSEDIB2^INT^1^59547,73881^0
QSEDIB2 ;
 
 
 
 
 
 
 
ECR 
 Q:'($D(@TEMP@("PAG")))
 N DYY,GAPBN,NGAP,P,PP,TABC,TIT,XX
 S GAPBN=$S($D(@TEMP@("PAG",EGAP)):EGAP,1:EGAP-1),EGAP=GAPBN
 S TABC(1)="+"_"^PLUS",TABC(1,"EQU")="=",TABC(2)="-"_"^MOIN",TABC(3)="page"_"^PAGE",TABC(4)="?"_"^REP"
 D EFF(2)
ENT S DX=0,DY=4 X XY W ?10,$$^%QZCHW("Attributs"),?40,$$^%QZCHW("Valeur"),?70,$$^%QZCHW("Unite")
 S DX=15,DY=5 X XY W $$^%QZCHW("Commentaire")
 S DY=6,DX=0 X XY W $TR($J("",79)," ","-")
 D AFF1
SUIT S DX=68,DY=2 X XY W $J("",11) X XY W $$^%QZCHW("Page")_" "_EGAP_"/"_GAPBN
 D POCLEPA^%VVIDEO
ACT D ^%VQUIKMN(20,79,23,"TABC",.ADR,.CTR) G:(CTR="A")!(CTR="F") END G:ADR'="" @ADR G ACT
PAGE 
 D POCLEPA^%VVIDEO X XY S Y1=$$^%VZAME1($$^%QZCHW(" Page : ")) G:CTRLA!CTRLF SUIT G:Y1="" SUIT G:'($$ADR^%QZNBN1(Y1)) SUIT S NGAP=Y1 D AFF G SUIT
MOIN 
 S NGAP=EGAP-1 D AFF G SUIT
PLUS 
 S NGAP=EGAP+1 D AFF G SUIT
AFF 
 I '($D(@TEMP@("PAG",NGAP))) D ^%VSQUEAK Q
 S EGAP=NGAP D EFF(8)
AFF1 S DY="" F %QY=1:1 S DY=$O(@TEMP@("PAG",EGAP,DY)) Q:DY=""  D AFF2
 Q
AFF2 I DY=8 S DYY=DY,DY=2,DX=2 X XY W REP," : ",@TEMP@("IND",EGAP) S DX=0,DY=3 X XY W $TR($J("",79)," ","-") S DY=DYY
 S DX=5 X XY W @TEMP@("PAG",EGAP,DY) Q
END D EFF(5) K @(TEMP) Q
REP 
 S XX="",P=0
 D EFF(2)
 F PP=1:1 Q:'($D(@TEMP@("IND",PP)))  D AFFP Q:(XX=1)!(XX=6)
 I XX'=1 D ^%VZEAVT("")
 D EFF(2) G ENT
AFFP W $$^%QZCHW("Page : "),PP,?20,@TEMP@("IND",PP),!
 S P=P+1 D:(P#17)=0 ALORS Q
ALORS D POCLEPA^%VVIDEO W $$^%QZCHW("(RETURN) pour continuer ,(CTRLA) pour finir ") R *X
 S P=0 D EFF(6) Q
 
EFF(DY) S DX=0 D CLEBAS^%VVIDEO Q
 
 
IMPR 
 N %DAT,HEURE,EGAP,ZLG
 D ZD^%QMDATE4,^%QMDAK0,MSG^%VZEATT($$^%QZCHW("Impression en cours")_"...")
 O IMP U IMP
 F EGAP=1:1 Q:'($D(@TEMP@("PAG",EGAP)))  D ENTET F ZLG=8:1 Q:'($D(@TEMP@("PAG",EGAP,ZLG)))  W !,?7,@TEMP@("PAG",EGAP,ZLG)
 W !,# C IMP
 D ^%VZEAVT($$^%QZCHW("Impression terminee "))
 K @(TEMP) Q
ENTET 
 W #,!,?5,$$^%QZCHW("Le")," ",%DAT," ",$$^%QZCHW("a")," ",HEURE,?65,$$^%QZCHW("Page")," : ",EGAP,!,!,!
 W ?15,REP," : ",@TEMP@("IND",EGAP),!,!,?5,$TR($J("",71)," ","-")
 W !,?10,$$^%QZCHW("Attributs"),?40,$$^%QZCHW("Valeur"),?70,$$^%QZCHW("Unite"),!,?20,$$^%QZCHW("Commentaire"),!,?5,$TR($J("",71)," ","-"),!
 Q

