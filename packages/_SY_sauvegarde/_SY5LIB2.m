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

;%SY5LIB2^INT^1^59547,73892^0
%SY5LIB2 ;;09:30 AM  8 Jun 1993; ; 08 Jun 93  9:38 AM
 
 
L20(LIB) Q:MODTM $$^%QZCHW("+,-,(P)age,CTRLE:Acces ")_LIB_$$^%QZCHW(",ESCP:Abandon")
 Q $$^%QZCHW("+,-,(P)age,CTRLE:Acces ")_LIB_$$^%QZCHW(",BREAK:Abandon")
 
L21() Q:MODTM $$^%QZCHW("Utiliser : FLECHES pour ajouter un parametre, CTRLF pour fin, ESCP pour abandon")
 Q $$^%QZCHW("Utiliser : FLECHES pour ajouter un parametre, CTRLF pour fin, BREAK pour abandon")
 
L22() Q:MODTM $$^%QZCHW("(C)ontinuer, ESCP recommencer, CTRLF finir, RETURN pour accord")
 Q $$^%QZCHW("(C)ontinuer, BREAK recommencer, CTRLF finir, RETURN pour accord")
 
L23(LIB) Q:MODTM $S(LIB'="":LIB_", ",1:"")_$$^%QZCHW("ESCP abandon")
 Q $S(LIB'="":LIB_", ",1:"")_$$^%QZCHW("BREAK abandon")
L24() Q:MODTM $$^%QZCHW("ESCP")
 Q $$^%QZCHW("BREAK")
 
L25() Q:MODTM $$^%QZCHW("+,-,Page,CTRLE:parametres,ESCP:Abandon,CTRLF:Fin,CTRLH:Individu")
 Q $$^%QZCHW("+,-,Page,CTRLE:parametres,BREAK:Abandon,CTRLF:Fin,CTRLH:Individu")

