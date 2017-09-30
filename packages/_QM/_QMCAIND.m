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

;%QMCAIND^INT^1^59547,73876^0
%QMCAIND(FIND,LLI,NUMORD) ;;10:40 AM  15 Sep 1993; ; 30 Sep 93  2:01 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N LISTREP,RES,IND,ATT,OR,REP,%R,RL,%I,LS,ADRESSE,LISRES
 S LISTREP=$$TEMP^%SGUTIL
 S RES=$$TEMP^%SGUTIL
 S RESLIS=$$TEMP^%SGUTIL
 
 
 S LISRES=$$GEN^%QCAPOP("CSA")
 S ADRESSE="^[QUI]RQS2("""_LISRES_""",""OBJET"")"
 D CREERL^%QS0XG1(LISRES,"L0",ADRESSE,"CONSULTATION","CONSULTATION")
 
 
 G:LLI'="*" INILIS
 
 D REPI^%QSGEST9(LISTREP) K @LISTREP@("%")
 
 I $D(@LISTREP@("ATTRIBUT")) K @LISTREP@("ATTRIBUT")
 
 S REP=""
 F %R=0:1 S REP=$O(@LISTREP@(REP)) Q:REP=""  S RL=@LISTREP@(REP) I ($$REPM^%QSGEST9(RL)'=2)&(REP'="%"),RL'="LIEN" K @LISTREP@(REP)
 G PARCOURS
INILIS 
 
 
 S LIS="" F %L=0:0 S LIS=$$SUIVL^%QS0XG1(LLI,LIS) Q:LIS=""  S REP=$$BASE^%QSGEST7(LIS) I REP'="" S @LISTREP@(REP)="",IND="" F %I=0:0 S IND=$$SUIVL^%QS0XG1(LIS,IND) Q:IND=""  S @LISTREP@(REP,IND)=""
 
 
PARCOURS 
 S REP=""
NXREP S REP=$O(@LISTREP@(REP)) G:REP="" CRELIS
 
 
 I $$IR^%QSGE5(REP,FIND) S IND=FIND D ADDIND
 
 
 S AT=""
V1 S AT=$$NXTRVA^%QSTRUC8(REP,FIND,AT) G:AT="" ATTRIB S OR=""
V2 S OR=$$NXTRVAO^%QSTRUC8(REP,FIND,AT,OR) G:OR="" V1 S IND=""
V3 S IND=$$NXTRVAOI^%QSTRUC8(REP,FIND,AT,OR,IND) G:IND="" V2
 D ADDIND G V3
 
 
ATTRIB 
 S VAL=""
A1 S VAL=$$NXTRAV^%QSTRUC8(REP,FIND,VAL) G:VAL="" ORD S OR=""
A2 S OR=$$NXTRAVO^%QSTRUC8(REP,FIND,VAL,OR) G:OR="" A1 S IND=""
A3 S IND=$$NXTRAVOI^%QSTRUC8(REP,FIND,VAL,OR,IND) G:IND="" A2
 D ADDIND G A3
 
 
ORD 
 G:NUMORD=0 SUITE
 S IND=""
O1 S IND=$$NXTRI^%QSTRUC8(REP,IND) G:IND="" SUITE D:$$NXTRIOA^%QSTRUC8(REP,IND,FIND,"")'="" ADDIND G O1
 
SUITE 
 G NXREP
 
CRELIS 
 
 
 
 
CRE2 
 
 
 
 
 
 
 
 
FIN K @(RES),@(LISTREP),@(RESLIS)
 Q LISRES
 
 
ADDIND I LLI'="*" Q:'($D(@LISTREP@(REP,IND)))
 
 I '($D(@RESLIS@(REP))) S LS=$$GEN^%QCAPOP("CSA"),ADRESSE="^[QUI]RQS2("""_LS_""",""OBJET"")" D CREERL^%QS0XG1(LS,REP,ADRESSE,"CONSULTATION","CONSULTATION"),AJOUT^%QS0XG1(LISRES,LS) S @RESLIS@(REP)=LS
 D AJOUT^%QS0XG1(@RESLIS@(REP),IND)
 Q
 ;

