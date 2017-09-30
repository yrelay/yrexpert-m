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

;%QMDRTST^INT^1^59547,73877^0
QMDRTST ;
 D CLEPAG^%VVIDEO S SCR="QMDRTST",%V=^%SCRE(SCR) F %U=1:1:%V S RESUL(%U)="",PATOUCH(%U)="",DEJALU(%U)=""
 D ^%VAFIGRI,^%VAFISCR,^%VCURWAY(SCR) K ^POS($J) S CMS=0,POS=$P($T(POS),";;",2) F %U=1:1 S IT=$P(POS,"/",%U) Q:IT=""  S ^POS($J,$P(IT,",",1))=$P(IT,",",2,999),LI=$P(IT,",",2),DX=$P(IT,",",3),DY=$P(IT,",",4) X XY W LI
T0 D ^%VMODISC G FIN:ABENDSCR,T0:RESUL(1)="",T0:RESUL(2)="" S AN=$P(RESUL(1),"/",3),REG=RESUL(2) D JDH^%QMDRSEJ("01/01/"_AN,.X,.DEB,.Y),JDH^%QMDRSEJ("31/12/"_AN,.X,.FIN,.Y),JDH^%QMDRSEJ(RESUL(1),.X,.J,.Y) I $D(^[QUI]PLPLACAL(REG,J)) S OK=1 G AFF
 S NEX=$O(^[QUI]PLPLACAL(REG,DEB-1)),OK=$S(NEX="":3,NEX>FIN:3,1:2)
AFF S IT=^POS($J,OK),LI=$P(IT,",",1),(ODX,DX)=$P(IT,",",2),(ODY,DY)=$P(IT,",",3) D REV^%VVIDEO,BLK^%VVIDEO X XY W LI D NORM^%VVIDEO,POCLEPA^%VVIDEO W "[RETURN] " R *X:60 D POCLEPA^%VVIDEO S DX=ODX,DY=ODY X XY W LI G T0
FIN Q
POS ;;1,Jour ouvre,7,11/2,Jour non ouvre,30,11/3,Non determine,58,11

