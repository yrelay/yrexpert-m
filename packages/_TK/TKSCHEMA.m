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

;TKSCHEMA^INT^1^59547,74869^0
TKSCHEMA ;
C 
 
 S:'($D(^TKSCHEMA)) ^TKSCHEMA="" N (TK,TKP) D:($D(TK)+$D(TKP))'=12 INIT^TKDEV X ^TK("TERM-ON"),^TK("WRAP-OFF")
BEG D HEAD S Y="Edit Dictionary Code\Display Codes\Print Codes\Copy Dictionary Code\Quit",L="EDPCQ"
 S NE=5,(TC,%C)=28,TR=8
SELECT D SEL G:J=0 EXIT S:'(J) J=$F(L,J)-1 K L
 I J=1 G CODE
 I J=2 D ^TKSCHEM2 D:$D(S1) ^TKSCHEM1:S1'="Q" G BEG
 I J=3 D ^TKSCHEM3 G BEG
 I J=4 D COPY^TKSCHEM3 G BEG
 
EXIT W TK("F") X ^TK("TERM-OFF"),^TK("WRAP-ON") Q
 Q
CODE K A,CA D HEAD S %R=5,%C=5,LNG=9,X="" W @(TKP),TK("LO"),$$^%QZCHW("Enter Dictionary Code "),TK("HI") S %C=28 X ^TKREAD G:X="" BEG S S1=X
 D ^TKSCHEM1 G CODE
 
COMPILE S ACOMPILE="ED2" D ED1^TKFRME1 K ACOMPILE Q
 
NA S %R=20 W @(TKP),$$^%QZCHW("OPTION NOT AVAILABLE") H 2 W @(TKP),TK("CL") Q
HEAD W TK("F"),TK("Z") S %R=1,%C=2 W TK("LO"),@(TKP),TK("RON")," P ",TK("RT")," G ",TK("RT")," & ",TK("RT")," A " S %C=26 W @(TKP),TK("ROF"),TK("HI"),$$^%QZCHW("DATABASE DICTIONARY MANAGEMENT"),TK("LO")
 S %C=68 W @(TKP),TK("RON"),"  TKSCHEMA  ",TK("ROF"),! S J=TK("HL"),J=J_J_J_J F I=1:1:20 W J
 Q:$D(NE)  S %R=3,%C=14 W @(TKP),TK("LO"),"Copyright (C) 1985, Patterson, Gray and Assoc., Inc." Q
 
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

