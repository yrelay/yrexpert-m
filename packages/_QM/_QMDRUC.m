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

;%QMDRUC^INT^1^59547,73877^0
QMDRUC ;;11:14 AM  16 Jul 1996
POP S TB="^[QUI]PLCAHOJO("""_RESUL(1)_""")" G NEX
POPF S TB="^[QUI]PLCAJOFE("""_RESUL(1)_""")" G NEX
POPPF S TB="^[QUI]PLCAPENO("""_RESUL(1)_""","""_RESUL(2)_""","""_RESUL(3)_""")" G NEX
POPP S TB="^[QUI]PLCAPEHO("""_RESUL(1)_""","""_RESUL(2)_""","""_RESUL(3)_""")" G NEX
NEX S NEX=$ZP(@TB@(""))+1,ICC=IC,TAB(ICC)=$J("",$L(RESUL(IC))) D ^%VAFFICH S TAB(ICC)=NEX D ^%VAFFICH G FIN
JOUR G REF:RESUL(IC)="" S JJ="LUNDI,MARDI,MERCREDI,JEUDI,VENDREDI,SAMEDI,DIMANCHE" F %U=1:1 S J=$P(JJ,",",%U) G REF:J="" I $E(J,1,$L(RESUL(IC)))=RESUL(IC) S ICC=IC,TAB(ICC)=J D ^%VAFFICH G FIN
HEUR G REF:RESUL(IC)="" S %DU=RESUL(IC) D ^%QMDRHEU G REF:'(%OKH) S ICC=IC,TAB(ICC)=%TI D ^%VAFFICH G FIN
MOIS G REF:RESUL(IC)="",REF:RESUL(IC-1)="" S JJ="JANVIER,FEVRIER,MARS,AVRIL,MAI,JUIN,JUILLET,AOUT,SEPTEMBRE,OCTOBRE,NOVEMBRE,DECEMBRE"
 F %U=1:1:$L(JJ,",") S J=$P(JJ,",",%U) G REF:J="" I $E(J,1,$L(RESUL(IC)))=RESUL(IC) S MS=%U,ICC=IC,TAB(ICC)=J D ^%VAFFICH G FIN:SCR="QMDRJOFE",MOISS
 G REF
MOISS S DC=RESUL(IC-1)_"/"_MS_"/"_$E(RESUL(2),1,2) K R F %U=2,3 S R(%U)=$E(RESUL(%U),5,6)_"/"_$E(RESUL(%U),3,4)_"/"_$E(RESUL(%U),1,2)
 D JDH^%QMDRSEJ(R(2),.X,.D1,.Y),JDH^%QMDRSEJ(R(3),.X,.D2,.Y),JDH^%QMDRSEJ(DC,.X,.D3,.Y) G REF:D3<D1,REF:D3>D2,FIN
PREC F %U=IC-3:1:IC G REF:RESUL(%U)=""
 S JJ="JANVIER,FEVRIER,MARS,AVRIL,MAI,JUIN,JUILLET,AOUT,SEPTEMBRE,OCTOBRE,NOVEMBRE,DECEMBRE",%V=1 K R F %U1=IC-2,IC F %U=1:1 S %W=$P(JJ,",",%U) G REF:%W="" I %W=RESUL(%U1) S R(%V)=%U,%V=%V+1 Q
 S %V=1 F %U1=IC-3,IC-1 S %W=RESUL(%U1),R(%V)=R(%V)_$S($L(%W)=1:"0",1:"")_%W,%V=%V+1
 G REF:R(1)>R(2),FIN
RES1 D ^%VYDAT G FIN:REFUSE S ICC=IC,TAB(ICC)=$J("",$L(RESUL(IC))) D ^%VAFFICH S TAB(ICC)=$P(DAAT,"/",3)_$P(DAAT,"/",2)_$P(DAAT,"/",1) D ^%VAFFICH G FIN
RES2 D ^%VYDAT G FIN:REFUSE,REF:$P(DAAT,"/",3)'=$E(RESUL(2),1,2) K R S %U=2,R(%U)=$E(RESUL(%U),5,6)_"/"_$E(RESUL(%U),3,4)_"/"_$E(RESUL(%U),1,2)
 D JDH^%QMDRSEJ(R(2),.X,.D1,.Y),JDH^%QMDRSEJ(DAAT,.X,.D2,.Y) G REF:D2<D1
 S ICC=IC,TAB(ICC)=$J("",$L(RESUL(IC))) D ^%VAFFICH S TAB(ICC)=$P(DAAT,"/",3)_$P(DAAT,"/",2)_$P(DAAT,"/",1) D ^%VAFFICH G FIN
JS S %PCH=RESUL(IC) D ^%QZNBN1 G REF:'(ISNUM) S %PCH=%PCH+0 G REF:%PCH<1,REF:%PCH>31 S ICC=IC,TAB(ICC)=$J("",$L(RESUL(IC))) D ^%VAFFICH S TAB(ICC)=%PCH D ^%VAFFICH G FIN
FIN K R,MS,TAB,%V,%W,%U1 Q
REF S REFUSE=1 G FIN
REF2 S REFUSE=2 G FIN
REF3 K ^LISM($J) G REF2
REF4 K ^PERI($J) G REF2
AN K ^PERI($J) G REF:RESUL(IC)="",ANEX:RESUL(IC)["?",ANT:RESUL(IC)["-",ANV:RESUL(IC)["," S %PCH=RESUL(IC) D ^%QZNBN1 G REF:'(ISNUM) S ^PERI($J,RESUL(IC))=1,REFUSE=0 G FIN
ANV S %V=$L(RESUL(IC),",") F %U=1:1:%V S %PCH=$P(RESUL(IC),",",%U) G REF4:%PCH="" D ^%QZNBN1 G REF4:'(ISNUM),REF4:%PCH<80,REF4:%PCH>99 S ^PERI($J,%PCH)=1
 G FIN
ANT K R S %V=1 F %PCH=$P(RESUL(IC),"-",1),$P(RESUL(IC),"-",2,999) D ^%QZNBN1 G REF4:'(ISNUM),REF4:%PCH<80,REF4:%PCH>99 S R(%V)=%PCH,%V=%V+1
 G REF4:R(1)>R(2) F %U=0:1 S R=R(1)+%U G FIN:R>R(2) S ^PERI($J,R)=1
ANEX D POCLEPA^%VVIDEO W "Exemple : 87 ou 87,88,89 ou 87-89  [RETURN] " R *X:60 D POCLEPA^%VVIDEO G REF
REG K ^LISM($J) G REF:RESUL(IC)="",REGEX:RESUL(IC)["?",REGL:RESUL(IC)[",",REF:'($D(^[QUI]PLCAREGI(RESUL(IC)))) S ^LISM($J,1)=RESUL(IC),REFUSE=0 G FIN
REGEX D ^%QMDRSRG I $D(^LISM($J)) S OICC=IC D ^%VAFIGRI,^%VAFISCR S (ICC,IC)=OICC,TAB(ICC)="ok pour cette liste !" G FIN
 S OICC=IC D ^%VAFIGRI,^%VAFISCR S (IC,ICC)=OICC G REF
REGL S %V=$L(RESUL(IC),",") F %U=1:1:%V S R=$P(RESUL(IC),",",%U) G REF3:R="",REF3:'($D(^[QUI]PLCAREGI(R))) S ^LISM(%U)=R
 G FIN
GIM G REF:RESUL(IC)="",GIMEX:RESUL(IC)["?",REF:'($D(^[QUI]PLCAREGI(RESUL(IC)))),FIN
GIMEX D ^%QMDRSER(.REG) G REF:REG="" S ICC=IC,TAB(ICC)=REG D ^%VAFFICH G FIN
 
DT D ^%VYDAT G FIN:REFUSE=1 S ICC=IC,TAB(IC)=DAAT D ^%VAFFICH
 K VIS,TAB Q

