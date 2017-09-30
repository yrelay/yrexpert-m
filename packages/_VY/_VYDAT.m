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

;%VYDAT^INT^1^59547,74036^0
VVYDAT ;
 
 
 
 
 
 
 
 
BEG S JR=RESUL(IC),REFUSE=0
DEB D ZD^%QMDATE4
 S JJ=$P(JR,"/",1),MM=$P(JR,"/",2),AA=$P(JR,"/",3)
 S DAAT="//",OI=1
 F OC=JJ,MM,AA S $P(DAAT,"/",OI)=$S(OC="":$P(%DAT,"/",OI),1:OC),%PCH=$P(DAAT,"/",OI) D ^%QZNBN1 G:'(ISNUM) REFUDAT S OI=OI+1
 S DD1=$F(DAAT,"/")-1 I (DD1>3)!(DD1<2) G REFUDAT
 S DD1=$F(DAAT,"/",DD1+1)-1 I (DD1>6)!(DD1<4) G REFUDAT
 F LLL=1:1:2 D NORMDA
 S DD1=$P(DAAT,"/",1),JJ=$P(DAAT,"/",2)
 
 I (JJ>12)!((JJ+0)<1) D ^%VZEAVT($$^%QZCHW("mois inconnu")) S REFUSE=1,DAAT="" Q
 
 I JJ="02" G FEV
 N NBJ
 S NBJ=$$LONGM^%QZDAJM(JJ)
 I DD1>NBJ G FIN
 G ANN
FEV 
 N BIS
 S BIS=$$BIS^%QMDATE($P(DAAT,"/",3)+0)
 I DD1>(28+BIS) G FIN
ANN 
 S DD1=0+$P(DAAT,"/",3) I (DD1>99)!(DD1<1) G REFUDAT
 Q
 
FIN D ^%VZEAVT($$^%QZCHW("nombre de jours superieur au nombre de jours du mois"))
 S REFUSE=1,DAAT=""
 Q
 
REFUDAT D ^%VZEAVT("Date sous la forme JJ/MM/AA  s.v.p. ")
 S REFUSE=1,DAAT=""
 Q
NORMDA 
 S JJ=0+$P(DAAT,"/",LLL) I ((JJ<10)&$E($P(DAAT,"/",LLL),1,1))'="0" S $P(DAAT,"/",LLL)="0"_JJ
 Q
 
FINCTR Q
 
 
CORRECT(DATE) 
 N JR,OC,JJ,MM,AA,OI,DD1,LLL,%PCH,%ISNUM
 S JR=DATE D DEB
 Q DAAT
 
 
UCONT 
 D BEG Q:REFUSE=1
 S TAB(ICC)=DAAT D ^%VAFFICH Q
 
UCONT2 
 N D
 S REFUSE=0
 S D=$$^%QMDAINT(RESUL(IC),3)
 I (D="")!(D=RESUL(IC)) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Date incorrecte"))
 Q
 
 
 
SAISIE() N L,X0,Y0,Y1 S X0=$X,Y0=$Y,L=""
SAIS1 S DX=X0,DY=Y0
 X XY W "Date : "
 S DX=$X,DY=$Y D ^%VLEC S L=$L(Y1) Q:CTRLA "" S DATE=$$CORRECT(Y1)
 I DATE="" W $J("",L) G SAIS1
 W " ("_DATE_")",! Q DATE
 
TEST W !,"Jour : " R JR Q:JR=0
 D DEB^%VYDAT W !,?10,"===> ",DAAT G TEST

