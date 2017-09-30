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
;! Nomprog     : %VVIDEO3                                                     !
;! Module      : Vidéo (V)                                                    !
;! But         : Gestion de la vidéo (MNEMONICS POUR UNE CONSOLE PC)          !
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

%VVIDEO ;
 x "*" ; No entry from top
 ;
AA ; Normal mode
 w $c(27,91)_"0m"
 q
AB ; Bold mode
 w $c(27,91)_"1m"
 q
AC ; Underlined mode
 w $c(27,91)_"4m"
 q
AD ; Bold, underlined mode
 w $c(27,91)_"1;4m"
 q
AE ; Reverse video
 w $c(27,91)_"7m"
 q
AF ; Reverse video / bold mode
 w $c(27,91)_"1;7m"
 q
AG ; Reverse video/ underlined mode
 w $c(27,91)_"4;7m"
 q
AH ; Reverse video/ bold, underlined modes
 w $c(27,91)_"1;4;7m"
 q
AI ; Blink mode
 w $c(27,91)_"5m"
 q
AJ ; Bold, blink mode
 w $c(27,91)_"1;5m"
 q
AK ; Underlined, blink mode
 w $c(27,91)_"4;5m"
 q
AL ; Bold, underlined, blink mode
 w $c(27,91)_"1;4;5m"
 q
AM ; Reverse video / bold, blink modes
 w $c(27,91)_"1;5;7m"
 q
AN ; Reverse video / bold, blink mode
 w $c(27,91)_"1;5;7m"
 q
AO ; Reverse video / underlined, blink modes
 w $c(27,91)_"4;5;7m"
 q
AP ; Reverse video / bold, underlined, blink modes
 w $c(27,91)_"1;4;5;7m"
 q
AZ ; Mode Z
 q
B(%1,%2) ; %1=video attribute for characters as fg + (bg <4)
 ; %2=frame attribute for clearing areas
 w:$l(%1) $c(255,66,%1) w:$l(%2) $c(255,89,%2)
 q
BOX ; Draw a window-relative utility box
 q
C(%1,%2) ; Position cursor at column %1, line %2
 s %1=+$g(%1,1),%2=+$g(%2,1) w $c(27,91)_%2_";"_%1_"H"
 s $x=%1-1,$y=%2-1,$x=$s($x<0:0,$x>255:255,1:$x),$y=$s($y<0:0,$y>255:255,1:$y)
 q
CLR ; Clear current frame
 w $c(27,91)_"2J",$c(27,91)_"1;1H" s $x=0,$y=0
 q
COLOR(%1,%2) ; Set IBM PC Color - foreground %1, background %2
 n %3,%4 s %3=%1#8,%4=%2#8
 s %3=$s(%3=0:30,%3=1:34,%3=2:32,%3=3:36,%3=4:31,%3=5:35,%3=6:33,%3=7:37,1:"")
 s %4=$s(%4=0:40,%4=1:44,%4=2:42,%4=3:46,%4=4:41,%4=5:45,%4=6:43,%4=7:47,1:"")
 w $c(27,91)_$s(%1<9:"0;",1:"")_%3_";"_%4_$s(%1>8:";1",1:"")_"m"
 q
DC(%1) ; Delete %1 characters
 w $c(27,91)_+$g(%1,1)_"P"
 q
EC(%1) ; Erase %1 characters
 w $c(27,91)_+$g(%1,1)_"X"
 q
EF ; Erase to end of frame
 w $c(27,91)_"0J"
 q
EL ; Erase to end of line
 w $c(27,91)_"0K"
 q
F(%1,%2,%3,%4,%5) ; Fill rectangular area w/$c(%1), at upper left corner
 ; (%2,%3), %4 columns wide by %5 lines high
 n %x,%y s $p(%x,$c(%1),%4-%2+1)=""
 f %y=%3:1:(%3+%5-1) d C(%2,%y) w %x
 q
GETCUR ; Read terminal cursor position (return in $KEY)
 ; NOTE: THIS IS DESIGNED ONLY FOR MULTI-USER DOS
 ;HL2 n %1 s %1=$zu(75,$c(192,0,0)),$k=$a(%1,3)_","_$a(%1,2)
 W !,"$ZU à implementer [RETURN]",! R *HL
 q
HF ; Screen half bright off
 q
HIDECURSOR ; Hide mouse cursor
 q
HN ; Screen half bright
 q
IC(%1) ; Insert %1 characters
 w $c(27,91)_+$g(%1,1)_"@"
 q
LF ; Disable literal mode
 q
LN ; Enable literal mode
 q
MARK(%1) ; Make mark on screen
 w $s(+$g(%1):$c(4),1:$c(5))
 q
NORM ; Enable normal display attributes
 w $c(27,91)_"0m"
 q
PAD(%1) ; Write %1 NULLS for padding
 q
PF ; Pause off
 q
PN ; Pause on
 q
RF ; Screen reverse video off
 q
RN ; Screen reverse video
 q
SD(%1,%2,%3) ; Scroll current frame down by %3 lines
 q
SHOWCURSOR ; Show mouse cursor
 q
SU(%1,%2,%3) ; Scroll current frame up by %3 lines, starting at line %1 down to
 ; but not including line %2
VF ; Visible cursor off
 q
VN ; Visible cursor on
 q
WBOX ; Draw a screen-relative utility box
 q
WCLOSE ; Close utility window
 q
WINDOW ; Set scrolling window
 q
WOPEN ; Open utility window
 q
Y(%1) ; Set binary frame attribute
 q

