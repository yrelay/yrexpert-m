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

;TKSA1^INT^1^59547,74869^0
TKSA1 ;
 
 
BEG R A W TK("F") S %R=20,%C=30 W @(TKP),TK("LO"),$$^%QZCHW("( You use the cursor keys, space bar, or first "),!,?31,$$^%QZCHW("character to move the selector - then press "),!,?31,$$^%QZCHW("RETURN to make the selection. )"),TK("HI")
 F I=1,2 S %R=10,%C=32 W @(TKP),"Pop-up / Reverse Video / ",I," Column" S Y="10\BLRH\"_I_"\Sample "_I_"\\"_B,%R=12,%C=32 W @(TKP),"Y = """,$E(Y,1,40),"..." D ^TKPOP X ^TK("WRAP-OFF")
 S (%R,%C)=20 W @(TKP),TK("CS")
 F I=1,3 S %R=10,%C=32 W @(TKP),"Pull-down / Reverse Video / ",I," Column" S Y="10\TLRH\"_I_"\\\Pick Fruit*,*,"_B,%R=12,%C=32 W @(TKP),"Y = """,$E(Y,1,40),"..." D ^TKPOP X ^TK("WRAP-OFF")
 F I=1,2 S %R=10,%C=32 W @(TKP),"Pop-up / Normal Video / ",I," Column",TK("CL") S Y="15\BLH\"_I_"\Pick One\\"_B,%R=12,%C=32 W @(TKP),"Y = """,$E(Y,1,40),"..." D ^TKPOP X ^TK("WRAP-OFF")
 F I=2 S %R=10,%C=32 W @(TKP),"Pop-up / Reverse Video / No Lines / ",I," Column" S Y="15\RB\"_I_"\Pick One\\"_B,%R=12,%C=32 W @(TKP),"Y = """,$E(Y,1,40),"..." D ^TKPOP X ^TK("WRAP-OFF")
 
 S K=2 D ^TKSA3 W TK("F") S %R=8,%C=20 W TK("HI"),@(TKP),$$^%QZCHW("In order to list the ASCII table...") H 1 S %R=12 W @(TKP),$$^%QZCHW("you may Xecute ^TKASCII.  No routine is called") S %R=13 W @(TKP),$$^%QZCHW("so you will not lose your current routine buffer.") R A:2
 S %R=16 W @(TKP),$$^%QZCHW("Press RETURN to see an example ") R A:20 W TK("F") X ^TKASCII W !,$$^%QZCHW("      Press RETURN to continue ") R A:60 S K=3 D ^TKSA3 W TK("F")
B S GR="SAMPLE" K ^TKPAINT(GR) S ^(GR)="SAMPLE OF DRAWING\\" F I=1:1 S A=$T(TEXT+I) Q:A'>0  S ^TKPAINT(GR,+(A))=$P(A,";",2,255)
 G ^TKSA2
TEXT 
1 
2 
3 
4 
21 

