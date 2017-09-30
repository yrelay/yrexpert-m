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

;%QMDATE^INT^1^59751,45346^0
ZHEUR ;
 
 
 
DIV(A,B) 
 Q (($P(A,"H",1)*60)+$P(A,"H",2))/(($P(B,"H",1)*60)+$P(B,"H",2))
MULT(X,H) 
 Q X*(($P(H,"H",1)*60)+$P(H,"H",2))
MULTH(X,H) 
 Q $$HEUR($$MULT(X,H))
DIFJ(D1,D2) 
 N %DS,%DN S %DS=$$PERM(D1) D INT^%DATE S D1=%DN,%DS=$$PERM(D2) D INT^%DATE S D2=%DN Q D1-D2
DIF(D2,H2,D1,H1) 
 N D,H
 S %DS=$$PERM(D1) D INT^%DATE
 S D1=%DN,H1=($P(H1,"H",1)*3600)+($P(H1,"H",2)*60)
 S %DS=$$PERM(D2) D INT^%DATE
 S D2=%DN,H2=($P(H2,"H",1)*3600)+($P(H2,"H",2)*60)
 S D=D2-D1 I H1'>H2 S H=H2-H1 G FDIF
 S D=D-1,H=(H2-H1)+86400
FDIF Q $$HEUR(((D*86400)+H)\60)
DIFNO(H1,H2) 
 Q $$DIF($$DATENO($P(H1,",",1)),$$HEURNO($P(H1,",",2)),$$DATENO($P(H2,",",1)),$$HEURNO($P(H2,",",2)))
HEUR(M) 
 N H S H=M\60,M=M-(H*60) Q $S($L(H)=1:"0"_H,1:H)_"H"_$S($L(M)=1:"0"_M,1:M)
PERM(D) 
 Q $P(D,"/",2)_"/"_$P(D,"/",1)_"/"_$P(D,"/",3)
PERMC(D) 
 Q $P(D,"/",3)_$P(D,"/",1)_$P(D,"/",2)
PERMD(D) 
 Q $P(D,"/",3)_$P(D,"/",2)_$P(D,"/",1)
SLASH(D) 
 Q $E(D,5,6)_"/"_$E(D,3,4)_"/"_$E(D,1,2)
INF(A,B) 
 Q (($P(A,"H",1)*60)+$P(A,"H",2))<(($P(B,"H",1)*60)+$P(B,"H",2))
SUP(A,B) 
 Q (($P(A,"H",1)*60)+$P(A,"H",2))>(($P(B,"H",1)*60)+$P(B,"H",2))
SUPDAT(A,B) 
 Q:$P(A,"/",3)'=$P(B,"/",3) $P(A,"/",3)>$P(B,"/",3)
 Q:$P(A,"/",2)'=$P(B,"/",2) $P(A,"/",2)>$P(B,"/",2)
 Q $P(A,"/",1)>$P(B,"/",1)
INFDAT(A,B) 
 Q:A=B 0 Q '($$SUPDAT(A,B))
HEURE() 
 N H,M S H=$P($H,",",2)\3600,M=($P($H,",",2)-(H*3600))\60
 Q $S($L(H)=1:"0"_H,1:H)_"H"_$S($L(M)=1:"0"_M,1:M)
HEUREX(H1) 
 N M S H=$P(H1,",",2)\3600,M=($P(H1,",",2)-(H*3600))\60
 Q $S($L(H)=1:"0"_H,1:H)_"H"_$S($L(M)=1:"0"_M,1:M)
DATE() 
 ;HL2 N D S D=$ZD($H) Q $$PERM(D)
 N D S D=$ZD($H,"MM/DD/YEAR") Q $$PERM(D)
DATEX(H1) 
 N D
 S H1=$S(H1<0:0,H1>94000:94000,1:H1)
 ;HL2 S D=$ZD(H1)
 S D=$ZD(H1,"MM/DD/YEAR")
 Q $$PERM(D)
DATE2() 
 ;HL2 N A,D,J,M S D=$ZD($H)
 N A,D,J,M S D=$ZD($H,"MM/DD/YEAR")
 S J=$P(D,"/",2),M=$$MOIS($P(D,"/",1)),A="19"_$P(D,"/",3)
 Q J_" "_M_" "_A
DATENO2(D) 
 ;HL2 N A,J,M S D=$ZD(D)
 N A,J,M S D=$ZD(D,"MM/DD/YEAR")
 S J=$P(D,"/",2),M=$$MOIS($P(D,"/",1)),A="19"_$P(D,"/",3)
 Q J_" "_M_" "_A
DATE3() 
 ;HL2 N D S D=$ZD($H) Q $P(D,"/",3)_$P(D,"/",1)_$P(D,"/",2)
 N D S D=$ZD($H,"MM/DD/YEAR") Q $P(D,"/",3)_$P(D,"/",1)_$P(D,"/",2)
DATENO3(D) 
 ;HL2 Q:(D>60000)!(D<0) "" S D=$ZD(D) Q $P(D,"/",3)_$P(D,"/",1)_$P(D,"/",2)
 Q:(D>60000)!(D<0) "" S D=$ZD(D,"MM/DD/YEAR") Q $P(D,"/",3)_$P(D,"/",1)_$P(D,"/",2)
DATE4() 
 Q $$DATENO4($H)
DATENO4(H) 
 Q:(H>60000)!(H<0) ""
 ;HL2 N %DS,%DN,A,H1 S A=$P($ZD(H),"/",3),%DS="01/01/"_A D INT^%DATE S H1=%DN
 N %DS,%DN,A,H1 S A=$P($ZD(H,"MM/DD/YEAR"),"/",3),%DS="01/01/"_A D INT^%DATE S H1=%DN
 Q (A_"00")+(((((H-H1)+$$FIRSTDAY^%QMDATE(A))-1)\7)+1)
DH41(D) 
 N %DS,%DN,A,H1,R S A=$E(D,1,2),%DS="01/01/"_A D INT^%DATE S H1=%DN
 S R=((H1-$$FIRSTDAY^%QMDATE(A))+1)+(($E(D,3,4)-1)*7) Q:R<H1 H1 Q R
MOIS(M) 
 Q $P("Janvier,Fevrier,Mars,Avril,Mai,Juin,Juillet,Aout,Septembre,Octobre,Novembre,Decembre",",",M)
ANNEE() 
 Q $P($$DATE,"/",3)
ANNEEX(H) Q $P($$DATEX(H),"/",3)
ADDAT(D,H,DD) 
 S %DS=$$PERM(D) D INT^%DATE S D=%DN
 S H=($P(H,"H",1)*3600)+($P(H,"H",2)*60)
 S DD=($P(DD,"H",1)*3600)+($P(DD,"H",2)*60)
 S H=H+DD,DD=H\86400,D=D+DD,H=H-(DD*86400)
 Q $$DATENO(D)_","_$$HEURNO(H)
ADDAT1(H,DUREE) 
 
 
 N SEC,DD,D S D=$P(H,",",1),DD=$P(H,",",2)
 S SEC=($P(DUREE,"H",1)*3600)+($P(DUREE,"H",2)*60)
ADDS S SEC=SEC+DD,D=D+(SEC\86400),SEC=SEC#86400
 Q D_","_SEC
ADDAT2(H,SEC) 
 N D,DD S D=$P(H,",",1),DD=$P(H,",",2)
 G ADDS
SUBDAT(D,H,DD) 
 S %DS=$$PERM(D) D INT^%DATE S D=%DN
 S H=($P(H,"H",1)*3600)+($P(H,"H",2)*60)
 S DD=($P(DD,"H",1)*3600)+($P(DD,"H",2)*60)
 S H=H-DD G:H'<0 FSUB S DD=((-(H))\86400)+(((-(H))#86400)'=0),D=D-DD,H=H+(DD*86400)
FSUB Q $$DATENO(D)_","_$$HEURNO(H)
DATENO(N) 
 ;HL2 Q $$PERM($ZD(N))
 Q $$PERM($ZD(N,"MM/DD/YEAR"))
DH1(D) 
 N %DS,%DN S %DS=$$PERM(D) D INT^%DATE Q %DN
DH31(D) 
 ;HL N %DS,%DN S %DS=$E(D,3,4)_"/"_$E(D,5,6)_"/"_$E(D,1,2) D INT^%DATE Q %DN
 N %DS,%DN S %DS=$E(D,5,6)_"/"_$E(D,7,8)_"/"_$E(D,1,4) D INT^%DATE Q %DN
HEURNO(N) 
 N H,M S H=N\3600,M=(N-(H*3600))\60 Q $S($L(H)=1:"0"_H,1:H)_"H"_$S($L(M)=1:"0"_M,1:M)
HEURNO2(N) 
 N H,M,S S H=N\3600,M=(N-(H*3600))\60,S=(N-(H*3600))-(M*60) Q $S($L(H)=1:"0"_H,1:H)_"H"_$S($L(M)=1:"0"_M,1:M)_"'"_$S($L(S)=1:"0"_S,1:S)
INVERS(D) 
 Q $P(D,"/",3)_"/"_$P(D,"/",2)_"/"_$P(D,"/",1)
SUPDH(D1,H1,D2,H2) 
 Q:D1=D2 $$SUP(H1,H2) Q $$SUPDAT(D1,D2)
TEMPS() Q $$DATE_" a "_$$HEURE
TEMPSX(H1) Q $$DATEX(H1)_" a "_$$HEUREX(H1)
TEMPSNO(N) Q $$DATENO($P(N,",",1))_" a "_$$HEURNO($P(N,",",2))
UC(E,S) 
 Q:E="" 0 N D,F S D=$P(E,"H",1),F=$P(E,"H",2)
 Q:(D'?1N.N)!(D>23) 0 Q:(F'?.N)!(F>59) 0
 S S=$S($L(D)=1:"0"_D,1:D)_"H"_$S($L(F)=1:"0"_F,F="":"00",1:F) Q 1
CONS(A) 
 N I
 S BIS=$$BIS(A)
 S TAB(0)=0
 S TAB(1)=31,TAB(2)=59,TAB(3)=90,TAB(4)=120,TAB(5)=151,TAB(6)=181
 S TAB(7)=212,TAB(8)=243,TAB(9)=273,TAB(10)=304,TAB(11)=334,TAB(12)=365
 F I=2:1:12 S TAB(I)=TAB(I)+BIS
 S FDAY=$$FIRSTDAY(A) I FDAY=1 S SEM(1)=7
 E  S SEM(1)=(14-FDAY)+1
 
 F I=2:1 Q:SEM(I-1)'<(365+BIS)  S SEM(I)=SEM(I-1)+7
 
 
 Q
JOURSD(A,S) 
 
 N TAB,SEM
 D CONS(A) S S=S*1
 Q:'($D(SEM(S))) ""
 
 Q SEM(S)-6
JOURSF(A,S) 
 N TAB,SEM
 D CONS(A) S S=S*1
 Q:'($D(SEM(S))) ""
 Q SEM(S)
JOURMD(A,M) 
 N TAB,SEM
 D CONS(A) S M=M*1
 Q:'($D(TAB(M))) ""
 I M=1 Q 1
 Q TAB(M-1)+1
JOURMF(A,M) 
 N TAB,SEM
 D CONS(A) S M=M*1
 Q:'($D(TAB(M))) ""
 Q TAB(M)
MOISEM(A,S) 
 N TAB,I,FIRSTDAY,BIS,SEM
 D CONS(A) S S=S*1
 Q:'($D(SEM(S))) ""
 F I=1:1:12 Q:TAB(I)'<SEM(S)
 I (SEM(S)-TAB(I-1))>3 Q I
 Q I-1
FIRSTDAY(A) 
 
 Q $$NJ^%QMDATE1($$20^%QMDATE1(A_"0101"))
 
 N DIFF,DIFF1,DIFF2,FIRSTDAY
 S DIFF=A-86,DIFF1=DIFF#4,DIFF2=DIFF\4
 S FIRSTDAY=(3+(5*DIFF2))+$S(DIFF1=0:0,DIFF1=1:1,DIFF1=2:2,DIFF1=3:4)
 Q $S((FIRSTDAY#7)=0:7,1:FIRSTDAY#7)
BIS(A) S BIS=100+(A-84)
 S BIS=$S((BIS#4)=0:1,1:0)
 Q BIS

