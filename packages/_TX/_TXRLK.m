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

;%TXRLK^INT^1^59547,74033^0
%TXRLK(GR,APP,NODE,DATE) 
 
 
 
 
 
 
 
 
 
 
 N I,II,VAL
 K ^[QUI]LK(APP)
 S I="" F II=1:1 S I=$O(@GR@(I)) Q:I=""  Q:I="z"  D TRAIT
 Q
TRAIT 
 S VAL=@GR@(I) S:I["/" I=$TR(I,"/",".")
 S ^[QUI]LK(APP,NODE,DATE,"DATA",1,II)=I_$C(9)_VAL
 S:I["." I=$TR(I,".","/")
 Q
RMGO 
 D CLEPAG^%VVIDEO
 S DX=5,DY=5 X XY D BLD^%VVIDEO,REV^%VVIDEO
 W $$^%QZCHW("Chargement du repertoire RMGO") D NORM^%VVIDEO
 D DEB^%VTEMPS($P($ZPOS,"^",2)),TEST,TEST1,TEST2,AFF^%VTEMPS($P($ZPOS,"^",2)) Q
RMGG 
 D CLEPAG^%VVIDEO
 S DX=5,DY=5 X XY D BLD^%VVIDEO,REV^%VVIDEO
 W $$^%QZCHW("Chargement du repertoire RMGG") D NORM^%VVIDEO
 D DEB^%VTEMPS($P($ZPOS,"^",2)),PREM,PREM1,PREM2,AFF^%VTEMPS($P($ZPOS,"^",2)) Q
 
 
TEST 
 
 S GR="^[""BB""]RMGO",APP="%TX"
 D %TXRLK(GR,APP,"A1","D") Q
 
 
 
 
 
TEST1 N ERR
 K ^[QUI]LK("%TX","A2")
 S ERR=$$^LKLO("%TX","A1","D","%TX","A2","D","LOST","AMA^LKTX%TX0","","",1)
 Q
 
 
 
 
TEST2 N ERR
 S ERR=$$^LKRQS("%TX","A2","D","D","%TXRQS","AMA2^LKTX%TX0","","")
 Q
 
PREM 
 
 S GR="^[""BB""]RMGG"
 D %TXRLK(GR,"%TX","A1","D") Q
 
 
 
 
 
PREM1 N ERR
 K ^[QUI]LK("%TX","A2")
 S ERR=$$^LKLO("%TX","A1","D","%TX","A2","D","LOST","AMA^LKTX%TX1","","",1)
 Q
 
 
 
 
PREM2 N ERR
 S ERR=$$^LKRQS("%TX","A2","D","D","%TXRQS","AMA2^LKTX%TX1","","")
 Q
 
BUG N I,II,VAL
 K ^[QUI]LK("%TX","A3")
 S GR="^[""BB""]RMGG"
 D %TXRLK(GR,"%TX","A3","D")
 N ERR
 K ^[QUI]LK("%TX","A4")
 S ERR=$$^LKLO("%TX","A3","D","%TX","A4","D","LOST","AMA^LKTX%TX1","","",1)
 N ERR
 S ERR=$$^LKRQS("%TX","A4","D","D","%TXRQS","AMA2^LKTX%TX1","","")
 Q

