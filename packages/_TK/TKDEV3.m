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

;TKDEV3^INT^1^59547,74869^0
TKDEV3 ;
 
 
PROG D:($D(TK)+$D(TKP))'=12 INIT^TKDEV W TK("F") X ^TK("TERM-ON"),^TK("WRAP-OFF")
ENTRY D HEAD S %R=5,%C=10 W @(TKP),TK("LO"),$$^%QZCHW("Enter any CRT specific MUMPS code necessary to set up this CRT type"),!,?9,$$^%QZCHW("for Advanced Editing (i.e., function keys, video attributes, etc.).")
 D:$D(^TK(1E-1,TK,1))=0 ^TKDEV4 S X=$S($D(^TK(1E-1,TK,1)):^(1),1:""),%R=8,%C=1,LNG=255 W @(TKP),TK("HI"),X X ^TKREAD S ^TK(1E-1,TK,1)=X
 I X'="" S A="help="_^TK("ERRORR"),@(A),A=(^("ERROR"))_"=""HELP""",@(A) X X S:help'["<" A=^TK("ERROR")_"=help",@(A) K help,A
WIDE S %R=13,%C=10 W @(TKP),TK("LO"),$$^%QZCHW("If the CRT has a 132 column screen option, enter the MUMPS code "),!,?9,$$^%QZCHW("necessary for changing to the wide screens.")
 S A=$S($D(^TK(1E-1,TK,7)):^(7),1:""),X=$P(A,"\"),%R=16,%C=1,LNG=80 W @(TKP),TK("HI"),X X ^TKREAD S:X="" ^(7)="\\"_$P(^TK(1E-1,TK,7),"\",3,999) S:X'="" $P(A,"\")=X G:X="" EDIT
 S X=$P(A,"\",2),%R=18,%C=10,LNG=80 W @(TKP),TK("LO"),$$^%QZCHW("Enter code to change back to normal screen.") S %R=20,%C=1 W @(TKP),TK("HI"),X X ^TKREAD
 S $P(A,"\",2)=X,^TK(1E-1,TK,7)=A
EDIT G ^TKDEV5
 
HEAD S %C=1,%R=3 W @(TKP),TK("CS") S %C=20,%R=1 W @(TKP),$$^%QZCHW("F U N C T I O N   K E Y   D E F I N I T I O N")
 Q
 
HELP W !,!,!,$$^%QZCHW("Enter a valid MUMPS expression."),*7 H 4 G PROG
 ;

