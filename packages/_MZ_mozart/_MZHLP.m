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

;%MZHLP^INT^1^59547,73872^0
MOZHLP ;
 
 
 
 
 
 
 
 
VT100 X XY D NORM^%VVIDEO I DTM G ^%MZHLPC2
 W @(FF)
 S BLD=1,DXG=0,DYH=0,LH=37,LV=5,IX=8,IY=3 D DAMIER^%VVIDEO S BLD=1,DXG=39,DYH=0,LH=37,LV=21,IX=8,IY=3 D DAMIER^%VVIDEO S TT=0
TT01 I (TT'=0)&$D(^MOZ("HLPGLO")) S LI=^MOZ("HLPGLO") F %U=1:1 W ^MOZ("HLPGLO",%U) G TT02:%U=LI
 S %X=1 D CUROF^%VVIDEO F %U=0:1 S LIG=$P($T(POS+%U),";;",2) Q:$E(LIG,1)="*"  F %U1=1:1 S %U3=$P(LIG,"/",%U1) Q:%U3=""  D T1
TT02 K %U,%U1,%U2,%U3,%U4,%U5,REV,LIB,LIG Q:TT'=0
 D HLPCOM,POCLEPA^%VVIDEO W "(CTRLE) Explication detaillees ; (RETURN) Retour a la gamme " R *ED G:ED'=5 FIN D ^%MZHLPD
FIN D OPEN^%SYSUTI1($I,80,""),STAT^%MZWORD S EDLL=EDSL,%=3 Q
T1 S %U4=1 F %U5="LIB","REV","DX","DY" S @%U5=$P(%U3,"#",%U4),%U4=%U4+1
 S DX=DX+TT Q:(DX<79)&(TT>0)  X XY D:REV=1 REV^%VVIDEO W LIB X XY D:REV=1 NORM^%VVIDEO D CURON^%VVIDEO
 Q
POS ;;HAUT#0#2#1/BAS#0#11#1/GAUCHE#0#20#1/DROITE#0#29#1/ INVERS #1#40#1/AIDE#0#50#1/SUIVANT#0#58#1/Sup lig#0#67#1
 ;;  PF1   #1#40#2/PF2#0#50#2/PF3#0#60#2/PF4#0#69#2
 ;;^#0#4#3/v#0#13#3/<#0#22#3/>#0#31#3/ LIENS  #1#40#3/CHERCHE#1#58#3/Res lig #1#67#3
 ;;Attr.OP.#0#40#5/Pag suiv#0#49#5/ LIENS  #0#58#5/Sup mot#0#67#5
 ;;7#0#43#6/8#0#52#6/9#0#61#6/-#0#70#6
 ;; Command#1#40#7/Pag prec#1#49#7/Remplace#1#58#7/Res mot #1#67#7
 ;;Sup car#0#67#9
 ;;4#0#43#10/5#0#52#10/6#0#61#10/,#0#70#10
 ;;Ins. op#0#59#9/ Ins act#1#58#11
 ;;Fin text#1#40#11/Deb text#1#49#11/Res car #1#67#11
 ;;Mot suiv#0#40#13/Fin lig#0#49#13/Numerot.#0#58#13/ Return #0#67#13
 ;;1#0#43#14/2#0#52#14/3#0#61#14
 ;;Reper.ga#1#40#15/ Sup lig#1#49#15/Repert.#1#58#15
 ;;        #0#67#16
 ;;Debut lig suiv#0#42#17
 ;;0#0#48#18/.#0#61#18/Substitu#1#67#18
 ;;  Return    #1#42#19
 ;;*
C S %TAB=0
 D ^%VCRIFLD($J("",21),1,21,0,22) S DX=1,DY=EDSL+2
 X XY D NORM^%VVIDEO W "Commande: " R *ED:^TOZE($I,"ATTENTE") S ED=ED#32 I ^MOZMEM($J)=1,ED'=16 D ^%VSQUEAK G KC
 S %0=$D(^MOZ("C",+(%ED),5,ED,1))#2 D:'(%0) ^%VSQUEAK X:%0 ^(1)
KC X ^MOZ("C",12,6)
 I '(DTM) O 0:(RM:"S":"")
 K %0 Q
HLPCOM S DX=0,DY=5 X XY W "CTRLZ : acces aux commandes ci-dessous ",!
 S NL=0 F %ZZZ=1:1 S NL=$N(^MOZ("C",12,5,NL)) Q:NL=-1  S LG=^MOZ("C",12,5,NL,0) D AFFCOM
 K NL,LG,%ZZZ Q
AFFCOM Q:$P(LG,"^",1)=""  W !,$P(LG,"^",1) S LG1=$P(LG,"^",2),PP="" F %ZXX=1:1 S P=$P(LG1," ",%ZXX) Q:P=""  D AF
 I PP'="" W ?15,PP
 Q
AF I ($L(PP)+$L(P))>23 W ?15,PP,! S PP=P_" " Q
 S PP=PP_P_" " Q
BEG X ^MOZ100 Q
