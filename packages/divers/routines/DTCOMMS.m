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

;DTCOMMS^INT^1^59547,74866^0
DTCOMMS ;
 
 
INIT 
 S ACK=6,NAK=22,SOH=$C(1),CR=$C(13),CC=$C(9),ABORT=0,NULL="",XTOT=0
 S MAXERR=30,MAXPACK=512
 I '($D(CRC)) S CRC=0
 U 0:(0) B 0
 R STOR:10
 I DTYPE="R" D SR
 I DTYPE="G" D SG
 B 1
 Q
 
SR 
 S RTN=0 F RN=1:1 S RTN=$O(^UTILITY($J,RTN)) Q:RTN=""  D RTN Q:ABORT
 K S I ABORT Q
 S S(1)="*** TRANSMISSION COMPLETED ***",S(2)="***" D SEND
 K S
 Q
 
RTN K S D APR,SEND
 Q
 
APR 
 K S S S(1)=RTN
 X "ZL @RTN F LN=1:1 S L=$T(+LN),S(LN+1)=L Q:L=NULL"
 Q
 
 
SG 
 S SBLIST="(" F I=1:1:25 S SBLIST=SBLIST_"K("_I_"),"
 S GSX=""
 F GN=1:1 S GSX=$O(^UTILITY($J,GSX)) Q:GSX=""  D LIMITS,SGSPEC Q:ABORT
 K S I ABORT Q
 S S(1)="***",S(2)="***" D SEND K S
 Q
 
LIMITS S GSPEC=GSX
 S LMIN=0,LMAX=999,D1=$C(2),D2=$C(22),L=0 K GLIM
LIM1 S X=$P(GSPEC,D2,L+1,999) I X="" G LIM2
 S X=$P(X,D2,1),S1=$P(X,D1,1),S2=$P(X,D1,2)
 I L,S1'="" S @("S1="_S1)
 I L,S2'="" S @("S2="_S2)
 I S1'="" S GLIM(L,S1)=""
 I S2'="" S GLIM(L,S2)=""
 S L=L+1 G LIM1
LIM2 K X,S1,S2 Q
 
SGSPEC K K,P S L=0,K(L)=$O(GLIM(L,""))
 K S S SN=1,PSIZE=0 D GWALK I $D(S) D SEND
 Q
 
GWALK I K(L)'="" S DD=$D(@("^"_K(L))) I DD D GSEND K P
 I $D(GLIM(L)),$O(GLIM(L,K(L)))="" Q
 S K(L)=$O(@("^"_K(L))) I K(L)="" Q
 I $D(GLIM(L)),($O(GLIM(L,K(L)))'="")!$D(GLIM(L,K(L))) G GWALK
 Q
 
GSEND I DD#10 S DATA=@("^"_K(L)) D GPACK
 
DOWN S L=L+1,K(L)=$O(GLIM(L,"")) K P
 I K(L)="" G WALK
 S DD=$D(@("^"_K(0)_$P(SBLIST,",",1,L)_")"))
 G WALK2
 
WALK S K(L)=$O(@("^"_K(0)_$P(SBLIST,",",1,L)_")"))
 
WALK1 I K(L)="" G UP
 I $D(GLIM(L)),$O(GLIM(L,K(L)))="",'($D(GLIM(L,K(L)))) G UP
 S DD=$D(^(K(L))) K P(L)
WALK2 I DD#10 S DATA=^(K(L)) D GPACK
 I DD<10 S K(L)=$O(^(K(L))) G WALK1
 G DOWN
 
UP K K(L) S L=L-1 I L<1 Q
 K P G WALK
 Q
 
GPACK 
 S X=""
 F I=0:1:L S V=K(I) D:(V'=(+(V)))&I QUOTE S P(I)=V,X=X_$S('(I):"^",I=1:"(",1:",")_P(I)
 I L S X=X_")"
 S S(SN)=X,S(SN+1)=DATA,SN=SN+2
 S PSIZE=(PSIZE+$L(X))+$L(DATA)
 I PSIZE>MAXPACK D SEND K S S SN=1,PSIZE=0
 Q
 
QUOTE F Z=0:0 S Z=$F(V,"""",Z) Q:'(Z)  S V=$E(V,1,Z-1)_$E(V,Z-1,999),Z=Z+1
 S V=""""_V_"""" Q
 
 
SEND S (BTOT,NERR)=0
 D SENDP
 S XTOT=XTOT+BTOT
 Q
 
SENDP F I=1:1 R *C:0 E  Q
 W SOH S (STOT,CRCTOT)=0,S=-1
 
NEXTM S S=$N(S(S)) I S<0 G SENDX
 S M=S(S)
 
SENDM S P=1,V=0
 
SENDF S Q=P+127,F=$E(M,P,Q-1) I Q>$L(M) S Q=$L(M)+1
 I F'?.NPA G SENDB
 
SENDA 
 I Q>$L(M) W "A",F,CR G CRC
 W "C",F,CR S P=Q G SENDF
 
SENDB 
 F Q=P:1:Q I $E(M,Q)'?.NPA,CC'[$E(M,Q) Q
 E  S F=$E(M,P,Q-1) G SENDA
 I Q>P S F=$E(M,P,Q-1) G SENDA
 F Q=P+1:1:P+127 I ($E(M,Q)?.NPA)!(CC[$E(M,Q)) Q
 W $S(Q>$L(M):"B",1:"D") F I=P:1:Q-1 W $C(($A(M,I)#16)+64,($A(M,I)\16)+64)
 W CR
 S P=Q G SENDF:Q'>$L(M)
 
 
CRC 
 I CRC S V=$ZC(M)
 E  D ASUM
 S CRCTOT=CRCTOT+V,STOT=STOT+$L(M)
 G NEXTM
 
 
SENDX W "X",STOT,"^",CRCTOT,CR
ACKX R *C:10 E  G SENDX
 I C=ACK S NERR=0,BTOT=BTOT+STOT Q
 I C'=NAK G ACKX
 S NERR=NERR+1 I NERR<MAXERR G SENDP
 S ABORT=1
 Q
 
ASUM S V=0 F CI=1:1:$L(M) S V=V+$A(M,CI)
 Q

