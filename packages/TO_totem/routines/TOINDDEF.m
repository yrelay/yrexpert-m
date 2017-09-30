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

;TOINDDEF^INT^1^59547,74872^0
TOINDDEF ;
 S TABI="^PHASADM($I,NUFA,TWREF,""TABIND"")",NF=-1
LNF S NF=$N(@TABI@("RFIND",IND,NF)) G:NF=-1 FNF
 S RS=$S($D(@TABI@("REPFIC",NF)):@TABI@("REPFIC",NF),1:^[QUI]IREPFICH(YA,NF))
 S DOM=$P(RS,"^",1),REF=$P(RS,"^",2),RES=$P(RS,"^",3,4),RSIN=$P(RS,"^",5),RSIN=$S(RSIN'="":RSIN,1:REF)
 K POP,@TABI@("RFIND",IND,NF) S VIND=-1
LV K ^IND($J) S VIND=$N(IND(VIND)) G:VIND=-1 FLV D POP K KEY
 F %UV=2:2 S KEY=$P(REF,"""",%UV) Q:KEY=""  S KEY((%UV\2)+1)=KEY
 S K=-1 F %U=1:1 S K=$N(@TABI@("CLEPAR",NF,K)) Q:K=-1  S KP=@TABI@("CLEPAR",NF,K),%V=$$ZSUBST^%QZCHSUB(KP,"~("_IND_")","."_VIND),KEY(K)=%V,@TABI@("CLEPAR",NNF,K)=%V D ^TOINDBAS(%V,"LIS") S IX=-1 F %U=1:1 S IX=$N(LIS(IX)) Q:IX=-1  S ^IND($J,IX)=1
 
 S NRF="" F %U=2:1 Q:'($D(KEY(%U)))  S NRF=NRF_$S(NRF="":"",1:",")_""""_KEY(%U)_""""
 S @TABI@("REPFIC",NNF)=DOM_"^"_NRF_"^"_RES_"^"_RSIN,@TABI@("VALINDIS",NNF,IND)=VIND,%U=-1 F %V=1:1 S %U=$N(@TABI@("VALINDIS",NF,%U)) Q:%U=-1  S @TABI@("VALINDIS",NNF,%U)=@TABI@("VALINDIS",NF,%U)
 S %U=-1 F %V=1:1 S %U=$N(^IND($J,%U)) Q:%U=-1  S @TABI@("RFIND",%U,NNF)=1,@TABI@("LOCAI",NNF,%U)=1
 D:DOM["IMP" EXPARG D:'($D(@TABI@("LOCAI",NNF))) OK G LV
FLV K @TABI@("VALINDIS",NF),@TABI@("LOCAI",NF),@TABI@("REPFIC",NF) G LNF
FNF Q
POP S NNF=^PHASADM($I,NUFA,TWREF,"CPTNUF")+1,^PHASADM($I,NUFA,TWREF,"CPTNUF")=NNF,POP(NNF)=1 Q
EXPARG S PP=$P(REF,"""",2),NP=$P(NRF,"""",2) G EX1:$D(^[QUI]DEPARG(YA,PP)),EX2:$D(^PHASADM($I,NUFA,TWREF,"DEPARG",PP)),FARG
EX1 S PARG=$P(^[QUI]DEPARG(YA,PP),"""",4) G EX3
EX2 S PARG=^PHASADM($I,NUFA,TWREF,"DEPARG",PP)
EX3 S PARG=$$ZSUBST^%QZCHSUB(PARG,"~"_IND,"."_VIND) D ^TOINDNET(PARG,.NPARG) S ^PHASADM($I,NUFA,TWREF,"DEPARG",NP)=NPARG
FARG K NPAR,PP,NP,PARG Q
OK S AD=$E(DOM,1,4) G @AD
IMPL S BIS=$ZP(^BISIMP($I,NUFA,TWREF,YA,""))+1,^BISIMP($I,NUFA,TWREF,YA,BIS)="!!^"_NNF_"^"_^[QUI]REPFICH(YA,DOM,RSIN) Q
PHAS S BIS=$ZP(^GLOETUD($I,NUFA,TWREF,"PHAS",1,""))+1,^GLOETUD($I,NUFA,TWREF,"PHAS",1,BIS)="!!^"_NNF_"^"_^[QUI]REPFICH(YA,DOM,RSIN),^TENTATIV($I,NUFA,TWREF,"PHAS",KEY(2),KEY(4),KEY(3))=1 Q
NOME S BIS=$ZP(^PHASADM($I,NUFA,TWREF,"BISCP",""))+1,^PHASADM($I,NUFA,TWREF,"BISCP",BIS)="!!^"_NNF_"^"_^[QUI]REPFICH(YA,DOM,RSIN) Q
FORM Q
OUTC Q

