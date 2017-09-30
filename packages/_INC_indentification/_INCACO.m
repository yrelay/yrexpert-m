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

;%INCACO^INT^1^59547,73870^0
INCACO ;
 
 
 
 
 
 N I,MES,R,REP,Y1
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,MSG=$$^%QZCHW("MAJ DU CONFIGURATION COURANTE"),GRAPH=1 D 4^%VZCD
 S DX=10,DY=8 X XY W $$^%QZCHW("configuration courante : "),$$PCONF^%INCASTO("CONF")
 D POCLEPA^%VVIDEO W $$^%QZCHW("Voulez-vous la modifier ") S REP=$$^%VZEOUI("N")
 Q:REP=-1  G REP0:REP'=1,REP1:REP=1
REP0 Q
REP1 D POCLEPA^%VVIDEO S R=$$^%VZECH2($$^%QZCHW("Quelle valeur : "),"Defaut","Autre") Q:R=-1  G D:R'="Autre",A:R="Autre"
D D STAND^%INCASTO Q
A D POCLEPA^%VVIDEO,INIT^%QUCHOIP("^INCONNE(""INCA1"")",1,"",0,10,80,12),AFF^%QUCHOIP
 S Y1=$$UN^%QUCHOIP Q:Y1=""
 D STOCONF^%INCASTO(Y1)
 Q
 
INTER 
 
 
WHOR 
 N WHOR
 S YY1="",VDEF=" ",MES=$$^%QZCHW("Service origine : "),DX1=10,DY1=10
 D S1^%VLECFL(VDEF,MES,DX1,DY1,.CTR,.YY1) Q:((CTR="A")!(CTR="F"))!(YY1=" ")
 I YY1'="?" S WHOR=YY1 I '($D(^TABIDENT(WHOR))) D ^%VZEAVT($$^%QZCHW("Service inconnu... ")),CLEPAG^%VVIDEO G WHOR
 I YY1="?" S WHOR=$$^%QUCHOYO("^TABIDENT",.R,1) D:WHOR="" CLEPAG^%VVIDEO G:WHOR="" WHOR I '($D(^TABIDENT(WHOR))) D ^%VZEAVT($$^%QZCHW("Service inconnu...")),CLEPAG^%VVIDEO G WHOR
WHDES 
 I YY1="?" D CLEPAG^%VVIDEO
 N WHDES
 S YY1="",VDEF=" ",MES=$$^%QZCHW("Service destination : "),DX1=10,DY1=15
 D S1^%VLECFL(VDEF,MES,DX1,DY1,.CTR,.YY1) Q:((CTR="A")!(CTR="F"))!(YY1=" ")
 I YY1'="?" S WHDES=YY1 I '($D(^TABIDENT(WHDES))) D ^%VZEAVT($$^%QZCHW("Service inconnu... ")),CLEPAG^%VVIDEO G WHDES
 I YY1="?" S WHDES=$$^%QUCHOYO("^TABIDENT",.R,1) D:WHDES="" CLEPAG^%VVIDEO G:WHDES="" WHDES I '($D(^TABIDENT(WHDES))) D ^%VZEAVT($$^%QZCHW("Service inconnu...")),CLEPAG^%VVIDEO G WHDES
 D:YY1="?" CLEPAG^%VVIDEO D DUPL^%INCODEF(WHOR,WHDES)
 Q
 ;

