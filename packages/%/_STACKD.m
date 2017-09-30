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
;! Nomprog     : %STACKD                                                      !
;! Module      : SYS                                                          !
;! But         : Gestion de la pile de processus d'affichage                  !
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

%STACKD ;

STACK ;display the process stack
 N (%msub) D CURRENT^%IS S TRACE=$G(^trace($P($ZPOS,"^",2))),POP=0
 D OPEN^%FILTER(RM,SL) S $ZT="SCLOSE^"_$P($ZPOS,"^",2),$ZE=""
 D PSTACK ;print the stack information
SCLOSE S $ZT="" I $ZE]"" W !,"Error:"_$ZE S $ZE=""
 D CLOSE^%FILTER("") Q  ;close w/o fini
PSTACK ;print just the stack information
 D NEWLN^%FILTER("Process Stack:")
 S STMAX=+$G(^mtemp(%msub,"*STACK")) DO  Q:POP
 . S HEAD=0 F ST=1:1:STMAX DO  Q:POP
 . . D HEAD Q:POP  S X=$G(^mtemp(%msub,"*STACK",ST,"L"))
 . . D NEWLN^%FILTER(X) S POP=$$POP()
 D NEWLN^%FILTER() ;an extra line at the end
 Q
HEAD Q:$G(HEAD)  ;display a header
 D NEWLN^%FILTER("Level  Type     Line                   Source",2)
 S POP=$$POP(),HEAD=1 Q
trace S ^trace($P($ZPOS,"^",2))=1 W !,"trace set for "_$P($ZPOS,"^",2) Q
PRINT ;print all the variables for each stack level
 N (%msub,ALL) D CURRENT^%IS ;CURRENT ensures that $ZU(22) was done
 S TRACE=$G(^trace($P($ZPOS,"^",2))) W !!,"Display on" D OUT^%IS Q:POP
 S SELF=($I=IO),RM=IOM,SL=IOSL I 'SELF S SL=0
 ;
 U IO D OPEN^%FILTER(RM,SL) S $ZT="PCLOSE^"_$P($ZPOS,"^",2),$ZE=""
 ;
 I $G(ALL) DO  G PCLOSE:POP
 . D PSTATE^%STACKS ;print the process state information
 . D NEWLN^%FILTER("") ;add an extra blank line
 ;
 D PTRACE ;print out the stack/trace information
 ;
PCLOSE S $ZT="" I $ZE]"" W !,"Error: "_$ZE S $ZE=""
 D CLOSE^%FILTER(1) ;close w/ fini
 I 'SELF U IO W @IOF C IO
 Q
PTRACE ;print out all the stacks and the variabels
 S STMAX=+$G(^mtemp(%msub,"*STACK")),HEAD=0
 F ST=1:1:STMAX S V="" DO  Q:POP  ;print each stack level
 . D HEAD Q:POP  S X=$G(^mtemp(%msub,"*STACK",ST,"L"))
 . D NEWLN^%FILTER(X) D NEWLN^%FILTER("") S POP=$$POP() Q:POP  S PV=0
 . S V="" F  S V=$O(^mtemp(%msub,"*STACK",ST,"V",V)) Q:V=""  DO  Q:POP
 . . D VSHOW(V,ST) S PV=1
 . I PV D NEWLN^%FILTER("") ;extra linefeed if any variables at this level
 q
VSHOW(R,ST) ;show the definition for a variable, or set stack level
 N V,L,N,F,X,Z,O
 S V=$P(R,"("),L=ST+1,F=0 ;the variable name, and 'highest' level
 F  S L=$O(^mtemp(%msub,"*STACK",L),-1) Q:'L  DO  Q:F
 . S F=$G(^mtemp(%msub,"*LEVEL",L,V)) ;first level
 I 'F D NEWLN^%FILTER(V_" is not defined"):0 S POP=$$POP() Q
 ;
 ;
 I ST'=F D NEWLN^%FILTER("(base stack level = "_F_")") Q:$$POP()
 ;
 S N=$P(R,"(",2,$L(R)),(N,O)=$E(N,1,$L(N)-1) ;the node/subscript
 I N="",$D(^mtemp(%msub,"*STACK",F,"V",V))#2 S X=^(V),Z=""
 I N]"",$D(^mtemp(%msub,"*STACK",F,"V",V,"N",N))#2 S X=^(N),Z="("_N_")"
 I $D(X) D VONE(V_Z,X) Q:$$POP()
 F  DO  Q:N=""  Q:POP
 . S N=$O(^mtemp(%msub,"*STACK",F,"V",V,"N",N)) Q:N=""  S X=^(N)
 . I O]"",$E(N,1,$L(O))'=O S N="" Q  ;not in range requested
 . D VONE(V_"("_N_")",X) S POP=$$POP()
 i '(ST>F) q
 k X  
 i N="",$D(^mtemp(%msub,"*STACK",ST,"V",V))#2 S X=^(V),Z=""
 I N]"",$D(^mtemp(%msub,"*STACK",ST,"V",V,"N",N))#2 S X=^(N),Z="("_N_")"
 i $d(X) d  
 . d NEWLN^%FILTER("(stack level = "_ST_")") Q:$$POP()
 . d VONE(V,X) S POP=$$POP()
 Q
VONE(Var,Val) D NEWLN^%FILTER($J("",10)_$$LJ(Var,8)_" = ") D TAB^%FILTER(25,Val) Q
POP() S POP=$S($G(POP):1,1:'$G(%filter)) Q POP
 ;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
VLIST(R) N L,F,V,S ;list out the variables or stack levels
 I R\1=R,R>0,R'>STMAX S F=R DO  Q  ;list all variabls for one level
 . S V="" F  S V=$O(^mtemp(%msub,"*NAMES",V)) Q:V=""  DO
 . . S S=$O(^mtemp(%msub,"*NAMES",V,F+1),-1)
 . . I S,$D(^mtemp(%msub,"*NAMES",V,F)) S S(V)=""
 . W !!,"The folowing Variables are defined for Stack Level: "_F,!
 . S V="" F  S V=$O(S(V)) Q:V=""  W:$X ?$X\5+1*5 W:$X>70 ! W V
 . W:'$X !,"No Variables defined for that level." W ! Q
 ;
 I R?1N.E W "  Not a valid stack level" Q
 I $E(R)="?" W ! DO  W ! Q  ;list *all* variable levels
 . W !,"The following levels have defined Variables:"
 . S F="" F  S F=$O(^mtemp(%msub,"*STACK",F),-1) Q:F=""  I F DO
 . . Q:'$D(^mtemp(%msub,"*STACK",F,"V"))  W !,"Base Stack Level: "_F,!
 . . S V="" F  S V=$O(^mtemp(%msub,"*STACK",F,"V",V)) Q:V=""  DO
 . . . W:$X ?$X\5+1*5 W:$X>70 ! W V
 . . W !
 ;
 I R?1P.E,$E(R)'="%" W "  Enter a Stack level or Variable name" Q
 ;
 S V=$P(R,"(") ;the variable name -- list the levels it exists on
 S STMAX=+$G(^mtemp(%msub,"*STACK")),F=STMAX+1,S=0 ;start at the top
 F  S F=$O(^mtemp(%msub,"*NAMES",V,F),-1) Q:'F  DO
 . W !,"Base Stack Level = "_F
 . S A=$O(^mtemp(%msub,"*NAMES",V,F,"")),Z=$O(^(""),-1)
 . S S=S+1,R=A_"-"_Z S:A=Z R=A W:R'=F ?25," "_R
 I 'S W "  variable '"_V_"' not defined at any stack level"
 Q
TEST K  N (E) S A=1 D TEST1 Q  ;level=2
TEST1 N A S (B,A)=2 DO  ;level = 3
 . N A,B S (C,B,A)=3 DO  ;level = 4
 . . N A,B,C S $ZT="TESTQ" ;error trap set! (level 4.1?)
 . . S (D,C,B,A)=4 DO  ;level = 5
 . . . N A,B,C,D S (E,D,C,B,A)=5 D TEST2 ;level 6
TESTQ Q
TEST2 N XEC S XEC="D TEST3^"_$P($ZPOS,"^",2) X XEC Q  ;level 7
TEST3 D TESTD(A,,C,.D) Q
TESTD(AA,BB,CC,DD,EE) N FF F  S FF=$$TESTE(AA,$G(BB),CC,.DD,.EE) Q:'FF
 Q
TESTE(AAA,BBB,CCC,DDD,EEE) S (AAA,BBB,CCC,DDD,EEE)=6 Q $$TESTF()
TESTF() D ^%STACK Q 0
LJ(x,n) Q ($E(x_$J("",n),1,n)_$E(x,n+1,$L(x))) ;left justify text to n chars
UC(x) q $zcvt(x,"u")

