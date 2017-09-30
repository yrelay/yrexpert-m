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

;%QSVOTER^INT^1^59547,73883^0
QSVOTER ;
 
 
 
 
 N B,%B,BASE,BASI,LBASE,OBJ,SIGN
 I '($D(^[QUI]RQSAUTOR(WHOIS))) D ^%VZEAVT($$^%QZCHW("Veuillez contacter YXP, vous n'etes pas autorise a choisir une base")) W $$^%QZCHW("Merci") H 1 D POCLEPA^%VVIDEO Q
SIGN S Y1=$$^%VZAME1($$^%QZCHW("Signataire : "))
 I CTRLA!(Y1="") D POCLEPA^%VVIDEO Q
 S SIGN=Y1
 I '($D(^[QUI]RQSVSIGN(SIGN))) D ^%VZEAVT($$^%QZCHW("Signataire inconnu")) G SIGN
 S B=-1 F %B=0:0 S B=$N(^[QUI]RQSAUTOR(WHOIS,B)) Q:B=-1  S:B'="z" LBASE(0,B)=""
 D CLEPAG^%VVIDEO,CAD,INIT^%QUCHOIP("LBASE(0)",1,"",0,3,20,7)
L0 D AFF^%QUCHOIP
 S BASE=$$UN^%QUCHOIP G:BASE="" FIN S BASI=$$NOMINT^%QSF(BASE)
 I $$REPVID^%QSGEST5(BASI) D ^%VZEAVT($$^%QZCHW("Ensemble vide")) G L0
 
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(BASI),1,"",21,3,59,7)
L1 D AFF^%QUCHOIP S OBJ=$$UN^%QUCHOIP I OBJ="" D END^%QUCHOIP G L0
 D INT(BASI,OBJ,SIGN,0,10,13,80) G L1
FIN D END^%QUCHOIP Q
CAD S DXG=0,DXD=39,DYH=0,DYB=2,GRAPH=1,BIG=0,MSG="OTER LES VISAS"
 D 4^%VZCD Q
 
INT(R,I,S,XG,YH,HA,LA) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N L,LVISA,REP,SX,SY,V,%V,VISA
 S L=0,V=-1 F %V=0:0 S V=$N(^[QUI]RQSVDESC(V)) Q:V=-1  S REP=$P(^[QUI]RQSVDESC(V),"^",1) I R=REP S L=L+1,LVISA(V)=""
 I L=0 D ^%VZEAVT($$^%QZCHW("Aucun visa pour les ")_R) Q
 D INIT^%QUCHOIP("LVISA",1,"",XG,YH,LA,HA),AFF^%QUCHOIP
VISA S VISA=$$UN^%QUCHOIP I VISA'="",'($$VISE^%QSVVISE(S,VISA)) D ^%VZEAVT($$^%QZCHW("Vous n'etes pas autorise a oter ce VISA")) G VISA
 D END^%QUCHOIP Q:VISA=""
 D CLFEN^%VVIDEO(XG+1,YH+1,HA-2,LA-2)
 D CARSP^%VVIDEO(XG,YH,HA,LA,1)
 S L=((LA-2)-$L(VISA))\2,DX=XG+1,DY=YH+1
 D BLD^%VVIDEO,REV^%VVIDEO X XY W $J("",L),VISA,$J("",L)
 D NORM^%VVIDEO
 S DX=XG+2,DY=(YH+((YH+HA)-1))\2 X XY W $$^%QZCHW("Code secret : ")
CODE D ECHOFF^%VVIDEO R CODE D ECHON^%VVIDEO
 Q:CODE=""
 I CODE'=^[QUI]RQSVSIGN(S) D ^%VSQUEAK G CODE
 X XY W $J("",LA-4) X XY W "----> ",S
 D OTER($$NOMINT^%QSF(R),I,VISA)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Visa ote ...") H 2 Q
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M," ... [RETURN]" R *DX:^TOZE($I,"ATTENTE")
 D POCLEPA^%VVIDEO Q
 
OTER(REP,I,VISA) 
 
 
 
 
 
 
 
 
 
 
 D SAH^%QSGESTI(REP,I,VISA)
 D SAH^%QSGESTI(REP,I,VISA_".DATE")
 D SAH^%QSGESTI(REP,I,VISA_".HEURE")
 Q
ALL(REP,NOM) 
 
 
 
 
 S ATT="VISA." F A=0:0 S ATT=$$NXTRIA^%QSTRUC8(REP,NOM,ATT) Q:$E(ATT,1,5)'="VISA."  D SAH^%QSGESTI(REP,NOM,ATT)
 Q

