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

;%QULCHP^INT^1^59547,73885^0
%QULCHP(G,GSEL,UCO,TIT,POSX,POSY,NBLIG,TYPSEL) ;;09:12 AM  4 May 1992; ; 07 Dec 92 12:21 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,GY,EXT,AFFD,PROC,TPAR,TIMWT,%AA,%BB,%CC,%DD,%EE,LC,LDEB,AFF,Y,EXEFULL,EXEAFFI,TC,TD,TF,TT,TW,TG,TH,TX,ZF,TA,TE,TI,TJ,TM,TR,TRO,PK,TB,ITIM
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"X") K @(TEMP)
 S GY=$$CONCAS^%QZCHAD(TEMP,"Y"),EXT=$$CONCAS^%QZCHAD(TEMP,"E"),TPAR=$$CONCAS^%QZCHAD(TEMP,"PAR")
 S TIMWT=$S(TYPSEL=0:3,TYPSEL=-1:0,1:^TOZE($I,"ATTENTE"))
 D CHGPK^%PKUTIL
 
 
 
 S TD=NBLIG,TW=0,(TF,AFFD)=POSY,TC=1,TT=POSX,TC(1)=TF+1
 S EXEAFFI=$S('($D(@UCO@("AFF"))):"S AFF=%BB",1:"S @TPAR@(""O"")=%BB S AFF="_@UCO@("AFF")_"(TPAR)")
 S EXEFULL=$S('($D(@UCO@("FULL"))):"S AFF=@GY@(LC)",1:"S AFF="_@UCO@("FULL")_"(TPAR)")
 
 K @(GY),@(EXT)
 S %BB="" F %AA=1:1 S %BB=$O(@G@(%BB)) Q:%BB=""  S @GY@(%AA)=%BB X EXEAFFI S @GY@(%AA,"C")=AFF S:$L(AFF)>TW TW=$L(AFF)
 
 S:$L(TIT)>TW TW=$L(TIT) S (LC,LDEB)=1
 
 
BCLY K Y,PRV
 S %LC=LDEB F %BB=1:1:TD S Y(%BB)=$S($D(@GY@(%LC)):@GY@(%LC,"C"),1:"*"),PRV(%BB)=$S('($D(@GY@(%LC))):PK("UF"),$D(@GSEL@(@GY@(%LC))):PK("UO"),1:PK("UF")),%LC=%LC+1
 S Y(0)=TD
 D CLEPAG^%VVIDEO,CUROF^%VVIDEO
 S CTR="",TI=0
 K TJ S:TW#2 TW=TW+1 S @("TRO=PK(""ROF""),TR=PK(""RON"")") W PK("HI"),TRO
 
 
 G:TD=0 AFFTIT
 S %C=TF,TE=PK("VL")_$J("",TW)_PK("VL"),TM=PK("HL")_PK("HL"),%R=(TT+TD)+1 W @(PKP),PK("BLC") F TI=2:2:TW W TM
 W PK("BRC")
 F %R=TT+TD:-1:TT+1 W @(PKP),TE
 S %R=TT W @(PKP),PK("TLC") F TI=2:2:TW W TM
 W PK("TRC")
 
AFFTIT I TIT'="" S %R=TT,%C=TF+1 W TR,@(PKP),$J("",TW) S %C=(TF+1)+((TW-$L(TIT))\2) W @(PKP),TIT,TRO
 
 S TE="TA="_PKP,TH="",%C=TF+1,%R=TT F TM=1:1:TD Q:$D(Y(TM))=0  S %R=%R+1,@(TE),TX=Y(TM),CA=$E(TX,$L(TX)) S:CA'="*" TB(TM)=TA_TX,TH=TH_TX_"\" S:CA="*" TX=$E(TX,1,$L(TX)-1),TH=TH_"\" W TA,PRV(TM),TX
 S TA=TI-1,TI=TD S:TI>TA TI=TA S TM=^%PK("TERMST"),TG=" ",TI=TC*TD,ZF=""
 S X=(LC+1)-LDEB
 
 G:$D(TB(X)) ECR0 S ITIM=0
ECR01 S ITIM=ITIM+1 G:ITIM>TIMWT END H 1 R TE#1:0 E  G ECR01
 X TM D TOUCHE^%INCCLAV($A(ZF),.TE)
 G:TE=13 END I (TE<27)&(TE>0) S CTR=$C(TE+64) G:(CTR="A")!(CTR="F") END
 G ECR01
ECR0 
ECR1 W TR,TB(X)
 
 
 
 G:$D(@EXT@(LC)) AFF0
 K @(TPAR) S @TPAR@("O")=@GY@(LC) X EXEFULL
 S %AA="",%BB=$E(AFF,1,TW),%DD=(TW-$L(%BB))\2 F %EE=1:1:%DD S %AA=%AA_PK("HL")
 S %CC=%AA S:((2*%DD)+$L(%BB))<TW %CC=%CC_PK("HL")
 S %C=AFFD+1,%R=(TT+TD)+1,@("TA="_PKP),@EXT@(LC)=TA_TRO_%AA_TR_%BB_TRO_%CC
 G:'($D(@UCO@("INFO"))) AFF0
 S PROC=@UCO@("INFO")
 S @("AFF="_PROC_"(TPAR)"),AFF=$E(AFF,1,TW)
 S %CC=TR,%C=AFFD+1,%R=(TT+TD)+2,@("TA="_PKP),%CC=%CC_TA_$J("",TW)
 S %R=(TT+TD)+2,%C=AFFD+1,@("TA="_PKP),%CC=%CC_TA_AFF
 S @EXT@(LC)=@EXT@(LC)_%CC_TRO
 
AFF0 W @EXT@(LC)
 R TE#1:TIMWT E  G END
 X TM
 W TRO,PRV(X)_TB(X)
 
 
 G:TE="+" PBAS G:TE="-" PHAUT
 
 I TE="?",$D(@UCO@("?")) K @(TPAR) S @TPAR@("O")=@GY@(LC),PROC=@UCO@("?") D CHGNORM^%PKUTIL,@(PROC_"(TPAR)"),RETMOD^%PKUTIL G BCLY
 
 F %AA="UK","DK" I ZF=PK(%AA) S LV=LC G @("TT"_%AA)
 
 D TOUCHE^%INCCLAV($A(ZF),.TE)
 
 G:TE'=13 AFFSU G:TYPSEL=0 AFFSU
 I $D(@GSEL@(@GY@(LC))) K @GSEL@(@GY@(LC)) S PRV(X)=PK("UF") G TTSEL
 S @GSEL@(@GY@(LC))="" G:TYPSEL=1 END S PRV(X)=PK("UO") G TTSEL
AFFSU 
 I (TE<27)&(TE>0) S CTR=$C(TE+64) G:(CTR="A")!(CTR="F") END
 G ECR0
 
TTSEL W TRO,PRV(X)_TB(X)
 
TTDK I $D(@GY@(LC+1)) S LV=LC+1 G:LV<(LDEB+TD) FINFL S (LDEB,LC)=LC+1 G BCLY
 G ECR0
 
TTUK I $D(@GY@(LC-1)) S LV=LC-1 G:LV'<LDEB FINFL S LDEB=LDEB-TD,LC=LC-1 G BCLY
 G ECR0
 
FINFL S LC=LV,X=(LV+1)-LDEB G ECR0
 
PBAS I $D(@GY@(LDEB+TD)) S (LDEB,LC)=LDEB+TD G BCLY
 G ECR0
PHAUT I $D(@GY@(LDEB-TD)) S (LDEB,LC)=LDEB-TD G BCLY
 G ECR0
 
END W PK("Z")
 I '($D(^%PKREAD)) D READ^%PKGLOB
 D RETMOD^%PKUTIL
 K @(TEMP)
 Q
 
 
TEST(TSEL) K TABUCO,TAB
 S TABUCO("AFF")="$$FULL^%QULCHP"
 
 S TABUCO("?")="PTING^%QULCHP"
 D ^%QULCHP("^NAMEFUL","TAB","TABUCO","ESSAI sur le global nameful",10,10,5,TSEL)
 
 
AFFRT W !,"resultat"
 S I="" F  S I=$O(TAB(I)) Q:I=""  W !,I
 Q
T2 K TABUCO,TAB D ^%QULCHP("TABUCO","TAB","TABUCO","coucou",10,10,0,1) G AFFRT
 
PTING(TAB) N GAG S GAG=@TAB@("O") I $$CONFIRM^%PKUTIL(2,14,40,$TR(GAG,"A","?"))
 Q
FULL(TAB) N GAG S GAG=@TAB@("O") Q GAG
INFO(TAB) N GAG S GAG="++++++++++++"_@TAB@("O")_"+++++++++" Q GAG

