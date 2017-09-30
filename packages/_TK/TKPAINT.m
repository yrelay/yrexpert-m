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

;TKPAINT^INT^1^59547,74869^0
TKPAINT ;
 
 
 U 0 S TKG="^TKPAINT",RS=1,RE=24,CS=1,CE=80
 D:($D(TK)+$D(TKP))'=12 INIT^TKDEV X ^TK("TERM-ON"),^("WRAP-OFF")
BEG D HEAD S %C=28 W TK("HI"),@(TKP),$$^%QZCHW("Screen Painting Utility")
 S Y=$$^%QZCHW("Edit Existing Drawing\Build New Drawing\Copy a Drawing\Delete a Drawing\Help\Quit"),L="EBCDHQ"
 S NE=6,(TC,%C)=28,TR=8
SELECT D SEL G:J=0 EXIT
 I J=2 G NEW
 I J=1 S TITLE="EDIT DRAWING" D ^TKPNT4 G BEG:GR="" D ENTRY^TKPNT2 G ^TKPNT1
 I J=4 S TITLE="DELETE DRAWING" D ^TKPNT4 G:GR'="" DEL G BEG
 I J=3 S TITLE="COPY DRAWING" D ^TKPNT4 G:GR'="" COPY^TKPNT4 G BEG
 I J=5 D ^TKPNT2 G BEG
 
EXIT K Y,I,A,B,GR X ^TK("TERM-OFF"),^TK("WRAP-ON") Q
 
NEW K A,CA S PAT="X?1.9UNP",Y="12\LRCHD\1\Create New Drawing\\*,Enter Drawing Name *        ",%R=8,X="" D ^TKPOP G:X="" BEG S GR=X
 I $D(@TKG@(GR)) S Y="22\TRC\1\\\Drawing is already defined - Press RETURN*",%R=11 D ^TKPOP G NEW
 S Y="32\TRLC\1\\\Enter Description (0-30 characters)*,     *",X="" D ^TKPOP,DATE S @TKG@(GR)=X_"\"_DT_"\"
 D ENTRY^TKPNT2 G ^TKPNT1
 
DEL S %R=3,%C=1 W @(TKP),TK("CS") S %R=10,%C=32 W @(TKP),"DRAWING DELETED" H 2 K @TKG@(GR) G BEG
 
HEAD W TK("F") S %R=1,%C=2 W TK("LO"),@(TKP),TK("RON")," P ",TK("RT")," G ",TK("RT")," & ",TK("RT")," A " S %C=66 W @(TKP),"  TK-PAINT  ",TK("ROF"),! S J=TK("HL"),J=J_J_J_J F I=1:1:20 W J
 Q
 
DATE S K=$H+306,Y=((4*K)+3)\1461,D=((((K*4)+3)-(1461*Y))+4)\4,M=((5*D)-3)\153,D=((((5*D)-3)-(153*M))+5)\5,M=M+2,Y=((M\12)+Y)-60,M=(M#12)+1,Y=(((Y*100)+M)*100)+D,DT=$E(Y,3,4)_"/"_$E(Y,5,6)_"/"_$E(Y,1,2) K K,Y,M,D Q
 
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
 
DTM I ^TK("OS")="DTM"
 Q

