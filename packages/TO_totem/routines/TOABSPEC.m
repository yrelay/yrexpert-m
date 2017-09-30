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

;TOABSPEC^INT^1^59547,74871^0
TOABSPEC ;
 
D S %TP="D"
B K %ABSP S RS=%LIB,%CAR="." D ^%QZCHNBC S $P(%ABSP,%CAR,%NBCAR+1)=""
 D @(%TP_0) F %UU=%BE:1:%EN S $P(%ABSP,%CAR,%UU)=$E($P(%LIB,%CAR,%UU),1)
FIN K RS,%TP,%BE,%EN,%LIB,%CAR,%NBCAR Q
D0 S $P(%ABSP,%CAR,%NBCAR+1)=$P(%LIB,%CAR,%NBCAR+1),%BE=1,%EN=%NBCAR Q
P0 S $P(%ABSP,%CAR,1)=$P(%LIB,%CAR,1),%BE=2,%EN=%NBCAR+1 Q
PD0 S $P(%ABSP,%CAR,1)=$P(%LIB,%CAR,1),$P(%ABSP,%CAR,%NBCAR+1)=$P(%LIB,%CAR,%NBCAR+1),%BE=2,%EN=%NBCAR Q
P S %TP="P" G B
PD S %TP="PD" G B
 
TEST W !,$$^%QZCHW("Type d'abreviation (P,D,PD) ? ") R %TP Q:(%TP'="P")&((%TP'="D")&(%TP'="PD"))
 W !,$$^%QZCHW("A tester : ") R %LIB Q:%LIB=""
 D @(%TP_"^TOABSPEC") W !,?10,"===> ",%ABSP G TEST

