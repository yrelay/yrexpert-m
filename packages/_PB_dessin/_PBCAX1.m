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

;%PBCAX1^INT^1^59547,73872^0
PTCX1 ;
 
 I $D(%9X1) S %9X1=(%9X1*ENVL(%TERM,"%RED"))+ENVL(%TERM,"%PFX") S:$F(%9X1,".") %9X1=$P(%9X1,".")
 I $D(%9X2) S %9X2=(%9X2*ENVL(%TERM,"%RED"))+ENVL(%TERM,"%PFX") S:$F(%9X2,".") %9X2=$P(%9X2,".")
 I $D(%9Y1) S %9Y1=(%9Y1*ENVL(%TERM,"%RED"))+ENVL(%TERM,"%PFY") S:$F(%9Y1,".") %9Y1=$P(%9Y1,".")
 I $D(%9Y2) S %9Y2=(%9Y2*ENVL(%TERM,"%RED"))+ENVL(%TERM,"%PFY") S:$F(%9Y2,".") %9Y2=$P(%9Y2,".")
 D ^%PBCA9R,^%PBCA9L
 Q
TEST W !,"TERMINAL: " R %TERM Q:%TERM=""
B1 W !,"X1=" R %9X1 W "  Y1=" R %9Y1 W "  X2=" R %9X2 W "  Y2=" R %9Y2 G:%9X1="" TEST
 D PTCX1 W !,"X1=",%9X1,"  Y1=",%9Y1,"  X2=",%9X2,"  Y2=",%9Y2 G B1

