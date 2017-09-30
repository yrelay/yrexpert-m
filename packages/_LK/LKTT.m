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

;LKTT^INT^1^59547,74867^0
LKTT ;
 S DATA="^[QUI]LK(""AVEX"",""A2"",""53626,38050"",""DATA"")"
 S IND=$O(@DATA@(""))
 F I=1:1 Q:IND=""  D T S IND=$O(@DATA@(IND))
 Q
T S PARAM=$O(@DATA@(IND,""))
 I PARAM'="ARC" Q
TT S VAL=$O(^[QUI]CLICHE(@DATA@(IND,PARAM,0)))
 I VAL="" W *
 I VAL="" S VAL=@DATA@(IND,PARAM,0)
 W !,"IND ",IND," PARAM ",PARAM," VAL ",VAL," OVAL ",@DATA@(IND,PARAM,0)," $D ",$D(^[QUI]CLICHE(@DATA@(IND,PARAM,0)))
 S @DATA@(IND,PARAM,0)=VAL
 Q
A1 S DATA="^[QUI]LK(""AVEX"",""M"",""D"",""DATA"")"
 S IND=$O(@DATA@(""))
 F I=1:1 Q:IND=""  D T S IND=$O(@DATA@(IND))
 Q
 S PARAM=$O(@DATA@(IND,""))
 I (PARAM'="ORIGINE.EXPEDITION")&(PARAM'="DESTINATION") Q
 S VAL=$O(^[QUI]CLIENCGD($R(900000)))
 I VAL="" G TT
 S @DATA@(IND,PARAM,1)=VAL
 W !,"IND ",IND," PARAM ",PARAM," VAL ",VAL
 Q

