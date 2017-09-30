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

;TKSA^INT^1^59547,74869^0
TKSA ;
 
 
BEG I $D(^TK)=0 W !,!,$$^%QZCHW("The ^TK global was not found - Initialization proceeding"),!,! D ^TKINIT
CALC I $D(^TKPC)=0 W !,!,$$^%QZCHW("Initializing TKPC -  Calculator Code...") D SETUP^TKPC
ASCII I $D(^TKASCII)=0 W !,!,$$^%QZCHW("Initializing TKASCI -  ASCII chart...") D ^TKASCII
NOTE I $D(^TKNOTE)=0 W !,!,$$^%QZCHW("Initializing TKNOTE -  Notepad Code...") D SETUP^TKNOTE,UND^TKNOTE2
 I ^TK("OS")="DTM" D DTM^TKPAINT
BEG1 D:$D(TK)=0 INIT^TKDEV Q:'($D(TK))  W TK("F"),TK("LO") S A=TK("HL"),A=A_A_A,P=TK("P") W "  ",TK("TLC") F I=1:1:25 W A
 W TK("TRC") F %R=2:1:12 F %C=3,79 W @(TKP),TK("VL")
 W !,"  ",TK("BLC") F I=1:1:25 W A
 W TK("BRC"),TK("HI") S %R=3,%C=22 W @(TKP),$$^%QZCHW("WELCOME TO THE PG&A TOOLKIT I SAMPLER") S %C=33,%R=6 W @(TKP),$$^%QZCHW("- featuring -") S %C=7,%R=7 F I=1:1:4 S %R=%R+1 W @(TKP),$P($T(TEXT+I),";",2,9)
 S %C=6,%R=14 F I=5:1:10 S %R=%R+1 W @(TKP),$P($T(TEXT+I),";",2,9)
 S %R=21,%C=23,A=A_A_A W @(TKP),TK("LO"),A,A,A,A S %R=22,%C=28 W @(TKP),TK("HI"),$$^%QZCHW("Press RETURN to continue ") R A S K=1 D ^TKSA3 X ^TK("TERM-ON") G POP
 
TEXT 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
POP D:$D(TK)=0 INIT^TKDEV
 S B=$$^%QZCHW("Apples,Apricots,Bananas,Grapes,Grapefruit,Melons,Oranges,Peaches,Strawberries,Tangerines") W TK("F")
 F I="60\BLRWH\1\Sample\\","50\TLWH\2\\\","9\RBLW\5\\\","8\TRWH\1\\\" S Y=I_B D ^TKPOP X ^TK("WRAP-OFF")
 S %C=27,%R=9 W @(TKP),$$^%QZCHW("These are 4 examples of pull-down or pop-up menus.") S %C=1,%R=13 F I=11:1:14 S %R=%R+1 W @(TKP),$P($T(TEXT+I),";",2,9)
 G ^TKSA1

