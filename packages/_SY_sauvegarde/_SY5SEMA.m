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

;%SY5SEMA^INT^1^59547,73892^0
%SY5SEMA ;;09:31 AM  8 Jun 1993; 08 Sep 92 11:53 AM ; 08 Jun 93  9:39 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ZA(PAR,SEMA,TIMEOUT) 
 L +^[PAR]SEMAPH(SEMA):TIMEOUT E  Q 0
 
 I $D(^[PAR]SEMAPH(SEMA)),^[PAR]SEMAPH(SEMA)=$J L -(^[PAR]SEMAPH(SEMA))
 S ^[PAR]SEMAPH(SEMA)=$J
 Q 1
 
 
ZD(PAR,SEMA) 
 I $D(^[PAR]SEMAPH(SEMA)),^[PAR]SEMAPH(SEMA)=$J K ^[PAR]SEMAPH(SEMA)
 
 L -(^[PAR]SEMAPH(SEMA))
 Q
 
 
INIT(PAR) 
 N SEMA,%S
 S SEMA="" F %S=0:0 S SEMA=$O(^[PAR]SEMAPH(SEMA)) Q:SEMA=""  I ^[PAR]SEMAPH(SEMA)=$J K ^[PAR]SEMAPH(SEMA)
 L
 Q
 
 
NETTOIE(PAR) 
 N SEMA,%S
 S SEMA="" F %S=0:0 S SEMA=$O(^[PAR]SEMAPH(SEMA)) Q:SEMA=""  I ^[PAR]SEMAPH(SEMA)=$J K ^[PAR]SEMAPH(SEMA) L -(^[PAR]SEMAPH(SEMA))
 Q

