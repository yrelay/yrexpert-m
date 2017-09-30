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

;DTCOMMR^INT^1^59547,74866^0
DTCOMMR ;
 
 
 
INIT S SOH=1,ACK=6,NAK=22,CR=$C(13),CC=$C(9),STRLEN=255,MAXERR=30
 S ZSAVE="ZR  F L=2:1:R ZI R(L) K R(L) I L=R ZS @RTN"
 S (DONE,ABORT)=0
 I '($D(CRC)) S CRC=0
 
 B 0 U 0:(0)
 W "$S=",$S,CR
 I DTYPE="R" D RRT
 I DTYPE="G" D RG
 B 1
 Q
 
 
RRT F RN=1:1 D READ Q:ABORT  D RTN Q:DONE
 Q
 
RTN I R<2 Q
 I R(1)?1"***".E S DONE=1 Q
 S RTN=R(1)
 X ZSAVE
 Q
 
RG 
 S GNAME=""
 F PN=1:1 D READ Q:ABORT  D NG Q:DONE
 Q
 
NG I R(1)?1"***".E S DONE=1 Q
 I R<2 Q
 I $E(R(1))="^" S NG=$P(R(1),"(",1)
 F GN=1:2:R-1 S @R(GN)=R(GN+1)
 Q
 
READ S (BTOT,NERR)=0
 D READP
 Q
 
READP K R S (R,RTOT,CRCTOT)=0
 
WAIT R *C:10 E  G NAK
 I C=SOH G READM
 G WAIT
 
NAK S NERR=NERR+1 I NERR<MAXERR W *NAK G WAIT
 S ABORT=1 Q
 
READM S M="",V=0
READF R F:10 E  G NAK
 I $C(10,13)[$E(F,1) S F=$E(F,2,9999)
 I $C(10,13)[$E(F,$L(F)) S F=$E(F,1,$L(F)-1)
 S T=$E(F,1),F=$E(F,2,9999)
 G READA:T="A",READB:T="B",READC:T="C",READD:T="D",READX:T="X"
 G NAK
 
READA I ($L(M)+$L(F))>STRLEN G NAK
 S M=M_F G CRC
 
READB I ($L(M)+($L(F)\2))>STRLEN G NAK
 I $L(F)#2 G NAK
 F I=1:2:$L(F)-1 S C=(($A(F,I+1)#16)*16)+($A(F,I)#16),M=M_$C(C)
 G CRC
 
READC I ($L(M)+$L(F))>STRLEN G NAK
 S M=M_F G READF
 
READD I ($L(M)+($L(F)\2))>STRLEN G NAK
 I $L(F)#2 G NAK
 F I=1:2:$L(F) S C=(($A(F,I+1)#16)*16)+($A(F,I)#16),M=M_$C(C)
 G READF
 
READX S CHECK=RTOT_"^"_CRCTOT
 I F=CHECK W *ACK S NERR=0,BTOT=BTOT+RTOT Q
 W *NAK G READP
 
 
CRC 
 I CRC S V=$ZC(M)
 E  D ASUM
 S CRCTOT=CRCTOT+V
 S NERR=0,R=R+1,R(R)=M,RTOT=RTOT+$L(M)
 G READM
 
ASUM S V=0 F CI=1:1:$L(M) S V=V+$A(M,CI)
 Q

