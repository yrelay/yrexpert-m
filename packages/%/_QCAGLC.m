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
;! Nomprog     : %QCAGLC                                                      !
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

%QCAGLC ;
 
 
 
 
 
 
 
 
TRAIT N %DEL,%TREE,%NG,%G,%UU,%NEW,%RS,%TREEDEL,%LQUI,%APT,%NVERSI
 S %NVERSI=0
RUN S %ARR=NOMTREE,%LARR=$L(%ARR),%APT=$P(%ARR,"(",1),%LEAR=$L(%APT)
 S %LQUI=0
 S:%APT["]" %LEAR=$L($P(%APT,"]",2)),%LQUI=$L($P(%APT,"]",1))
 G:%LEAR'>9 TRAITS
 I %ARR'["(" S %ARR=$E(%ARR,1,9+%LQUI),%LARR=9+%LQUI G TRAITS
 S %PDR=$P(%ARR,"(",2),%ARR=$E(%ARR,1,9+%LQUI)_"("_%PDR,%LARR=(10+$L(%PDR))+%LQUI
TRAITS S %TREEF=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE),%TREECF=$S(%TREECOP["(":%TREECOP_")",1:%TREECOP)
 I ($D(@%TREEF)#10)=1 S %RS=@%TREEF,@%TREECF=%RS
 
 
 
 S %TREE=$P(%TREECOP,"(",1),%T=$S(NOMTREE["(":NOMTREE_")",%NVERSI:NOMTREE,1:NOMTREE_"("""")"),%TREECOP=$S(%TREECOP["(":%TREECOP_",",1:%TREECOP_"(")
 
 ; correction pb en DTM 6.3 et GT.M
 IF IBMPC'=1 F %U=1:1 S %T=$Q(@%T) Q:%T=""  S %T=$S($E(NOMTREE,2)="[":$P(NOMTREE,"]",1)_"]"_$E(%T,2,$L(%T)),1:%T) Q:$E(%T,1,%LARR)'=%ARR  Q:($E(%T,%LARR+1)'=",")&($E(%T,%LARR+1)'="(")  D WRIT
 IF IBMPC=1 F %U=1:1 S %T=$Q(@%T) Q:%T=""  S %T=$S($E(NOMTREE,2)="[":$P(NOMTREE,"[",1)_"[QUI]"_$P(%T,"|",3),1:%T) Q:$E(%T,1,%LARR)'=%ARR  Q:($E(%T,%LARR+1)'=",")&($E(%T,%LARR+1)'="(")  D WRIT
 
END Q
 
WRIT S %RS=@%T,%NEW=%TREECOP_$E(%T,%LARR+2,500),@%NEW=%RS Q
 
FIN 
 Q
 
 
 
 
COPY(S,D) 
 N %ARR,%TREECF,%LARR,%LEAR,%PDR,%TREEF,%T,NOMTREE,%TREECOP
 I S["(" S S=$E(S,1,$L(S)-1)
 I D["(" S D=$E(D,1,$L(D)-1)
 S NOMTREE=S,%TREECOP=D
 G TRAIT
 
ADR(NOMTREE,%TREECOP) 
 G TRAIT
 
GLOCOP(S,D) 
 N NOMTREE,%TREECOP
 I S["(" S S=$E(S,1,$L(S)-1)
 I D["(" S D=$E(D,1,$L(D)-1)
 S NOMTREE=S,%TREECOP=D
 G TRAIT
 
TEST W !,"A copier : " R NOMTREE Q:$A(NOMTREE)<32
 W "   dans : " R %TREECOP Q:$A(%TREECOP)<32
 D ^%QCAGLC Q
 
 
 
 
 
COPY2(S,D) 
 N %ARR,%TREECF,%LARR,%LEAR,%PDR,%TREEF,%T,NOMTREE,%TREECOP
 N %DEL,%TREE,%NG,%G,%UU,%NEW,%RS,%TREEDEL,%LQUI,%APT,%NVERSI
 I S["(" S S=$E(S,1,$L(S)-1)
 I D["(" S D=$E(D,1,$L(D)-1)
 S NOMTREE=S,%TREECOP=D,%NVERSI=1
 G RUN
 
 
 
 
 
EGALGLO(G1,G2) N Q1,Q2,RE1,RE2,T1,T2
 Q:$D(@G1)'=$D(@G2) 0
 S Q1=$S($E(G1,2)="[":$P(G1,"]")_"]",1:"^"),Q2=$S($E(G2,2)="[":$P(G2,"]")_"]",1:"^")
 S RE1=$S($E(G1,$L(G1))=")":$E(G1,1,$L(G1)-1),1:G1),RE2=$S($E(G2,$L(G2))=")":$E(G2,1,$L(G2)-1),1:G2)
 S T1=G1,T2=G2
 I $D(@G1)#10 Q:@G1'=@G2 0
BCL S T1=$Q(@T1),T2=$Q(@T2) I (T1="")&(T2="") Q 1
 Q:T1="" $E(Q2_$E(T2,2,$L(T2)),1,$L(RE2))'=RE2 Q:T2="" $E(Q1_$E(T1,2,$L(T1)),1,$L(RE1))'=RE1
 S T1=Q1_$E(T1,2,$L(T1)),T2=Q2_$E(T2,2,$L(T2))
 I ($E(T1,1,$L(RE1))'=RE1)!($E(T2,1,$L(RE2))'=RE2) Q ($E(T1,1,$L(RE1))'=RE1)&($E(T2,1,$L(RE2))'=RE2)
 I $E(T1,$L(RE1)+1,$L(T1))'=$E(T2,$L(RE2)+1,$L(T2)) Q 0
 I @T1'=@T2 Q 0
 G BCL
 
 
TESTE K ^TEST,^[QUI]TEST
 S ^TEST("A",1,"A",2)=4,^TEST("A",1,"A",3)=6,^TEST("A",1,"A")="zz",^TEST("A",1,"B")=9,^TEST("A",1,"C")=0
 S ^[QUI]TEST("A",1,"A",2)=5,^[QUI]TEST("A",1,"A",3)=7,^[QUI]TEST("A",1,"A")="zzz",^[QUI]TEST("A",1,"C")=1
 S R=$$EGALGLO("^TEST","^[QUI]TEST") W !,1-R
 S R=$$EGALGLO("^TEST(""A"")","^[QUI]TEST") W !,1-R
 S R=$$EGALGLO("^TEST(""A"")","^[QUI]TEST(""A"")") W !,1-R
 S R=$$EGALGLO("^TEST(""A"",1,""A"")","^[QUI]TEST(""A"",1,""A"")") W !,R
 S R=$$EGALGLO("^TEST(""A"",1,""B"")","^[QUI]TEST(""A"",1,""B"")") W !,1-R
 S R=$$EGALGLO("^TEST(""A"",1,""C"")","^[QUI]TEST(""A"",1,""C"")") W !,1-R
 Q

