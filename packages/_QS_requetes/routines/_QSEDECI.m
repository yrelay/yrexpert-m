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

;%QSEDECI^INT^1^59547,73881^0
QSEDECI ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ECR Q:'($D(^AFFPAG($J)))
 N DYY,GAP,GAPBN,NGAP,P,PP,REP,TABC
 S GAPBN=$S($D(^AFFPAG($J,EGAP)):EGAP,1:EGAP-1),EGAP=GAPBN
 S TABC(1)="+"_"^PLUS",TABC(1,"EQU")="=",TABC(2)="-"_"^MOIN",TABC(3)="page"_"^PAGE",TABC(4)="?"_"^REP"
 S DX=0,DY=5 D CLEBAS^%VVIDEO
ENT S DX=0,DY=6 X XY W TIT D AFF1
SUIT S GAP=$$^%QZCHW("Page ")_EGAP_"/"_GAPBN,DX=40-($L(GAP)\2),DY=5 X XY W GAP S DX=(($X-$L(GAPBN))-1)-$L(EGAP)
 D POCLEPA^%VVIDEO
ACT D ^%VQUIKMN(10,79,23,"TABC",.ADR,.CTR) G:(CTR="A")!(CTR="F") 1 G:ADR'="" @ADR G ACT
PAGE 
 D POCLEPA^%VVIDEO X XY S Y1=$$^%VZAME1($$^%QZCHW(" Page : ")) G:CTRLA!CTRLF SUIT G:Y1="" SUIT G:'($$ADR^%QZNBN1(Y1)) SUIT S NGAP=Y1 D AFF G SUIT
1 G END
MOIN 
 S NGAP=EGAP-1 D AFF G SUIT
PLUS 
 S NGAP=EGAP+1 D AFF G SUIT
AFF 
 I '($D(^AFFPAG($J,NGAP))) D ^%VSQUEAK Q
 S EGAP=NGAP,DX=0,DY=8 D CLEBAS^%VVIDEO
AFF1 S DY="" F %QY=1:1 S DY=$O(^AFFPAG($J,EGAP,DY)) Q:DY=""  D AFF2
 Q
AFF2 I DY=10 S DYY=DY,DY=8,DX=L X XY W ^AFFIND($J,EGAP) S DY=DYY
 S DX=0 X XY W ^AFFPAG($J,EGAP,DY) Q
END S DX=0,DY=5 D CLEBAS^%VVIDEO Q
REP 
 S REP="",P=0,DX=0,DY=6 D CLEBAS^%VVIDEO
 F PP=1:1 Q:'($D(^AFF($J,PP)))  D AFFP Q:(REP=1)!(REP=6)
 D POCLEPA^%VVIDEO I REP'=1 W $$^%QZCHW("[RETURN] ") R *REP
 S DX=0,DY=6 D CLEBAS^%VVIDEO G ENT
AFFP W $$^%QZCHW("Page : "),PP,?15,$P(^AFF($J,PP)," ",1),! S P=P+1 D:(P#17)=0 ALORS Q:REP=1  Q:NB=1
 W ?15,$P(^AFF($J,PP)," ",2),! S P=P+1 D:(P#17)=0 ALORS Q:REP=1  Q:NB=2
 W ?15,$P(^AFF($J,PP)," ",3),! S P=P+1 D:(P#17)=0 ALORS Q:REP=1  Q:NB=3
 W ?15,$P(^AFF($J,PP)," ",4),! S P=P+1 D:(P#17)=0 ALORS Q
ALORS D POCLEPA^%VVIDEO W $$L2^%QSLIB R *REP D TOUCHE^%INCCLAV(REP,.REP)
 S P=0,DX=0,DY=6 D CLEBAS^%VVIDEO Q
 
IMPR 
 
 
 
 N EGAP,ZLG
 D ZD^%QMDATE4,^%QMDAK0,POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours...") O IMP U IMP
 F EGAP=1:1 Q:'($D(^AFFPAG($J,EGAP)))  D ENTET F ZLG=10:1 Q:'($D(^AFFPAG($J,EGAP,ZLG)))  W !,?10,^AFFPAG($J,EGAP,ZLG)
 W !,# C IMP
 D ^%VZEAVT($$^%QZCHW("Impression terminee ")) Q
ENTET 
 W #,!,$$^%QZCHW("Le : "),%DAT,$$^%QZCHW(" a : "),HEURE,?75,$$^%QZCHW("Page : "),EGAP,!,!,!
 W ?10,$$^%QZCHW("Attributs"),?10+L,I G:NB=1 NIND W ?(L*2)+10,I G:NB=2 NIND W ?(L*3)+10,I G:NB=3 NIND W ?(L*4)+10,I
NIND W !,!,?L+10,^AFFIND($J,EGAP),!,! Q

