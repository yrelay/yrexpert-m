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

;%MZHLPC2^INT^1^59547,73872^0
MOZHLP ;
 
 
 
 
 
 
 
 
 
VT200 G:'(MODTM) ^%MZHLPVT D CLEPAG^%VVIDEO
 S BLD=1,DXG=0,DYH=0,LH=37,LV=5,IX=8,IY=3 D DAMIER^%VVIDEO
 S BLD=1,DXG=39,DYH=0,LH=37,LV=5,IX=8,IY=3 D DAMIER^%VVIDEO
 S BLD=1,DXG=48,DYH=5,LH=28,LV=13,IX=8,IY=3 D DAMIER^%VVIDEO
 D CARSP^%VVIDEO(57,18,3,10,1)
 S BLD=1,DXG=48,DYH=20,LH=28,LV=3,IX=8,IY=3 D DAMIER^%VVIDEO
 D BLD^%VVIDEO S DX=57,DY=20 X XY W $$CARSPE^%VVIDEO("n")
 S DX=66,DY=20 X XY W $$CARSPE^%VVIDEO("n") D NORM^%VVIDEO
 S TT=0
TT01 I (TT'=0)&$D(^MOZ("HLPGLO")) S LI=^MOZ("HLPGLO") F %U=1:1 W ^MOZ("HLPGLO",%U) G TT02:%U=LI
 S %X=1 D CUROF^%VVIDEO F %U=0:1 S LIG=$P($T(POS+%U),";;",2) Q:$E(LIG,1)="*"  F %U1=1:1 S %U3=$P(LIG,"/",%U1) Q:%U3=""  D T1
TT02 K %U,%U1,%U2,%U3,%U4,%U5,REV,LIB,LIG Q:TT'=0
 D HLPCOM^%MZHLP,POCLEPA^%VVIDEO W "(CTRLE) Explication detaillees ; (RETURN) Retour a la gamme " R *ED D TOUCHE^%INCCLAV(ED,.ED) G:ED'=5 FIN D ^%MZHLPC3
FIN O $I D CLEPAG^%VVIDEO,STAT^%MZWORD S EDLL=EDSL,%=3 Q
T1 S %U4=1 F %U5="LIB","REV","DX","DY" S @%U5=$P(%U3,"#",%U4),%U4=%U4+1
 S DX=DX+TT Q:(DX<79)&(TT>0)  X XY D:REV=1 REV^%VVIDEO W LIB X XY D:REV=1 NORM^%VVIDEO D CURON^%VVIDEO
 Q
POS ;; INVERS #1#1#1/Operat.#0#10#1/Pge suiv#0#19#1/Nomencl.#0#28#1
 ;; F10    #1#1#2/ F5#0#11#2/ F8#0#20#2/ F9#0#29#2
 ;;        #1#1#3/Action #1#10#3/Pge prec#1#19#3/def.subs#1#28#3
 ;;sup car #0#40#1/sup lig#0#49#1/sup mot#0#58#1/Suivant #0#67#1
 ;; Alt C  #0#40#2/ Alt D #0#49#2/ Alt M #0#58#2/ Alt S  #0#67#2
 ;;res car #1#40#3/res lig#1#49#3/res mot#1#58#3/recherch#1#67#3
 ;;  AIDE #0#49#6/mot svt #0#67#6
 ;; Alt X #0#49#7/ Alt W #0#58#7/ Alt J  #0#67#7
 ;;substit.#1#58#8
 ;;attrib.#0#49#10
 ;;  F7   #0#49#11/ Alt B  #0#58#11/ Alt Q  #0#67#11
 ;;deb.text#1#58#12/fin.text#1#67#12
 ;;numerot.#0#49#14/lig.suiv#0#58#14/fin lig.#0#67#14
 ;; Alt F4 #0#49#15/ Alt E  #0#58#15/  Alt F #0#67#15
 ;;GAUCHE <#1#49#21/ BAS v  #1#58#21/ HAUT ^ #1#58#19/DROITE >#1#67#21
 ;;*
C S %TAB=0
 D ^%VCRIFLD($J("",21),1,21,0,22) S DX=1,DY=EDSL+2
 X XY W "Commande: " R *ED:^TOZE($I,"ATTENTE") S ED=ED#32 I ^MOZMEM($J)=1,ED'=16 D ^%VSQUEAK G KC
 S %0=$D(^MOZ("C",+(%ED),5,ED,1))#2 D:'(%0) ^%VSQUEAK X:%0 ^(1)
KC K %0 Q
BEG X ^MOZ100 Q

