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

;TOABGRIL^INT^1^59547,74871^0
TOABGRIL ;
 
 
 
 
 
 N NA,NI,PAGE,PR,LIG,COL,I,J,K,L,M,N
 I '($D(QUI)) W !,"Utilisateur inconnu..." Q
 S NA=$O(^[QUI]OCGRIL(""))
 F I=1:1 W !,NA Q:NA=""  D NI S NA=$O(^[QUI]OCGRIL(NA))
 Q
NI 
 S NI=$O(^[QUI]OCGRIL(NA,""))
 F J=1:1 Q:NI=""  D PAGE S NI=$O(^[QUI]OCGRIL(NA,NI))
 Q
PAGE 
 S PAGE=$O(^[QUI]OCGRIL(NA,NI,""))
 F K=1:1 Q:PAGE=""  D PR S PAGE=$O(^[QUI]OCGRIL(NA,NI,PAGE))
 Q
PR 
 S PR=$O(^[QUI]OCGRIL(NA,NI,PAGE,""))
 F L=1:1 Q:PR=""  D LIG S PR=$O(^[QUI]OCGRIL(NA,NI,PAGE,PR))
 Q
LIG 
 S LIG=$O(^[QUI]OCGRIL(NA,NI,PAGE,PR,""))
 F M=1:1 Q:LIG=""  D COL S LIG=$O(^[QUI]OCGRIL(NA,NI,PAGE,PR,LIG))
 Q
COL 
 S COL=$O(^[QUI]OCGRIL(NA,NI,PAGE,PR,LIG,""))
 F N=1:1 Q:COL=""  D INT S COL=$O(^[QUI]OCGRIL(NA,NI,PAGE,PR,LIG,COL))
 Q
INT 
 I ((COL'=10)&(COL'=33))&(COL'=56) S ^[QUI]WRONGAB($I,NA,NI,PAGE,PR,LIG,COL)="" W "Erreur..."
 Q

