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

;%SYSBGYQ^INT^1^59547,73892^0
%GIQ ;
 
 
 
 
 
 
 
 
 
 
 
 
 
OSS ;;DSM/11-V2,1024,1018,0,251  DSM/11-V3,1024,1018,2,251  M/11,1024,1018,0,255  M/11+,2048,2040,1,0  M/VX,2048,2040,1,0  M/DG,2048,2040,1,0
 
INIT W !,"Load globals from a tape written by %GOQ."
 W !,">>>>> quel volume >>>" R VOLUME
 L %GIQ:0 E  W !,"[Another copy of %GIQ is running now.]" Q
 K (VOLUME) S IO=0,$ZE="",$ZT="EXIT" D INT^%DIR,^%ST S GVECA=%ST("GVEC"),PRIN=%ST("PRIN"),VWBUF=%ST("VBUF") K %ST O 63 C 63
 
MT W !,"Load from magtape" D ^%IS G:POP EXIT
 I (IO<47)!(IO>50) W !,"[Magtape devices 47-50 only.]" C IO G MT
 
COMMENT S VOL=VOLUME,BLKSIZ=2048 D TPMOUNT S DATETIME=D,VOL=V
 S X=$P(COMMENT,"~",2),COMMENT=$P(COMMENT,"~")
 I X'="%GOQ" W !,"[This is not a tape written by %GOQ.]" G COMMENT
 
OPSYS S OSS=$P($T(OSS),";;",2)
 F I=1:1:$L(OSS,"  ") S X=$P(OSS,"  ",I) I OS=$P(X,",") Q
 E  W !,"[I can't handle a tape written by ",OS,".  Only"
 E  F I=1:1:$L(OSS,"  ") W " ",$P($P(OSS,"  ",I),",")
 E  W "]" C IO G INIT
 S BLKSIZ=$P(X,",",2),LINKA=$P(X,",",3),TYPE=$P(X,",",4),BIT8=$P(X,",",5)
 K OSS
 
 ;;;;;I VOL-1 W !,"[This is volume ",VOL,".]" G COMMENT
 W !,OS,!,COMMENT," wrote the tape on ",DATETIME,".  OK?" D YN E  G EXIT
 
FILL W !,"How full shall the M/11+ global blocks become before splitting"
 W !,"(85% - 100%)?"," 95% => " R X S:X="" X=95
 I X["?" W !,"  100% gives the best packing but the first few days of changes to the database"
 I  W !,"  will generate a lot of disk activity due to block splitting.  85% leaves room"
 I  W !,"  for some growth before splitting but gives lower packing efficiency.",! G FILL
 S X=X/100 I X'<85E-2,X'>1 S HOWFULL=(X*2036)\1
 E  W "  ???" G FILL
 
GLOBALS W !,"The globals are" F GN=1:1:GNS W !,NAMES(GN)
 W !,"Checking that none of them is now defined..." S OK=1
 F GN=1:1:GNS-1 F GP=1:1 S GLO=$P(NAMES(GN)," ",GP) Q:GLO=""  D GL1
 I '(OK) W !,!,"Do you want to proceed, skipping those globals that are already present?",! D YN E  G EXIT
 G COPY
GL1 S GLONAM="^"_GLO I $D(@GLONAM) W !,GLONAM," is already present." S OK=0
 Q
 
COPY C IO O IO:("USA":0:BLKSIZ) S TIM2=$H
 S ERR=0 F NG=0:1 D GLO G:ERR EXIT Q:TM
 
 U 0 W !,NG," globals restored in ",(($P($H,",",2)-$P(TIM2,",",2))\60)#1440," minutes."
 
EXIT S $ZT="" I $D(VWBUF) V VWBUF:-1:4:0
 I $ZE'="" U 0 W !,!,$ZE
 U 0 C:(IO'=$I)&(IO'="") IO L  Q
 
GLO 
 S $ZT="ERR" U IO R GLO
 S MTBUFA=$V($V(PRIN+4,-1,4)+48,-3,4) V VWBUF:-1:4:MTBUFA
 S GLONAM="^"_GLO U 0 W !,GLONAM,"...  " I '($D(@GLONAM)) G GLO3
 
 W "is already present.  Skipping it on tape." S $ZT="ERR2"
GLO2 U IO F Z=0:0 W *-6 S NEXTBN=$V(LINKA,0,3) Q:NEXTBN=0
 Q
 
GLO3 S @GLONAM@(1)="" K ^(1)
 S GLOVEC=$V(GVECA,-1,4),DATABN=$V(GLOVEC+40,-3,3),PNTRBN=$V(GLOVEC+36,-3,3)
 S NEXTBN=0,NBLKS=1,$ZT="ERR3A"
GLO3A U IO W *-6 S NEXTBN=$V(LINKA,0,3) D:OS="M/DG" MDGFIX
 W *
GLO3B F NBLKS=NBLKS:1 Q:NEXTBN=0  W *-6 D:OS="M/DG" MDGFIX W *
 S $ZT="" U 0 W NBLKS," ",OS," blocks restored." Q
MDGFIX S X=$V(2046,0,2) V 2046:0:1:X\256,2047:0:1:X#256 Q
 
 
 
ERR2 D ERR Q:ERR  D EOT G GLO2
ERR3A D ERR Q:ERR  D EOT G GLO3A
ERR3B D ERR Q:ERR  D EOT G GLO3B
 
ERR S $ZT="",TM=($ZE["TAPE")&(($ZA\16384)#2) I TM S $ZE="" Q
 S ERR=1 U 0 W:$ZE["TAPE" !,$ZE,!,"$ZA=",$ZA D:$ZE?1"<DATAB".E DBDGD Q
 
EOT U 0 W !,"End of volume ",VOL U IO W *-5 S VOL=VOL+1
EOT1 D TPMOUNT ;;I VOL'=V W *7,!,"[No, this is volume ",V," on ",D,".]",! G EOT1
 W !,GLONAM,"...  " U IO Q
 
 
 
TPMOUNT C IO O IO:("USA":0:BLKSIZ) U 0 W !,"Mount tape volume ",VOL,".  <RETURN> when ready. => " R X
 U IO W *-5 R COMMENT,D,OS,V
 F GNS=1:1 R NAMES(GNS) Q:NAMES(GNS)=""
 W *-2 U 0 S TM=0 Q
 
DBDGD W !,"The original ",OS," block number was ",NEXTBN,"."
 I (OS="M/11+")!(OS="M/VX") W !,"The contents are:" F I=1:2 W *
 Q
 
YN S YNX=$X W " (Y or N) Y=> " R YN S YN=$F("YyNn",$E(YN)) I '(YN) W !,?YNX G YN
 I YN<4
 K YN,YNX Q

