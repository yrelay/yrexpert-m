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

;%QFINIT3^INT^1^59547,73875^0
QFINIT3(NUFA,LISTE,LLISTEN,ATTR) 
 
 
 
 
 
 
 
 
 
 
 
 N I,L,ADR,O,J,OOBJ,OBJ,ADRO,MSG,MODE,MODE1
 S MSG=""
 S ADR=$$ADRLT^%QSGEST7(LLISTEN)
 S MODE="T"
 I (ADR=0)!(ADR="") S MODE="NT",ADR=$$ADRLIS^%QSGEST7(LLISTEN)
 I (ADR=0)!(ADR="") Q $$^%QZCHW("Impossible de rerouver les individus de la liste ")_" "_LLISTEN
 
 S O=$O(@ADR@(""))
 F I=0:0 Q:O=""  Q:MSG'=""  D TR1 S O=$O(@ADR@(O))
 Q MSG
TR1 S L=$S(MODE="T":@ADR@(O),1:O)
 D CREGR^%QFCREGR(NUFA,L)
 
 S ADRO=$$ADRLT^%QSGEST7(L),MODE1="T"
 I (ADRO=0)!(ADRO="") S MODE1="NT",ADRO=$$ADRLIS^%QSGEST7(L)
 I (ADRO=0)!(ADRO="") S MSG=$$^%QZCHW("Impossible de rerouver les individus de la liste ")_" "_L Q
 S OOBJ=$O(@ADRO@(""))
 F J=0:0 Q:OOBJ=""  S OBJ=$S(MODE1="T":@ADRO@(OOBJ),1:OOBJ) D PLACE^%QFOBJ(NUFA,ATTR,L,OBJ) S OOBJ=$O(@ADRO@(OOBJ))
 Q

