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

;%EDCHPL3^INT^1^59547,73868^0
%EDCHPL3 ;;06:06 PM  14 Feb 1992;
 
 
TEXTE 
 N %FONC
 D XY
 
 I %9O="HORIZONTALE" G H
 
V I ^V($J,"%","%ORIENTATION",1)="VERTICALE" G:VALPLA="D" PLACERD G PLACER
 
 S %FONC="LANDSCAPE" D ^%PBPZ
 S %9O=$$^%QZCHW("HORIZONTALE")
 D:VALPLA="D" PLACERD D:VALPLA'="D" PLACER
 S %FONC="PORTRAIT" D ^%PBPZ
 S %9O=$$^%QZCHW("VERTICALE")
 S %FONC="CHARGER.VARIABLES" D ^%PBPZ
 Q
H 
 I ^V($J,"%","%ORIENTATION",1)="HORIZONTALE" G:VALPLA="D" PLACERD G PLACER
 
 S %FONC="PORTRAIT" D ^%PBPZ
 S %9O=$$^%QZCHW("PORTRAIT")
 D:VALPLA="D" PLACERD D:VALPLA'="D" PLACER
 S %FONC="LANDSCAPE" D ^%PBPZ
 S %9O=$$^%QZCHW("HORIZONTALE")
 S %FONC="CHARGER.VARIABLES" D ^%PBPZ
 Q
PLACER 
 S %FONC="MOUV" D ^%PBPZ
 D DEB^%EDCHP
 D ACCENT
 U %PORT W %9STR
 Q
PLACERD 
 N LG,I,CAR,%COEF,%COEF2 S LG=$L(%9STR) D ^%EDCOEF
 S %9X=%9X-%COEF,%FONC="MOUV" D ^%PBPZ
 S CAR=$E(%9STR,LG) U %PORT D TRANSCAR W CAR
 F I=1:1:LG-1 S CAR=$E(%9STR,LG-I) S:$A(CAR)'<97 %9X=%9X-%COEF2 S:$A(CAR)<97 %9X=%9X-%COEF S %FONC="MOUV" D ^%PBPZ U %PORT D TRANSCAR W CAR,!
 Q
 
XY I $$^%QCAZG("%DESSIN")=1 N %FONC S %FONC="CONVERSION.X" D ^%PBPZ S %FONC="CONVERSION.Y" D ^%PBPZ
 Q
 
ACCENT 
 S %9STR=$TR($TR($TR($TR(%9STR,"{",$C(197)),"}",$C(201)),"@",$C(200)),"\",$C(181))
 Q
TRANSCAR 
 S CAR=$S(CAR="{":$C(197),CAR="}":$C(201),CAR="@":$C(200),CAR="\":$C(181),1:CAR)
 Q

