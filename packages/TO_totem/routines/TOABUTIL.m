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

;TOABUTIL^INT^1^59547,74871^0
TOABUTIL ;
 D CLEPAG^%VVIDEO S MSG=$$^%QZCHW("Abaques utilises")
QU D POCLEPA^%VVIDEO W $$^%QZCHW("Numero d'etude : ") S DX=$X D ^%VLEC Q:Y1=""  G QU:('($D(^[QUI]RAISON(Y1))))&('($D(^[QUI]RAISMAT(Y1))))
 K ^RESUL($J) S NUFA=Y1,ART="ART",NOMTREE="^[QUI]RAISON("""_NUFA_"""",%TAD="T0^TOABUTIL" D ^%QCAGTW S ART="MAT",NOMTREE="^[QUI]RAISMAT("""_NUFA_"""",%TAD="T0^TOABUTIL" D ^%QCAGTW
 D POCLEPA^%VVIDEO I '($D(^RESUL($J))) W $$^%QZCHW("Pas d'acces aux abaques dans cette etude  [RETURN] ") R *X G QU
QU1 D POCLEPA^%VVIDEO W $$^%QZCHW("Resultats sur (E)cran ou (I)mprimante ") R *X S X=$C(X) G:(X'=$$^%QZCHW("E"))&(X'=$$^%QZCHW("I")) QU1 S IMPR=$S(X=$$^%QZCHW("E"):0,1:^TABIDENT(WHOIS,"PRINTER")) O IMPR U IMPR
 I IMPR=0 D CLEPAG^%VVIDEO G QU2
 W !,NUFA I $D(^[QUI]TREEWORK(NUFA,0)) W " ==> ",$P(^[QUI]TREEWORK(NUFA,0),"^",4)
QU2 S ART=-1 F %U=1:1 S ART=$N(^RESUL($J,ART)) Q:ART=-1  D T2 W !,$S(ART="ART":$$^%QZCHW("Abaques de l'article"),1:$$^%QZCHW("Abaques de la matiere")),! D T1
 C IMPR G TOABUTIL
T0 S IT=$P(@%T,"^",1) Q:IT'="ABAQUE"  S IT=@%T,AB=$TR($P(IT,"^",3),"#","  "),PG=$P($P(IT,"^",2),"/",1),COL=$P($P(IT,"^",2),"/",2),^RESUL($J,ART,AB,PG,COL)=1 Q
T1 S A=-1,TB="^RESUL($J,ART)",LI=1
 F %V=0:0 S A=$N(@TB@(A)) Q:A=-1  W !,!,A S LI=LI+2 D:LI>21 T3 S PG=-1 F %V=0:0 S PG=$N(@TB@(A,PG)) Q:PG=-1  S COL=-1 F %V=0:0 S COL=$N(@TB@(A,PG,COL)) Q:COL=-1  W !,?10,$$^%QZCHW("Page "),PG,?18,$$^%QZCHW("Colonne : "),$S(COL=7:1,COL=33:2,1:3) S LI=LI+1 I LI>21 D T3
 Q
T3 Q:IMPR'=0  D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] pour continuer ") R *X D CLEPAG^%VVIDEO S LI=1 Q
T2 Q:IMPR'=0  Q:%U=1  D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] pour continuer ") R *X Q

