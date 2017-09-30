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

;%QFINTOB^INT^1^59547,73875^0
GRINTOBJ ;
 
 S LI=$Y,DX1=2,DY1=$Y Q:'($D(^PAG($J,PAG,LI)))  S OBJ=^PAG($J,PAG,LI),QUER=^[QUI]GRLISTE(NUFA,OBJ)
 G IOB
IOC S DX=0,DY=2 D CLEBAS^%VVIDEO S AFF=$S($D(^[QUI]GROAFF(NUFA,OBJ))=0:"aucune",1:^[QUI]GROAFF(NUFA,OBJ)) X XY D BLD^%VVIDEO W OBJ," affectation: ",AFF D NORM^%VVIDEO S ATTR=-1,TIT=""
DIOC S LI=8,EGAP=1,EGAPBN=1
LIOC S ATTR=$N(^[QUI]QUERY3(QUER,OBJ,1,ATTR)) G:ATTR=-1 FINATT S NBL=30-$L(ATTR) D BLANC^%QFECRAN S ^AFFPAG($J,EGAP,LI)=BLANC_ATTR_":  "_$O(^[QUI]QUERY3(QUER,OBJ,1,ATTR,"")),LI=LI+1 G:LI=21 PIOC G LIOC
PIOC I $N(^[QUI]QUERY3(QUER,OBJ,1,ATTR))=-1 G FINATT
 S EGAP=EGAP+1,EGAPBN=EGAP,LI=8 G LIOC
FINATT D ^TOPAGIN,AFFGD^%QFECRAN S RETOUR=1 Q
IOB S DX=0,DY=2 D CLEBAS^%VVIDEO S DX=0,DY=4,AFF=$S($D(^[QUI]GROAFF(NUFA,OBJ))=0:"aucune",1:^[QUI]GROAFF(NUFA,OBJ)) X XY D BLD^%VVIDEO W OBJ," affectation: ",AFF D NORM^%VVIDEO S ATTR=-1
 N TEMP,LATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LATT=$$CONCAS^%QZCHAD(TEMP,"LATT")
 F I=2:1:5 G:^ATTR($J,"O",I)="" FIOB S ATTR=^ATTR($J,"O",I),@LATT@(I-1,ATTR)=$$PI^%QFCALVA(OBJ,ATTR)
FIOB D:I>2 SELECT^%QSATTRI(OBJ,QUER,1,5,75,12,LATT) W *-1 D POCLEPA^%VVIDEO
 D:I=2 ^%QSATTRI(OBJ,QUER,1,5,75,12) D POCLEPA^%VVIDEO
 D AFFGD^%QFECRAN S RETOUR=1
 K @(TEMP)
 Q
SHORT S DY1=$Y,DX1=2 Q:'($D(^PAG($J,PAG,DY1)))  S OBJ=^PAG($J,PAG,DY1),AFF=$S('($D(^[QUI]GROAFF(NUFA,OBJ))):"Aucune",1:^[QUI]GROAFF(NUFA,OBJ)),%OO=OBJ_"/ ",%L=$L(%OO) D BLD^%VVIDEO,CUROF^%VVIDEO
 D POCLEPA^%VVIDEO W %OO,"affectation: ",AFF H 1
 F %I=1:1:6 S %ATTR=^ATTR($J,"O",%I) I %ATTR'="" S %T=%OO_%ATTR_": "_$$PI^%QFCALVA(OBJ,%ATTR) D POCLEPA^%VVIDEO W $E(%T,1,79) H 1
 K %I,%OO,%ATTR,%T D NORM^%VVIDEO,CURON^%VVIDEO S RETOUR=1 Q

