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

;%ABEV04^INT^1^59547,73864^0
%ABEV04 ;
 K ^REFOK($J),VB,TBEV S %NBZ=%NBZ+1,%PF=1,TBEV="^[QUW]TOCPNUPL(NUGR,",%NBP=$ZP(PNUM(""))+0 Q:%NBP=0  F %U=1:1:%NBP S VB(%U)=""
L S VB(%PF)=$O(PNUM(%PF,VB(%PF))) G:VB(%PF)="" S S TBEV(%PF)=TBEV,TBEV("COUR")=TBEV_""""_VB(%PF)_"""" G:'($D(@(TBEV("COUR")_")"))) L G:%PF=%NBP TR S TBEV=TBEV("COUR")_",",%PF=%PF+1 G L
TR S VB("Z")=0,VB("REF")="" F %U=1:1:%NBP S:VB(%U)="z" VB("Z")=VB("Z")+1 S VB("REF")=VB("REF")_","""_VB(%U)_""""
 S VB("REF")=$E(VB("REF"),2,999),^REFOK($J,VB("Z"))=VB("REF"),VB("VAL")=@(TBEV("COUR")_")"),^REFOK($J,VB("Z"),1)=VB("VAL") G:VB("Z")=%NBZ FIN G L
S I %PF=1 G FIN
 F UU=%PF:1:%NBP S VB(UU)=""
 S %PF=%PF-1,TBEV=TBEV(%PF) G L
FIN K VB,TBEV,%NBP,%PF Q
TEST X ^ATF K PNUM S NUGR=31 F %U=1:1 W !,"%PF : " R %PF Q:%PF=""  F %V=1:1 W !,?10,"VAL : " R VAL Q:VAL=""  S PNUM(%PF,VAL)=1
 D ^%ABEV04 Q

