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

;%QWMENU^INT^1^59547,73886^0
%QWMENU ;
 
 
 
 
 
 S @MNGEN="21^5^79"
 S @MNGEN@(1)=$$^%QZCHW("Activer")_"^ACTI"
 S @MNGEN@(1,"COM")=$$^%QZCHW("Activation de l'etude (les resultats precedents seront perdus)")
 
 
 S @MNGEN@(2)=$$^%QZCHW("Consulter")_"^CONS"
 S @MNGEN@(2,"COM")=$$^%QZCHW("Consulter les resultats d'une etude")
 
 
 
 
 
 
 
 S (@MNITP,@MNITC)="21^10^79"
 S (@MNITP@(1),@MNITC@(1))=$$^%QZCHW("Espace")_"^ISPACE"
 S (@MNITP@(1,"COM"),@MNITC@(1,"COM"))=$$^%QZCHW("Consultation de l'espace de travail")
 S (@MNITP@(2),@MNITC@(2))=$$^%QZCHW("Refus")_"^IREFUS"
 S (@MNITP@(2,"COM"),@MNITC@(2,"COM"))=$$^%QZCHW("Remise en cause d'une valeur produite")
 S (@MNITP@(3),@MNITC@(3))=$$^%QZCHW("Tentative")_"^IRETRY"
 S (@MNITP@(3,"COM"),@MNITC@(3,"COM"))=$$^%QZCHW("Execution d'un autre facon")
 S (@MNITP@(4),@MNITC@(4))=$$^%QZCHW("Abandon")_"^IABAND"
 S (@MNITP@(4,"COM"),@MNITC@(4,"COM"))=$$^%QZCHW("Abandon de l'etude")
 S (@MNITP@(5),@MNITC@(5))=$$^%QZCHW("Sauvegarde")_"^ISAUV"
 S (@MNITP@(5,"COM"),@MNITC@(5,"COM"))=$$^%QZCHW("Sauvegarde de l'etat actuel")
 S (@MNITP@(6),@MNITC@(6))=$$^%QZCHW("Regret")_"^REGRET"
 S (@MNITP@(6,"COM"),@MNITC@(6,"COM"))=$$^%QZCHW("Attributs dont le systeme aimerait connaitre la valeur")
 S @MNITC@(7)=$$^%QZCHW("Reprise")_"^IREPRI"
 S @MNITC@(7,"COM")=$$^%QZCHW("Reprise de l'execution")
 
 Q

