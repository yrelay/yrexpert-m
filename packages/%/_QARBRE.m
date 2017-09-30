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

;%QARBRE^INT^1^59547,73875^0
%QARBRE(FONC,VAL1,VAL2,VAL3,ADR1,ADR2) ;;04:10 PM  23 Aug 1991;
 
 S TRACE=0
 I FONC="INIT" D INIT(VAL1,VAL2,VAL3) Q
 I FONC="OKPLACE" D OKPLAC(VAL1,VAL2,.R1,.R2),AFF^%TLIACTS(ADR1,R1),AFF^%TLIACTS(ADR2,R2) Q
 I FONC="PLACER" D PLACER(VAL1) Q
 Q
 
INIT(PAR1,PAR2,CASE) 
 N TEMP,TCASE,CARAC
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S CARAC=$$CONCAS^%QZCHAD(TEMP,"CARAC")
 K @(TEMP)
 S @CARAC@("NBCOL")=PAR1,@CARAC@("NBLIG")=PAR2
 S @CARAC@("NBCASE")=PAR1*PAR2
 S @TCASE@(CASE)=""
 Q
 
 
OKPLAC(CASE1,DIR,CASE2,CHEM) 
 N TEMP,TCASE,CARAC,NBCOL,NBLIG,NBCASE,I,IK1,IK2,NXT,NXL,PILE,IPIL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S CARAC=$$CONCAS^%QZCHAD(TEMP,"CARAC")
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE") K @(PILE)
 F I="NBCOL","NBLIG","NBCASE" S @(I_"=@CARAC@(I)")
 S (CHEM,CH)=CASE1_","
 S CC=CASE1
 S (CASE2,IPIL)=0
 D COORD(CASE1,.I,.J)
 G:DIR="DROITE" DEBD
DEBB I I>1 S NXT=CASE1-NBCOL I $$OKL D PUSH
 I J>1 S NXT=CASE1-1 I $$OKL D PUSH
 I J<NBCOL S NXT=CASE1+1 I $$OKL D PUSH
 I I<NBLIG S NXT=CASE1+NBCOL I $$OKL D PUSH
 G NEX
DEBD I J>1 S NXT=CASE1-1 I $$OKL D PUSH
 I I>1 S NXT=CASE1-NBCOL I $$OKL D PUSH
 I I<NBLIG S NXT=CASE1+NBCOL I $$OKL D PUSH
 I J<NBCOL S NXT=CASE1+1 I $$OKL D PUSH
 
NEX S CC=$$PULL G:CC="" ECHEC
 D COORD(CC,.I,.J)
 
 G:DIR="DROITE" NEX1D
 I I<NBLIG S NXT=CC+NBCOL I '($D(@TCASE@(NXT))) G OKCASEL
 I J<NBCOL S NXT=CC+1 I '($D(@TCASE@(NXT))) G OKCASEL
 I J>1 S NXT=CC-1 I '($D(@TCASE@(NXT))) G OKCASEL
 I I>1 S NXT=CC-NBCOL I '($D(@TCASE@(NXT))) G OKCASEL
 G NEX2B
NEX1D I J<NBCOL S NXT=CC+1 I '($D(@TCASE@(NXT))) G OKCASEL
 I I<NBLIG S NXT=CC+NBCOL I '($D(@TCASE@(NXT))) G OKCASEL
 I I>1 S NXT=CC-NBCOL I '($D(@TCASE@(NXT))) G OKCASEL
 I J>1 S NXT=CC-1 I '($D(@TCASE@(NXT))) G OKCASEL
 G NEX2D
 
 
 
NEX2B I (I>1)&(J<NBCOL) S NXT=(CC-NBCOL)+1 I $$OKL D PUSH
 I (I<NBLIG)&(J>1) S NXT=(CC+NBCOL)-1 I $$OKL D PUSH
 I (I>1)&(J>1) S NXT=(CC-NBCOL)-1 I $$OKL D PUSH
 I (I<NBLIG)&(J<NBCOL) S NXT=(CC+NBCOL)+1 I $$OKL D PUSH
 G NEX
NEX2D I (I>1)&(J>1) S NXT=(CC-NBCOL)-1 I $$OKL D PUSH
 I (I<NBLIG)&(J>1) S NXT=(CC+NBCOL)-1 I $$OKL D PUSH
 I (I>1)&(J<NBCOL) S NXT=(CC-NBCOL)+1 I $$OKL D PUSH
 I (I<NBLIG)&(J<NBCOL) S NXT=(CC+NBCOL)+1 I $$OKL D PUSH
 G NEX
 
OKCASEL S CHEM=CH_NXT,CASE2=NXT
ECHEC K @(PILE)
 Q
 
OKL() I $F(CH,","_NXT_",") Q 0
 I '($D(@TCASE@(NXT))) Q 1
 I @TCASE@(NXT)=CC Q 1
 Q 0
 
PUSH S IPIL=IPIL+1
 S @PILE@(IPIL)=NXT,@PILE@(IPIL,"C")=CH_NXT_","
 Q
PULL() N IL,V
 S IL=$ZP(@PILE@("")) Q:IL="" ""
 S CH=@PILE@(IL,"C"),V=@PILE@(IL)
 K @PILE@(IL)
 Q V
 
 
COORD(CA,I,J) 
 S J=((CA-1)#NBCOL)+1,I=((CA-1)\NBCOL)+1 Q
 
 
 
PLACER(CHM) 
 N TEMP,TCASE,DEP,L,C
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S DEP=$P(CHM,",")
 F L=2:1:$L(CHM,",") S C=$P(CHM,",",L),@TCASE@(C)=DEP,DEP=C
 Q
 
TEST K tb
 S g="^[QUI]ZLIGTRIE(""TRI91070900"")"
 D INIT(7,12,3)
 S X=$O(@g@("")),tb(@g@(X))=3
TESTBC S X=$O(@g@(X)) Q:X=""
 S EL=@g@(X),P=$$^%QSCALIN("ARTICLE",EL,"NOM.PERE",1)
 W !,EL,"   pere : ",P
 I '($D(tb(P))) W "  (pere non place)" G TESTBC
 S CASP=tb(P)
BREAK D OKPLAC(CASP,.CASO,.CHE)
 I '(CASO) W "  non placable " G TESTBC
 W "  placement en cours"
 S tb(EL)=CASO
 D PLACER(CHE)
 G TESTBC

