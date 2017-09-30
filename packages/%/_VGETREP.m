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

;%VGETREP^INT^1^59547,74035^0
GEGETREP ;
 
 
 W " ENTREES: TEST^%VGETREP,DETRUIT^%VGETREP,FABRIQ^%VGETREP "
 Q
INI 
 N PREF,SUF
 D ^%VGETSCR
 S PREF="^SC($J)"
 S SUF=""
 K ^REP($J)
 
SELREP 
 S SUF=$O(@PREF@(SUF))
 Q:SUF=""
 D ^%VSELREP(SUF)
 G SELREP
 
DEL 
 S PREF="^REP($J)"
 S SUF=""
DESTRUC 
 S SUF=$O(@PREF@(SUF))
 Q:SUF=""
 F I=1:1:4 K @("^[QUI]QUERY"_I_"(SUF)")
 G DESTRUC
 Q
 
FAB 
 S PREF="^SC($J)"
 S SUF=""
CONSTR 
 S SUF=$O(@PREF@(SUF))
 Q:SUF=""
 S GSTOC=^%SCRE(SUF,"GLOSTOC")
 D:$D(@GSTOC)>0 ^%VCONSRE(SUF)
 G CONSTR
 
TEST 
 D INI
 D DEL
 D FAB
 Q
 
DETRUIT 
 D INI
 D DEL
 Q
FABRIQ 
 D INI
 D FAB
 Q

