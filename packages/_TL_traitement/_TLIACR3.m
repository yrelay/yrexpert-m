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

;%TLIACR3^INT^1^59547,74029^0
%TLIACR3 ;;01:59 PM  11 Jul 1991;
 
 
 
 
 
TXTNOTE 
 N INOT,NOMAT,II,IJ,REPC,INDC
 S REPC=CXT("@","BASE"),INDC=CXT("@","OBJET")
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Conversion d'une note en attribut"))
 S INOT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(INOT="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer indice note")) S ECHEC=1 Q
 I '($D(^[QUI]QUERYT(REPC,INDC,INOT))) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Note inconnue")) S ECHEC=1 Q
 S NOMAT=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(NOMAT="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs evaluer nom attribut")) S ECHEC=1 Q
 S II="" F IJ=1:1 S II=$O(^[QUI]QUERYT(REPC,INDC,INOT,"LIGNE",II)) Q:II=""  D PA^%QSGESTI(REPC,INDC,NOMAT,^[QUI]QUERYT(REPC,INDC,INOT,"LIGNE",II),IJ)
 Q
 
 
 
ERR D:MODAF ADD^%TLIFEN("LOG","  "_MSG)
 S ECHEC=1
 Q
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

