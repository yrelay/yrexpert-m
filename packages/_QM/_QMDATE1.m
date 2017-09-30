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

;%QMDATE1^INT^1^59547,73877^0
%ZHEUR1 ;
 
 
 
 
ANNO(H) 
 Q $P($ZD(H),"/",3)
AN() Q $$ANNO($H)
 
SEMNO(H) Q $E($$05(H),3,4)
SEM() Q $$SEMNO($H)
 
MOISO(H) 
 Q $P($ZD(H),"/",1)
MOIS() Q $$MOISO($H)
 
JOURO(H) 
 Q $P($ZD(H),"/",2)
JOUR() Q $$JOURO($H)
 
TRIMO(H) 
 Q $$TRIM^%QZDAJM($$MOISO(H))
TRIM() Q $$TRIMO($H)
 
DATENO5(H) 
 N D S D=$$DATENO4^%QMDATE(H) Q:$E(D,3,4)'="01" D
 Q:$$FIRSTDAY^%QMDATE($E(D,1,2))=1 D
 Q $$DATENO4^%QMDATE($$DH41^%QMDATE(D)-1)
DH51(D) 
 N A S A=$$DH41^%QMDATE(D) Q:$E(D,3,4)'="01" A
 Q:$$FIRSTDAY^%QMDATE($E(D,1,2))=1 D
 Q $$DH41^%QMDATE($$DATENO4^%QMDATE(A-1))
 
 
 
 
 
 
 
 
 
 
 
01(X) Q $$DATEX^%QMDATE(X)
02(X) Q $$DATENO3^%QMDATE(X)
03(X) Q $$DATENO2^%QMDATE(X)
04(X) Q $$SLASH^%QMDATE($$PERMC^%QMDATE($$01(X)))
05(X) Q $$NOSEM^%QMDAK4(X)
06(X) Q $TR($$01(X),"/","")
10(X) Q $$20($$12(X))
12(X) Q $$PERMD^%QMDATE(X)
13(X) Q $$03($$10(X))
14(X) Q $$PERM^%QMDATE(X)
15(X) Q $$05($$10(X))
20(X) Q $$DH31^%QMDATE(X)
21(X) Q $$SLASH^%QMDATE(X)
23(X) Q $$03($$20(X))
24(X) Q $$04($$20(X))
25(X) Q $$05($$20(X))
30(X) Q $$10($$31(X))
31(X) Q $$PERMUTE(X)
32(X) Q $$12($$31(X))
34(X) Q $$14($$31(X))
35(X) Q $$15($$31(X))
40(X) Q $$10($$41(X))
41(X) Q $$PERM^%QMDATE(X)
42(X) Q $$PERMC^%QMDATE(X)
43(X) Q $$23($$42(X))
45(X) Q $$25($$42(X))
50(X) Q $$HLUN^%QMDAK4(X)
51(X) Q $$01($$50(X))
52(X) Q $$02($$50(X))
53(X) Q $$03($$50(X))
54(X) Q $$04($$50(X))
61(X) S X=X+0 Q:X<10100 "" Q:X>311299 ""
 I $L(X)=5 S X="0"_X
 Q $E(X,1,2)_"/"_$E(X,3,4)_"/"_$E(X,5,6)
62(X) S X=X+0 Q:X<10100 "" Q:X>311299 ""
 I $L(X)=5 S X="0"_X
 Q $E(X,5,6)_$E(X,3,4)_$E(X,1,2)
X8B(X) Q $$X8B^%QMDAT3(X)
A7(X) Q $$A7^%QMDAT3(X)
1() Q $$DATE^%QMDATE
2() Q $$DATE3^%QMDATE
3() Q $$DATE2^%QMDATE
4() Q $$SLASH^%QMDATE($$PERMC^%QMDATE($$1))
5() Q $$NOSEM0^%QMDAK4
NJ(X) 
 Q ((X+3)#7)+1
J(X) 
 Q $P($P($T(JOURL),";;",2),",",$$NJ(X))
JOURL ;;lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche,
PERMUTE(X) 
 N J,M,A
 S J=$P(X," ",1),M=$P(X," ",2),A=$E($P(X," ",3),3,4),M=$$MOISINV(M) I J<10 S:(J?1"0".N)=0 J="0"_J
 Q J_"/"_M_"/"_A
MOISINV(M) 
 Q $S(M="Janvier":"01",M="Fevrier":"02",M="Mars":"03",M="Avril":"04",M="Mai":"05",M="Juin":"06",M="Juillet":"07",M="Aout":"08",M="Septembre":"09",M="Octobre":"10",M="Novembre":"11",M="Decembre":"12",1:"00")

