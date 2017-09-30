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

;%SDUMEN^INT^1^59547,73890^0
SDUMEN ;
 
 
 
 
 
AFF(X,Y,MEN) 
 N %9STR,OPT
 S %9STR=""
 S OPT="" F I=0:0 S OPT=$O(@MEN@(OPT)) Q:OPT=""  S %9STR=%9STR_$$TRANSF($P(@MEN@(OPT),"^",1))_"  "
 D EFF^%PBP5EC(0)
 D AFFI(X,Y,%9STR)
 Q
TRANSF(LIB) 
 Q "("_$E(LIB)_")"_$$MIN^%VMINUSC($E(LIB,2,99))
 
AFFI(X,Y,%9STR) 
 Q:%9STR=""
 N %9MOD,%FONC,LG,CH2,SSCH,CH,I,%9X,%9Y
 S %9X=X,%9Y=Y
 S CH=$$GETLBLAN^%VTLBLAN(%9STR)
 S LG=$L(CH),PART=$L(CH,"  ")
 I LG<75 G AFF1
 I PART=1 Q
 S SSCH="",I=1
LOOPAF 
 I I>PART S %9STR=SSCH D AFF1 Q
 S CH2=$P(CH,"  ",I)
 I CH2="" S %9STR=SSCH D AFF1 Q
 S I=I+1
 I ($L(SSCH)+$L(CH2))<75 S SSCH=SSCH_CH2_"  " G LOOPAF
 S %9STR=SSCH,%9Y=100 D AFF1 S SSCH=CH2_"  "
 S %9X=0,%9Y=0
 G LOOPAF
 
AFF1 S %FONC="MOUV" D ^%PBPZ
 S %9MOD=1,%FONC="TAILLE" D ^%PBPZ
 S %FONC="TEXT" D ^%PBPZ
 S %9MOD=1,%FONC="TAILLE" D ^%PBPZ
 
 
 U 0 W !
 Q
EFF(X,Y) 
 N %9Y,%9X,%FONC,%9STR
 S %9X=X,%9Y=Y
 S %FONC="MOUV" D ^%PBPZ
 I %TERM'="VT-340" S %9STR=$J("",80)
 I %TERM="VT-340" S %9STR="" F I=1:1:74 S %9STR=%9STR_$C(8)_$C(32)_$C(32)
 S %FONC="TEXT" D ^%PBPZ
 I %TERM'="VT-340" U 0 W !
 Q
EFFBAS 
 D EFF(0,100)
 D EFF(0,0)
 Q
 
LEC(CH,Y1) 
 Q:CH=""
 D ^%PBPZGRA,EFFBAS
 N %9Y,%9X,LG,%FONC,%9MOD
 D AFF(0,0,CH)
 S %FONC="PRENDRE" D ^%PBPZ
 S %9MOD=1,%FONC="TAILLE" D ^%PBPZ
 S LG=$L(CH),%9X=LG*45,%9Y=0,%FONC="MOUV" D ^%PBPZ
LEC0 R Y1
 S Y1=$$GETLBLAN^%VTLBLAN(Y1)
 S %FONC="POSER" D ^%PBPZ
 Q
CUROFF 
 N %FONC S %FONC="CUROFF" D ^%PBPZ Q
CURON 
 N %FONC S %FONC="CURON" D ^%PBPZ Q
 
CONFIRM(LIB) 
 D ^%PBPZGRA
 D EFFBAS
 N AD
 D AFFI(0,0,LIB),EFF^%PBP5EC(1)
 R *AD:^TOZE($I,"ATTENTE")
 D EFF^%PBP5EC(0),EFFBAS
 I AD=79 Q 1
 Q 0
SEL(MENU,ADR,CTR) 
 N CAR,CPT,OPT,TAB S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INTER") K @(TAB)
 S OPT="" F I=0:0 S OPT=$O(@MENU@(OPT)) Q:OPT=""  S @TAB@($$^%VMINUSC(@MENU@(OPT)))=OPT
 S CPT=1,CH="",ADR="",CTR="" D EFF^%PBP5EC(1)
SEL2 R *CAR
 I (CAR>48)&(CAR<58) G NUM
 I CAR<32 G CONTROL
 I CAR>96 S CAR=CAR-32
 S CH=CH_$C(CAR),OCCUR=0
 S LIB="" F I=0:0 S LIB=$O(@TAB@(LIB)) Q:LIB=""  S OPT=@TAB@(LIB) I CH=$E(LIB,1,CPT) S ADR=$P(@MENU@(OPT),"^",2),OCCUR=OCCUR+1
 I OCCUR=0 S CH="",CPT=1 G ERR
 I OCCUR>1 S CPT=CPT+1 G SEL2
 G FSEL
 
NUM 
 S OPT=$C(CAR)
 I '($D(@MENU@(OPT))) G ERR
 S ADR=$P(@MENU@(OPT),"^",2)
 G FSEL
CONTROL 
 I CAR=1 S CTR="A" G FSEL
 I CAR=6 S CTR="F" G FSEL
 I CAR=18 S CTR="R" G FSEL
ERR D ^%VSQUEAK G SEL2
 
FSEL K @(TAB)
 D EFF^%PBP5EC(0)
 Q

