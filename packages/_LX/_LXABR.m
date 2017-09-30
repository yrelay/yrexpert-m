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

;%LXABR^INT^1^59547,73870^0
%LXABR ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N GLOB
 S GLOB="^[QUI]TOLEX" G EXPL
 
ADR(PCH,CONCUR,PCHCOMP) 
 N GLOB
 S GLOB="^[QUI]TOLEX" G EXPL
 
SEARCH(PCH,GLOB,CONCUR,PCHCOMP) 
EXPL N PART,NBP,X,Y,%M,LG,OK,N,%Z
 S PCHCOMP="",CONCUR=0 Q:PCH=""
 I $D(@GLOB@(PCH)) S CONCUR=1,PCHCOMP=PCH Q
 S NBP=$L(PCH,".") F N=1:1:NBP S PART(N)=$P(PCH,".",N),LG(N)=$L(PART(N))
 S X=$S(PART(1)="":"",1:$ZP(@GLOB@(PART(1))))
 S Y=$O(@GLOB@(PART(1)_"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"))
 F %M=0:0 S X=$O(@GLOB@(X)) Q:X=Y  I $$OK S CONCUR=CONCUR+1,PCHCOMP=X I CONCUR>1 S PCHCOMP="" Q
 Q
OK() Q:$L(X,".")<NBP 0
 S OK=1 F %Z=2:1:NBP S V=$P(X,".",%Z) Q:%Z=""  I $E(V,1,LG(%Z))'=PART(%Z) S OK=0 Q
 Q OK
 
 
SEARCHE(PCH,GLOB,ECRMOD,CONNU) 
 N PART,NBP,X,Y,%M,LG,OK,N,%Z,TABRES
 S PCHCOMP="",CONCUR=0,CONNU=1
 I PCH="" S TABRES=GLOB G E2
 I $D(@GLOB@(PCH)) Q PCH
 S TABRES=$$TEMP^%SGUTIL
 S NBP=$L(PCH,".") F N=1:1:NBP S PART(N)=$P(PCH,".",N),LG(N)=$L(PART(N))
 S X=$S(PART(1)="":"",1:$ZP(@GLOB@(PART(1))))
 S Y=$O(@GLOB@(PART(1)_"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"))
 F %M=0:0 S X=$O(@GLOB@(X)) Q:X=Y  I $$OK S @TABRES@(X)="",CONCUR=CONCUR+1
 I CONCUR=0 K @(TABRES) S CONNU=0 Q ""
 I CONCUR=1 S PCHCOMP=$O(@TABRES@("")) K @(TABRES) Q PCHCOMP
E2 S PCHCOMP=$$UN^%PKCHOIX(TABRES,1,6,14)
 I PCH'="" K @(TABRES)
 S ECRMOD=1
 Q PCHCOMP
 
 
 
 
TST K ^TEST
 F NBT=1:1:1000 S L=$R(5)+1,M="" F I=1:1:L S B=$R(3)+1 F J=1:1:B S M=M_$C($A("A")+$R(26)) I J=B S:I'=L M=M_"." S:I=L ^TEST(M)=""
 Q
VR S M="" F %M=0:0 S M=$O(^TEST(M)) Q:M=""  D ADR(M,.R1,.F1),ADR2(M,.R2,.F2) W:R1'=R2 *7,"pb sur "_M I R1=R2,R1=1,F1'=F2 W *7,"pb sur "_M
 Q
 
 
 
 
 
 
DEB N %3NPT,%3NPT1,%3NPT2,AM,NX1,NX2,PEXP,POS,POSII,PR
 N SCH,SEP,SSCH,UU,UU1,V,VP,Z1,C,CC1,ECHEC,EF,DED,LIBC,CC2,I1,CH,AN
 N EG,TAB,E
 S CONCUR=0,PCHCOMP="" G FIN:PCH="" I $D(^[QUI]TOLEX(PCH))!$D(^[QUI]TOSYNONY(PCH)) S PCHCOMP=PCH,CONCUR=1 G FIN
PTHM 
 S SEP=".",CONCUR=0,POSII=-1,ECHEC=0
 S CH=PCH,EF="EF" D DECOMP
 S PEXP="^[QUI]PLEXP(""TOLEX""",EF="EF",DED=1
L F PR=DED:1:%3NPT1 D AA G:(TAB("D",PR)=-1)!($E(TAB("D",PR),1,TAB("L",PR))'=TAB(EG,PR)) S S TAB("PEXP",PR)=PEXP,PEXP=PEXP_","""_TAB("D",PR)_""""
 S LIBC="" F UU=1:1:PR S LIBC=LIBC_$S(LIBC="":"",1:".")_TAB("D",UU)
 S CC1=PEXP_",-1)",NX1=$N(@CC1),CC2=PEXP_","""_NX1_""")",NX2=$N(@CC2) I NX2'=-1 S PCHCOMP="",CONCUR=2 G FIN
 S CONCUR=CONCUR+1 I CONCUR>1 S PCHCOMP="" G FIN
 S PCHCOMP=$ZP(^[QUI]TOLEX(LIBC)),PCHCOMP=$O(^[QUI]TOLEX(PCHCOMP))
 S PEXP=TAB("PEXP",PR),DED=%3NPT+1,EF="D" G L
S I PR=1 G FIN
 F UU1=PR:1:%3NPT+1 S TAB("D",UU1)=TAB("EF",UU1)
 S:PR'=1 PR=PR-1 S EF="D",DED=PR,PEXP=TAB("PEXP",PR) G L
 Q
DECOMP S %3NPT=0,POS=1 F I1=1:1 Q:$F(CH,SEP,POS)=0  S POS=$F(CH,SEP,POS),%3NPT=%3NPT+1
 S %3NPT1=%3NPT+1 F Z1=1:1:%3NPT1 D TRAIT
 S %3NPT2=%3NPT1+1,TAB("EF",%3NPT2)="-1",TAB("EG",%3NPT2)="",TAB("L",%3NPT2)=1 Q
TRAIT S SCH=$P(CH,SEP,Z1),SSCH=SCH+0,TAB("L",Z1)=$L(SCH) I SSCH=SCH S TAB("EG",Z1)=SCH,TAB("EF",Z1)=SCH-1 Q
 S TAB("EG",Z1)=SCH S:(SCH'="")&(SCH'=" ") AM=$E(SCH,TAB("L",Z1)),AN=$C($A(AM)-1),TAB("EF",Z1)=$E(SCH,1,TAB("L",Z1)-1)_AN_$C(122) I (SCH="")!(SCH=" ") S TAB("EF",Z1)="-1",TAB("EG",Z1)=SCH,TAB("L",Z1)=1 Q
FIN Q
AA S V=TAB(EF,PR),VP="V",C=PEXP_","_VP_")",(E,TAB("D",PR))=$N(@C)
 S:TAB("EG",PR)="" TAB("EGC",PR)=$E(E,1)
 S EG=$S(TAB("EG",PR)="":"EGC",1:"EG")
 Q
ADR2(PCH,CONCUR,PCHCOMP) 
 G DEB
TEST W !," Abreviation a determiner : " R PCH Q:PCH=""  D ADR2(PCH,.EXP,.FULL)
 W !," ===> ",PCH," est ",$S(EXP=0:"inconnu",EXP>1:"ambigu",1:FULL) G TEST

