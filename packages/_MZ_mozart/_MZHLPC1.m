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

;%MZHLPC1^INT^1^59547,73872^0
MOZHLP ;
 
 
 
 
 
 
 
 
 
VT200 G:'(MODTM) ^%MZHLPVT D CLEPAG^%VVIDEO
 S BLD=1,DXG=0,DYH=0,LH=37,LV=5,IX=8,IY=3 D DAMIER^%VVIDEO
 S BLD=1,DXG=39,DYH=0,LH=37,LV=5,IX=8,IY=3 D DAMIER^%VVIDEO
 S BLD=1,DXG=57,DYH=5,LH=19,LV=5,IX=8,IY=3 D DAMIER^%VVIDEO
 S BLD=1,DXG=48,DYH=11,LH=28,LV=9,IX=8,IY=3 D DAMIER^%VVIDEO
 S BLD=1,DXG=39,DYH=20,LH=37,LV=3,IX=8,IY=3 D DAMIER^%VVIDEO
 
 S TT=0
TT01 I (TT'=0)&$D(^MOZ("HLPGLO")) S LI=^MOZ("HLPGLO") F %U=1:1 W ^MOZ("HLPGLO",%U) G TT02:%U=LI
 S %X=1 D CUROF^%VVIDEO F %U=0:1 S LIG=$P($T(POS+%U),";;",2) Q:$E(LIG,1)="*"  F %U1=1:1 S %U3=$P(LIG,"/",%U1) Q:%U3=""  D T1
TT02 K %U,%U1,%U2,%U3,%U4,%U5,REV,LIB,LIG Q:TT'=0
 D HLPCOM,POCLEPA^%VVIDEO W "(CTRLE) Explication detaillees ; (RETURN) Retour a la gamme " R *ED D TOUCHE^%INCCLAV(ED,.ED) G:ED'=5 FIN D ^%MZHLPC
FIN O $I D STAT^%MZWORD S EDLL=EDSL,%=3 Q
T1 S %U4=1 F %U5="LIB","REV","DX","DY" S @%U5=$P(%U3,"#",%U4),%U4=%U4+1
 S DX=DX+TT Q:(DX<79)&(TT>0)  X XY D:REV=1 REV^%VVIDEO W LIB X XY D:REV=1 NORM^%VVIDEO D CURON^%VVIDEO
 
 Q
POS ;; INVERS #1#1#1/AIDE#0#11#1/SUIVANT#0#19#1/Sup lig#0#28#1
 ;; F1     #1#1#2/ F2#0#11#2/ F3#0#20#2/ F4#0#29#2
 ;;        #1#1#3/CHERCHE #1#19#3/Res lig #1#28#3
 ;;Sup car #0#40#1/Sup mot #0#49#1/Fin lig#0#58#1/Numerot.#0#67#1
 ;;  F5   #0#40#2/F6#0#50#2/F7#0#60#2/F8#0#69#2
 ;;Res car #1#40#3/Res mot #1#49#3/Sup lig#1#59#3
 ;;Attribut#0#58#6/Nomencl.#0#67#6
 ;;  F9  #0#60#7/F10#0#69#7
 ;;Operat. #0#49#12/Pge prec#0#67#12
 ;; INSERT #0#49#13/ HOME#0#58#13/PAGE UP#0#67#13
 ;; Action #1#49#14/Deb.text#1#58#14
 ;;Sup car #0#49#16/Pge suiv#0#67#16
 ;; DELETE #0#49#17/ END#0#58#17/PAGE DN#0#67#17
 ;;Fin.text#1#58#18
 ;;GAUCHE <#1#40#21/ BAS v  #1#49#21/ HAUT ^ #1#58#21/DROITE >#1#67#21
 ;;*
C S %TAB=0
 D ^%VCRIFLD($J("",21),1,21,0,22) S DX=1,DY=EDSL+2
 X XY W "Commande: " R *ED:^TOZE($I,"ATTENTE") S ED=ED#32 I ^MOZMEM($J)=1,ED'=16 D ^%VSQUEAK G KC
 S %0=$D(^MOZ("C",+(%ED),5,ED,1))#2 D:'(%0) ^%VSQUEAK X:%0 ^(1)
KC K %0 Q
HLPCOM S DX=0,DY=5 X XY W "CTRLZ : acces aux commandes ci-dessous ",!
 S NL=0 F %ZZZ=1:1 S NL=$N(^MOZ("C",12,5,NL)) Q:NL=-1  S LG=^MOZ("C",12,5,NL,0) D AFFCOM
 K NL,LG,%ZZZ Q
AFFCOM W !,$P(LG,"^",1) S LG1=$P(LG,"^",2),PP="" F %ZXX=1:1 S P=$P(LG1," ",%ZXX) Q:P=""  D AF
 I PP'="" W ?15,PP
 Q
AF I ($L(PP)+$L(P))>23 W ?15,PP,! S PP=P_" " Q
 S PP=PP_P_" " Q
BEG X ^MOZ100 Q

