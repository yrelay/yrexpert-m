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

;%PKDEV1^INT^1^59547,73874^0
PKDEV1 ;
 
 S M=0,M(M)="" F C=1:1 S B=$P($T(FUNC+C),";;",2,99) Q:B=""  I H[$P(B,";") S SB=$P(B,";",3),A=$P(B,";",2),T=$S(A=3:$$^%QZCHW("HARD COPY DEVICES"),1:0),O=$S($D(^%PK(T,DV,SB)):^(SB),1:"") D ENTER
 G ^%PKDEV2
ERASE X "F J=J:-1:1 W $C(8,32,8)" Q
ENTER W ! W:$P(B,";",2)=2 "*" W ?3,SB,?8,"- ",$$^%QZCHW($P(B,";",4)),"  " S X=O D DISP W "> "
E1 R E I E="" W $C(8,8,32) G:X'="" S1 S (X,Y)="" G SS
 I E="-" S J=$L(Y),(E,X,Y)="" G SS D ERASE W $$^%QZCHW("(Item Cleared)") S ^%PK(T,DV,SB)="" Q
 I E="?" W !,!,$S($P(B,";",5)'="":$P(B,";",5),1:$$^%QZCHW("Enter the ASCII sequence in decimal separated by commas ( - clears item)")),! G ENTER
 S F=0,X="" I A'=2 F I=1:1 S J=$P(E,",",I) Q:J=""  S:'((J?1N.N)&(J<256)) F=1 S X=X_$C(J)
 I F W "  ???",*7 S J=$L(E)+6 H 2 D ERASE W " " G E1
SS S:"12"[A X=E S ^%PK(T,DV,SB)=X,J=$X-44 D ERASE,DISP
S1 D:A=2 S2 S:Y="" Y="""""" S:($L(M(M))+$L(Y_SB))>240 M=M+1,M(M)="" S M(M)=M(M)_",PK("""_SB_""")="_Y Q
S2 S Y=X Q:Y=""  I Y["""" S %F=$F(X,"""") F %J=0:0 S Y=$E(Y,0,%F-2)_""""""_$E(Y,%F,256),%F=$F(Y,"""",%F+1) Q:%F<1
 S Y=""""_Y_"""" Q
 
DISP S Y="" W ?44 Q:X=""  I 12'[A S Y="$C(" X "F I=1:1:$L(X) S:I>1 Y=Y_"","" S Y=Y_$A(X,I)" S Y=Y_")" W Y Q
 I A=1 S Y="("_X_")" W Y Q
 S Y=X W X Q
 
FUNC 
 ;;;1;C;# Columns;Enter maximum horizontal columns
 ;;;1;R;# Rows;Enter total number of lines per page
 ;;1;0;SET;Setup terminal (graphics, etc.)
 ;;1;0;H;Cursor home
 ;;1;0;U;Cursor up
 ;;1;0;D;Cursor down
 ;;1;0;RT;Cursor right
 ;;1;0;L;Cursor left
 ;;1;0;F;Home and Erase Screen
 ;;1;0;CL;Clear to end of line
 ;;1;0;CS;Clear to end of screen
 ;;1;0;IN;Insert Character
 ;;1;0;DL;Delete Character
 ;;1;2;IL;Insert Line
 ;;1;2;DT;Delete Line
 ;;1;0;RON;Reverse Video On
 ;;1;0;ROF;Reverse Video Off
 ;;1;0;HI;High Intensity
 ;;1;0;LO;Low Intensity
 ;;1;0;UO;Underline On
 ;;1;0;UF;Underline Off
 ;;1;2;P;Cursor Address (%R=row,%C=col.);Enter MUMPS executable code
 ;;0;3;CPI10;Normal 10 char/inch output
 ;;0;3;CPI12;Normal 12 char/inch output
 ;;0;3;CPI16;Compressed 16 char/inch output
 ;;1;0;HL;Horizontal Line
 ;;1;0;VL;Vertical Line
 ;;1;0;TLC;Top Left Corner
 ;;1;0;TRC;Top Right Corner
 ;;1;0;BLC;Bottom Left Corner
 ;;1;0;BRC;Bottom Right Corner
 ;;1;0;TI;Top Intersection
 ;;1;0;RI;Right Intersection
 ;;1;0;BI;Bottom Intersection
 ;;1;0;LI;Left Intersection
 ;;1;0;X;Crossed Lines
 ;;1;2;SR;Scroll Region (%R=top,%C=bottom)
 ;;1;2;CSR;Clear Scroll Region

