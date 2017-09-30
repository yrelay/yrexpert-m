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

;%QAXNUC^INT^1^59547,73875^0
QAXNUC ;
 
 
 
 
 
 
EX 
 I $D(^[QUI]ZSYNONY(RESUL(1),RESUL(ICC))) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Le mot maitre")_" "_RESUL(ICC)_" "_$$^%QZCHW("a deja un synonyme sous le code")_" "_RESUL(1)) Q
 S REFUSE=0 Q
 
EXSYN 
 N A
 S A=$O(^[QUI]ZSYNINV(RESUL(1),RESUL(ICC),""))
 I A'="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("le synonyme")_" "_RESUL(ICC)_" "_$$^%QZCHW("est deja utilise pour le mot maitre")_" "_A) Q
 S REFUSE=0 Q
 
SUP() 
 D DEL(RESUL(1),RESUL(2),RESUL(3))
 Q 0
 
MOD() 
 N A,B,C
 S A=OR(1),B=OR(2),C=OR(3)
 D STOCK I '(ABENDSCR) D DEL(A,B,C)
 Q 0
 
DUP() 
 S ABENDSCR=0
 I AFRESU(1)=RESUL(1) D DUP1 Q:ABENDSCR 0
 D STOCK Q 0
 
STOCK 
 S ABENDSCR=1
 I ((RESUL(1)="")!(RESUL(2)=""))!(RESUL(3)="") D ^%VZEAVT($$^%QZCHW("Tous les champs doivent etre definis")) Q
 I $D(^[QUI]ZSYNONY(RESUL(1),RESUL(2))) D ^%VZEAVT($$^%QZCHW("Le mot maitre")_" "_RESUL(2)_" "_$$^%QZCHW("a deja un synonyme sous le code")_" "_RESUL(1)) Q
 N A
 S A=$O(^[QUI]ZSYNINV(RESUL(1),RESUL(3),""))
 I A'="" D ^%VZEAVT($$^%QZCHW("le synonyme")_" "_RESUL(3)_" "_$$^%QZCHW("est deja utilise pour le mot maitre")_" "_A) Q
 S ^[QUI]ZSYNONY(RESUL(1),RESUL(2),RESUL(3))="",^[QUI]ZSYNINV(RESUL(1),RESUL(3),RESUL(2))=""
 S ABENDSCR=0
 Q
 
 
 
DUP1 I (AFRESU(2)'=RESUL(2))&(AFRESU(3)'=RESUL(3)) Q
 D ^%VZEAVT($$^%QZCHW("Les synonymes et mots maitres doivent se correspondre de facon unique")_", "_AFRESU(2)_" --> "_AFRESU(3)_" et "_RESUL(2)_" --> "_RESUL(3)_" "_$$^%QZCHW("est invalide "))
 S ABENDSCR=1 Q
 
DEL(COD,M,S) 
 K ^[QUI]ZSYNONY(COD,M,S),^[QUI]ZSYNINV(COD,S,M)
 Q

