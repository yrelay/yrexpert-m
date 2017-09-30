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

;%QSCOMP5^INT^1^59547,73881^0
RQSCOMP5 ;
 
PASS N A,LIG,NOEUD,V
 F LIG=1:1:$ZP(^[QUI]RQS1(R,"CONTRAINTES","")) D TLIG Q:'(RESF)
 Q
TLIG 
 I '($D(^[QUI]RQS1(R,"CONTRAINTES",LIG,"TETE"))) S RESF=0 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("RQSCOMP5 : Impossible de trouver l'arbre d'analyse")) Q
 S A=^[QUI]RQS1(R,"CONTRAINTES",LIG,"TETE")
 Q:$$RED^%ANA(A,"TYPE")'="OPERATEUR.PRECEDENCE"
 S NOEUD=$$NEW^%ANA
 D SET^%ANA(NOEUD,"CALCUL","PRECEDENCE")
 S V=$$RED^%ANA($$RED^%ANA(A,1),"TEXTE")
 
 D SET^%ANA(NOEUD,1,TABIND(V))
 S V=$$RED^%ANA($$RED^%ANA(A,2),"TEXTE")
 
 D SET^%ANA(NOEUD,2,TABIND(V))
 S SAP(NOEUD)=PAPA(V)
 D SET^%ANA(NOEUD,"REPERTOIRE",$$RED^%ANA(TABIND(PAPA(V)),"REPERTOIRE"))
 D SET^%ANA(NOEUD,"SOURCE",$$RED^%ANA(TABIND(V),"REPERTOIRE"))
 Q

