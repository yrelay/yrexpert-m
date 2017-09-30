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

;%QSCOMP8^INT^1^59547,73881^0
RQSCOMP8 ;
 
 
 
PASS N FI,FFI,NFI,CALC,ENS,I,FFFI,%I,%F
 S NFI=$$RED^%ANA(A,"FILS"),I=1
 F %I=0:1 S FI=$$RED^%ANA(A,I) Q:FI=0  D CONT
 D SET^%ANA(A,"FILS",NFI)
 Q
CONT G:$$RED^%ANA(FI,"CALCUL")'="CHEMIN" FINCONT
 G:$$RED^%ANA(FI,"DESTINATION")'=BASE FINCONT
 S FFI=$$RED^%ANA(FI,1)
 G:FFI=0 FINCONT
 K ENS
 S ENS(FFI)=""
 G:$$BON FINCONT
 D KILL^%ANA(FI)
 F %I=I:1 S FFI=$$RED^%ANA(A,%I+1) Q:FFI=0  D SET^%ANA(A,%I,FFI)
 K ^[QUI]ANSA(A,%I)
 S NFI=NFI-1
 Q
FINCONT 
 S I=I+1
 Q
 
BON() 
BOUC S FFI=$O(ENS(""))
 Q:FFI="" 0
 K ENS(FFI)
 S TYP=$$RED^%ANA(FFI,"CALCUL")
 Q:(TYP'="INTERSECTION")&(TYP'="CHEMIN") 1
 I TYP="CHEMIN" S FFFI=$$RED^%ANA(FFI,1) S:FFFI'=0 ENS(FFFI)="" G BOUC
 F %I=1:1 S FFFI=$$RED^%ANA(FFI,%I) Q:FFFI=0  S ENS(FFFI)=""
 G BOUC

