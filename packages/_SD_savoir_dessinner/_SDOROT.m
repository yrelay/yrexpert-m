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

;%SDOROT^INT^1^59547,73889^0
SDOROT(OBJ,VERS,%PORT,%TERM,ENS) 
 
 
 
 
 
 N ANGLE,EL,%EL,Y1,AN
L0 D ALFA^%SDEDEF
 D CLEPAG^%VVIDEO
 
 
L1 D POCLEPA^%VVIDEO W "Angle de rotation : " S DX=$X,DY=$Y D ^%VLEC
 G:CTRLA!(Y1="") END
 I '($$ENTP^%QZNBN(Y1)) D ^%VSQUEAK G L1
 S ANGLE=$$NORM^%PBCACV(Y1)
 
 N EL,%EL
 S EL=0 F %EL=0:0 S EL=$O(@ENS@("EL",EL)) Q:EL=""  S ^[QUI]SDOBJ(OBJ,VERS,"EL",EL,"PRES")=$$ROTATION^%SDOTRSF(EL,ANGLE)
 D GRAPH^%SDEDEF,^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 Q
END D GRAPH^%SDEDEF
 I %TERM="VT-340" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 Q
 
 
 
SEL(OBJ,VERS,%PORT,%TERM) 
 N MENSEL,TAB,EL,TAB2
 S MENSEL(1)="TOUS.LES.ELEMENTS"_"^"_"TOUS"
 S MENSEL(2)="SELECTION"_"^"_"QQ"
AFF1 D EFFBAS^%SDUMEN
DIAL 
 D AFF^%SDUMEN(0,0,"MENSEL")
DIAL2 D SEL^%SDUMEN("MENSEL",.ADR,.CTR)
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G DIAL
 G @ADR
FIN 
 D ^%SDOMAT(OBJ,VERS)
 Q
TOUS 
 D ^%SDOROT(OBJ,VERS,%PORT,%TERM,$$DEF^%SDOCMS(OBJ,VERS))
 G FIN
 
QQ 
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ELEM") K @(TAB)
 S TAB2=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ELEM2") K @(TAB2)
 D ^%SDESEL(OBJ,VERS,%PORT,%TERM,TAB,0)
 I '($D(@TAB)) Q
 S EL="" F I=0:0 S EL=$O(@TAB@(EL)) Q:EL=""  S @TAB2@("EL",EL)="" K @TAB@(EL)
 D ^%SDOROT(OBJ,VERS,%PORT,%TERM,TAB2)
 K @(TAB),@(TAB2)
 G FIN

