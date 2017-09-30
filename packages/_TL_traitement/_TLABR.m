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

;%TLABR^INT^1^59547,74028^0
TLABR ;
 
DEB N %3NPT,%3NPT1,%3NPT2,AM,NX1,NX2,PEXP,POS,POSII,PR
 N SCH,SEP,SSCH,UU,UU1,V,VP,Z1,C,CC1,ECHEC,EF,DED,LIBC,CC2,I1,CH,AN
 N EG,TAB,E
 
 S CONCUR=0,PCHCOMP="" G FIN:PCH="" I $D(^[QUI]TTL(PCH)) S PCHCOMP=PCH,CONCUR=1 G FIN
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
ADR(PCH,CONCUR,PCHCOMP) 
 G DEB
TEST W !," Abreviation a determiner : " R PCH Q:PCH=""  D ADR(PCH,.EXP,.FULL)
 W !," ===> ",PCH," est ",$S(EXP=0:"inconnu",EXP>1:"ambigu",1:FULL) G TEST

