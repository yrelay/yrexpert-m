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

;%TLIACTQ^INT^1^59547,74029^0
%TLIACTQ ;
 
 
 
 
 
 
DIALOGUE 
 N NOMDIAL,IND,REP,VA,JEUX
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation de dialogue en cours"))
 S POS=1
 S NOMDIAL=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible d'evaluer le nom de dialogue "))
 G:NOMDIAL="TOTEM" INDIAL
 
 I '($D(^[QUI]TLDIALF(NOMDIAL))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  le dialogue n'existe pas "))
 S JEUX=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (JEUX="")!('(POS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible d'evaluer le jeux de valeurs "))
 
 
INDIAL 
 S VA=$$RED($$RED(ACTI,2),"TEXTE"),IND=$$^%QCAZG("CXT(VA,""OBJET"")"),REP=$$^%QCAZG("CXT(VA,""BASE"")")
 I IND="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer variable ")_VA) Q
 I REP="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver repertoire de variable ")_VA) Q
 
DIAL 
 
 I NOMDIAL="" D LISTE^%QSATTRI(IND,REP,1,4,79,17,JEUX) Q 1
 I NOMDIAL="TOTEM" D DIAL^TORQSIDF(REP,IND),CLEPAG^%VVIDEO Q 1
 D DIALOGUE^%QSATTRI(REP,IND,NOMDIAL,JEUX) Q 1
 Q 1
 
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

