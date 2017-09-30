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

;%QSNOTE4^INT^1^59547,73882^0
QSNOTE4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
COPY(QUI1,BASE1,IND1,ATT1,VAL1,OR1,QUI2,BASE2,IND2,ATT2,VAL2,OR2,MODE,TYPE) 
 I MODE'=3 D DUPLN^%QSNOTE(QUI1,BASE1,IND1,OR1,QUI2,BASE2,IND2,OR2) Q
 N T,%T,P,%P,TAB
 S TAB=$C(9)
 S (P,T)=""
 D STOLK^%QMCPOZ(QUI,TYPE_TAB_BASE2_TAB_IND2_TAB_ATT2_TAB_VAL2_TAB_OR2)
 F %T=0:0 S T=$O(^[QUI1]QUERYT(BASE1,IND1,OR1,"LIGNE",T)) Q:T=""  D STOLK^%QMCPOZ(QUI,TYPE_"L"_TAB_T_TAB_^[QUI1]QUERYT(BASE1,IND1,OR1,"LIGNE",T))
 D STOLK^%QMCPOZ(QUI,TYPE_"F"_TAB_BASE2_TAB_IND2_TAB_ATT2_TAB_VAL2_TAB_OR2)
 Q

