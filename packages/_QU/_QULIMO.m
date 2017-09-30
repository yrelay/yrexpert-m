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
;! HL002 ! HL     ! 23/07/12 ! PB caractères parasites sur terminal-gnome     !
;! HL003 ! HL     ! 23/07/12 ! PB saut de ligne sur terminal-gnome            !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QULIMO^INT^1^59547,73885^0
%QULIMO(XG,YH,DH,DV,LI,P1,COA,COS) ;;09:22 AM  28 Jun 1991 ; 01 Jul 93  6:32 PM
 N MODP,PARAM S MODP=1,PARAM="" G Z3
ZLISTE(XG,YH,DH,DV,LI,P1,COA,COS) 
 N MODP,PARAM S MODP=1,PARAM="" G Z3
ZLISTE2(XG,YH,DH,DV,LI,P1,COA,COS,HELP) 
 N CP,MODP,VISU,PARAM
 S CP="",MODP=1,VISU=0,PARAM="" G GO
ZLISTE3(XG,YH,DH,DV,LI,P1,COA,COS,MODP) 
Z3 N CP,HELP,VISU,PARAM
 S CP="",HELP="^%QULIMO7",VISU=0,PARAM="" G GO
ZLISTE4(XG,YH,DH,DV,LI,P1,COA,COS,HELP,CP) 
 N MODP,VISU,PARAM S VISU=0,PARAM="",MODP=1 G GO
VISU(XG,YH,DH,DV,LI,P1) 
 N MODP,VISU,PARAM S (MODP,VISU)=1,HELP="^%QULIMO7",PARAM="" G GO
 
 
 
 
GO N CARD,CTR,FI,GLO,I,L,LPR,NB,NL,NPAG,OK,P11,P1C,PAG,PCX,PCY,TAB,X1,Y1,YC
 N SLI,SLI2,SNB,SP1,SP1C,SP1CX,SP2,SP2C,SXG,SXG2,SXY,SXY2,SYC,SSX,SSY
 N PAGE,P11L,GLO1,P1L,LLLLXXXX,TEMP,BUFFER,ADR,UCONT,J,YG,ESC,%F,BUFFCP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S BUFFER=$$CONCAS^%QZCHAD(TEMP,"BUFFER")
 S BUFFCP=$$CONCAS^%QZCHAD(TEMP,"BUFFCP")
 K @(TEMP)
 ;HL002 S:(TADTM=0)&((XG+DH)>79) DH=79-XG
 S:((XG+DH)>79) DH=79-XG
 
 S TAB("DX")=XG+2,TAB("DY")=(YH+DV)-1,TAB("MSG")=" (+),(-),(.) "
 S TAB("MSGI")=" Insertion "
 S (NB,P1C)=P1,LPR="",NL=DV-2,PAGE=1,P11=$O(@LI@("")) I P11="" S P11=1
 S P11L=1,GLO1="GLO",P1L=1
 D CONS1^%QULIMO3(1,LI,NL,"GLO",DH,P11,P11L,.CARD)
 S PAG=(NB\NL)+((NB#NL)'=0)
 
LL D LL^%QULIMO4(GLO1,PAG,NL,P1,.P1L,.YC,.P1C)
LP D LP^%QULIMO4
L0 D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY
 
L00 D POS X XY
 I '($$MORE^%VZATOU(.X1,.%F,.CTR,.ESC,"",0)) G 1
 I %F'="" G:(((%F="H")!(%F="B"))!(%F="G"))!(%F="D") @%F
 I %F'="" G 43:%F="NEXT_SCREEN",45:%F="PREVIOUS_SCREEN",4:%F="INSERT_HERE",8:%F="HELP"
 I CTR'="","AFHJR"[CTR G @("CTR"_CTR)
 I X1'="" G 43:X1=43,45:X1=45,46:X1=46,61:X1=61,95:X1=95
 
 G:VISU ERR
 G:$$NOKMOD(LI) ERR
 I CTR'="","DEGILP"[CTR G @("CTR"_CTR)
 
 S I=$C(X1) G:(X1'<32)&(X1'>126) M
 G ERR
M G M^%QULIMO5
1 
 S AB=1 K @(TEMP) Q
 
4 G 4^%QULIMO8
 
5 G:'($D(@LI@(P1C))) ERR
 D SAUV2
 K @(BUFFER) S @BUFFER=1
B5 S Y1=@LI@(P1C) D POS X XY D SAUV,@COS,CHARG I '(OK) D ^%VSQUEAK G E5
 F YC=SYC:1:SYC+@LI@(P1C,"NL") I (DY>YH)&(((YH+DV)-1)>DY) D EFF
 D COPIE^%QULIMO2(LI,P1C,BUFFER,@BUFFER,CP,BUFFCP)
 K @LI@(P1C) I CP'="" K:$D(@CP@("COMP",P1C)) @CP@("COMP",P1C)
 S P1C=$O(@LI@(P1C))
 S @BUFFER=@BUFFER+1
 G:P1C'="" B5
E5 D CHARG2
 D CONS1^%QULIMO3(0,LI,NL,"GLO",DH,P11,P11L,.CARD)
 D REAFF^%QULIMO3(P1C,1,LI,XG,YC-1,DH,(DV-(YC-YH))+1)
 G LP
6 
 S AB=0 K @(TEMP) Q
7 
 G:'($D(@LI@(P1C))) ERR
 D POS S Y1=@LI@(P1C),OK=Y1=""
 D:'(OK) SAUV,@COS,CHARG I '(OK) D ^%VSQUEAK G L0
OK7 D EFF
 K @(BUFFER) S @BUFFER=1
 D COPIE^%QULIMO2(LI,P1C,BUFFER,@BUFFER,CP,BUFFCP)
 F I=P1C+1:1 Q:'($D(@LI@(I)))  D RECOP(I,I-1)
 S I=$ZP(@LI@("")) I I'="" K @LI@(I) K:CP'="" @CP@("COMP",I)
 D REAFF^%QULIMO3(P1C,1,LI,XG,YC-1,DH,(DV-(YC-YH))+1)
 D CONS1^%QULIMO3(0,LI,NL,"GLO",DH,P11,P11L,.CARD) G LP
8 
 D REAFF^%QULIMO3(P1,1,"LLLLXXXX",XG,YC-1,DH,DV-(YC-YH))
 D @HELP G 18
9 
 I '($D(@LI@(P1C))) D ^%VSQUEAK G L00
 S YG=@LI@(P1C) D 91
 D REAFF^%QULIMO3(P1C,1,LI,XG,YC-1,DH,DV-(YC-YH)),LLP
 D CONS1^%QULIMO3(0,LI,NL,"GLO",DH,P11,P11L,.CARD) G B
10 
 D IMPR^%QULIMO2(LI) G L0
12 G 12^%QULIMO5
16 
 G:'($D(@LI@(P1C))) ERR
 
 K @(BUFFER) S @BUFFER=1
 D COPIE^%QULIMO2(LI,P1C,BUFFER,@BUFFER,CP,BUFFCP)
 ;HL003 D POCLEPA^%VVIDEO W $E("--> "_@LI@(P1C),1,RM-1) H 1 D POCLEPA^%VVIDEO G L00
 D POCLEPA^%VVIDEO W $E("--> "_@LI@(P1C),1,RM-5) H 1 D POCLEPA^%VVIDEO G L00
18 G 18^%QULIMO4
43 G 61^%QULIMO4
61 G 61^%QULIMO4
45 G 95^%QULIMO4
46 G:'(MODP) ERR
 G 80^%QULIMO4
95 G 95^%QULIMO4
80 G 80^%QULIMO4
H G H^%QULIMO4
B G B^%QULIMO4
G G L00
D G L00
 
ERR D ^%VSQUEAK G L00
91 D MOD^%QULIMO2 Q
EFF D EFF^%QULIMO2 Q
POS D POS^%QULIMO2 Q
RECOP(S,D) D RECOP^%QULIMO2(S,D) Q
LLP D LLP^%QULIMO2 Q
SAUV D SAUV^%QULIMO2 Q
CHARG D CHARG^%QULIMO2 Q
SAUV2 D SAUV2^%QULIMO2 Q
CHARG2 D CHARG2^%QULIMO2 Q
 
CTRA G 1
CTRD G 4
CTRE D ^%VZEAVT("Vous allez supprimer des lignes jusqu'a la fin du texte")
 I $$MES^%VZEOUI("Continuez-vous ?","N")=1 D POCLEPA^%VVIDEO G 5
 D POCLEPA^%VVIDEO G L00
CTRF G 6
CTRG G 7
CTRH G 8
CTRI G 9
CTRJ G 10
CTRL G 12
CTRP G 16
CTRR G 18
 
 
 
 
DEL(A) D DEL^%QULIMO2(A) Q
VAL(A) Q $$VAL^%QULIMO2(A)
AFF(A,V) D AFF^%QULIMO2(A,V) Q
 
TEST N XX S XX=1 D CLEPAG^%VVIDEO,CARSA^%VVIDEO(10,5,20,10)
 D ZLISTE(10,5,20,10,"^TATAT",.XX,"ADD^%QULIMO","ADD^%QULIMO") Q
ADD S OK=1 Q
TEST1 N XX S XX=1 D CLEPAG^%VVIDEO
 S (DX,DY)=0 X XY
 
 F DX=0:1:79 W DX#10
 S DX=0 F DY=0:1:23 X XY W DY
 D CARSA^%VVIDEO(10,5,20,10)
 D ZLISTE(10,5,20,10,"^TATA",.XX,"ADD^%QULIMO","ADD^%QULIMO") Q
 
NOKMOD(LI) 
 N G,TY,TYP,OBJ
 S G=$P(LI,"(")
 F TY="]TTL","]EDMOD","]EDFORMAT" G:G[TY NOK2
 Q 0
NOK2 S TYP=$S(TY="]TTL":"TRAITEMENT",TY="]EDMOD":"MODELE",TY="]EDFORMAT":"FORMAT")
 S @("OBJ="_$P($P(LI,G_"(",2,999),","))
 Q $$NOKOBJ^%INCOIN2(TYP,OBJ)

