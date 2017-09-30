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

;%QSLUTRI^INT^1^59547,73882^0
%QSLUTRI(LNT,LE,LS,TRI,B) ;;05:28 PM  7 Nov 1991; ; 21 Apr 93  3:16 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %O,%PRIO,%T,A,C,CLE,M,O,T,V,W,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 K ^TRI($J) W:OKECR "."
 S N=0,O=""
 F %O=0:0 S O=$O(@LE@(O)) Q:O=""  D TT S N=N+1 W:((N#10)=0)&OKECR "*"
 S A=0,TRI(0)=""
 W:OKECR ".","*"
 D TRI("^TRI($J)",1)
 K ^TRI($J)
 D MAJ(LNT,LS)
 Q
 
TT S W=@LE@(O)
 S CLE="",T=""
 F %T=0:0 S T=$O(TRI(T)) Q:T=""  S C=TRI(T),A=$P(C,"^",1),M=$P(C,"^",2),IX=$P(C,"^",3),LI=$P(C,"^",4) S:IX="" IX=1 S V=$S(A="":O,LI'="":$$^%QSCALVU(LI,B,W,A,IX),1:$$^%QSCALIN(B,W,A,IX)),CLE=CLE_$S(A="":$$S1^%QZCHAD(V),V'="":$$S2^%QZCHAD(V),M=">":""" """,1:"""~""")_","
 S @("^TRI($J,"_CLE_$$S1^%QZCHAD(W)_")="_$$S1^%QZCHAD(W))
 Q
 
TRI(G,N) G:$D(TRI(N)) STRI
 N %X,X
 
 S X=""
 F %X=0:0 S X=$O(@G@(X)) Q:X=""  S A=A+1,@LS@(A)=X,@LE@(X)=A W:((A#10)=0)&OKECR "*"
 Q
 
STRI N %X,X,NN
 
 S NN=N+1 G:$P(TRI(N),"^",2)="<" DEC
 S X=""
 F %X=0:0 S X=$O(@G@(X)) Q:X=""  D TRI($E(G,1,$L(G)-1)_","_$$S2^%QZCHAD(X)_")",NN)
 Q
 
DEC S X=""
 F %X=0:0 S X=$ZP(@G@(X)) Q:X=""  D TRI($E(G,1,$L(G)-1)_","_$$S2^%QZCHAD(X)_")",NN)
 Q
 
MAJ(LNT,LS) 
 N I,IND
 S IND=""
 F I=0:0 S IND=$O(@LS@(IND)) Q:IND=""  S @LNT@(@LS@(IND))=IND
 Q
 
DEFAUT(E) 
 
 
 
 
 
 
 N N,O,%O,T,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 W:OKECR "." S T=$$GEN^%QCAPOP("TRI"),O="",N=0 F %O=0:0 S O=$O(@E@(O)) Q:O=""  S N=N+1,^[QUI]ZLIGTRIE(T,N)=O W:((N#100)=0)&OKECR "%"
 Q "^[QUI]ZLIGTRIE("""_T_""")"
 
 
 
 
TRIETU(LISTE,TRI) 
 N LE,I,IND,ORD,B
 N %O,%PRIO,%T,A,C,CLE,M,O,T,V,W,OKECR
 S LE=$$TEMP^%SGUTIL
 S I=$$REFL^%QXPGESD(WHOIS("ETUDE"),LISTE) Q:I="" ""
 S B=$$CALIN^%QXPGES2(WHOIS("ETUDE"),"L0",LISTE,"BASE",1)
 S IND=""
MKS S IND=$$SUIVMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",I,IND,.ORD) G:IND="" MKF
 D SUPPMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",I,IND)
 I $$PULLMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",I,ORD)=IND S @LE@(ORD)=IND
 D SUPPMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",I,ORD)
 G MKS
MKF 
 S OKECR=$$GET^%SGVAR("ECR")
 K ^TRI($J) W:OKECR "."
 S N=0,O=""
 F %O=0:0 S O=$O(@LE@(O)) Q:O=""  D TT S N=N+1 W:((N#10)=0)&OKECR "*"
 S A=0,TRI(0)=""
 W:OKECR ".","*"
 D ETRI("^TRI($J)",1)
 K ^TRI($J)
 Q
 
 
ETRI(G,N) 
 
 N X
 G:$D(TRI(N)) ESTRI
 S X=""
 F %X=0:0 S X=$O(@G@(X)) Q:X=""  S A=A+1 D PUSHMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE.TRIEE",I,A,X),PUSHMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"LISTE",I,X,A) W:((A#10)=0)&OKECR "*"
 D PUSHVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"DERNIER.OCCUPE",I,A)
 D PA^%QXPGES2(WHOIS("ETUDE"),"L0",I,"CARD",A,1)
 Q
 
ESTRI G:$P(TRI(N),"^",2)="<" EDEC
 S X=""
 F %X=0:0 S X=$O(@G@(X)) Q:X=""  D ETRI($E(G,1,$L(G)-1)_","_$$S2^%QZCHAD(X)_")",N+1)
 Q
 
EDEC S X=""
 F %X=0:0 S X=$ZP(@G@(X)) Q:X=""  D ETRI($E(G,1,$L(G)-1)_","_$$S2^%QZCHAD(X)_")",N+1)
 Q
 ;

