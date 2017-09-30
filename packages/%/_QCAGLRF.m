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

;%QCAGLRF^INT^1^59547,73875^0
ZREFGLO ;
 
 
 
 
 
 
 
 
D(%N,%TB) 
 N %EX S %EX="S %K=$ZP(@%KC)" G T
P(%N,%TB) 
 N %EX S %EX="S %K=$O(@%KC)" G T
T N %K,%G,%T,%KC,%U,%D K @(%TB) S @%TB=0
 S %T=$S(%N["(":%N_",",1:%N_"("),%G="",%D="",%U=0
LP S %KC=%T_%G_"%D)" X %EX G:%K="" FIN S %G=%G_""""_%K_""",",%U=%U+1,@%TB@(%U)=%K,@%TB=%U G LP
FIN Q
 
 
 
 
TEST K TB W !,"A tester : " R REF Q:$A(REF)<32
 W !,"Premiere : " D P^%QCAGLRF(REF,"TB")
 W !,@(TB)," cles de vues",!,! S %KC="" F %U=1:1 S %KC=$O(TB(%KC)) Q:%KC=""  W ?((%U-1)#8)*10,TB(%KC) W:(%U#8)=0 !
 W !,!,"Derniere : " D D^%QCAGLRF(REF,"TB")
 W !,@(TB)," cles de vues",!,! S %KC="" F %U=1:1 S %KC=$O(TB(%KC)) Q:%KC=""  W ?((%U-1)#8)*10,TB(%KC) W:(%U#8)=0 !
 G TEST

