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

;%QS0DPM^INT^1^59547,73879^0
QS0DPM(TOTO) 
 
 
 
 
 
 
 S @TOTO="21^10^79"
 S @TOTO@(1)=$$^%QZCHW("Entrer")_"^ENTREE",@TOTO@(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S @TOTO@(2)=$$^%QZCHW("Lister")_"^INDIV",@TOTO@(2,"COM")=$$^%QZCHW("Lister les individus d'une liste")
 S @TOTO@(3)=$$^%QZCHW("Attributs")_"^ATTRI",@TOTO@(3,"COM")=$$^%QZCHW("Listes d'attributs pour editer les listes")
 S @TOTO@(4)=$$^%QZCHW("Graphiques")_"^GRAPH",@TOTO@(4,"COM")=$$^%QZCHW("Representations graphiques")
 S @TOTO@(5)=$$^%QZCHW("Primitives")_"^PRIM",@TOTO@(5,"COM")=$$^%QZCHW("Primitives ensemblistes sur les listes")
 S @TOTO@(6)=$$^%QZCHW("Traiter")_"^TRAIT",@TOTO@(6,"COM")=$$^%QZCHW("Traitements sur les listes")
 
 S @TOTO@(8)="+^PLUS",@TOTO@(8,"EQU")="=",@TOTO@(8,"COM")=$$^%QZCHW("Avancer d'une page")
 S @TOTO@(9)="-^MOINS",@TOTO@(9,"EQU")="_",@TOTO@(9,"COM")=$$^%QZCHW("Reculer d'une page")
 S @TOTO@(10)=$$^%QZCHW("Page")_"^PAGE",@TOTO@(10,"COM")=$$^%QZCHW("Changer de page")
 S @TOTO@(11)=$$^%QZCHW("Repere")_"^REPER",@TOTO@(11,"COM")=$$^%QZCHW("Afficher le repere des pages")
 S @TOTO@(12)=$$^%QZCHW("Requetes")_"^ALREQ",@TOTO@(12,"COM")=$$^%QZCHW("Acces aux requetes")
 
 S:$$OKR^%INCOIN("QG") @TOTO@(13)=$$^%QZCHW("Groupage")_"^GROUP",@TOTO@(13,"COM")=$$^%QZCHW("Groupage a partir d'une liste")
 Q

