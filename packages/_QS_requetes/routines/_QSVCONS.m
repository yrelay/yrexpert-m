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

;%QSVCONS^INT^1^59547,73883^0
QSVCONS ;
 
 
 
 
 N B,%B,BASE,BASI,LBASE,OBJ
 I '($D(^[QUI]RQSAUTOR(WHOIS))) D ^%VZEAVT($$^%QZCHW("Veuillez contacter YXP, vous n'etes pas autorise a choisir une base")) W $$^%QZCHW("Merci") H 1 D POCLEPA^%VVIDEO Q
 S B=-1 F %B=0:0 S B=$N(^[QUI]RQSAUTOR(WHOIS,B)) Q:B=-1  S:B'="z" LBASE(0,B)=""
 D CLEPAG^%VVIDEO,CAD,INIT^%QUCHOIP("LBASE(0)",1,"",0,3,20,7)
L0 D AFF^%QUCHOIP
 S BASE=$$UN^%QUCHOIP G:BASE="" FIN S BASI=$$NOMINT^%QSF(BASE)
 I $$REPVID^%QSGEST5(BASI) D ^%VZEAVT($$^%QZCHW("Ensemble vide")) G L0
 
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(BASI),1,"",21,3,59,7)
L1 D AFF^%QUCHOIP S OBJ=$$UN^%QUCHOIP I OBJ="" D END^%QUCHOIP G L0
 D INT(BASI,OBJ,0,10,13,80) G L1
FIN D END^%QUCHOIP Q
CAD S DXG=0,DXD=39,DYH=0,DYB=2,GRAPH=1,BIG=0,MSG=$$^%QZCHW("CONSULTER LES VISAS")
 D 4^%VZCD Q
 
INT(R,I,XG,YH,HA,LA) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N L,LVISA,REP,SX,SY,V,%V,VAL,VAT,VISA
 S RR=$$NOMINT^%QSF(R)
 S L=0,V=-1 F %V=0:0 S V=$N(^[QUI]RQSVDESC(V)) Q:V=-1  S REP=$P(^[QUI]RQSVDESC(V),"^",1) I R=REP S L=L+1,VAT=$$^%QSCALVA(RR,I,V) S:VAT="" VAT="non vise" S VAL=V_" "_$J("",20-$L(V))_VAT_" "_$J("",20-$L(VAT))_$$^%QSCALVA(RR,I,V_".DATE"),LVISA(VAL)=""
 I L=0 D ^%VZEAVT($$^%QZCHW("Aucun visa pour les ")_R) Q
 D INIT^%QUCHOIP("LVISA",1,"",XG,YH,LA,HA),AFF^%QUCHOIP
VISA S VISA=$$UN^%QUCHOIP
 D END^%QUCHOIP Q
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M," ... [RETURN]" R *DX:^TOZE($I,"ATTENTE")
 D POCLEPA^%VVIDEO Q

