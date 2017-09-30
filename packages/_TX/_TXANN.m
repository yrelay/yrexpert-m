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

;%TXANN^INT^1^59547,74031^0
%TXANN(GR,APP,NODE,DATE) 
 
 
 
 
 
 N IND,II,VAL
 K ^[QUI]LK(APP)
 D ^%VZEATT
 S IND="",NB=0 F II=1:1 S IND=$O(@GR@(IND)) Q:IND=""  Q:IND="z"  S LOC="" F III=1:1 S LOC=$O(@GR@(IND,LOC)) Q:LOC=""  S NB=NB+1 D TRAIT
 Q
TRAIT 
 S VAL=@GR@(IND,LOC)
 S ^[QUI]LK(APP,NODE,DATE,"DATA",1,NB)=IND_$C(9)_LOC_$C(9)_VAL
 Q
ANNR 
 D CLEPAG^%VVIDEO
 S DX=5,DY=5 X XY D BLD^%VVIDEO,REV^%VVIDEO
 W $$^%QZCHW("Chargement du repertoire ANNUAIRE") D NORM^%VVIDEO
 D DEB^%VTEMPS($P($ZPOS,"^",2)),ETAPE,ETAPE1,ETAPE2,AFF^%VTEMPS($P($ZPOS,"^",2)) Q
ETAPE 
 
 S GR="^[""BB""]ANNR",APP="IFM"
 D %TXANN(GR,APP,"A1","D") Q
 
 
 
 
 
ETAPE1 N ERR
 K ^[QUI]LK("%TX","A2")
 S ERR=$$^LKLO("%TX","A1","D","%TX","A2","D","LOST","AMA^LKTX%TX2","","",1)
 Q
 
 
 
 
ETAPE2 N ERR
 S ERR=$$^LKRQS("%TX","A2","D","D","%TXRQ1","AMA2^LKTX%TX2","","")
 Q
 ;

