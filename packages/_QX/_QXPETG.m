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

;%QXPETG^INT^1^59547,73887^0
%QXPETG ;;09:00 AM  2 Apr 1993 ; 02 Apr 93 11:31 AM
 
 
 
DEBRAYE 
 N MOTEUR,R
 I WHOIS("ETUDE")'=0 D ^%VZEAVT($$^%QZCHW("Vous etes deja en mode paravent")) Q
 S ETU=$$GEN^%QCAPOP("QXP")
 S R=$$SAISIE^%QXPETG2(ETU)
 Q:R=0
 D INIETU^%QXPETU(ETU,^[QUI]ETU(ETU,"MOTEUR"),2)
 D AVANTI^%QXPETU(ETU)
 Q
 
 
 
EMBRAYE 
 S WHOIS("ETUDE")=0
 Q
 
GESDI N MN,ADRES,CONTR
 N TEMP,GET,ET,%ET,VAL,LSEL,UCONT
 S UCONT=$$TEMP^%SGUTIL
 S MN=$$TEMP^%SGUTIL,TEMP=$$TEMP^%SGUTIL,LSEL=$$TEMP^%SGUTIL
 D ON^%VZEATT
 S ET="" F %ET=0:0 S ET=$O(^[QUI]ETU(ET)) Q:ET=""  D LIGNE
 G SUI
LIGNE 
 S VAL=ET_"  "
 
 
 
 S @TEMP@(VAL)=""
 Q
SUI 
 D INIT^%QUCHOIP(TEMP,0,1,0,0,78,20)
 D OFF^%VZEATT
 S @MN="20^10^79"
 S @MN@(1)=$$^%QZCHW("Arbre")_"^ARBO"
 S @MN@(1,"COM")=$$^%QZCHW("Acces a l'arbre de paravent")
 S @MN@(4)=$$^%QZCHW("Suppression")_"^SUP"
 S @MN@(4,"COM")=$$^%QZCHW("Suppression d'etudes")
 D AFF^%QUCHOIP
MEN 
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,21,MN,.ADRES,.CONTR) G:ADRES'="" @ADRES
 G:(CONTR="A")!(CONTR="F") FIN
 G MEN
FIN D END^%QUCHOIP
 K @(MN),@(TEMP),@(LSEL)
 Q
ARBO 
 S VAL=$$UN^%QUCHOIP
 I VAL="" G MEN
 S ET=$P(VAL," ")
 D VISU^%QXPET2(ET)
 D CLEPAG^%VVIDEO,AFF^%QUCHOIP
 G MEN
 
SUP 
 K @(LSEL)
 D ^%QUCHOYP(LSEL)
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de ces etudes"))'=1 G MEN
 S VAL="" F %V=0:0 S VAL=$O(@LSEL@(VAL)) Q:VAL=""  S ET=$P(VAL," ") D SUPETU(ET) K @TEMP@(VAL)
 D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 D INIT^%QUCHOIP(TEMP,0,1,0,0,78,20)
 D AFF^%QUCHOIP
 G MEN
SUPETU(ETU) 
 K ^[QUI]ETU(ETU)
 Q
 ;

