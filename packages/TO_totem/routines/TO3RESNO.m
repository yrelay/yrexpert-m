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

;TO3RESNO^INT^1^59547,74870^0
TO3RESNO ;
 
LOOP 
 S CTRLF=0,CTRLA=0,NUC=1,TOID=$P(^[QUI]TREEWORK(NUFA,0),"^",4) D ENTET S LI=$Y,NOMTREE="^[QUI]TREEWORK(NUFA",ADR="TRAIT^TO3RESNO" D ^%QCAGTU1 G ALORS
TRAIT S DATACOUR=@NOM,COMP=$P(DATACOUR,"^",2),QT=$P(DATACOUR,"^",3) D ^TO3GREF,GETNIV W !,"|",$J(NUC,4),?5+(PX*5),"* ",COMP,?60,$J(QT,10),?79,"|" S LI=LI+1 I ((LI#3)=0)&(DEV="IMPR") H 2
 I LI>LILIM D SUIT
 S NUC=NUC+1 Q
ALORS Q:(CTRLF=1)!(CTRLA=1)  W !,LSTAR Q:DEV="IMPR"  D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] pour continuer ") R RT Q
GETNIV S %CAR=",",RS=TWREF D ^%QZCHNBC S PX=%NBCAR Q
SUIT I DEV="ECR" D POCLEPA^%VVIDEO W $$L14^%QSLIB1 R *RET D TOUCHE^%INCCLAV(RET,.RET),CLEPAG^%VVIDEO S:RET=1 CTRLA=1,STOP=1 S:RET=6 STOP=1,CTRLF=1 Q:STOP=1  W !,$$^%QZCHW("Suite de la gamme de la nomenclature de :"),!,?5,TOID,!,! S LI=$Y Q
 W !,LSTAR D ENTET S LI=10 Q
ENTET H:DEV'="ECR" 5 S %PPAGE=%PPAGE+1 W #,! D ^TOHAUPAG(IMPR,%DDATE,%HHEUR,%TTITR,%PPAGE)
 W !,!,LSTAR,!,"|",?25,$$^%QZCHW("Nomenclature de :"),?79,"|",!,"|",?79,"|",!,"|",?10,TOID,?79,"|"
 W !,LSTAR,!,"|",?20,$$^%QZCHW("Composants"),?60,$$^%QZCHW("Quantite"),?79,"|",!,LSTAR
 S LI=10 Q

