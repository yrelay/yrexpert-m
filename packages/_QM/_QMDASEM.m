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

;%QMDASEM^INT^1^59547,73877^0
DEBSEM ;
 
 
 S %DS=$P(%DAT,"/",2)_"/"_$P(%DAT,"/",1)_"/"_$P(%DAT,"/",3) D INT^%DATE S %JR=%DN D ZCEJOUR^%QMDATE4 S %PJO=$ZD(%DN-$S(%NJ="LUNDI":0,%NJ="MARDI":1,%NJ="MERCREDI":2,%NJ="JEUDI":3,%NJ="VENDREDI":4,%NJ="SAMEDI":5,%NJ="DIMANCHE":6))
 S %PJO=$P(%PJO,"/",2)_"/"_$P(%PJO,"/",1)_"/"_$P(%PJO,"/",3) Q
NSEM 
 
 S %DS="01/01/"_%ANN D INT^%DATE S %DAT=$ZD(((%NSE-1)*7)+%DN),%DAT=$P(%DAT,"/",2)_"/"_$P(%DAT,"/",1)_"/"_$P(%DAT,"/",3) D DEBSEM Q
TEST W !,"Date : " R %DAT Q:%DAT=""
 D DEBSEM W !,"Premier jour --> ",%PJO G TEST
TEST2 W !,"Semaine : " R %NSE Q:%NSE=""
 W !,"Annee   : " R %ANN G:%ANN="" TEST2
 D NSEM W !,"Premier jour --> ",%PJO G TEST2

