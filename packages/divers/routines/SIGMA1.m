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

;SIGMA1^INT^1^59547,74868^0
SIGMA1 ;
 
RETERR Q:%ABEND=1  S %PAAAF=0,PRF=$P($P($P(EXPFONC,"/",2),"""",2),"~",1),TYP=$P(EXPFONC,"/",3),AD=$S(TYP["DN":"C",1:"D"),%RESULTAT="" G @AD
C S LI3=1,@("LI1="_$P(EXPFONC,"/",4)),@("LI2="_$P(EXPFONC,"/",5)) I $P(EXPFONC,"/",6)'="" S @("LI3="_$P(EXPFONC,"/",6))
 K IND F AD=LI1:LI3:LI2 S IND(AD)=1
 G T0
D K IND F AD=4:1 S LI1=$P(EXPFONC,"/",AD) Q:LI1=""  S @("LI2="_LI1),IND(LI2)=1
T0 S AD=-1,%RESULTAT=0
LAD S AD=$N(IND(AD)) G:AD=-1 BON S PRFI=PRF_"."_AD G:'($D(^V($I,YA,PRFI))) FIN S %RESULTAT=%RESULTAT+^V($I,YA,PRFI) G LAD
BON S %PAAAF=1
FIN K PRF,TYP,AD,LI1,LI2,LI3,IND,PRFI Q

