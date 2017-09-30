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

;TOP0CTRD^INT^1^59547,74873^0
TOP0CTRD ;
 
 D ZD^%QMDATE4 S JJ=$P(JR,"/",1),MM=$P(JR,"/",2),AA=$P(JR,"/",3)
 S DAAT="//",OI=1 F OC=JJ,MM,AA S $P(DAAT,"/",OI)=$S(OC="":$P(%DAT,"/",OI),1:OC),OI=OI+1
 S DD1=$F(DAAT,"/")-1 I (DD1>3)!(DD1<2) D REFUDAT G FINCTR
 S DD1=$F(DAAT,"/",DD1+1)-1 I (DD1>6)!(DD1<4) D REFUDAT G FINCTR
 F LLL=1:1:2 D NORMDA
 S DD1=$P(DAAT,"/",1),JJ=$P(DAAT,"/",2) I ((DD1>31)!(JJ>12))!((JJ="02")&(DD1>29)) D REFUDAT G FINCTR
 S DD1=0+$P(DAAT,"/",3) I (DD1>99)!(DD1<1) D REFUDAT G FINCTR
 G FINCTR
REFUDAT Q
 Q
NORMDA S JJ=0+$P(DAAT,"/",LLL) I ((JJ<10)&$E($P(DAAT,"/",LLL),1,1))'="0" S $P(DAAT,"/",LLL)="0"_JJ
 Q
FINCTR K OI,JJ,JR,MM,AA,OC,%DAT,DD1,LLL,REFUSE Q

