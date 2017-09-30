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

;%PBLOYXP^INT^1^59547,73873^0
PTLOYXP ;
 C %PORT O %PORT
 S %FONC="INIT" D ^%PBPZ
 S %FONC="CLEAR" D ^%PBPZ
 S %TYPLOGO=1,%COUL=1,%9X=1100,%9Y=2400,%Z=2,%LIBEL=1,%INCLIN=1 D ^%PBMLOM
 K %9MOD S %FONC="TAILLE" D ^%PBPZ
 S %9X=2250,%9Y=3000,%FONC="MOUV" D ^%PBPZ
 S %9STR="ETUDES ET REALISATIONS",%FONC="TEXT" D ^%PBPZ
 S %9X=2300,%9Y=2900,%FONC="MOUV" D ^%PBPZ
 S %9STR="INFORMATIQUES",%FONC="TEXT" D ^%PBPZ
 S %9X=2250,%9Y=2700,%FONC="MOUV" D ^%PBPZ
 S %9STR="RECHERCHE OPERATIONNELLE",%FONC="TEXT" D ^%PBPZ
 S %9X=2400,%9Y=2500,%FONC="MOUV" D ^%PBPZ
 S %9STR=" 28, Cours Jean-Jaures",%FONC="TEXT" D ^%PBPZ
 S %9X=2400,%9Y=2400,%FONC="MOUV" D ^%PBPZ
 S %9STR=" 38000 GRENOBLE",%FONC="TEXT" D ^%PBPZ
 S %9X=2400,%9Y=2200,%FONC="MOUV" D ^%PBPZ
 S %9STR=" (76.87.88.20)",%FONC="TEXT" D ^%PBPZ
 C %PORT D ^%PBPZALF
 Q
TEST W !,"Terminal : " R %TERM Q:%TERM=""
L1 W !,"Porte    : " R %PORT G:%PORT="" TEST
 D PTLOYXP G TEST

