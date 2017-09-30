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

;TKMENUE^INT^1^59547,74869^0
TKMENUE ;
 
 
 D:($D(TK)+$D(TKP))'=12 INIT^TKDEV S OP="^TKMENU" X ^TK("TERM-ON"),^TK("WRAP-OFF")
BEG D HEAD S %C=29 W TK("HI"),@(TKP),$$^%QZCHW("TkMenu Global Editor")
 S Y="Edit Menu Items\Add/Edit Security Code\Define Menu Title\Specify Device Security\Programmer's Access Code\Logo Edit\User's MUMPS Code\Help\Quit",L="EADSPLUHQ"
 S NE=9,(TC,%C)=28,TR=8
SELECT D SEL G:J=0 EXIT
 I J=1 D ^TKMENE1 G BEG
 I J=2 G BEG
 I J=3 D NAME^TKMENE2 G BEG
 I J=5 D CODE^TKMENE2 G BEG
 I J=6 D COMPANY^TKMENE2 G BEG
 I J=7 D SETUP^TKMENE2 G BEG
 I J=8 D ^TKMENE2 G BEG
 
EXIT K Y,I,A,B,GR X ^TK("TERM-OFF"),^TK("WRAP-ON") Q
 
HEAD W TK("F") S %R=1,%C=2 W TK("LO"),@(TKP),TK("RON")," P ",TK("RT")," G ",TK("RT")," & ",TK("RT")," A " S %C=68 W @(TKP),"  TK-MENU  ",TK("ROF"),! S J=TK("HL"),J=J_J_J_J F I=1:1:20 W J
 Q
 
SEL F I=1:1:NE S X=$P(Y,"\",I),%R=I+TR W @(TKP),TK("HI"),$E(X),"  ",TK("LO"),X
 S I=""
LEV S %R=24,%C=7 W @(TKP),TK("LO"),$$^%QZCHW("[ Type "),TK("HI"),$$^%QZCHW("Letter"),TK("LO"),$$^%QZCHW(" or use "),TK("HI"),$$^%QZCHW("ARROWS"),TK("LO"),$$^%QZCHW(" to move selector, "),TK("HI"),$$^%QZCHW("RETURN"),TK("LO"),$$^%QZCHW(" to make selection ]") S %C=1,%R=TR+1 W @(TKP),*13
 
ASK S J=1,%C=TC-4 X ^TK("ECHO-OFF")
A1 S %R=TR+J,X=$P(Y,"\",J) W @(TKP),TK("HI"),"==> ",$E(X),"  ",X,@(TKP),"==> "
A2 R C#1 X TK("T") S A=ZF I C'="" S:C?1L C=$C($A(C)-32) I L[C S J=$F(L,C)-1 D A3 G A1:^TK("MENU"),DONE
 I A=TK("UK") D A3 S J=$S(J>1:J-1,1:NE) G A1
 I (C=" ")!(A=TK("DK")) D A3 S J=$S(J<NE:J+1,1:1) G A1
 I ZF=$C(13) G DONE
 G A2
A3 W $C(8,8,8,8),"    ",TK("HI"),$E(X),TK("LO"),"  ",X Q
DONE K TR,TC,Y,L,X,C X ^TK("ECHO-ON") Q
 ;

