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

;%QAXMOD^INT^1^59547,73875^0
ZSYMOD(CODE,SYN) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEBUT I CODE="" S CODE=$$COD^%QAX
 I CODE="" W !,"PAS DE CODE COURANT DEFINI" Q
 S MOT=CXT("@","OBJET")
 S OLDSYN=$$S^%QAX(MOT)
 I OLDSYN'="" D SUP^%QAX(CODE,MOT,OLDSYN)
 D INS^%QAX(CODE,MOT,SYN)
 Q
 
 
ADD(MOT,SYN,CODE) 
 N OLDSYN
 I CODE="" S CODE=$$COD^%QAX Q:CODE="" $$^%QZCHW("Aucun code courant n'est defini")
 S OLDSYN=$$MAITRE^%QAX(CODE,SYN)
 Q:OLDSYN=MOT ""
 I OLDSYN'="" Q SYN_" : "_$$^%QZCHW("synonyme deja utilise pour le code")_" "_CODE
 S OLDSYN=$$S2^%QAX(MOT,CODE)
 I OLDSYN'="" D SUP^%QAX(CODE,MOT,OLDSYN)
 D INS^%QAX(CODE,MOT,SYN)
 Q ""
 
 
TEST W !,"NOM DE L'INDIVIDU : " R CXT("@","OBJET")
 W !,"VALEUR DU SYNONYME : " R SYN
 S CODE=""
 D DEBUT

