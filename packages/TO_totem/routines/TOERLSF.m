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

;TOERLSF^INT^1^59547,74872^0
TOERLSF ;
 
 D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("Edition du rapprochement de l'article ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S ARTI=Y1 D CLEPAG^%VVIDEO
QUES S DX=0,DY=10 X XY W $$^%QZCHW("Edition sur (E)cran ou (I)mprimante ? ") R *REP D TOUCHE^%INCCLAV(REP,.REP) G:(REP=13)!((REP=1)!(REP=6)) FIN
 S REP=$C(REP) G:(REP'=$$^%QZCHW("I"))&(REP'=$$^%QZCHW("E")) QUES S DEV=$S(REP=$$^%QZCHW("I"):"IMPR",1:"ECR") G @DEV
ECR D CLEPAG^%VVIDEO G ECRI
IMPR D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("Impression en cours... ") S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR W #
ECRI W !,!,$$^%QZCHW("Rapprochement LEXIQUE-S.F de "),ARTI,!,!,! S NUM=-1,CPT=1
 F UU=0:0 S NUM=$N(^[QUI]RAPLEXSF(ARTI,NUM)) Q:NUM=-1  S RS=^[QUI]RAPLEXSF(ARTI,NUM) W !,!,$P(RS,"|",1),!,?10,$P(RS,"|",2) S CPT=CPT+1 H:(CPT#7)=0 3
 C:DEV="IMPR" IMPR W:DEV="ECR" !,!,"RETURN" R:DEV="ECR" RET Q
 
FIN Q

