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

;TOSUPSFI^INT^1^59547,74875^0
TOSUPSFI ;
 
QUES K TAB D CLEPAG^%VVIDEO W $$^%QZCHW("Suppression de tous les SF sauf : ") S DY=4
QUES1 S DX=0,DY=DY+1 X XY W "- " S DX=$X+1 D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") SUIT S TAB(Y1)=1 G QUES1
SUIT F TB="EXPLICI","IMPLICI","PHASE" S TBB="^[QUI]"_TB,AR=-1 F UU=0:0 S AR=$N(@TBB@(AR)) Q:AR=-1  I '($D(TAB(AR))) D DEL
 G FIN
DEL W !,AR,"   Destruction en cours..."
 F TTT="EXPLICI","IMPLICI","NOMENC","PHASE","FORMULE","AIMPLICI","CIMPLICI","ANOMENC","CNOMENC","AFORMULE","CFORMULE","APHASE","HM","PAR","PARP","TRI","REFLATER","IMPBIS","FONCTION","TREEIMP","KEMPLOI" S BAT="^[QUI]"_TTT_"("""_AR_""")" K @(BAT)
 K ^[QUI]VALITOLE(AR)
 S REF="VALI"_AR_"/",REF2=$E(REF,1,$L(REF)-1)_$C($A($E(REF,$L(REF))-1))_"z" F UU=0:0 S REF2=$N(^[QUI]IMPTRIP(REF2)) Q:(REF2=1)!($E(REF2,1,$L(REF))'=REF)  K ^[QUI]IMPTRIP(REF2)
FIN Q

