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

;TOVALID^INT^1^59547,74876^0
TOVALID ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("VALIDATION") D TO4^%VZCD K ^VALID($I) S B=$$^%QZCHW("DANGEREUX") D ^%INCUPA Q:B["?"  D POCLEPA^%VVIDEO S DY=5,%N=1,DX=0 X XY
 F %UU=1:1 S %LIG=$T(MENU+%UU) Q:%LIG=""  S %LIG=$P(%LIG,";;",2),LIG=$P(%LIG,";",1),PR=$P(%LIG,";",2),^VALID($I,%N)=PR W !,?$S(%N>9:9,1:10),%N,?15,LIG S %N=%N+1
 D POCLEPA^%VVIDEO W $$^%QZCHW("Votre choix (ex:1,2) : ") S DX=$X D ^%VLEC Q:(CTRLA=1)!((CTRLF=1)!(Y1=""))  K ^TBSAIS($I) F %UU=1:1 S EX=$P(Y1,",",%UU) Q:EX=""  S ^TBSAIS($I,EX)=1
 S CH=",",%N=-1 F %UU=1:1 S %N=$N(^TBSAIS($I,%N)) Q:%N=-1  I $D(^VALID($I,%N)) S %P=^VALID($I,%N) F %VV=1:1 S %PR=$P(%P,",",%VV) Q:%PR=""  S CP=","_%PR_"," I CH'[CP S CH=CH_%PR_","
 K ^VAR($I) S X=$E(CH,2,599) S:$E(X,$L(X))="," X=$E(X,1,$L(X)-1) D @X
 Q
 ;;Initialisation et protection des tables;^TOV1  c'etait le No 1
 ;;Verification totale;^TOV1,^TOV2,^TOV3,^%ABV4,^TOV6,^TOV51,^TOV52 c'etait le No 5
MENU 
 ;;Restauration du lexique;^TOV2
 ;;Verification du SF articles,matieres,machines;^TOV3
 ;;Comprehension abaques,articles,matieres,machines;^%ABV4,^TOV6,^TOV51,^TOV52
 ;;Verification selective;^TOSAISI2
 ;;Verification totale par article;^TOSAISIM

