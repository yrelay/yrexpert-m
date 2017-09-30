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

;%QMDASA2^INT^1^59547,73877^0
QMDASA2 ;
 
 
 
 
 
DAT(D,PC) 
 
 S LD=$L(D) Q:LD>11  Q:"JDSMT"'[PC  Q:I'=1
 S DAT=$E(D,2,LD),LDA=$L(DAT)
 G:PC="T" TRIM G:PC="M" MOIS G:PC="S" SEM G:PC="D" DEMI
 
 I D'["/" S DAT=PC_DAT_"/"_MOI_"/"_ANN G J
 S DP=$P(DAT,"/",3) S:DP="" DP=ANN
 S:$L(DP)=4 DP=$E(DP,3,4)
 S DAT=PC_$P(DAT,"/",1,2)_"/"_DP
J S JOUR=1,SUF=$E(DAT,2,$L(DAT)),J=$P(SUF,"/",1),M=$P(SUF,"/",2),A=$P(SUF,"/",3)
 Q:((M="")!(A=""))!(J="")
 Q:(((('($$ENTP^%QZNBN(A)))!('($$ENTP^%QZNBN(M))))!(M>12))!('($$ENTP^%QZNBN(J))))!(J>31)
 S DAT=SUF I (M*1)'=2 S STOP=J>$$LONGM^%QZDAJM(M) Q
 
 S BIS=$$BIS^%QMDATE(A) I BIS=0 S STOP=J>28 Q
 S STOP=J>29 Q
 
DEMI 
 S:D'["/" DAT=DAT_"/"_MOI_"/"_ANN
 S DP=$P(DAT,"/",3) S:$L(DP)=4 DP=$E(DP,3,4)
 S:DP="" DP=ANN S DAT=$P(DAT,"/",1,2)_"/"_DP Q:$L(DAT)>8
 S S=$P(DAT,"/",1)*1,M=$P(DAT,"/",2)*1,A=$P(DAT,"/",3)
 Q:(((('($$ENTP^%QZNBN(A)))!('($$ENTP^%QZNBN(M))))!(M>12))!('($$ENTP^%QZNBN(S))))!(S>53)
 D ^%QMDATE2(A)
 I S=53 S STOP='($D(^SEMAINE(A,M,S))) Q
 I S'=52 Q:'($D(^SEMAINE(A,M,S)))  S STOP='($D(^SEMAINE(A,M+1,S))!$D(^SEMAINE(A,M-1,S))) Q
 I M'=12 S STOP='($D(^SEMAINE(A,M,S))) Q
 
 Q:$D(^SEMAINE(A,M,53))  Q:'($D(^SEMAINE(A,M,S)))
 D CONS^%QMDATE(A) Q:SEM(52)=(365+BIS)
 S STOP=0 Q
 
SEM 
 I (D'["/")&(LDA=4) S DAT=$E(DAT,1,2)_"/"_$E(DAT,3,4)
 S DP=$P(DAT,"/",2) S:$L(DP)=4 DP=$E(DP,3,4)
 S:DP="" DP=ANN S DAT=$P(DAT,"/",1)_"/"_DP Q:$L(DAT)>5
 S S=$P(DAT,"/",1)*1,A=$P(DAT,"/",2) Q:(S="")!(A="")
 Q:((('($$ENTP^%QZNBN(A)))!('($$ENTP^%QZNBN(S))))!(S>53))!(S<1)
 D ^%QMDATE2(A) I S=53 Q:'($D(^SEMAINE(A,12,S)))
 S STOP=0 Q
 
MOIS 
 I (D'["/")&(LDA=4) S DAT=$E(DAT,1,2)_"/"_$E(DAT,3,4)
 S DP=$P(DAT,"/",2) S:$L(DP)=4 DP=$E(DP,3,4)
 S:DP="" DP=ANN S DAT=$P(DAT,"/",1)_"/"_DP Q:$L(DAT)>5
 S M=$P(DAT,"/",1),A=$P(DAT,"/",2) Q:(M="")!(A="")
 Q:(('($$ENTP^%QZNBN(A)))!('($$ENTP^%QZNBN(M))))!(M>12)
 S STOP=0 Q
 
TRIM 
 S DP=$P(DAT,"/",2) S:$L(DP)=4 DP=$E(DP,3,4)
 S:DP="" DP=ANN S DAT=$P(DAT,"/",1)_"/"_DP
 Q:$L(DAT)>5
 S T=$P(DAT,"/",1)*1,A=$P(DAT,"/",2) Q:(T="")!(A="")  Q:((('($$ENTP^%QZNBN(T)))!('($$ENTP^%QZNBN(A))))!(T<1))!(T>4)
 S STOP=0 Q

