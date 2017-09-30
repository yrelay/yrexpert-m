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

;%QAXEDE^INT^1^59547,73875^0
ZSYEDECR ;
 
 
 
 
 
 
 
 
 
 
 
 Q:'($D(^AFFPAG($J)))
 N ADR,CTR,GAP,GAPBN,MEN,PAGE,REP
 D INIT
ENT S DX=0,DY=8 X XY W TIT S DX=35,DY=9 X XY W "(",CODIMP,")" I (CODIMP'=COD)&(COD'="") S DX=55 X XY W "(",COD,")"
 D AFF1
SUIT S GAP=$$^%QZCHW("Page ")_EGAP_"/"_GAPBN,DX=40-($L(GAP)\2),DY=6 X XY W GAP
ACT D POCLEPA^%VVIDEO,^%VQUIKMN(10,80,23,"MEN",.ADR,.CTR) Q:CTR="A"  G:ADR'="" @ADR G ACT
PAGE 
 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1(" Page : ") G:Y1="" SUIT G:'($$ADR^%QZNBN1(Y1)) SUIT S NGAP=Y1 D AFF G SUIT
MOIN 
 S NGAP=EGAP-1 D AFF G SUIT
PLUS 
 S NGAP=EGAP+1 D AFF G SUIT
REP 
 S REP="",DX=0,DY=6 D CLEBAS^%VVIDEO F PP=1:1 Q:'($D(^AFFSYN($J,PP)))  W $$^%QZCHW("Page : "),PP," ",^AFFSYN($J,PP),! D:(PP#17)=0 ALORS Q:(REP=1)!(REP=6)
 D POCLEPA^%VVIDEO I REP'=1 W $$^%QZCHW("[RETURN] ") R *REP
 S DX=0,DY=6 D CLEBAS^%VVIDEO G ENT
ALORS D POCLEPA^%VVIDEO W $$L2^%QSLIB R *REP D TOUCHE^%INCCLAV(REP,.REP)
 S DX=0,DY=6 D CLEBAS^%VVIDEO Q
 
AFF 
 I '($D(^AFFPAG($J,NGAP))) D ^%VSQUEAK Q
 S EGAP=NGAP,DX=0,DY=10 D CLEBAS^%VVIDEO
AFF1 S DY="" F %QY=1:1 S DY=$O(^AFFPAG($J,EGAP,DY)) Q:DY=""  S DX=10 X XY W ^AFFPAG($J,EGAP,DY)
 Q
END S DX=0,DY=5 D CLEBAS^%VVIDEO Q
 
INIT 
 S GAPBN=$S($D(^AFFPAG($J,EGAP)):EGAP,1:EGAP-1),EGAP=GAPBN
 S DX=0,DY=5 D CLEBAS^%VVIDEO
 S MEN(1)="+"_"^PLUS",MEN(1,"EQU")="="
 S MEN(2)="-"_"^MOIN",MEN(3)="Page"_"^PAGE"
 S MEN(4)="Repere"_"^REP" Q

