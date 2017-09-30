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

;%QSETTI1^INT^1^59547,73881^0
QSETTI1 ;
 
 
 
 
 
EDIT 
 Q:'($D(^AFF($J)))
 N ADR,CTR,GAPBN,MEN,NGAP,CX
 S CX=$S(RM=80:30,1:50)
 S GAPBN=$S($D(^AFF($J,EGAP)):EGAP,1:EGAP-1),EGAP=GAPBN
 S MEN(1)="+"_"^PLUS",MEN(1,"EQU")="=",MEN(2)="-"_"^MOIN",MEN(3)="page"_"^PAGE"
 D CLEPAG^%VVIDEO I RM=80 D ^%VZCDB(TITRE,0)
 I RM=132 D G132^%VZCDB(TITRE,0)
 S DX=0,DY=3 X XY W %CH3
 S DY=4 X XY W %CH4 S DY=5 X XY W %CH5 S DY=6 X XY W %CH3
 D AFF1
 
SUIT S DX=CX,DY=2 X XY W $$^%QZCHW("Page")_" "_EGAP_"/"_GAPBN,$J("",10)
ACT D POCLEPA^%VVIDEO,^%VQUIKMN(CX,79,23,"MEN",.ADR,.CTR) Q:(CTR="A")!(CTR="F")  G:ADR'="" @ADR G ACT
 
PAGE 
 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("Page")_" : ")
 G:CTRLA!CTRLF SUIT G:Y1="" SUIT G:'($$ADR^%QZNBN1(Y1)) SUIT
 S NGAP=Y1 D AFF G SUIT
MOIN 
 S NGAP=EGAP-1 D AFF G SUIT
PLUS 
 S NGAP=EGAP+1 D AFF G SUIT
 
AFF 
 I '($D(^AFF($J,NGAP))) D ^%VSQUEAK Q
 S EGAP=NGAP,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 S DY=""
 F %I=1:1 S DY=$O(^AFF($J,EGAP,DY)) Q:DY=""  S DX=0 X XY W ^AFF($J,EGAP,DY)
 Q

