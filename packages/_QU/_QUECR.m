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

;%QUECR^INT^1^59547,73885^0
QUECR ;
 
 
 
 
 
 
 
 
 
 
 
RECT(EXG,EYH,EL,EH,XG,YH,L,H) 
 N A,DX1,DY1,DX2,DY2,XD,YB
 D MIRE^%QUECZ("NOLIB",EXG-1,EXG+EL,EYH-1,EYH+EH,.A,.DX1,.DY1)
 D XY^%VVIDEO(DX1,DY1) W "+"
 D MIRE^%QUECZ("NOLIB",EXG,EXG+EL,EYH,EYH+EH,.A,.DX2,.DY2)
 D XY^%VVIDEO(DX2,DY2) W "+"
 I (DX1=DX2)!(DY1=DY2) Q 1
 S XG=$$MIN^%QZCA(DX1,DX2)
 S YH=$$MIN^%QZCA(DY1,DY2)
 S XD=$$MAX^%QZCA(DX1,DX2)
 S YB=$$MAX^%QZCA(DY1,DY2)
 S H=(YB-YH)+1
 S L=(XD-XG)+1
 Q 0
TEST D CLEPAG^%VVIDEO
 S A=$$RECT(10,5,20,10,.XG,.YH,.L,.H)
 D CARSP^%VVIDEO(XG,YH,H,L,0)
 
 Q

