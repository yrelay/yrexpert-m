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

;TOP8V2^INT^1^59547,74874^0
TOP8V2(ARC,GLO,DESC) 
 
 Q:WHOIS'="BTL"
 D @WHOIS S %U=1 F IT="LI","NOP1","NOP2","OP1","OP2","MA1","MA2" S @("@IT="_$P(POS,",",%U)),%U=%U+1
 K ^OPER($J)
NLA S LI=LI-1,NU=30
LLI S NU=NU+10,LI=$N(^[QUI]CLICHE(ARC,LI)) G:LI=-1 FLI S LIC=^[QUI]CLICHE(ARC,LI),%LIB=$$GETLBLAN^%VTLBLAN($E(LIC,NOP1,NOP2)) G:%LIB="" LLI S PCH=%LIB D TO^%QZNBN1 G:'(ISNUM) FLI S NOP=PCH
 S NUP=NOP,NOP=($E(1000+NU,2,100)_"."_NOP)+0,%OCH=$E(LIC,OP1,OP2) D NET S OP=%LIB,%OCH=$E(LIC,MA1,MA2) D CONS(LIC,MA2,GLO,DESC,NOP,ARC),NET S MAC=%LIB,^OPER($J,NOP)=OP_"^"_MAC G LLI
FLI G:'($D(^OPER($J))) END S NOP=-1,NU=0
LOP S NU=NU+1,NOP=$N(^OPER($J,NOP)) G:NOP=-1 END S LIC=^OPER($J,NOP),OP=$P(LIC,"^",1),MAC=$P(LIC,"^",2)
 G LOP
END Q
FEND Q
STAND S LIC=^[QUI]TOP0NUOP(NOP),OP=$P(LIC,"^",1),MAC=$P(LIC,"^",2),NOP=(NU_"."_NOP)+0,^OPER($J,NOP)=OP_"^"_MAC Q
NET D ^%QZCHNET S PARA=$$GETLBLAN^%VTLBLAN(%NCH) D ^%QZCHBT S %LIB=PARA Q
NETE(%OCH) 
 N PARA,%NCH,%LIB
 D ^%QZCHNET S PARA=$$GETLBLAN^%VTLBLAN(%NCH) D ^%QZCHBT S %LIB=PARA
 Q %LIB
STF G ATF
STL G TLR
ATF S POS="26,21,25,26,35,36,40" Q
TLR S POS="19,21,25,26,31,32,35" Q
BTL G TLR
BTF G ATF
 
CONS(CH,POS,GLO,DESC,NOP,ARC) 
 N ATT,VAL,OR
 S ATT=$O(@DESC@(""))
 F I=0:0 Q:ATT=""  D CONS1 S ATT=$O(@DESC@(ATT))
 Q
CONS1 S OR=$O(@DESC@(ATT,""))
 F I=0:0 Q:OR=""  D CONS2 S OR=$O(@DESC@(ATT,OR))
 Q
CONS2 S VAL=$E(CH,@DESC@(ATT,OR,"D"),@DESC@(ATT,OR,"F"))
 I $D(@DESC@(ATT,OR,"T"))>9 S VAL=$$NETE(VAL) Q:'($$NUM^%QZNBN(VAL))  S VAL=VAL+0
 S VAL=$$GETLBLAN^%VTLBLAN(VAL)
 Q:VAL=""
 S @GLO@(ATT,VAL,OR,ARC,NOP)=""
 S @GLO@(ATT,VAL,OR)=$$^%QCAZG($$CONCAS^%QZCHAD(GLO,ATT_","_VAL_","_OR))+1
 W !,ARC,?20,ATT,?40,VAL,?50,OR,?55,NOP
 Q
CONSP ;;|"DIMENSION.OPERATION",1,"D"|36|
 ;;|"DIMENSION.OPERATION",1,"F"|46|
 ;;|"CONSIGNE.SPECIALE",1,"D"|46|
 ;;|"CONSIGNE.SPECIALE",1,"F"|56|
 ;;
 ;;|"DIMENSION.OPERATION",2,"D"|42|
 ;;|"DIMENSION.OPERATION",2,"F"|45|
 ;;|"DIMENSION.OPERATION",1,"T","1"|$$NETE(VAL)|
 ;;|"DIMENSION.OPERATION",2,"T","1"|$$NETE(VAL)|

