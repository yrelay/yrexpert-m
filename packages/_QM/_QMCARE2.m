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

;%QMCARE2^INT^1^59547,73876^0
QMCARE2() 
 
 
 
 
 
 N ECHEC,AT,IND,%A,%O,%I,CPT,SYN,ARRET,CARD,GLO,DEB,SAUV,SAUVN,LSV,COD,BREP,NVAL
 F FEN="CAREP","CALISTE" S GLO=$$GLOB^%TLBAGF1(FEN),DEB=$ZP(@GLO@("")) D NET^%TLBAGF1 F CPT=DEB:-1:(DEB-$$HAUT^%TLBAGF1(FEN))+3 K @GLO@(CPT)
 S @IMPR@(NUML)=" ",NUML=NUML+1,LSV=$L(VAL)
 D INIT^%QMCARES
 S NVAL=$$ADR^%QZNBN1(VAL)
 
 I NVAL=1 S STOP=$$PARC("CVN")
 E  S STOP=$$PARC("CV")
 G:ARRET=1 FINC
 I NUMORD=0 G ATRI
 G ORD
FINC G FINC^%QMCARES
 
CV 
 Q:ARRET=1
 S SAUV=$$NXTRV^%QSTRUC8(REP,SAUV)
 I $E(SAUV,1,LSV)'=VAL Q
 D VAL^%QMCAREC(SAUV)
 G CV
 
ORD 
 I NVAL=1 S STOP=$$PARC("CNO")
 E  S STOP=$$PARC("CO")
 G:ARRET=1 FINC G ATRI
 
CO 
 S IND=""
 F %I=0:0 S IND=$$NXTRI^%QSTRUC8(REP,IND) Q:(IND="")!(ARRET=1)  S SAUV=VAL D CO2
 Q
CO2 Q:ARRET=1
 S SAUV=$$NXTRIO^%QSTRUC8(REP,IND,SAUV)
 I $E(SAUV,1,LSV)'=VAL Q
 D VALO^%QMCAREC(SAUV)
 G CO2
 
ATRI 
 S STOP=$$PARC("CA") G:ARRET=1 FINC
 S SAUV=VAL
 
 F %A=0:0 S SAUV=$O(^[QUI]TOSYNONY(SAUV)) Q:($E(SAUV,1,LSV)'=VAL)!(ARRET=1)  S SYN="" F %I=0:0 S SYN=$O(^[QUI]TOSYNONY(SAUV,SYN)) Q:(SYN="")!(ARRET=1)  D CS^%QMCAREC(SYN)
 G INDIV
CA 
 Q:ARRET=1
 S SAUV=$$NXTRA^%QSTRUC8(REP,SAUV)
 I $E(SAUV,1,LSV)'=VAL Q
 D CAI^%QMCAREC(SAUV)
 G CA
 
INDIV 
 I NVAL=1 S STOP=$$PARC("CIN")
 E  S STOP=$$PARC("CI")
 G:ARRET=1 FINC
 
 I NVAL=1 D SYNI
 E  S COD="" F %I=0:0 S COD=$O(^[QUI]ZSYNINV(COD)) Q:(COD="")!(ARRET=1)  S SAUV=VAL F %A=0:0 S SAUV=$O(^[QUI]ZSYNINV(COD,SAUV)) Q:($E(SAUV,1,LSV)'=VAL)!(ARRET=1)  D CSI^%QMCAREC(SAUV)
 G REPER
CI 
 Q:ARRET=1
 S SAUV=$$NXTRI^%QSTRUC8(REP,SAUV)
 I $E(SAUV,1,LSV)'=VAL Q
 D INDI
 G CI
INDI 
 S SYN=$$S^%QAX(SAUV),SYN=$S(SYN=SAUV:"",1:" il a pour synonyme "_SYN)
 D AD(SAUV_" est un individu",0)
 D AD(" du repertoire "_@LISTREP@(REP),0)
 D AD(SYN,1)
 S IND=SAUV
 D LIST,ARRET
 Q
 
REPER 
 S STOP=$$PARC("CR") G:ARRET=1 FINC
 G FINC
CR 
 Q:ARRET=1
 S SAUV=@LISTREP@(REP) I $E(SAUV,1,LSV)'=VAL Q
 D AD(SAUV_" est un repertoire du schema de donnees courant",0)
 D AD(" Choisissez l'option MODELE pour plus de renseignements sur le schema",2)
 D AD("",1)
 S:STOP=1 BREP=2 S:STOP=0 BREP=1
 S (ATR,IND)=""
 D LIST,ARRET Q
 
PARC(ROU) 
 
 S REP=""
 F %R=0:1 S REP=$O(@LISTREP@(REP)) Q:(REP="")!(ARRET=1)  S (SAUVN,SAUV)=VAL D @ROU
 Q STOP
 
LIST G LIST^%QMCAREC
 
ARRET G ARRET^%QMCAREC
 
AD(MSG,T) G AD2^%QMCAREC
 
CVN 
 N TAB S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
CV2 G:ARRET=1 FC
 S $ZT="CVA^%QMCARE2"
 S SAUV=$$NXTRV^%QSTRUC8(REP,SAUV) G:SAUV="" FC
 I '($$ADR^%QZNBN1(SAUV)) G CVA
 I $E(SAUV,1,LSV)'=VAL S SAUVN=SAUVN_"0",SAUV=SAUVN G CV2
 D VALN
 G CV2
CVA S $ZT="",SAUV=VAL_" "
CVA2 G:ARRET=1 FC
 S SAUV=$$NXTRV^%QSTRUC8(REP,SAUV) G:SAUV="" FC
 G:$E(SAUV,1,LSV)'=VAL FC
 D VALN
 G CVA2
CNO 
 N TAB S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
 S IND=""
 F %I=0:0 S IND=$$NXTRI^%QSTRUC8(REP,IND) Q:(IND="")!(ARRET=1)  S (SAUV,SAUVN)=VAL D CNO2
 G FC
CNO2 Q:ARRET=1
 S $ZT="CVO^%QMCARE2"
 S SAUV=$$NXTRIO^%QSTRUC8(REP,IND,SAUV) Q:SAUV=""
 I '($$ADR^%QZNBN1(SAUV)) G CVO
 I $E(SAUV,1,LSV)'=VAL S SAUVN=SAUVN_"0",SAUV=SAUVN G CNO2
 D VALO
 G CNO2
CVO S $ZT="",SAUV=VAL_" "
CVO2 Q:ARRET=1
 S SAUV=$$NXTRIO^%QSTRUC8(REP,IND,SAUV) Q:SAUV=""
 Q:$E(SAUV,1,LSV)'=VAL
 D VALO
 G CVO2
 
CIN 
 N TAB S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
CI2 G:ARRET=1 FC
 S $ZT="CIA^%QMCARE2"
 S SAUV=$$NXTRI^%QSTRUC8(REP,SAUV) G:SAUV="" FC
 I '($$ADR^%QZNBN1(SAUV)) G CIA
 I $E(SAUV,1,LSV)'=VAL S SAUVN=SAUVN_"0",SAUV=SAUVN G CI2
 I '($D(@TAB@("IND",REP,SAUV))) D INDI S @TAB@("IND",REP,SAUV)=""
 G CI2
CIA S $ZT="",SAUV=VAL_" "
CIA2 G:ARRET=1 FC
 S SAUV=$$NXTRI^%QSTRUC8(REP,SAUV) G:SAUV="" FC
 G:$E(SAUV,1,LSV)'=VAL FC
 D INDI
 G CIA2
FC K @(TAB) Q
 
VALN 
 S AT=""
 F %A=0:0 S AT=$$NXTRVA^%QSTRUC8(REP,SAUV,AT) Q:(AT="")!(ARRET=1)  S OR="" F %O=0:0 S OR=$$NXTRVAO^%QSTRUC8(REP,SAUV,AT,OR) Q:(OR="")!(ARRET=1)  S IND="" F %I=0:0 S IND=$$NXTRVAOI^%QSTRUC8(REP,SAUV,AT,OR,IND) Q:IND=""  D INS Q:ARRET=1
 Q
INS I '($D(@TAB@("VAL",REP,IND,AT,SAUV,OR))) D INS^%QMCAREC S @TAB@("VAL",REP,IND,AT,SAUV,OR)=""
 Q
 
SYNI 
 N TAB S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
 S COD="" F %I=0:0 S COD=$O(^[QUI]ZSYNINV(COD)) Q:(COD="")!(ARRET=1)  S (SAUVN,SAUV)=VAL D SY
 G FC
SY Q:ARRET=1
 S $ZT="SY2^%QMCARE2"
 S SAUV=$O(^[QUI]ZSYNINV(COD,SAUV)) Q:SAUV=""
 I '($$ADR^%QZNBN1(SAUV)) G SY2
 I $E(SAUV,1,LSV)'=VAL S SAUVN=SAUVN_"0",SAUV=SAUVN G SY
 I '($D(@TAB@("SYN",COD,SAUV))) D CSI^%QMCAREC(SAUV) S @TAB@("SYN",COD,SAUV)=""
 G SY
SY2 S $ZT="",SAUV=VAL_" "
CS2 Q:ARRET=1
 S SAUV=$O(^[QUI]ZSYNINV(COD,SAUV)) Q:SAUV=""
 Q:$E(SAUV,1,LSV)'=VAL
 D CSI^%QMCAREC(SAUV)
 G CS2
 
VALO 
 S AT=""
 F %A=0:0 S AT=$$NXTRIOV^%QSTRUC8(REP,IND,SAUV,AT) Q:(AT="")!(ARRET=1)  S OR="" F %O=0:0 S OR=$$NXTRIOAV^%QSTRUC8(REP,IND,SAUV,AT,OR) Q:OR=""  I '($D(@TAB@("ORD",REP,IND,AT,OR,SAUV))) D INSO^%QMCAREC S @TAB@("ORD",REP,IND,AT,OR,SAUV)="" Q:ARRET=1
 Q

