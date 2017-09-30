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

;TOTBLIST^INT^1^59547,74876^0
TOTBLIST ;
 K ^TE($J),^TC($J),^TS($J),^TR($J) S PREF="PREF^TOTBLIST",POSF="POSF^TOTBLIST" D ^TOTBACK S %TE="^TE($J)",%TS="^TS($J)",%TR="^TR($J)",%TC="^TC($J)" D ^TO4TRITO
 K A,A2,F,F2,PREF,POSF,%TE,^TE($J),%TS,^TS($J),%TC,^TC($J),%TR,X1,X2 Q
PREF Q
POSF W !,"%AN = ",%AN,!," %N = ",%N Q:%NIV=0  X "S A="_$P(%N,",",1)_",F="_$P(%N,",",4)_",A2="_$P(%AN,",",1)_",F2="_$P(%AN,",",4) S X1=A_"."_F,X2=A2_"."_F2
 W !,"X1 = ",X1," X2 = ",X2 S:'($D(^TE($J,X1,X2))) ^TE($J,X1,X2)=1,^TS($J,X2,X1)=1,^TC($J,X2)=$S($D(^TC($J,X2)):^TC($J,X2)+1,1:1)
 I %FEUIL S ^TC($J,X1)=0
 Q
 
TEST W !,$$^%QZCHW("Article : ") R %ART Q:%ART=""
 W !,$$^%QZCHW("Domaine : ") R %DOM Q:%DOM=""
 W !,$$^%QZCHW("Parametre :") R %IMPL Q:%IMPL=""
 W ! D TOTBLIST Q

