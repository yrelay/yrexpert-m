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

;TORESDCT^INT^1^59547,74875^0
TORESDCT ;
 
 D ^%AB3STAR
 S LI=0,CTRLA=0,CTRLF=0,COUTOT=0,DURTOT=0 I DEV="IMPR" O IMPR S RDA=$S($D(^TABIDENT(WHOIS,"TYP.IMPR")):^TABIDENT(WHOIS,"TYP.IMPR"),1:"LC35") S:RDA="" RDA="LC35" S RDA1=RDA_"O^%VPRXCA",RDA2=RDA_"F^%VPRXCA" D @RDA1 G TR
 D CLEPAG^%VVIDEO,132^%VVIDEO
TR D ENTET S NOMTREE="^[QUI]TREEWORK(NUFA",ADR="TRAIT^TORESDCT" D ^%QCAGTU1
 W !,LOSTAR,!,"|",?100,$$^%QZCHW("TOTAUX"),?107,"| ",$J(DURTOT,9,2)," | ",$J(COUTOT,9,2)," |",!,LOSTAR
 I DEV="ECR" D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] ") R *RET D TOUCHE^%INCCLAV(RET,.RET) S:RET=1 CTRLA=1 D POCLEPA^%VVIDEO,80^%VVIDEO G FIN
 H 1 U IMPR D @RDA2
FIN K LOSTAR,RDA,RDA1,RDA2,NOMTREE,ADR,RET Q
TRAIT D ^TO3GREF S REF=@NOM,DENOM=$P(REF,"^",4),QTE=$P(REF,"^",3),COUT=$S(($D(^[QUI]COUT(NUFA,TWREF))#10)=1:^[QUI]COUT(NUFA,TWREF),1:""),DUREE=$S(($D(^[QUI]DUREE(NUFA,TWREF))#10)=1:^[QUI]DUREE(NUFA,TWREF),1:""),DURA=$P(DUREE,"^",1),DURB=$P(DUREE,"^",2)
 S DURM=(DURA+(DURB*QTE))/QTE,ART=$P(DENOM,"/",1),DENOM=$E(DENOM,$L(ART)+2,$L(DENOM)),REFER=$P(COUT,"/",2),COUT=$P(COUT,"/",1),COUTOT=COUTOT+(COUT*QTE),DURTOT=DURTOT+(DURM*QTE),LDEN=$L(DENOM),REFER=$E(REFER,1,12)
 S:COUT'="" COUT=$J(COUT,9,2) S:DURM'="" DURM=$J(DURM,9,2)
 S LI=LI+1 I ((LI#3)=0)&(DEV="IMPR") H 2
 W !,"| ",$E(ART,1,30),?32," | " S PLDIS=48 F %PLC=1:1 S VAL=$P(DENOM,"/",%PLC),LDEN=(LDEN-$L(VAL))-1,PLDIS=(PLDIS-$L(VAL))-1 Q:PLDIS<0  W VAL,"/" Q:LDEN'>0
 W ?83," | ",REFER,?98," | ",QTE,?106," | ",DURM,?118," | ",COUT,?130," |"
TR1 I LI=LILIM D SUIT Q:STOP=1
 Q:LDEN'>0  S LI=LI+1,PLDIS=48 W !,"|",?33,"| ",VAL,"/" F %CPL=%PLC+1:1 S VAL=$P(DENOM,"/",%CPL),LDEN=(LDEN-$L(VAL))-1,PLDIS=(PLDIS-$L(VAL))-1 Q:PLDIS<0  W VAL,"/" Q:LDEN'>0
 S %PLC=%CPL F XX=84,99,107,119,131 W ?XX,"|"
 G:LDEN<0 TR1 Q
SUIT S STOP=0 W !,LOSTAR
 I DEV="ECR" D POCLEPA^%VVIDEO W $$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET),CLEPAG^%VVIDEO S:RET=1 CTRLA=1,STOP=1 S:RET=6 CTRLF=1,STOP=1 Q:STOP=1  S LI=$Y Q
 D ENTET S LI=5 Q
ENTET H:DEV'="ECR" 5 W # S %PPAGE=%PPAGE+1 D ^TOHAUPAG(IMPR,%DDATE,%HHEUR,%TTITR,%PPAGE)
 W !,LOSTAR,!,"|",?12,$$^%QZCHW("ARTICLE"),?33,"|",?54,$$^%QZCHW("DENOMINATION"),?84,$$^%QZCHW("|  REFERENCE   | Qte"),?107,"|",?110,$$^%QZCHW("DUREE un."),?119,"|",?123,$$^%QZCHW("COUT un."),?131,"|",!,LOSTAR
 Q

