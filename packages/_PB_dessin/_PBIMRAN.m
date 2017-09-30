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

;%PBIMRAN^INT^1^59547,73873^0
PTITRANS ;
 N ADRESS,CONTROL,MENUT
L0 
 D EFFBAS^%PBMEN
 S %9STR="" F I="(Z)oom","(T)ranslation","(R)otation","(O)rigine","(L)ibelles.des.points" S %9STR=%9STR_I_"  "
 D AFF^%PBMEN(0,0,%9STR),CUROFF^%PBMEN
 R *ADRESS:^TOZE($I,"ATTENTE")
 D CURON^%PBMEN
 I (ADRESS=1)!(ADRESS=6) Q
 I ADRESS=18 D RR^%PBIMCRE G L0
 S ADRESS=$C(ADRESS)
 I (ADRESS="Z")!(ADRESS=1) G ZOOM
 I (ADRESS="T")!(ADRESS=2) G TRANS
 I (ADRESS="R")!(ADRESS=3) G ROT
 I (ADRESS="O")!(ADRESS=4) G ORI
 I (ADRESS="L")!(ADRESS=5) G LIBEL
 D ^%VSQUEAK G L0
 
ZOOM D ^%PBIMZOO Q
TRANS D ^%PBIMDEP Q
ROT D ^%PBIMROT Q
ORI D ^%PBIMORI Q
LIBEL D ^%PBIMLIB Q

