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

;%SDESEL^INT^1^59547,73889^0
SDESEL(OBJ,VERS,%PORT,%TERM,ENS,AFF) 
 
 
 
 
 
 N MENMOD,MENSEL,ADR,CTR,TEMP,NUM,NUM2,SOURCE,SAVE,DIF,PAS,XM,YM,MAT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PAS=$$PAS^%SDOCNT(OBJ,VERS)
 S MAT=$$ADR^%SDOMAT
 I '($D(AFF)) S AFF=0
 I '($D(@MAT)) D ^%SDOMAT(OBJ,VERS)
 I '(AFF) D ^%SDOGRIL(OBJ,VERS,%PORT,%TERM,PAS,0) S AFF=1
SEL D SEL^%SDOGRIL(.XM,.YM)
 I XM="" G FIN
 I @MAT@(XM,YM)=1 S EL=$O(@MAT@(XM,YM,"")),@ENS@(EL)="" G SEL
 
 S LIST=$$CONCAS^%QZCHAD(TEMP,"LISTE") K @(LIST)
 S EL="",NOEL=""
 F I=0:0 S NOEL=$O(@MAT@(XM,YM,NOEL)) Q:NOEL=""  S @LIST@($E(^[QUI]SDTEXT(OBJ,VERS,NOEL),1,70))=""
 D ALFA^%SDEDEF,BLD^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez un element"),0),NORM^%VVIDEO
 S LIST2=$$CONCAS^%QZCHAD(TEMP,"LISTE2") K @(LIST2)
 D PLUS^%PKCHOIP(LIST,2,3,20,LIST2)
 I '($D(@LIST2)) G FIN
 S CH=""
 F I=0:0 S CH=$O(@LIST2@(CH)) Q:CH=""  S @ENS@($$GETLBLAN^%VTLBLAN($P(CH,";",1)))=""
 G SEL
FIN K @(TEMP)
 D GRAPH^%SDEDEF
 I %TERM="VT-340" D CADRE^%SDOAFFI,REAFF^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 D ^%SDOGRIL(OBJ,VERS,%PORT,%TERM,PAS,1)
 D EFF^%PBP5EC(0)
 Q
 
TEST 
 X ^DMO
TEST1 D CLEPAG^%VVIDEO
 W !,"OBJET : " R OBJ Q:OBJ=""
 W !,"VERSION : " R VERS Q:VERS=""
 I '($D(^[QUI]SDOBJ(OBJ,VERS))) D ^%VZEAVT(" INCONNU") G TEST
 S %PORT=0,%TERM="PT-100G"
 S %FONC="INIT" D ^%PBPZ
 S %FONC="INIT.DESSIN" D ^%PBPZ
 S %FONC="CLEAR" D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 D ^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 K TOTO
 D ^%SDESEL(OBJ,VERS,%PORT,%TERM,"TOTO",0)
 D ALFA^%SDEDEF
 G TEST1

