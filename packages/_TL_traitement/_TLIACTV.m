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

;%TLIACTV^INT^1^59547,74029^0
%TLIACTV ;
 
 
 
 
 
SUPELE 
 N OBJ,VERS,NUM
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Suppression d'1 element d'1 objet"))
 
 S OBJ=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom objet") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 I '($$EXI^%SDOCMS(OBJ,VERS)) S MSG=$$^%QZCHW("Objet inexistant") G ERR
 
 S NUM=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer numero element") G ERR
 
 I '($$NUM^%QZNBN(NUM)) S MSG=$$^%QZCHW("Numero element non numerique") G ERR
 I '($$EXELE^%SDOCMS(OBJ,VERS,NUM)) S MSG=$$^%QZCHW("Element inexistant") G ERR
 
 D KILL^%SDEGES2(OBJ,VERS,NUM)
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Element de numero")_" "_NUM_" "_$$^%QZCHW("supprime"))
 Q
 
ERR 
 D:MODAF ADD^%TLIFEN("LOG","   "_MSG)
 S ECHEC=1 Q
 
 
CNTCOL 
 N COL,VERS,X0,Y0,ANG,ECH
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("maj caracteristiques d'1 collection"))
 
 S COL=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer collection") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 
 S X0=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer abscisse origine") G ERR
 S:X0="" X0=0
 I '($$ENT^%QZNBN(X0)) S MSG=$$^%QZCHW("abscisse origine non conforme") G ERR
 
 S Y0=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer ordonnee origine") G ERR
 S:Y0="" Y0=0
 I '($$ENT^%QZNBN(Y0)) S MSG=$$^%QZCHW("ordonnee origine non conforme") G ERR
 
 S ANG=$$SUBST^%ANARBR2($$RED(ACTI,5),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer angle") G ERR
 S:ANG="" ANG=0
 I '($$ANG^%QZNBN(ANG)) S MSG=$$^%QZCHW("angle non conforme") G ERR
 
 S ECH=$$SUBST^%ANARBR2($$RED(ACTI,6),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer echelle") G ERR
 S:ECH="" ECH=1
 I '($$POS^%QZNBN(ECH)) S MSG=$$^%QZCHW("echelle non positive") G ERR
 
 
 D CRECOL^%SDCOCAR(COL,VERS,X0,Y0,ANG,ECH) ;;*
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("caracteristiques modifiees"))
 Q
 
 
CNTOBJ 
 N OBJ,VERS,X0,Y0
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("maj contexte d'1 objet"))
 
 S OBJ=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer objet") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 
 S X0=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer abscisse origine") G ERR
 S:X0="" X0=0
 I '($$ENT^%QZNBN(X0)) S MSG=$$^%QZCHW("abscisse origine non conforme") G ERR
 
 S Y0=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer ordonnee origine") G ERR
 S:Y0="" Y0=0
 I '($$ENT^%QZNBN(Y0)) S MSG=$$^%QZCHW("ordonnee origine non conforme") G ERR
 
 
 D CREOBJ^%SDOCNT(OBJ,VERS,X0,Y0,0,1,200,"O") ;;*
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("contexte modifie"))
 Q
 
 
SUPOBJ 
 N OBJ,VERS,POS,MSG
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Suppression d'un objet graphique"))
 
 S OBJ=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom objet") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 I '($$EXI^%SDOCMS(OBJ,VERS)) S MSG=$$^%QZCHW("Objet inexistant") G ERR
 D SUPPR^%SDOCMS(OBJ,VERS)
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Objet graphique supprime"))
 Q
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

