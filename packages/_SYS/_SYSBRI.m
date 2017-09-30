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

;%SYSBRI^INT^1^59547,73892^0
%ZRI ;
 B 1 K  S %NET=0 W !,"Routine input" D IN^%IS Q:POP
 
 S V="ZR  F Z=0:0 X V2 ZS @ROU S:'$D(^ZRI(DAT,HEURE,ROU)) ^ZRI(DAT,HEURE,ROU)="""" Q:L="""""
 S V2="F J=1:1:40 R L S L=$P(L,$C(13),1) Q:L=""""  S:L[$C(9) L=$P(L,$C(9),1)_"" ""_$P(L,$C(9),2,99) ZI L"
 
 S %JO=$J#256,%R=0 K ^UTILITY(%JO) S $ZT="ERR"
 I (IOT="MT")!(IOT="BT") D READYMT I POP G OPTQ
 U IO R HEAD,DAT U 0 W !,!,"Bande ecrite par ",DAT
 W " avec la description:",!,HEAD
PICK U 0 W !,!,"Option: " R A:600 G:A="" OPTQ
 S:A?1L A=$C($A(A)-32) I A["?" D PIQ G PICK
 F I=1:1 S Y=$P($T(OPTNS+I),";",3) Q:Y=""  I $E(Y)=A W $E(Y,2,99) G XXX
 W "  ???" G PICK
XXX S %NET=0 G:A="L" OPTL
NET W !,!,"Voulez vous un nettoyage des routines apres recuperation de celles-ci (O/N) ? " R *X S X=$C(X) G:(X'="O")&(X'="N") NET S:X="O" %NET=1
 D ZD^%QMDATE4,^%QMDAK0 S DAT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1) K ^ZRI(DAT,HEURE) G @("OPT"_A)
PIQ W !,!,"Les differentes options sont:" F I=1:1 S Y=$P($T(OPTNS+I),";",3) Q:Y=""  W !,?5,Y
 W !,!,"Donnez le premier caractere de l'option choisie." Q
OPTNS 
 ;;Acquisition de toutes les routines.
 ;;Selection des routines au fur et a mesure
 ;;Ennonce des noms ou groupes de noms des routines a recuperer
 ;;Liste des noms de routines presentes sur la bande
 ;;
OPTL S OVLAY=1 D REFQ F R=0:0 D RNAM Q:ROU=""  D SHOW,SKIP
 G ENDFIL
OPTA D OVLQ,REFQ
 W !,! F R=0:0 D RNAM Q:ROU=""  D OK2SAV,SAVE,SHOW:OK,RDIR
 G ENDFIL
OPTS D OVLQ,REFQ F R=0:0 D RNAM Q:ROU=""  D OK2SAV,S1
 G ENDFIL
S1 I OK D ROUQ I  D SAVE,RDIR
 E  D SKIP
 Q
OPTE D OVLQ,REFQ
E1 W !,!,"Donner le nom des routines.  ? pour vous aider",! K SEL F NS=1:1 D GET1 Q:ANS(NS)=""
 S NS=NS-1 I '(NS) W !,"No selections made." G OPTQ
 W !,!,"Selections:  starting with the empty set--"
 F X=1:1:NS S S=$E(ANS(X))'="'" W !,"   ",$S(S:"Add",1:"Subtract"),?12,$E(ANS(X),2-S,255)
 W !,"OK?" D YN G:'($T) E1 W !,!
 F R=0:0 D RNAM Q:ROU=""  D E2,OK2SAV:OK,SAVE I OK D SHOW,RDIR
 G ENDFIL
E2 S OK=0 F A=1:1:NS X SEL(A)
 Q
ENDFIL S R=0 S:$D(^UTILITY("ROU",0)) R=+(^(0)) S $P(^(0),"^",1)=%R+R
 U 0 W !,!,%R," routines recuperees." D SKIP
 I IOT="MT" U IO W *-2 I IOPAR["L" W *-2,*-2,*-2,*-2
 G OPTQ
LOADERR S $ZT="ERR" U 0 W !,!,"[Probleme de recuperation sur routine ",ROU,".]" U IO D ERR,SKIP Q
ERR S A=$ZA,^ZRI(DAT,HEURE,ROU)="PB" U 0 W !,!,$ZE,!,"$ZA = ",A Q
OPTQ K ^UTILITY(%JO) U 0 C:$I'=IO IO K %JO,%R,A,ANS,GREF,HEAD,I
 K IO,IOBS,IOF,IOM,IOPAR,IOSL,IOST,IOT,NS,OK,OVLAY,POP,R,ROU,S,SEL,TEXT
 K V,V2,Y C 47 I %NET,$D(^ZRI(DAT,HEURE)) D RECU^%SYSINET
 Q
YN S X=$X W " (Y or N) Y=> " R A S A=$F("YyNn",$E(A)) I '(A) W !,?X G YN
 I A<4
 K A,X Q
NY S X=$X W " (Y or N) N=> " R A S A=$F("NnYy",$E(A)) I '(A) W !,?X G NY
 I A'<4
 K A,X Q
RNAM U IO R ROU S ROU=$P(ROU,$C(13),1) Q
SHOW U 0 W ?(($X+9)\10)*10,ROU W:$D(^UTILITY("ROU",ROU)) "." W:$X>70 ! Q
OK2SAV I '(OVLAY),$D(^UTILITY("ROU",ROU))
 S OK='($T) Q
RDIR I OK S ^UTILITY("ROU",ROU)="",^UTILITY(%JO,ROU)="",%R=%R+1
 Q
SAVE I OK U IO S $ZT="LOADERR" X V Q
SKIP U IO F I=0:0 R X S X=$P(X,$C(13),1) Q:X=""
 K I,X Q
OVLQ W !,!,"S' il existe deja des routines ayant le meme nom,"
 W !,"faudra t-il les ecraser ? " D NY S OVLAY=$T Q
ROUQ U 0 W !,"Save " D SHOW W "?" D NY W *
REFQ I OVLAY W !,!,". indique celles qui seront ecrasees ." Q
 D:'(OVLAY) ^%ROU Q
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
READYMT U IO S %Z=$ZA U 0 Q:((%Z\64)#2)=1  C IO
 W !,%Z,!,"Faites <RETURN> quand la bande est prete ou STOP..." R X I (X="STOP")!(X="stop") S POP=1 Q
 O @(IO_":"_IOPAR) G READYMT

