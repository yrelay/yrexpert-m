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

;%LXABREV^INT^1^59547,73870^0
LEXABREV ;
 N (PCH,PCHCOMP,CONCUR,QUI,WHOIS,ECHEC)
 S ECHEC=0,CONCUR=0,YART="TOLEX" K ^MOTLEX($I)
PTHM 
 S SEP=".",CONCUR=0,POSII=-1,ECHEC=0
 S CH=PCH,EF="EF" D DECOMP
 S PEXP="^[QUI]PLEXP(YART",EF="EF",DED=1
L F PR=DED:1:%3NPT1 S @("V="_EF_PR),VP="V",C=PEXP_","_VP_")",(E,@("D"_PR))=$N(@C) S:@("EG"_PR)="" @("EGC"_PR)=$E(E,1) S EG=$S(@("EG"_PR)="":"EGC",1:"EG") G:(@("D"_PR)=-1)!($E(@("D"_PR),1,@("L"_PR))'=@(EG_PR)) S S @("PEXP"_PR)=PEXP,PEXP=PEXP_","_("D"_PR)
 S LIBC="" F UU=1:1:PR S LIBC=LIBC_$S(LIBC="":"",1:".")_@("D"_UU)
 S CC1=PEXP_",-1)",NX1=$N(@CC1),CC2=PEXP_","""_NX1_""")",NX2=$N(@CC2)
 S CONCUR=CONCUR+1 D FINREF S PEXP=@("PEXP"_PR),DED=%3NPT+1,EF="D" G L
S I PR=1 G CONCLU
 F UU1=PR:1:%3NPT+1 S @("D"_UU1)=@("EF"_UU1)
 S:PR'=1 PR=PR-1 S EF="D",DED=PR,PEXP=@("PEXP"_PR) G L
 Q
DECOMP S %3NPT=0,POS=1 F I1=1:1 Q:$F(CH,SEP,POS)=0  S POS=$F(CH,SEP,POS),%3NPT=%3NPT+1
 S %3NPT1=%3NPT+1 F Z1=1:1:%3NPT1 D TRAIT
 S %3NPT2=%3NPT1+1,@("EF"_%3NPT2)="-1",@("EG"_%3NPT2)="",@("L"_%3NPT2)=1 Q
TRAIT S SCH=$P(CH,SEP,Z1),SSCH=SCH+0,@("L"_Z1)=$L(SCH) I SSCH=SCH S @("EG"_Z1)=SCH,@("EF"_Z1)=SCH-1 Q
 S @("EG"_Z1)=SCH S:(SCH'="")&(SCH'=" ") AM=$E(SCH,@("L"_Z1)),AN=$C($A(AM)-1),@("EF"_Z1)=$E(SCH,1,@("L"_Z1)-1)_AN_$C(122) I (SCH="")!(SCH=" ") S @("EF"_Z1)="-1",@("EG"_Z1)=SCH,@("L"_Z1)=1 Q
 Q
FINREF S ADR="AFF^%LXABREV",PARQ=PEXP,PARQS=PARQ_")",NOMTREE=$E(PARQS,1,$L(PARQS)-1) D ^%QCAGTU1
 Q
AFF S LIBD=LIBC F WW=PR+2:1:%PR S LIBD=LIBD_"."_B(WW)
 I $D(^[QUI]TOLEX(LIBD))!$D(^[QUI]TOSYNONY(LIBD)) S ^MOTLEX($I,LIBD)=1
 Q
CONCLU 
 
FIN S:CONCUR'<2 ECHEC=1 Q
TEST 
TEST1 W !," Abreviation a determiner : " R PCH Q:PCH=""  D ^%LXABREV S PAR=-1 F UU=0:0 S PAR=$N(^MOTLEX($I,PAR)) Q:PAR=-1  W !,PAR
 Q  G TEST1

