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

;%SYSBRIM^INT^1^59547,73892^0
%MCODERI ;
 
 
 
 
 
 
 N %R,ANS,AROU,BLK,BLK1,BUFAD,COMMENT,CURLEN,DATETIME,DEV,FILLX
 N IO,L,LEN,MEDIUM,NS,OK,OK2SAV,OVLAY,POP,QUERY,RDBLK,ROU
 N SAVE,SCAN,SEL,SHOW,VOL,X,Y,Z,ZA
 I '($D(%ST("BUFFS"))) N %ST D ^%ST
 W !,"Read m-code of routines.",!
 
 D GETDEV S %R=0,IO=$I,$ZE="",$ZT="EXIT"
 D @(DEV_"OPEN") G:POP EXIT D @(DEV_"MOUNT") U 0
 I $P(COMMENT,"~",2)'="%MCODERO" W *7,!,"[Not an m-code ",MEDIUM,".]" G EXIT
 W !,"Volume ",VOL," ",MEDIUM," writen on ",DATETIME
 W !,"with description:  ",$P(COMMENT,"~",1)
 D SETXEC("GENERAL")
 
PICK U 0 W !,!,"Input option: " R ANS:600 G:ANS="" EXIT
 S:ANS?1L ANS=$C($A(ANS)-32) I ANS["?" D PIQ G PICK
 F L=1:1 S Y=$P($T(OPTNS+L),";",3) Q:Y=""  I $E(Y)=ANS W $E(Y,2,99) Q
 E  W "  ???" G PICK
 D @("OPT"_ANS) G DOIT
PIQ W !,!,"The input options are:" F L=1:1 S Y=$P($T(OPTNS+L),";",3) Q:Y=""  W !,?5,Y
 W !,!,"Type the first character of the option that you want." Q
OPTNS 
 ;;All routines.
 ;;Select routines one at a time.
 ;;Enter now the names or groups of names to be selected.
 ;;List names of routines on tape.
 
DOIT I OVLAY W !,!,". indicates routines that will replace those now on file."
 D ^%ROU,@(DEV_"BUFF") S BUFAD=$V(20+%ST("BUFFS"),-4,2)
 W ! U IO X SCAN
 
EXIT S $ZT="",ZA=$ZA U 0 W !,?8,%R," routines saved."
 I $ZE'="" W !,!,$ZE,!,"$ZA = ",ZA
 C:IO'=$I IO ZQ  Q
 
GENERAL ;;SCAN;F Z=0:0 ZR  X RDBLK,BLK1 Q:ROU=""  X AROU I OK ZS @ROU K ^ROUTINE(ROU) S %R=%R+1
 ;;OK2SAV;S OK=OVLAY!'$D(^UTILITY("ROU",ROU))
 ;;SAVE;F Z=0:0 S CURLEN=$S(LEN>2036:2036,1:LEN),LEN=LEN-CURLEN S:OK X=$ZU(21,BUFAD,CURLEN) Q:LEN=0  X RDBLK
 ;;SHOW;U 0 W:$X>70 ! W ?$X+9\10*10,ROU W:$D(^UTILITY("ROU",ROU)) "." U IO
 
 
 
OPTL S OVLAY=1,OK=0,AROU="X SAVE,SHOW" Q
 
OPTA S AROU="X OK2SAV,SAVE,SHOW:OK" D OVLQ Q
 
OPTS S AROU="X OK2SAV,QUERY:OK,SAVE,SHOW:OK"
 S QUERY="U 0 W !,""Save "",ROU,""? N=>"" R OK S OK=""Nn""'[$E(OK) U IO"
 D OVLQ Q
 
OPTE N R,R1,R2,RR,S
OPTE1 W !,!,"Enter routine name(s).  ? for help",! K SEL F NS=1:1 D GET1 Q:ANS(NS)=""
 S NS=NS-1 I '(NS) W !,"No selections made." G EXIT
 W !,!,"Selections:  starting with the empty set--"
 F X=1:1:NS S S=$E(ANS(X))'="'" W !,"   ",$S(S:"Add",1:"Subtract"),?12,$E(ANS(X),2-S,255)
 W !,"OK?" D YN G:'($T) OPTE1 W !,!
 S AROU="X OK2SAV,QUERY:OK,SAVE,SHOW:OK"
 S QUERY="S OK=0 F ANS=1:1:NS X SEL(ANS)"
 D OVLQ Q
 
 
 
YN S X=$X W " (Y or N) Y=> " R A S A=$F("YyNn",$E(A)) I '(A) W !,?X G YN
 I A<4
 K A,X Q
NY S X=$X W " (Y or N) N=> " R A S A=$F("NnYy",$E(A)) I '(A) W !,?X G NY
 I A'<4
 K A,X Q
 Q
OVLQ U 0 W !,!,"If a selected routine has the same name as one already on file,"
 W !,"shall it replace the one on file?" D NY S OVLAY=$T Q
 
GET1 W !,"Routine:  " R ANS(NS) S R=ANS(NS) Q:R=""  I R["?" D RHELP G GET1
 S ANS(NS)=R,S=$E(R)'="'" I '(S) S R=$E(R,2,255)
 D GE3 I  S SEL(NS)="I ROU="""_R_""" S OK="_S Q
 I R?1.E1"*" S R=$E(R,1,$L(R)-1) D GE3 I  S SEL(NS)="I ROU?1"""_R_""".E S OK="_S Q
 I R?1.E1"-"1.E D GE2 I  Q
 W *7,"      ",ANS(NS)," has bad form." G GET1
GE2 S RR=R,(R,R1)=$P(RR,"-",1) D GE3 E  Q
 S (R,R2)=$P(RR,"-",2) D GE3 E  Q
 I R1']R2 S SEL(NS)="I """_R1_"""']ROU,ROU']"""_R2_""" S OK="_S
 Q
GE3 I (R?1"%".7NA)!(R?1A.7NA)
 Q
RHELP W !,"Choose routines as in these examples:"
 W !,"  RNAM",?18,"One routine"
 W !,"  RNAM1-RNAM2",?18,"Range of routines"
 W !,"  CD*",?18,"All beginning with CD"
 W !,"  'RNAM",?18,"Exclude these routines from a range or"
 W !,"  'RNAM1-RNAM2",?18,"""*"" group named previously."
 W !,"  'CDG*",! Q
 
GETDEV W !,"Read from magtape, diskette, or SDP?  (M, D or S)=> " R DEV
 S DEV=$F("MmDdSs",$E(DEV))\2 G GETDEV:DEV<1
 S MEDIUM=$P("tape^diskette^SDP","^",DEV),DEV=$P("MT^FD^SD","^",DEV)
 W "  ",MEDIUM,! Q
 
SETXEC(TAG) F L=0:1 S X=$T(@TAG+L),Y=$P(X,";",3),Z=$P(X,";",4,99) Q:Y=""  S @Y=Z
 Q
 
MOUNT W !,"Mount a ",MEDIUM,".  <RETURN> when ready => ",*-1 R X W ! Q
 
RDHEADER 
 S $ZE="",$ZT="ERRHEAD",OK=1 U IO R COMMENT,DATETIME,VOL Q
 
 
ERRHEAD S $ZT="" D @(DEV_"ERR") E  G @$ZT
 U 0 W !,"[",MEDIUM," not ready.]" S OK=0 Q
 
 
 
 
MTOPEN D ^%IS S $ZE="" Q:POP
 I (IO<47)!(IO>57) C IO W !,*7,"Magtape devices 47-57 only." G MTOPEN
 D SETXEC("MT") Q
MTMOUNT C IO O IO:("V":2048) F Z=0:0 U 0 D MOUNT U IO D RDHEADER I OK Q
 Q
MTBUFF C IO O IO:("V":2048) Q
MTERR I $ZE["<MAGTA"
 Q
MT ;;BLK1;R X S LEN=$A(X,2)-2,ROU=$E(X,5,4+LEN),LEN=$A(X,42)*256+$A(X,41)+1\2*2+48
 ;;RDBLK;W *-6
 
 
 
FDOPEN N DBEG,DRIVE,DSK D ^%DSKALL,SETXEC("SD")
FDOP1 W !,"Enter the diskette drive to use=> " R DRIVE
 I $D(DSK(DRIVE)),'($P(DSK(DRIVE),"^",2))
 E  W "???  [No diskette ",DRIVE," on this system.]" G FDOP1
 S DBEG=DSK(DRIVE)*2097152
 F IO=59:1:62 O IO:(0:DBEG:"S"):0 I  W ! S BLK=DBEG Q
 E  W "Unable to open any SDP devices - please try again later."
 S POP='($T) Q
FDMOUNT F Z=0:0 U 0 D MOUNT U IO:(0:BLK:"S") D RDHEADER I OK S BLK=BLK+1 Q
 Q
FDBUFF Q
FDERR I $ZE["<DISK"
 Q
 
 
 
SDOPEN D ^%IS S $ZE="" Q:POP
 I (IO<59)!(IO>62) C IO W !,*7,"SDP devices 59-62 only." G SDOPEN
 D SETXEC("SD") U IO S BLK=$ZA U IO:(0:BLK:"S"),0 Q
 
SDMOUNT F Z=0:0 U IO:(0:BLK:"S") D RDHEADER I OK S BLK=BLK+1 Q
 Q
SDBUFF Q
SDERR I 0
 Q
SD ;;BLK1;R X#42 X FILLX S LEN=$A(X,2)-2,ROU=$E(X,5,4+LEN),LEN=$A(X,42)*256+$A(X,41)+1\2*2+48
 ;;FILLX;I $L(X)<42 R Y#42 S X=X_$C(255)_Y X FILLX
 ;;RDBLK;U IO:(0:BLK:"V") S BLK=$ZA+1

