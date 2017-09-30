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

;LKNMVER^INT^1^59547,74867^0
LKNMVER ;
 
NM(TYPE,GR,REC,EXTERNE,EXTBANDE,SUPPORT,IO,BASE) 
 N MSG,LE,REP,VAL,OUT2,I
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MN")
 S OUT2=$$CONCAS^%QZCHAD(TEMP,"OUT2")
 K @(TEMP)
 S MSG=""
 S MSG=$$VEREC1^LKMNVER(TYPE,.GR,REC,EXTERNE,.SUPPORT,.BASE)
 I MSG'="" D FIN Q MSG
 I SUPPORT="B" S MSG=$$BANDE^LKMNVER(TYPE,.GR,REC,EXTBANDE,.IO)
 I MSG'="" D FIN Q MSG
 
 
 S MSG=$$^LKNMCV(TYPE,.GR,REC,EXTERNE)
 I MSG'="" S MSG=$$^%QZCHW(MSG) D FIN Q MSG
 D FIN
 Q ""
FIN K @(TEMP) Q
 
NM1 S MSG=$$NM^LKMMVER(TYPE,.GR,REC,REP,OUT2)
 I MSG'="" Q
 
 Q
 
 
 
 
 
VERL(LISTE) 
 N ADRLIS,BASEL
 S ADRLIS=$$ADRLIS^%QSGEST7(LISTE)
 I (ADRLIS="")!(ADRLIS=0) Q $$^%QZCHW("Impossible de retrouver les individus de cette liste")
 Q ""
 ;

