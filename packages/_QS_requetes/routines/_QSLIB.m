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

;%QSLIB^INT^1^59547,73882^0
%QSLIB ;
L1() ;;NONDTM
 
 ;;FINNONDTM
 ;;DTM
 Q:MODTM $$^%QZCHW("+,-,Page,(CTRLF) fin de la gamme,(ESCP) abandon ")
 Q $$^%QZCHW("+,-,Page,(CTRLF) fin de la gamme,(BREAK) abandon ")
 ;;FINDTM
 
L2() ;;NONDTM
 
 ;;FINNONDTM
 ;;DTM
 Q:MODTM $$^%QZCHW("[RETURN] pour continuer,(ESCP) pour abandonner ")
 Q $$^%QZCHW("[RETURN] pour continuer,(BREAK) pour abandonner ")
 ;;FINDTM
 
L3(PRG) ;;NONDTM
 
 ;;FINNONDTM
 ;;DTM
 Q:MODTM $$^%QZCHW("ESCP:Abandon,"_$S(PRG="":"",1:"CTRLE:acces aux objets,")_"+,-,page,(?) repere")
 Q $$^%QZCHW("BREAK:Abandon,"_$S(PRG="":"",1:"CTRLE:acces aux objets,")_"+,-,page,(?) repere")
 ;;FINDTM
 
L4() ;;NONDTM
 
 ;;FINNONDTM
 ;;DTM
 Q:MODTM $$^%QZCHW("ESCP:Fin,CTRLE:choix d'une gamme,+,-,Page,(?)repere") Q $$^%QZCHW("BREAK:Fin,CTRLE:choix d'une gamme,+,-,Page,(?)repere") ;;FINDTM
 
L5() ;;NONDTM
 
 ;;FINNONDTM
 ;;DTM
 Q:MODTM $$^%QZCHW("(A)ttributs,(V)isualisation,(S)uppression,CTRLG:gomme,ESCP abandon")
 Q $$^%QZCHW("(A)ttributs,(V)isualisation,(S)uppression,CTRLG:gomme,BREAK abandon")
 ;;FINDTM
 
L6() ;;NONDTM
 
 ;;FINNONDTM
 ;;DTM
 Q:MODTM $$^%QZCHW("(S)election d'une gamme,CTRLG:gomme,ESCP abandon")
 Q $$^%QZCHW("(S)election d'une gamme,CTRLG:gomme,BREAK abandon")
 ;;FINDTM
 
L7 
 
 ;;FINNONDTM
 ;;DTM
 D POCLEPA^%VVIDEO
 I MODTM W $$^%QZCHW("ESCP pour finir ") Q
 W $$^%QZCHW("BREAK pour finir ") Q
 ;;FINDTM

