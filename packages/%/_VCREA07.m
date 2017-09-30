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

;%VCREA07^INT^1^59547,74034^0
GECREA07(SC,CHP) 
 S LI=^%SCRE(SC) F %UXV=CHP:1:LI-1 K ^%SCRE(SC,%UXV) S NOMTREE="^%SCRE("""_SC_""","_(%UXV+1),%TREECOP="^%SCRE("""_SC_""","_%UXV D ^%QCAGLC
 K ^%SCRE(SC,LI) S ^%SCRE(SC)=LI-1
FIN K %UXV Q
DECAL(SC,CH,X,Y) 
 S LI=^%SCRE(SC),%U=-1
LP S %U=%U+1,CHP=CH+%U G FIN:CHP>LI,LP:'($D(^%SCRE(SC,CHP))) S LIB=^%SCRE(SC,CHP,1),XX=^%SCRE(SC,CHP,2),YY=^%SCRE(SC,CHP,3),^%SCRE(SC,CHP,2)=XX+X,^%SCRE(SC,CHP,3)=YY+Y
 G LP:SC'["COMMENT",LP:$P(LIB,"~",2)'="KSP" S NU=-1
LQ S NU=$N(^%SCRE(SC,CHP,4,NU)) G LP:NU=-1 S %V=^%SCRE(SC,CHP,4,NU),TY=$P(%V,"~",2),P1=$S(TY="L":5,1:4),P2=$S(TY="L":6,1:5),$P(%V,"~",P1)=$P(%V,"~",P1)+X,$P(%V,"~",P2)=$P(%V,"~",P2)+Y,^%SCRE(SC,CHP,4,NU)=%V G LQ

