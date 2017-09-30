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

;%QS0EDM^INT^1^59547,73879^0
QS0EDM(TETE) 
 
 
 N CHCREA,ROUREAF
 S CHCREA=0,ROUREAF="REAFF^%QS0DP"
 
COMMUN K @(TETE) S @TETE="21^10^79"
 S @TETE@(1)=$$^%QZCHW("Creation")_"^"_$S(CHCREA=0:"CREA",1:"CREAREP")
 S @TETE@(1,"COM")=$$^%QZCHW("Creation d'une liste")
 S @TETE@(2)=$$^%QZCHW("Modification")_"^"_"MODI"
 S @TETE@(2,"COM")=$$^%QZCHW("Modification des objets d'une liste")
 S @TETE@(3)=$$^%QZCHW("Suppression")_"^SUPP"
 S @TETE@(3,"COM")=$$^%QZCHW("Suppression de listes")
ACT S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,TETE,.ADRES,.CONTR)
 I CONTR="R" D @ROUREAF G ACT
 Q:(CONTR="A")!(CONTR="F") 1
 G:ADRES'="" @ADRES G ACT
CREA S R=$$^%QS0EDIT(1) G FIN
CREAREP S R=$$REP^%QS0EDIT(BASE) G FIN
MODI S R=$$^%QS0EDIT(0) G FIN
SUPP S R=$$^%QS0SUPP G FIN
FIN I R=2 D @ROUREAF
 G ACT
 
 
 
 
 
 
 
 
 
 
 
REP(TETE,BASE,ROUREAF) 
 N CHCREA
 S CHCREA=1
 G COMMUN

