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

;%QZCHEV^INT^1^59547,73887^0
ZABREV(LIB,L,T) 
 
 
 
 
 
 
 
 
DE N %CAR
 S %CAR="."
DEB N %ABSP,%BE,%EN,%NBCAR
 N %NBC,%PART,%PART2,%LGCAR
 G:$L(LIB)'>L CO
 I %CAR'=".",LIB'[%CAR S %CAR="."
 S %NBCAR=$L(LIB,%CAR)-1,$P(%ABSP,%CAR,%NBCAR+1)=""
 I T="D" S %PART=$P(LIB,%CAR,%NBCAR+1),$P(%ABSP,%CAR,%NBCAR+1)=%PART,%BE=1,%EN=%NBCAR,%LGCAR=$L(%PART)
 I T="P" S %PART=$P(LIB,%CAR,1),$P(%ABSP,%CAR,1)=%PART,%BE=2,%EN=%NBCAR+1,%LGCAR=$L(%PART)
 I T="PD" S %PART=$P(LIB,%CAR,1),%PART2=$P(LIB,%CAR,%NBCAR+1),$P(%ABSP,%CAR,1)=%PART,$P(%ABSP,%CAR,%NBCAR+1)=%PART2,%BE=2,%EN=%NBCAR,%LGCAR=$L(%PART)+$L(%PART2)
 
 S %NBC=1
 I T'="PD",%NBCAR>0 S %NBC=((L-%LGCAR)-%NBCAR)\%NBCAR
 I T="PD",%NBCAR>1 S %NBC=((L-%LGCAR)-%NBCAR)\(%NBCAR-1)
 I %NBC<1 S %NBC=1
 F %UU=%BE:1:%EN S $P(%ABSP,%CAR,%UU)=$E($P(LIB,%CAR,%UU),1,%NBC)
 S LIB=%ABSP G:$L(LIB)'>L CO
 S LIB=$E(LIB,1,L) Q LIB
CO S LIB=LIB_$J("",L-$L(LIB)) Q LIB
 
CAR(LIB,L,T,%CAR) 
 G DEB
 
TEST W !,$$^%QZCHEV("AAAA.BBBBB.CCCC",8,"P")
 Q

