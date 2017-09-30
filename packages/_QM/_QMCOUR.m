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

;%QMCOUR^INT^1^59547,73876^0
QSNHIST(ACT,XG,YH,DH,DV,BASE,IND,ATT,VAL,ORD,GLO,AFF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N SAIDIR,TYP
 S SCR="QMCOUR",NOMTAB=^%SCRE(SCR,"GLOSTOC")
 G:ACT="S" SUPP G:ACT="C" AFFI G SAIS
SAIS 
 
 
 S SAIDIR=0 I ACT="M" G:VAL'="" MOD
 S SAIDIR=1
NQ D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY S:ATT="HISTOGRAMME" VAL=$$^%VZAME1($$^%QZCHW("Nom de l'histogramme ?")) S:ATT="COURBE" VAL=$$^%VZAME1($$^%QZCHW("Nom de la courbe"))
 I VAL="" D FIN("","") S AFF=1 Q
 D CRE(BASE,IND,.VAL,.ORD)
 I VAL="" D FIN(VAL,ORD) Q
 I (TYP="duplication")&(ORD="") D FIN(VAL,ORD) Q
MOD D HISTO(BASE,IND,VAL,.ORD,ATT,NOMTAB),FIN(VAL,ORD)
 S AFF=2 Q
FIN(V,O) 
 S VAL=V,ORD=O Q
 
CRE(BASE,IND,NT,ON) 
 D POCLEPA^%VVIDEO
TYP S TYP=$$^%VZECH2("","creation","duplication") D POCLEPA^%VVIDEO I (TYP=1)!(TYP=6) S AFF=1 G VIDE
 G:(TYP'="creation")&(TYP'="duplication") TYP
 Q:TYP="creation"
 D INIT^%QUCHOIP(@NOMTAB@("QMCO",ATT,BASE,IND),1,"",XG,YH,DH,DV),AFF^%QUCHOIP S ON=$$UN^%QUCHOIP D END^%QUCHOIP
 I ON="" S AFF=2 G VIDE
 D SAISD(.ON2)
 D ADR^%QCAGLC(NOMTAB_"(""QMCO"""_ATT_""","""_BASE_""","""_IND_""","""_ON_"""",NOMTAB_"(""QMCO"""_ATT_""","""_BASE_""","""_IND_""","""_ON2_"""")
 Q
VIDE 
 S (ON,NT)="" Q
HISTO(BASE,IND,NT,ON,ATT,NOMTAB) 
 D:SAIDIR=1 SAISD(.ON)
 D:SAIDIR=1 DETP(BASE,IND,ON,ATT)
 Q:'($D(@NOMTAB@("QMCO",ATT,BASE,IND,ON)))
 D AFF^%QMCOU2(BASE,IND,ON,1,ATT,NOMTAB)
 Q:'(SAIDIR)
 S GLO("AJ",ATT,ON)=NT
 Q
SAISD(ON2) 
 S ON2=$$INVERS^%QMDATE($$DATE^%QMDATE)_" "_$$HEURE^%QMDATE_" "_WHOIS,OR=""
 K GL,T D MV^%QSCALVA(BASE,IND,ATT,.GL,.TY)
 S G="" F %G=0:0 S G=$O(GL(G)) Q:G=""  I G[ON2 S OR=G
 S ON2=ON2_" "_($P(OR," ",4)+1),GLO("AJ",ATT,ON2)=NT
 Q
DETP(BASE,IND,ON,ATT) 
 S DX=XG,DY=YH D CLEBAS^%VVIDEO
 
 S (RESUL(1),TAB(1))="QMCO",PATOUCH(1)="",(RESUL(2),TAB(2))=ATT,PATOUCH(2)="",(RESUL(3),TAB(3))=BASE,PATOUCH(3)="",(RESUL(4),TAB(4))=IND,PATOUCH(4)="",(RESUL(5),TAB(5))=ON,PATOUCH(5)=1
DEB F %U=6:1:^%SCRE(SCR) S RESUL(%U)="",PATOUCH(%U)="" I $D(^%SCRE(SCR,%U,"PATOUCH")),^%SCRE(SCR,%U,"PATOUCH")=1 S PATOUCH(%U)=1
 D ^%VAFIGRI,^%VAFISCR S ABENDSCR=0
 S CMS=0 D ^%VMODISC I ABENDSCR=1 K RESUL,PATOUCH Q
 D ^%VZEATT S ICC=1 D ^%VAFFICH,^%VAUTOST,POCLEPA^%VVIDEO G DEB
 
AFFI 
 
 
 I VAL="" D ERR Q
 S NT=VAL,ON=ORD D AFF^%QMCOU2(BASE,IND,ON,0,ATT,NOMTAB)
 D FIN(NT,ORD) S AFF=2 Q
SUPP 
 
 
 I VAL="" D ERR Q
 S AFF=1,DX=XG,DY=23 X XY
 I ATT="HISTOGRAMME" G:$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de l' histogramme ")_VAL_" ?")'=1 FINS
 I ATT="COURBE" G:$$MES^%VZEOUI($$^%QZCHW("Suppression de la courbe ")_VAL_" ?","N")'=1 FINS
 K @NOMTAB@("QMCO",ATT,BASE,IND,ORD)
 S GLO("SUP",ATT,ORD)=VAL
FINS D FIN(VAL,ORD) Q
 
 
ERR 
 D ^%VSQUEAK S AFF=0 Q
ERR(V,O) 
 S VAL=V,ORD=O Q

