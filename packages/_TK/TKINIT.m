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

;TKINIT^INT^1^59547,74869^0
TKINIT ;
 
 W !,$$^%QZCHW("Global Initialization for PG&A Software") D ^TKINIT3
Z S A=$S(^TK("OS")="MSM":"INITMSM",1:"INIT"),^TK("INIT")=$P($T(@A)," ",2,999)
READ W !,!,?5,$$^%QZCHW("Initializing TKREAD - General Purpose Input code...") D ^TKREAD
DEV W !,!,$$^%QZCHW("Initializing Device Tables in ^TK..."),!,!,?5,$$^%QZCHW("Please respond Yes or No to each of the following devices.  A Yes")
 W !,?5,$$^%QZCHW("response will initialize device parameters, No will skip it.  You "),!,?5,$$^%QZCHW("may run ^TKINIT later to pick up additional device types."),!,!
 I ^TK("OS")="CCSM" D ^TKINIT5
 I ^TK("OS")="DTM" D ^TKINIT4
 I ^TK("OS")="MSM" S ^TK("8BIT")=$P($T(INITMSM+1),";",2) D ^TKINIT7
 D ^TKINIT1,^TKINIT2,^TKINIT6
 W !,!,$$^%QZCHW("Right Margin Setup")
 W !,!,?5,$$^%QZCHW("Since most of the PG&A software will not work with the Right Margin")
 W !,?5,$$^%QZCHW("set, it clears the Right Margin when it is called.  If your software"),!,?5,$$^%QZCHW("requires that the Right Margin be set back to some value when the toolkit"),!,?5
 W $$^%QZCHW("is finished, please enter that value here > ") S X="" I $D(^TK("MARGIN")) S X=^("MARGIN") W "(",+(X),") "
 R A W !,! S:A="" A=X S ^TK("MARGIN")=+(A)
 W $$^%QZCHW("Menu Driver Option"),!,!,?5,$$^%QZCHW("In the PG&A menu drivers you have the option of not having to press"),!,?5,$$^%QZCHW("the Carriage Return after the selection.  Do you want the Carriage"),!,?5,$$^%QZCHW("Return required (Y or N) > ")
 R X#5 S ^TK("MENU")="Yy"[X W "...RETURN ",$S(^("MENU"):"Required",1:"Not Required"),!
 W !,!,$$^%QZCHW("^TK Global Initialization completed"),!,! Q
SYS 
 W !,!,$$^%QZCHW("end of global initialization"),! G:$D(RET) @RET
STORE W "?" R T S A=9,B=" ;" ZI T_" ;":TEXT+0 F I=1:1 S A=$O(^TK(0,T,A)) ZI:A="" B Q:A=""  S B=B_A_"\$C(",C=^(A) X "F J=1:1:$L(C) S B=B_$A(C,J)_"",""" S B=$E(B,1,$L(B)-1)_")\" I $L(B)>160 W B,! ZI B S B=" ;"
 Q
FETCH 
 Q
 
INIT K TK W:$D(^TK($I))=0 !,!,$$^%QZCHW("Device not defined to the Toolkit - Use ^TKDEV"),!,! Q:$D(^($I))=0  S TK=^TK($I),TK(1)=0,TK("T")=^TK("TERMST"),TKP=^TK(0,TK,"P") X "F TKI=0:1:5 I $D(^TK(TKI)) X ^TK(TKI)" K TKI W TK("SET")
INITMSM K TK W:$D(^TK($I))=0 !,!,$$^%QZCHW("Device not defined to the Toolkit - Use ^TKDEV"),!,! Q:$D(^TK($I))=0  S TK=^TK($I),TK(1)=0,TK("T")=^TK("TERMST"),TKP=^TK(0,TK,"P") X "F TKI=0:1:5 I $D(^TK(TKI)) X ^TK(TKI)" K TKI W TK("SET") X:$I=1 ^TK("8BIT")
 ;
 ;

