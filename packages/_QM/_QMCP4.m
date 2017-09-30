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

;%QMCP4^INT^1^59547,73876^0
QMCP4 ;
 
 N CTR,COPIE,DX,DY,MODE,MSG,MODAF,R
 S MODE=$$^%QZCHW("definition")
 D REAFF(MODE)
 D LIRE2^%VREAD($$^%QZCHW("Copie")_" : ","",1,RM-1,DY+1,DY-1,"REAFF^%QMCP4("""_MODE_""")","$$UC1^%QMCP4",.CTR,.COPIE)
 I (CTR="A")!(COPIE="") Q
 I COPIE="?" S COPIE=$$^%QUCHOYO($$ADR^%QMCPZ,.R,1) I COPIE="" Q
 D DEF(COPIE,MODE)
 Q
SUP 
 N CTR,COPIE,DX,DY,MODE,MSG,MODAF,R
 S MODE=$$^%QZCHW("suppression de la definition")
 D REAFF(MODE)
 D LIRE2^%VREAD($$^%QZCHW("Copie")_" : ","",1,RM-1,DY+1,DY-1,"REAFF^%QMCP4("""_MODE_""")","$$UC1^%QMCP4",.CTR,.COPIE)
 I (CTR="A")!(COPIE="") Q
 I COPIE="?" S COPIE=$$^%QUCHOYO($$ADR^%QMCPZ,.R,1) I COPIE="" Q
 D SUPP(COPIE,MODE)
 Q
DUP 
 N CTR,COPIE,DX,DY,MODE,MSG,MODAF,R,COPIE2
 S MODE=$$^%QZCHW("duplication de la definition")
 D REAFF(MODE)
 D LIRE2^%VREAD($$^%QZCHW("Copie")_" : ","",1,RM-1,DY+1,DY-1,"REAFF^%QMCP4("""_MODE_""")","$$UC1^%QMCP4",.CTR,.COPIE)
 I (CTR="A")!(COPIE="") Q
 I COPIE="?" S COPIE=$$^%QUCHOYO($$ADR^%QMCPZ,.R,1) I COPIE="" Q
 S DY=22
 D LIRE2^%VREAD($$^%QZCHW("Copie")_" : ","",0,RM-1,DY+1,DY-1,"REAFF^%QMCP4("""_MODE_""")","$$UC3^%QMCP4",.CTR,.COPIE2)
 I (CTR="A")!(COPIE2="") Q
 D DUPP(QUI,COPIE,QUI,COPIE2)
 Q
REAFF(MODE) 
 D CLEPAG^%VVIDEO
 D ^%VZCDB(MODE_" "_$$^%QZCHW("d'une copie"),0)
 S DX=0,DY=5
 Q
UC1(YY1,REAF) 
 Q 1
UC2(COPIE,REAFF) 
 N A
 I COPIE="" D ^%VZEAVT("la chaine vide est interdite") Q 0
 S A=$$ADR^%QMCPZ
 D POCLEPA^%VVIDEO
 I '($D(@A@(COPIE))) D ^%VZEAVT(COPIE_" "_$$^%VZEAVT("n'existe pas")) Q 0
 Q 1
UC3(COPIE,REAFF) 
 N A
 I COPIE="" D ^%VZEAVT("la chaine vide est interdite") Q 0
 S A=$$ADR^%QMCPZ
 D POCLEPA^%VVIDEO
 I $D(@A@(COPIE)) Q $$CONFIRM^%VZEOUI($$^%QZCHW("Souhaitez vous ecraser la definition")_" "_COPIE_" ?")
 Q 1
DEF(COPIE,MODE) 
 N ADR,ADR1,P,ADR2,OK
 S P=1
DEF1 S ADR=$$ADR^%QMCPZ
 D CLEPAG^%VVIDEO
 D ^%VZCDB(MODE_" "_$$^%QZCHW("d'une copie"),0)
 D CARSA^%VVIDEO(0,2,80,20)
 D REAFF^%QULIMO3(1,1,$$ADRTX^%QMCPZ(COPIE),0,2,80,20)
 D ZLISTE2^%QULIMO(0,2,80,20,$$ADRTX^%QMCPZ(COPIE),.P,"ADD^%QMCP4","DEL^%QMCP4","^%QMCP7")
 
 S OK=$$VERIF(COPIE)
 D POCLEPA^%VVIDEO
 I '(OK) G:'($$MES^%VZEOUI($$^%QZCHW("Souhaitez vous abandonner ?"),"N")) DEF1
 D SETANA^%QMCPZ(COPIE,OK)
 Q
 
ADD S OK=1 Q
DEL S OK=1 Q
ADD1 S OK=1 Q
 
VERIFALL 
 N COP,%C,RES,G
 D CLEPAG^%VVIDEO
 S G=$$ADR^%QMCPZ
 S COP="" F %C=0:0 S COP=$O(@G@(COP)) Q:COP=""  W !,COP S RES=$$VERIF(COP) I RES W "   (OK)" H 5E-1
 Q
 
 
VERIF(COPIE) 
 N ADRTX,I,TEMP,STO,N,ERR,STRUCT,OK
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VERIF")
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 K @(TEMP)
 S STO=$$ADRSTO^%QMCPZ(COPIE) K @(STO)
 S STRUCT=$$ADRSTR^%QMCPZ(COPIE) K @(STRUCT)
 S ADRTX=$$ADRTX^%QMCPZ(COPIE)
 S OK=1
 
 S N=$O(@ADRTX@(""))
 F I=0:0 Q:N=""  S OK=OK&$$ANA(@ADRTX@(N),STO,ERR),N=$O(@ADRTX@(N))
 
 S OK=OK&$$VERIF2^%QMCP41(STO,ERR)
 I '($D(@ERR)) K @(TEMP) Q OK
 
 D CARSA^%VVIDEO(0,2,80,20)
 D REAFF^%QULIMO3(1,1,ERR,0,2,80,20)
 D VISU^%QULIMO(0,2,80,20,ERR,.P)
 K @(TEMP)
 Q OK
 
ANA(LI,STO,ERR) 
 N TYPE,I,OK,P1,P2,LI1,OK1,VAL,A,B
 S A="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 S B="abcdefghijklmnopqrstuvwxyz"
 S OK=0
 S TYPE=$$GETLBLAN^%VTLBLAN($P(LI,"#",1))
 F I="SERVICE","REPERTOIRE","LIEN","LISTE.D.ATTRIBUTS","DESTRUCTION","VERIFICATION" I I=TYPE S OK=1 Q
 I OK=0 D PRINT(ERR,$$^%QZCHW("la chaine")_" "_TYPE_" "_$$^%QZCHW("ne contient pas SERVICE ou REPERTOIRE ou LIEN ou DESTRUCTION ou VERIFICATION"),LI) Q 0
 
 I (TYPE="DESTRUCTION")!(TYPE="VERIFICATION") G ONE
 
 S LI1=$P(LI,"#",2)
 S P1=$$GETLBLAN^%VTLBLAN($P(LI1,"->",1))
 S P2=$$GETLBLAN^%VTLBLAN($P(LI1,"->",2))
 I P1="" D PRINT(ERR,$$^%QZCHW("la chaine")_" "_LI_" "_$$^%QZCHW("devrait etre de la forme")_" "_TYPE_" # "_$TR(TYPE,A,B)_1_" -> "_$TR(TYPE,A,B)_2,LI) Q 0
 I P2="" S P2=P1 I TYPE="LISTE.D.ATTRIBUTS" S P2="*"
 S @STO@(TYPE,P1,P2)=""
 S @STO@(TYPE,P1,P2,"LI")=LI
 Q 1
ONE S VAL=$$GETLBLAN^%VTLBLAN($P(LI,"#",2))
 I (VAL="OUI")!(VAL="NON") S @STO@(TYPE)=VAL Q 1
 D PRINT(ERR,$$^%QZCHW("la chaine")_" "_LI_" "_$$^%QZCHW("devrait etre de la forme")_" "_TYPE_" # OUI ou NON",LI)
 Q 0
PRINT(ERR,CH,LI) 
 I LI'="" D ADD^%VPRIN1(ERR,LI)
 D ADD^%VPRIN1(ERR,CH)
 Q
 
SUPP(COPIE,MODE) 
 N A
 D POCLEPA^%VVIDEO
 I '($$CONFIRM^%VZEOUI($$^%QZCHW("Souhaitez vous supprimer la copie")_" "_COPIE_" ?")) Q
 S A=$$ADR^%QMCPZ
 K @A@(COPIE)
 Q
 
DUPP(QUI1,COPIE1,QUI2,COPIE2) 
 D ON^%VZEATT
 N ADR1,ADR2
 S ADR1=$$ADR(QUI1)
 S ADR2=$$ADR(QUI2)
 S ADR1=$$CONCAT^%QZCHAD(ADR1,$$S1^%QZCHAD(COPIE1))
 S ADR2=$$CONCAT^%QZCHAD(ADR2,$$S1^%QZCHAD(COPIE2))
 D GLOCOP^%QCAGLC(ADR1,ADR2)
 Q
ADR(QUI) 
 Q $$ADR^%QMCPZ
 
TEST X ^DOTS
 D DEF("COPIE1")
 Q
TEST1 X ^SMA
 D DEF("COPIE1")
 Q

