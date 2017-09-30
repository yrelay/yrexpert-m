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

;LKEXZ^INT^1^59547,74867^0
LKEXZ ;
 
 
 
 
KILLMV(V) 
 N A
 S A=""
 S:($D(V)#10)=1 A=V
 K V
 S V=A
 Q 0
 
NEXTOR(NIV,V) 
 I P="" Q
 I ($D(@LOCAL@("ORDRE",NIV,P))#10)=0 S @LOCAL@("ORDRE",NIV,P)=0
 S @LOCAL@("ORDRE",NIV,P)=@LOCAL@("ORDRE",NIV,P)+1
 S V(@LOCAL@("ORDRE",NIV,P))=V
 S V=""
 Q 0
 
PARTIE(SEP,N1,N2,V) 
 S V=$P(V,SEP,N1,N2)
 Q 0
 
MPARTIE(SEP,N1,N2,V) 
 N I,J
 S J=1
 F I=N1:1:N2 S V(J)=$P(V,SEP,I),J=J+1
 Q 0
 
EXTR(N1,N2,V) 
 S V=$E(V,N1,N2)
 Q 0
 
 
NUM(S,N,V) 
 S V=$E(V,1,$L(V)-N)_S_$E(V,($L(V)-N)+1,99999)
 Q 0
 
 
SPENUM(LGPENT,CARNS,V) 
 N PENT,PDEM,CH,I,%I
 S PENT=$E(V,1,LGPENT),PDEM=$C(0)_$E(V,LGPENT+1,$L(V))
 S:$E(PDEM,2)="." PDEM=$C(0)_$E(PDEM,3,$L(PDEM))
 F CH="PENT","PDEM" S I="" F %I=1:1 S I=$E(CARNS,%I) Q:I=""  S @CH=$TR(@CH,I,"")
 F %I=1:1 Q:($E(PENT)'=" ")&($E(PENT)'="0")  S PENT=$E(PENT,2,$L(PENT))
 F %I=1:1 Q:($E(PDEM,$L(PDEM))'=" ")&($E(PDEM,$L(PDEM))'="0")  S PDEM=$E(PDEM,1,$L(PDEM)-1)
 S PENT=+(PENT)
 S V=PENT_"."_PDEM
 S V=+($TR(V,$C(0),""))
 Q 0
 
 
 
EPACK(L,V) 
 Q $$^LKPACK(L,V,.V)
 
 
 
 
 
ETOA(EBCDIC,V) 
 N X,I,C,T
 S EBCDIC=$$CONCAS^%QZCHAD(LOCAL,EBCDIC)
 S X=V,V=""
 F I=1:1:$L(X) S C=$A($E(X,I)),T=(C'<0)&(C'>256) S:T V=V_@EBCDIC@(C) S:'(T) V=V_"."
 Q 0
 
CHBKPT(V) 
 S V=$$ADR^%QZCHBT(V)
 Q 0
 
TR(A,B,V) 
 S V=$TR(V,A,B)
 Q 0
 
SUBST(A,B,V) 
 S V=$$ZSUBST^%QZCHSUB(V,A,B)
 Q 0
 
ELIM(A,B,V) 
 
 
 S V=$$ELIMALL^%QZCHNET(V,A)
 Q 0
 
NET(V) 
 S V=$$ADR^%QZCHNET(V)
 Q 0
 
CST(A,V) 
 S V=A
 Q 0
 
POP(RACINE,V) 
 S V=$$GEN^%QCAPOP(RACINE)
 Q 0
 
INV(V) 
 N I,B
 S B=""
 F I=1:1:$L(V) S B=$E(V,I)_B
 S V=B
 Q 0
 
GROUP(NL,V) 
 N VISU S VISU=0
 W:VISU !,"INDEX ",INDEX," V ",V
 I ((INDEX-1)#NL)=0 S @LOCAL@("VT","VT")=V,FLAG=0 W:VISU " LOCAL ",@LOCAL@("VT","VT") Q 0
 I ((INDEX-1)#NL)=(NL-1) S @LOCAL@("VT","VT")=@LOCAL@("VT","VT")_V W:VISU " LOCAL ",@LOCAL@("VT","VT") S V=@LOCAL@("VT","VT") Q 0
 S @LOCAL@("VT","VT")=@LOCAL@("VT","VT")_V,FLAG=0
 W:VISU " LOCAL ",@LOCAL@("VT","VT") Q 0
 
 
 
61(V) 
 S V=$$61^%QMDATE1(V)
 Q 0
 
62(V) 
 S V=$$62^%QMDATE1(V)
 Q 0
 
A7(V) 
 S V=$$A7^%QMDATE1(V)
 Q 0
 
A7I(V) S V=$$A7^%QMDATE1(V)
 S V=V_"/"_V
 Q 0
 ;

