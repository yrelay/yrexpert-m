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

;TKMENE2^INT^1^59547,74869^0
TKMENE2 ;
 
BEG W TK("F"),TK("HI") F I=1:1 S A=$T(TEXT+I) Q:A=""  W $P(A,";",2,99),!
 S %R=24,%C=50 W @(TKP),$$^%QZCHW("Press RETURN to continue ") R A#1 W TK("F") Q
CODE D HEAD S %R=4,%C=5 W @(TKP),TK("HI"),$$^%QZCHW("PROGRAMMER'S ACCESS CODE") S %R=6 W @(TKP),$$^%QZCHW("The Programmer's Access Code is a special code that allows the user"),!,?4,$$^%QZCHW("to enter the direct mode from the menu.  It is preceded by a Control P.")
 S %R=9,%C=10 W @(TKP),TK("LO"),$$^%QZCHW("Specify the Programmer's Access Code - "),TK("HI") S X="" S:$D(@OP@(1)) X=$P(^(1),"\",5) S %C=49,LNG=10 W @(TKP),X X ^TKREAD
 I X'="" F I=1:1:$L(X) I $E(X,I)?1L S X=$E(X,1,I-1)_$C($A(X,I)-32)_$E(X,I+1,99)
 S $P(@OP@(1),"\",5)=X Q
SETUP D HEAD S %R=4,%C=5 W @(TKP),$$^%QZCHW("LOGON SETUP CODE") S %R=6 W @(TKP),$$^%QZCHW("You may execute MUMPS code for setting up function keys, calling other"),!,?4,$$^%QZCHW("routines or whatever is required by your application.  This is only"),!,?4
 W $$^%QZCHW("performed at TKMENU initialization at the top level.  Your entry must"),!,?4,$$^%QZCHW("be executable MUMPS code.")
 S %R=12,%C=1 W @(TKP),TK("HI") S X=$S($D(@OP):$P(@OP,"`",3),1:"") W X X ^TKREAD S $P(@OP,"`",3)=X Q
NAME D HEAD S %R=4,%C=5 W @(TKP),$$^%QZCHW("MAIN MENU DESCRIPTION") S %R=6 W @(TKP),$$^%QZCHW("The Main Menu Description is the title on the top of the screen of the"),!,?4,$$^%QZCHW("first menu.  All lower level menus use their description as a title.")
 S %R=9,%C=10 W @(TKP),TK("LO"),$$^%QZCHW("Specify the Top Level Description - ") S X=$S($D(@OP@(1)):$P(@OP@(1),"\",1),1:""),%C=48 W @(TKP),TK("HI"),X X ^TKREAD S $P(@OP@(1),"\",1)=X Q
COMPANY D HEAD S %R=4,%C=5 W @(TKP),$$^%QZCHW("ORGANIZATION NAME") S %R=6 W @(TKP),$$^%QZCHW("The name of your organization may be displayed in the top left-hand"),!,?4,$$^%QZCHW("corner.  Enter from 1-15 characters.")
 S %R=9,%C=10 S:($D(@OP)#10)=0 @OP="" W @(TKP),TK("LO"),$$^%QZCHW("Specify the Organizational Name - ") S X=$P(@OP,"`",1),%C=46,LNG=15 W @(TKP),TK("HI"),X X ^TKREAD S $P(@OP,"`",1)=X Q
 
HEAD W TK("F") S %R=1,%C=2 W TK("LO"),@(TKP),TK("RON")," P ",TK("RT")," G ",TK("RT")," & ",TK("RT")," A " S %C=69 W @(TKP),"  TK-MENU  ",TK("ROF"),! S J=TK("HL"),J=J_J_J_J F I=1:1:20 W J
 W TK("HI") Q
TEXT 
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;

