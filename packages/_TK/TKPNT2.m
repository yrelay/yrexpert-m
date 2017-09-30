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

;TKPNT2^INT^1^59547,74869^0
TKPNT2 ;
 
BEG W TK("F"),TK("HI") F I=1:1 S A=$T(TEXT+I) Q:A=""  W $P(A,";;",2,99),!
 S %R=24,%C=45 W @(TKP),$$^%QZCHW("Press RETURN to return to the menu ") R A#1 W TK("F") Q
 
ENTRY S P=TK("P") W TK("F") F I=1:1:11 S A=$P("TLC,HL,TRC,VL,BRC,BLC,X,TI,RI,BI,LI",",",I),CT(I)=^TK(0,^TK($I),A)
 S %R=24,%C=72,A="CUR="_TKP_"_""R""",@(A),VIDON="",(E,VIDOF)=TK("Z")_TK("HI"),%C=1,A="STL="_TKP,@(A),STL=STL_TK("CL")
 K @TKG@("~"_$I),AA S TC=^TK("TERMST"),T=^TK($I) I $D(@TKG@(GR)) D FETCH
 S XX=$C(9)_"1",J=2 F I="LK","RK","DK","UK" S XX=XX_TK(I)_J,J=J+1
 G ^TKPNT3
FETCH 
 W E F I=1:40:400 I $D(@TKG@(GR,I)) S VD="`"_(I\20),J=I\40 D XX,TXT W E
 F I=21:40:400 I $D(@TKG@(GR,I)) S VD="`"_(I\20),J=I\40 D XX,LINE W E
TXT F J=I:1:I+19 Q:'($D(@TKG@(GR,J)))  S M=^(J) F L=1:3:$L(M) S K=$E(M,L,L+2),%R=$A(K)-31,%C=$A(K,2)-31,@TKG@("~"_$I,%R,%C)=$E(K,3)_VD W @(TKP),$E(K,3)
 Q
LINE F J=I:1:I+19 Q:'($D(@TKG@(GR,J)))  S M=^(J) F L=1:3:$L(M) S K=$E(M,L,L+2),%R=$A(K)-31,%C=$A(K,2)-31,@TKG@("~"_$I,%R,%C)=($A(K,3)-32)_VD W @(TKP),CT($A(K,3)-32)
 Q
XX S Y="",L=$P(";LO;RON;LO,RON;UO;UO,LO;UO,RON;UO,LO,RON",";",J+1) Q:L=""  F J=1:1:$L(L,",") S Y=Y_TK($P(L,",",J))
 W Y Q
 
TEXT ;;
 ;;                         TKPAINT - SCREEN PAINTING UTILITY
 ;;
 ;;    This utility provides the programmer the capability of quickly adding
 ;;lines or headings on the CRT screen.  The resultant product of this utility
 ;;is "compiled" text which is stored in the ^TKPAINT global and is simply
 ;;written to the screen by any routine.
 ;;
 ;;    In the edit mode, you may alter the drawing as you wish.  The Line Drawing
 ;;Mode toggles with the TAB key.  It must be ON in order for the cursor
 ;;keys to draw lines.  Turn it OFF so that you can move the cursor without
 ;;drawing on the screen.  The following keys are active in this utility:
 ;;
 ;;        TAB (or Ctrl L)     - Toggles between Line Drawing & Text
 ;;        Cursor keys         - Moves cursor (draws if Mode = Line)
 ;;        Alphanumeric keys   - Adds text (headings) to the screen
 ;;        Space key           - Erases text or lines
 ;;        Control A           - Steps through each graphic character
 ;;        Control E           - erases contiguous line under cursor
 ;;        Control V (or W)    - Changes Video Mode
 ;;        Control X (or R)    - Exits and stores screen

