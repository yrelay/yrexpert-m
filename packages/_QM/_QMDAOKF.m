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

;%QMDAOKF^INT^1^59547,73877^0
QMDAOKF(FORM,DATE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N COR,D
 G @FORM
 
0 Q 1
1 Q $$^%QMDASAI($$INVERS^%QMDATE(DATE),.DATE)
2 Q $$^%QMDASAI(DATE,.DATE)
3 Q $$^%QMDASAI($$SLASH^%QMDATE(DATE),.DATE)
4 G 2
5 G 2
6 S DATE=$$^%QMDAFIN(DATE) Q 1
61 Q $$^%QMDASAI("S"_$E(DATE,3,4)_$E(DATE,1,2),.DATE)
7 S DATE=$$^%QMDAFIN(DATE) Q 1
8 S DATE=$$^%QMDAFIN(DATE) Q 1
9 S DATE=$$^%QMDAFIN(DATE) Q 1
10 S DATE=$$^%QMDAFIN(DATE) Q 1
101 S D=$P(DATE," ",1)_" "_$$INVERS^%QMDATE($P(DATE," ",2))
 Q $$^%QMDASAI(D,.DATE)
102 G 2
103 S D=$P(DATE," ",1)_" "_$$SLASH^%QMDATE($P(DATE," ",2))
 Q $$^%QMDASAI(D,.DATE)
104 G 2
105 G 2
1001 Q $$^%QMDASAI($$INVERS^%QMDATE(DATE),.DATE)
1002 G 2
1005 G 2
1006 G 2
1007 G 2
1008 G 2
1009 G 2
1101 S D=$P(DATE," ",1)_" "_$$INVERS^%QMDATE($P(DATE," ",2))
 Q $$^%QMDASAI(D,.DATE)
1102 G 2
1104 G 2
1105 G 2
10001 S D=$$INVERS^%QMDATE($P(DATE," ",1))_" "_$P(DATE," ",2)
 Q $$^%QMDASAI(D,.DATE)
10002 G 2
10003 S D=$$SLASH^%QMDATE($P(DATE," ",1))_" "_$P(DATE," ",2)
 Q $$^%QMDASAI(D,.DATE)
10004 G 2
10005 G 2
10101 S D=$P(DATE," ",1)_" "_$$INVERS^%QMDATE($P(DATE," ",2))_" "_$P(DATE," ",3)
 Q $$^%QMDASAI(D,.DATE)
10102 G 2
10103 S D=$P(DATE," ",1)_" "_$$SLASH^%QMDATE($P(DATE," ",2))_" "_$P(DATE," ",3)
 Q $$^%QMDASAI(D,.DATE)
10104 G 2
10105 G 2
11001 S D=$$INVERS^%QMDATE($P(DATE," ",1))_" "_$P(DATE," ",2)
 Q $$^%QMDASAI(D,.DATE)
11002 G 2
11005 G 2
11101 S D=$P(DATE," ",1)_" "_$$INVERS^%QMDATE($P(DATE," ",2))_" "_$P(DATE," ",3)
 Q $$^%QMDASAI(D,.DATE)
11102 G 2
11104 G 2
11105 G 2
20001 G 10001
20002 G 2
20003 G 10003
20004 G 2
20005 G 2
20101 G 10101
20102 G 2
20103 G 10103
20104 G 2
20105 G 2
21001 G 11001
21002 G 2
21005 G 2
21101 G 11101
21102 G 2
21104 G 2
21105 G 2
21106 
 S D=$$SLASH^%QMDATE($E(DATE,1,6))_" "_$E(DATE,7,8)_"H"_$E(DATE,9,10)_"'"_$E(DATE,11,12)
 Q $$^%QMDASAI(D,.DATE)
 
TEST D CLEPAG^%VVIDEO
DEB W !,$$^%QZCHW("Date : ") R D Q:D=""
 W !,$$^%QZCHW("Format : ") R F G:F="" DEB
 S RES=$$QMDAOKF(F,.D)
 W !,$$^%QZCHW("Forme interne : "),$S(RES:D,1:"????"),! G DEB

