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

;%TLIACTU^INT^1^59547,74029^0
%TLIACTU ;
 
 
 
 
 
AJOBJ 
 N OBJ,VERS,NUM,OBJ,VO,X0,Y0,ANG,ECH,POS,MSG
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Ajout d'1 objet a 1 collection"))
 
 S COL=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom collection") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 I '($$EXI^%SDCCMS(COL,VERS)) S MSG=$$^%QZCHW("Collection inexistante") G ERR
 
 S NUM=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer numero objet") G ERR
 
 I NUM="" G AJ2
 
 I '($$NUM^%QZNBN(NUM)) S MSG=$$^%QZCHW("Numero objet non numerique") G ERR
 I $$EXOBJ^%SDCCMS(COL,VERS,NUM) S MSG=$$^%QZCHW("Numero objet existe deja") G ERR
AJ2 
 S OBJ=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom objet") G ERR
 
 S VO=$$SUBST^%ANARBR2($$RED(ACTI,5),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version objet") G ERR
 I '($$EXI^%SDOCMS(OBJ,VO)) S MSG=$$^%QZCHW("Objet inexistant") G ERR
 
 S X0=$$RED(ACTI,6),Y0=$$RED(ACTI,7)
 
 S ANG=$$RED(ACTI,8),ECH=$$RED(ACTI,9)
 
 I (((X0=0)&(Y0=0))&(ANG=0))&(ECH=0) S ECH=1 G AJ3
 S:X0="" X0=0 S:Y0="" Y0=0
 S:ANG="" ANG=0 S:ECH="" ECH=1
 S X0=$$SUBST^%ANARBR2(X0,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer abscisse origine objet") G ERR
 I '($$ENT^%QZNBN(X0)) S MSG=$$^%QZCHW("abscisse origine non conforme") G ERR
 S Y0=$$SUBST^%ANARBR2(Y0,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer ordonnee origine objet") G ERR
 I '($$ENT^%QZNBN(Y0)) S MSG=$$^%QZCHW("ordonnee origine non conforme") G ERR
 S ANG=$$SUBST^%ANARBR2(ANG,.CXT,"ATT^%TLIACT3",.POS)
 I '($$ANG^%QZNBN(ANG)) S MSG=$$^%QZCHW("angle non conforme") G ERR
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer angle objet") G ERR
 S ECH=$$SUBST^%ANARBR2(ECH,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer echelle objet") G ERR
 I '($$POS^%QZNBN(ECH)) S MSG=$$^%QZCHW("echelle non positive") G ERR
AJ3 
 D AJOBJ^%SDCCMS(COL,VERS,.NUM,OBJ,VO,X0,Y0,ANG,ECH) ;;*
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Objet de numero")_" "_NUM_" "_$$^%QZCHW("ajoute"))
 Q
 
ERR 
 D:MODAF ADD^%TLIFEN("LOG","   "_MSG)
 S ECHEC=1 Q
 
 
RETOBJ 
 N OBJ,VERS,NUM
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Retrait d'1 objet d'1 collection"))
 
 S COL=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom collection") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 I '($$EXI^%SDCCMS(COL,VERS)) S MSG=$$^%QZCHW("Collection inexistante") G ERR
 
 S NUM=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer numero objet") G ERR
 
 I '($$NUM^%QZNBN(NUM)) S MSG=$$^%QZCHW("Numero objet non numerique") G ERR
 I '($$EXOBJ^%SDCCMS(COL,VERS,NUM)) S MSG=$$^%QZCHW("Numero objet inexistant") G ERR
 
 D RETOBJ^%SDCCMS(COL,VERS,NUM)
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Objet de numero")_" "_NUM_" "_$$^%QZCHW("retire"))
 Q
 
 
POINT 
 N OBJ,VERS,NPT,XP,YP
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Maj d'un point d'1 collection"))
 
 S COL=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom collection") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 I '($$EXI^%SDCCMS(COL,VERS)) S MSG=$$^%QZCHW("Collection inexistante") G ERR
 
 S NPT=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer numero point") G ERR
 
 I '($$EXPT^%SDCCMS(COL,VERS,NPT)) S MSG=$$^%QZCHW("Numero point inexistant") G ERR
 
 S XP=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer abscisse point") G ERR
 I '($$NUM^%QZNBN(XP)) S MSG=$$^%QZCHW("abscisse du point non numerique") G ERR
 
 S YP=$$SUBST^%ANARBR2($$RED(ACTI,5),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer ordonnee point") G ERR
 I '($$NUM^%QZNBN(YP)) S MSG=$$^%QZCHW("ordonnee du point non numerique") G ERR
 
 D POINT^%SDCCMS(COL,VERS,NPT,XP,YP) ;;*
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Point")_" "_NPT_" "_$$^%QZCHW("mis a jour"))
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

