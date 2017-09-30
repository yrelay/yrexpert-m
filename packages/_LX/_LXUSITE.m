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

;%LXUSITE^INT^1^59547,73871^0
LEXUSITE ;
 
 D CLEPAG^%VVIDEO
QUES S DX=0,DY=10 X XY W $$^%QZCHW("Edition sur (E)cran ou (I)mprimante ? ") R *REP D TOUCHE^%INCCLAV(REP,.REP) G:(REP=13)!((REP=1)!(REP=6)) FIN
 S REP=$C(REP) G:(REP'=$$^%QZCHW("I"))&(REP'=$$^%QZCHW("E")) QUES S DEV=$S(REP=$$^%QZCHW("I"):"IMPR",1:"ECR") G @DEV
 
ECR D CLEPAG^%VVIDEO S IMPR=0 G ECRI
IMPR D CLEPAG^%VVIDEO,MSG^%VZEATT($$^%QZCHW("Impression en cours... "))
 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR W #
ECRI I DEV="IMPR" D ^TOUSITEP
 S TEMP=15,TPAG=5,TERM=-1,PAGE=1 F UU=0:0 S TERM=$N(^[QUI]TOLEX(TERM)) Q:TERM=-1  I TERM'="z" D TRAIT S PAGE=PAGE+1 I DEV="ECR" W !,!,"RETURN " R *XX D TOUCHE^%INCCLAV(XX,.XX) G:XX=1 FIN
FIN S:'($D(DEV)) DEV="ECR" S:'($D(IMPR)) IMPR=0 W:DEV="IMPR" *23 C:DEV="IMPR" IMPR Q
TRAIT I DEV'="ECR",(PAGE#TPAG)=0 H TEMP
 D:DEV="ECR" CLEPAG^%VVIDEO
 W !,?5,WHOIS,?35,$$^%QZCHW("page "),PAGE,?65,%DAT,!,!,! D:DEV="ECR" CAG^%VVIDEO,BLD^%VVIDEO,REV^%VVIDEO W ?10,"*** ",TERM," ***" D:DEV="ECR" NORM^%VVIDEO W !,?14 S LTERM=$L(TERM) I DEV="IMPR" F VV=1:1:LTERM W "-"
 I $P(^[QUI]TOLEX(TERM),"^",1,5)="^^^^" G SYN
 D:DEV="ECR" BLD^%VVIDEO W !,!,!,?20,$$^%QZCHW("Commentaires :"),! D:DEV="ECR" NORM^%VVIDEO
 S RS=$P(^[QUI]TOLEX(TERM),"^",1,5) D ^%VKMULC
S S TT=-1 F WW=0:0 S TT=$N(%RS(TT)) Q:TT=-1  I %RS(TT)'="" D COM
 G SYN
COM I $L(%RS(TT))<50 W !,?25,"- ",%RS(TT) G FINC
 S POS=0,APOS=0 F WW=0:0 S POS=$F(%RS(TT)," ",POS) Q:POS=0  Q:POS>50  S APOS=POS
 I APOS=0 W !,?25,"- ",%RS(TT) G FINC
 S TT1=$E(%RS(TT),1,APOS-1),TT2=$E(%RS(TT),APOS,299)
 W !,?25,"- ",TT1,!,?27,TT2
FINC Q
SYN I '($D(^[QUI]TOLEXS(TERM))) G END
 D:DEV="ECR" BLD^%VVIDEO W !,!,!,?20,$$^%QZCHW("Synonymes :"),!,! D:DEV="ECR" NORM^%VVIDEO
 S SYN=-1 F WW=1:1 S SYN=$N(^[QUI]TOLEXS(TERM,SYN)) Q:SYN=-1  W ?(((WW-1)#2)*35)+10,"- ",SYN I (WW#2)=0 W !
END Q

