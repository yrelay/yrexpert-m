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

;%LXUC4^INT^1^59547,73871^0
LEXUC4 ;
 
 
REC S HTOZE=^TOZE($I,"SIMUL") S:'($D(%UCATT)) %UCATT=60 S SYNON=0 I PCH="" S REFUSE=1 G FIN
 D ^%LXABR I CONCUR'=1 G FIN
 I $D(^[QUI]TOLEX(PCHCOMP)) S SYNON="M" G FIN
 G:'($D(^[QUI]TOSYNONY(PCHCOMP))) FIN
 S SYNON="S",PRECOS=$N(^[QUI]TOSYNONY(PCHCOMP,-1)) I PRECOS=-1 S SYNON=0
 G FIN
FULL D CHEFF S BRAQ=0,REFUSE=0 G:RESUL(IC)="" FIN S PCTE=0,IPAR=$P(RESUL(IC),"'",1),IAR=$P(RESUL(IC),"'",2),APO=$S(IAR="":"",1:"'")
FULL0 S MOD="ART",PCH=IAR I PCH'="" D FULL1 G:REFUSE=1 FIN S IAR=PCHCOMP
 S MOD="PAR",PCH=IPAR
FULL1 D REC
 D:CONCUR'=1 ALORS
 
 I SYNON=0 D ^%LXABR S REFUSE=$S(CONCUR=1:0,1:1) G FIN
 I SYNON="M" S:BRAQ=0 RESAFF=$S(MOD="PAR":PCHCOMP_APO_IAR,1:IPAR_APO_PCHCOMP),FRESU(IC)=RESAFF D:BRAQ=0 AFF G FIN
 I SYNON="S" D MSGSYN S:BRAQ=0 RESAFF=$S(MOD="PAR":PRECOS_APO_IAR,1:IPAR_APO_PRECOS),FRESU(IC)=$S(MOD="PAR":PRECOS_APO_IAR,1:IPAR_APO_PRECOS) D:BRAQ=0 AFF G FIN
ABR D CHEFF S REFUSE=0 G:RESUL(IC)="" FIN S PCH=RESUL(IC) D TO^%QZNBN1 G:ISNUM FIN S PCTE=0
ABR0 S BRAQ=0,IPAR=$P(RESUL(IC),"'",1),IAR=$P(RESUL(IC),"'",2),APO=$S(IAR="":"",1:"'")
 S MOD="ART",PCH=IAR I PCH'="" D FULL1 G:REFUSE=1 FIN S IAR=PCHCOMP
 S MOD="PAR",PCH=IPAR
ABR1 D REC I CONCUR="IND" D ALORS G FIN
 S:CONCUR=1 PCTE=0
 D:CONCUR'=1 ALORS
 G:PCTE=1 FIN
 
 I SYNON=0 D ^%LXABR S REFUSE=$S(CONCUR=1:0,1:1) G FIN
 I SYNON="S" D MSGSYN S (PCH,PCHCOMP)=PRECOS
 D:SYNON="M" MSGMAI
 D:PCH=PCHCOMP BESABR
 G:BRAQ=1 FIN S RESAFF=$S(MOD="PAR":PCH_APO_IAR,1:IPAR_APO_PCHCOMP),FRESU(IC)=$S(MOD="PAR":PCHCOMP_APO_IAR,1:IPAR_APO_PCHCOMP) D AFF G FIN
BRAQ D CHEFF S CPB=RESUL(IC-1) I CPB="" S REFUSE=1,(IC,ICC)=IC-1 G FIN
 I CPB="[]",RESUL(IC)'["," S REFUSE=1 G FIN
 I (CPB'="[]")&((CPB'="][")&((CPB'="[[")&(CPB'="]]"))),RESUL(IC)["," S REFUSE=1 G FIN
 S REFUSE=0 G:RESUL(IC)="" FIN S PCH=RESUL(IC) D TO^%QZNBN1 G:ISNUM FIN S CPTL=RESUL(IC-1) I CPTL="" S REFUSE=1,(IC,ICC)=IC-1 G FIN
 S PCTE=$S(CPTL="=":1,CPTL="'=":1,CPTL="[":1,CPTL="]":1,CPTL="'[":1,CPTL="']":1,1:0)
 I (PCTE=1)&(RESUL(IC)[",") S REFUSE=1 G FIN
 G:RESUL(IC)["," EXBRA
 S BRAQ=0,IPAR=$P(RESUL(IC),"'",1),IAR=$P(RESUL(IC),"'",2),APO=$S(IAR="":"",1:"'")
 S PCH=IAR,MOD="ART" I PCH'="" S PARA=PCH D BKPT S RESAFF=IPAR_APO_PARA,PCH=PARA D AFF,FULL1 G:REFUSE=1 FIN S IAR=PCHCOMP
 S PCH=IPAR,MOD="PAR",PARA=PCH D BKPT S RESAFF=$E(%CHEFF,1,$L(IPAR_IAR)+1) D AFF S RESAFF=PARA_APO_IAR,PCH=PARA D AFF D:IAR="" ABR1 D:IAR'="" FULL1 G:REFUSE=1 FIN S RESAFF=PCH_APO_IAR,FRESU(IC)=PCHCOMP_APO_IAR D AFF G FIN
EXBRA S BRAQ=1,BRA=RESUL(IC),(FBRA1,BRA1)=$P($P(BRA,",",1),"'",1),IAR1=$P($P(BRA,",",1),"'",2),APO1=$S(IAR1="":"",1:"'"),(FBRA2,BRA2)=$P($P(BRA,",",2),"'",1),IAR2=$P($P(BRA,",",2),"'",2),APO2=$S(IAR2="":"",1:"'")
 I (BRA1="")!(BRA2="") S REFUSE=1 G FIN
 F IPCH=1,2 D TRBRA G:REFUSE=1 FIN
 S RESAFF=BRA1_APO1_IAR1_","_BRA2_APO2_IAR2,FRESU(IC)=FBRA1_APO1_IAR1_","_FBRA2_APO2_IAR2 D AFF G FIN
TRBRA S MOD="ART",PCH=@("IAR"_IPCH) I PCH'="" S PARA=PCH D BKPT S PCH=PARA D FULL1 G:REFUSE=1 FIN S @("IAR"_IPCH)=PCHCOMP D NEWBRA
 S MOD="PAR",PCH=@("BRA"_IPCH) D TO^%QZNBN1 I '(ISNUM) S PARA=@("BRA"_IPCH) D BKPT S PCH=PARA D:@("IAR"_IPCH)="" ABR1 D:@("IAR"_IPCH)'="" FULL1 G:REFUSE=1 FIN S @("BRA"_IPCH)=PCH,@("FBRA"_IPCH)=PCHCOMP D NEWBRA
 G FIN
MSGSYN D ^%VZEAVT(PCH_"="_PCHCOMP_$$^%QZCHW(" est synonyme de ")_PRECOS_$$^%QZCHW(" ==> Substitution ")) G FIN
MSGMAI D POCLEPA^%VVIDEO W PCH,"=",PCHCOMP H:'(HTOZE) 2 G FIN
BESABR I '($D(^TOZE($I,"BESABR"))) D BABOFF^TOZE
 G:^TOZE($I,"BESABR")=0 FIN
 D ^%VZEATT
 S CHN="",LPCH=$L(PCH) F UU=1:1:LPCH S CHN=CHN_" "
 S RESAFF=CHN D AFF
 S OPCH=PCH,LIBCPT=PCHCOMP D ^%LXBESTA G FIN
AFF S ICC=IC,TAB(ICC)=RESAFF
 I $D(^SCRE(SCR)) D ^%VAFFICH G FIN
 D ^%VAFFICH G FIN
NEWBRA S CHN="",LBRA=$L(BRA1_APO1_IAR1_","_BRA2_APO2_IAR2) F UU=1:1:LBRA S CHN=CHN_" "
 S RESAFF=CHN D AFF
 S RESAFF=BRA1_APO1_IAR1_","_BRA2_APO2_IAR2 D AFF G FIN
REFUS S REFUSE=1 G FIN
ALORS G AMBI:CONCUR=2,UNKN:CONCUR=0 S REFUSE=0,CONCUR=1,PCTE=0,SYNON="M" D POCLEPA^%VVIDEO W PCH,"=",PCHCOMP," (",PCHIND,$$^%QZCHW(" indice )") H:'(HTOZE) 2 D POCLEPA^%VVIDEO G FIN
UNKN G:PCTE=0 PARA
P1 G:APO'="" PARA S REFUSE=0 I $E(PCH,1)="""" S REP=$$^%QZCHW("O") G P11
 D:%UCATT ^%VZEAVT(PCH_$$^%QZCHW(" est inconnu ! ")) X XY W $$^%QZCHW("Est-ce une valeur literale ? [O/N/(L)exique,(B)Cons.breve] ") R *REP:%UCATT S:REP=-1 REP=79 S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&((REP'=$$^%QZCHW("N"))&((REP'=$$^%QZCHW("L"))&(REP'=$$^%QZCHW("B")))) P1
P11 S TYPCH=0 I REP=$$^%QZCHW("O") S PCHCOMP=PCH G FIN
 S REFUSE=1,PCTE=0 G:REP=$$^%QZCHW("L") LEX G:REP=$$^%QZCHW("B") BREV G FIN
PARA D ^%VZEAVT(PCH_$$^%QZCHW(" est inconnu --> refuse "))
PARB X XY W $$^%QZCHW(" (L)exique/(B)Cons.breve/[RETURN] ") R *RET:%UCATT S:RET=-1 RET=13 S REFUSE=1,RET=$C(RET) G:RET=$$^%QZCHW("B") BREV G:RET=$$^%QZCHW("L") LEX G FIN
AMBI D ^%VZEAVT($$^%QZCHW("Veuillez etre plus precis ! ")_PCH_$$^%QZCHW(" est ambigu ")) S REFUSE=1 G PARB
FIN D POCLEPA^%VVIDEO Q
LEX D ^%LXUC7 G FIN
BREV S OICC=IC D ^%LXCONS,^%VAFIGRI,^%VAFISCR S ICC=OICC,CTRLF=0 G FIN
CHEFF S TYPVAL=1 Q:$D(%CHEFF)
 S %CHEFF="" F FD=1:1:50 S %CHEFF=%CHEFF_" "
 Q
BKPT Q:($E(PARA,1)="""")&($E(PARA,$L(PARA))="""")  D ^%QZCHBT
 Q
 
 F I=1:1:SS S L=@CHEM@(G,I,"LONGUEUR") W:L=10E20 !,"Pas de chemin entre "_SD_" et "_I W:L<10E20 !,"Longueur du chemin de "_SD_" vers "_I_" = "_L W " Predecesseur de "_I_" = "_@CHEM@(G,I,"PRED")
 Q

