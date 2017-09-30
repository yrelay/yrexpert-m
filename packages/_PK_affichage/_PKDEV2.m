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

;%PKDEV2^INT^1^59547,73874^0
PKDEV2 ;
 
 W !,!,$$^%QZCHW("INPUT PARAMETERS       (Control sequence from terminal to computer)"),!,!,$$^%QZCHW("Enter the decimal values of the ASCII characters that are transmitted by the"),!,$$^%QZCHW("key that is used for each of the following functions."),!,!
 W ?10,$$^%QZCHW("Example of an input:     27,65     (which is an ESC,A)"),!,!
 S (TT,ZF)="" G:$D(^%PK("TERMST"))=0 BEG S:$D(PK(1))=0 PK(1)=0 S TT=^%PK("TERMST") X ^%PK("TERM-ON")
 W $$^%QZCHW("NOTE:  If you are presently typing on the terminal that you are also defining"),!,$$^%QZCHW("then you need only press the key associated with the function and the computer"),!,$$^%QZCHW("will create the decimal values for you."),!,!
BEG W $$^%QZCHW("Press RETURN to skip over a function."),!,!
 F C=1:1 S B=$P($T(FUNC+C),";;",2,99) Q:B=""  I H[$P(B,";") S SB=$P(B,";",3),A=$P(B,";",2),T=$S(A=3:"HARD COPY DEVICES",1:0),O=$S($D(^%PK(T,DV,SB)):^(SB),1:"") D ENTER
 D LAST F I=0:1:5 K ^%PK(T,DV,I)
 F I=0:1:M S ^(I)="S "_$E(M(I),2,255)
 X:TT'="" ^%PK("TERM-OFF") K:$D(PK)=10 PK G OK^%PKDEV
ERASE X "F J=J:-1:1 W $C(8,32,8)" Q
LAST S A="",SB="Z" F I="ROF","UF","HI" S A=A_^%PK(0,DV,I)
 S ^%PK(0,DV,SB)=A S:DV["VT" ^(SB)=$C(27,91,59,49,109) S Y="$C(" F J=1:1:$L(A) S:J>1 Y=Y_"," S Y=Y_$A(A,J)
 S Y=Y_")" D S1 Q
ENTER W ! W:$P(B,";",2)=2 "*" W ?3,SB,?8,"- ",$P(B,";",4),"  " S X=O D DISP W "> "
E1 R E X TT I ZF'="",ZF'=$C(13) F I=1:1:$L(ZF) S E=E_$A(ZF,I)_","
 S:$E(E,$L(E))="," E=$E(E,1,$L(E)-1) I E="" W $C(8,8,32) G:X'="" S1 S (X,Y)="" G SS
 I E="-" S J=$L(Y),(E,X,Y)="" G SS
 I E="?" W !,!,$S($P(B,";",5)'="":$P(B,";",5),1:$$^%QZCHW("Enter the ASCII sequence in decimal separated by commas ( - clears item)")),! G ENTER
 S F=0,X="" I A'=2 F I=1:1 S J=$P(E,",",I) Q:J=""  S:'((J?1N.N)&(J<133)) F=1 S X=X_$C(J)
 I F W "  ???",*7 S J=$L(E)+6 H 2 D ERASE W " " G E1
SS S:"12"[A X=E S ^%PK(T,DV,SB)=X,J=$X-44 D ERASE,DISP
S1 D:A=2 S2 S:Y="" Y="""""" S:($L(M(M))+$L(Y))>240 M=M+1,M(M)="" S M(M)=M(M)_",PK("""_SB_""")="_Y Q
S2 S Y=X Q:X=""  I Y["""" S %F=$F(X,"""") F %J=0:0 S Y=$E(Y,0,%F-2)_""""""_$E(Y,%F,256),%F=$F(Y,"""",%F+1) Q:%F<1
 S Y=""""_Y_"""" Q
 
DISP S Y="" W ?44 Q:X=""  I 12'[A S Y="$C(" X "F I=1:1:$L(X) S:I>1 Y=Y_"","" S Y=Y_$A(X,I)" S Y=Y_")" W Y Q
 I A=1 S Y="("_X_")" W Y Q
 S Y=X W X Q
 
FUNC 
 ;;1;0;UK;Cursor up
 ;;1;0;DK;Cursor down
 ;;1;0;RK;Cursor right
 ;;1;0;LK;Cursor left
 ;;1;0;INK;Insert Character
 ;;1;0;DLK;Delete Character

