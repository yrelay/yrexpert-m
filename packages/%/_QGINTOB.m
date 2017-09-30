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

;%QGINTOB^INT^1^59547,73876^0
GRINTOBJ ;;06:38 PM  3 Jun 1992 ; 05 Nov 92  2:08 PM
 
 S LI=$Y,DX1=2,DY1=$Y Q:'($D(^PAG($J,PAG,LI)))  S OBJ=^PAG($J,PAG,LI),QUER=@GRLISTE@(OBJ)
 G IOB
IOC S DX=0,DY=2 D CLEBAS^%VVIDEO S AFF=$S($D(@GROAFF@(OBJ))=0:"aucune",1:@GROAFF@(OBJ)) X XY D BLD^%VVIDEO W OBJ," affectation: ",AFF D NORM^%VVIDEO S ATTR=-1,TIT=""
DIOC S LI=8,EGAP=1,EGAPBN=1
LIOC S ATTR=$N(^[QUI]QUERY3(QUER,OBJ,1,ATTR)) G:ATTR=-1 FINATT S NBL=30-$L(ATTR) D BLANC^%QGECRAN S ^AFFPAG($J,EGAP,LI)=BLANC_ATTR_":  "_$O(^[QUI]QUERY3(QUER,OBJ,1,ATTR,"")),LI=LI+1 G:LI=21 PIOC G LIOC
PIOC I $N(^[QUI]QUERY3(QUER,OBJ,1,ATTR))=-1 G FINATT
 S EGAP=EGAP+1,EGAPBN=EGAP,LI=8 G LIOC
FINATT D ^TOPAGIN,AFFGD^%QGECRAN S RETOUR=1 Q
 
 
IOB 
 S DX=0,DY=1 D CLEBAS^%VVIDEO S DX=0,DY=2
 X XY D BLD^%VVIDEO W OBJ," ",$$^%QZCHW("affectations")_" : "
 I '($D(@GROAFF@(OBJ))) S @GROAFF@(OBJ)=0
 S NUM=@GROAFF@(OBJ),NUM=$S(NUM>99:NUM_" ",NUM>9:" "_NUM_" ",1:"  "_NUM_" "),DX=DX+40 X XY W NUM_"/"
 S NUM=@GRLISTE@(OBJ,"NB"),NUM=$S(NUM>99:NUM_" ",NUM>9:" "_NUM_" ",1:"  "_NUM_" "),DX=DX+5 X XY W NUM
 I @GROAFF@(OBJ)=0 G IOB2
 S DX=10
 S ATTR="" F I=1:1 S ATTR=$O(@GROAFF@(OBJ,ATTR)) G:ATTR="" IOB2 I @GROAFF@(OBJ,ATTR)>0 S NUM=@GROAFF@(OBJ,ATTR),NUM=$S(NUM>99:NUM_" ",NUM>9:" "_NUM_" ",1:"  "_NUM_" "),DY=DY+1 X XY W NUM_" "_$$^%QZCHW("dans")_" "_ATTR
IOB2 
 S ATTR=-1
 N TEMP,LATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LATT=$$CONCAS^%QZCHAD(TEMP,"LATT")
 F I=2:1:5 G:^ATTR($J,"O",I)="" FIOB S ATTR=^ATTR($J,"O",I),@LATT@(I-1,ATTR)=$$PI^%QGCALVA(OBJ,ATTR)
FIOB 
 
 D ^%QSATTRI(OBJ,QUER,1,8,75,12),POCLEPA^%VVIDEO
 D AFFGD^%QGECRAN S RETOUR=1
 K @(TEMP)
 Q
SHORT S DY1=$Y,DX1=2 Q:'($D(^PAG($J,PAG,DY1)))  S OBJ=^PAG($J,PAG,DY1),AFF=$S('($D(@GROAFF@(OBJ))):"Aucune",1:@GROAFF@(OBJ)),%OO=OBJ_"/ ",%L=$L(%OO) D BLD^%VVIDEO,CUROF^%VVIDEO
 D POCLEPA^%VVIDEO W %OO,"affectation: ",AFF H 1
 F %I=1:1:6 S %ATTR=^ATTR($J,"O",%I) I %ATTR'="" S %T=%OO_%ATTR_": "_$$PI^%QGCALVA(OBJ,%ATTR) D POCLEPA^%VVIDEO W $E(%T,1,79) H 1
 K %I,%OO,%ATTR,%T D NORM^%VVIDEO,CURON^%VVIDEO S RETOUR=1
 Q

