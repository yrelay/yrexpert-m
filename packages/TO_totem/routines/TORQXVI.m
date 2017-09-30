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

;TORQXVI^INT^1^59547,74875^0
TORQXVI ;
 
 
 
 
 
 
 
 
 
 
 
 
VISU(OBJET,BASE) 
 N MEN,I,Z
 
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MEN") K @(MEN)
 S @MEN@(1)=$$^%QZCHW("Parametres du transfert")_"^PAR"
 S @MEN@(2)=$$^%QZCHW("resultats de l'etude")_"^TOT"
 S @MEN@(3)=$$^%QZCHW("attributs de l'etude")_"^REP"
 F I=0:0 Q:$$MEN
 K @(MEN)
 Q 2
 
MEN() N CTR,ADR
 D CLEPAG^%VVIDEO,^%VZCD(1,39,1,5,1,0,"Etude "_OBJET)
 D ^%VQUIKMN(0,80,22,MEN,.ADR,.CTR)
 Q:CTR'="" 1
 G:ADR'="" @ADR
 Q 0
 
REP D CLEPAG^%VVIDEO,^%QSATTRI(OBJET,BASE,0,0,80,23) Q 0
 
TOT D CLEPAG^%VVIDEO
 I $$TABID^%INCOIN("ORDINATEUR")'="VAX" S VAR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAR") K @(VAR) S @VAR@("OBJET")=OBJET D ^%VZEATT,MEM^%QCAMEM,^%VCLEVAR S VAR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAR"),OBJET=@VAR@("OBJET") K @(VAR)
 D VISU^TOXXVERI(OBJET),80^%VVIDEO
 I $$TABID^%INCOIN("ORDINATEUR")'="VAX" D RMEM^%QCAMEM
 Q 0
 
PAR D CLEPAG^%VVIDEO
 I $$TABID^%INCOIN("ORDINATEUR")="PDP" S VAR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAR") K @(VAR) S @VAR@("OBJET")=OBJET D ^%VZEATT,MEM^%QCAMEM,^%VCLEVAR S VAR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VAR"),OBJET=@VAR@("OBJET") K @(VAR)
 D POCLEPA^%VVIDEO,^TORQY7(OBJET)
 I $$TABID^%INCOIN("ORDINATEUR")="PDP" D RMEM^%QCAMEM
 Q 0

