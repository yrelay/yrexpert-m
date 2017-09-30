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

;%QSNHIST^INT^1^59547,73882^0
QSNHIST(ACT,XG,YH,DH,DV,BASE,IND,ATT,VAL,ORD,GLO,AFF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N SAIDIR,TYP
 G:ACT="S" SUPP G:ACT="C" AFFI G:ACT="I" INSE G SAIS
SAIS 
 
 
 S SAIDIR=0 I ACT="M" G:VAL'="" MOD
 S SAIDIR=1
NQ D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY S VAL=$$^%VZAME1($$^%QZCHW("Nom de l'histogramme ?"))
 I VAL="" D FIN("","") S AFF=1 Q
 D CRE(BASE,IND,.VAL,.ORD)
 I VAL="" D FIN(VAL,ORD) Q
 I (TYP="duplication")&(ORD="") D FIN(VAL,ORD) Q
MOD D HISTO(BASE,IND,VAL,.ORD),FIN(VAL,ORD)
 S AFF=2 Q
 
CRE(BASE,IND,NT,ON) 
 D POCLEPA^%VVIDEO
TYP S TYP=$$^%VZECH2("","creation","duplication") D POCLEPA^%VVIDEO I (TYP=1)!(TYP=6) S AFF=1 G VIDE
 G:(TYP'="creation")&(TYP'="duplication") TYP
 Q:TYP="creation"
 D INIT^%QUCHOIP("^[QUI]QUERYH(BASE,IND)",1,"",XG,YH,DH,DV),AFF^%QUCHOIP
 S ON=$$UN^%QUCHOIP D END^%QUCHOIP
 I ON="" S AFF=2 G VIDE
 D SAISD(.ON2)
 D ADR^%QCAGLC("^[QUI]QUERYH("""_BASE_""","""_IND_""","""_ON_"""","^[QUI]QUERYH("""_BASE_""","""_IND_""","""_ON2_"""")
 Q
VIDE 
 S (ON,NT)="" Q
 
INSE 
 
 
 
 G:VAL="" NQ
 N TAB,CTR
 S (DX,PCX)=1,(DY,PCY)=23,YG=VAL X XY W YG X XY
 S TAB("DX")=XG+2,TAB("DY")=(YH+DV)-1,TAB("PCX")=DX,TAB("PCY")=DY,TAB("%LGX")=XG-1,TAB("%LDX")=(DX+DH)-1,TAB("MSG")=$$^%QZCHW("modification du nom de l'histogramme")
 I '(DTM) O 0:(RM:1)
 D MODIF^%VLECFLD(YG,"TAB",.CTR,.VAL)
 I (VAL="")!(CTR="A") D FIN("","") S AFF=1 Q
 
 D FIN(VAL,ORD)
 S GLO("MOD",ATT,ORD)=VAL
 S AFF=2 Q
 
HISTO(BASE,IND,NT,ON) 
 I SAIDIR=1 D SAISD(.ON),DETP(BASE,IND,ON)
 I '($D(^[QUI]QUERYH(BASE,IND,ON))) K GLO S ON="" Q
 D AFF^%QSNHIS2(BASE,IND,ON,1)
 I SAIDIR S GLO("AJ",ATT,ON)=NT
 Q
 
SAISD(ON2) 
 S ON2=$$ORDRE(WHOIS,BASE,IND)
 S GLO("AJ",ATT,ON2)=NT
 Q
 
DETP(BASE,IND,ON) 
 N SCR,NOMTAB,RESUL,PATOUCH,TAB,%U,ICC,CMS,ABENDSCR,DEJALU,AFRESU
 S DX=XG,DY=YH D CLEBAS^%VVIDEO
 S SCR="QSHISTO",NOMTAB=^%SCRE(SCR,"GLOSTOC")
 D ININV
DEB F %U=4:1:^%SCRE(SCR) S RESUL(%U)="",PATOUCH(%U)="" I $D(^%SCRE(SCR,%U,"PATOUCH")),^%SCRE(SCR,%U,"PATOUCH")=1 S PATOUCH(%U)=1
 D ^%VAFIGRI,^%VAFISCR
 S (CMS,ABENDSCR)=0
 D ^%VMODISC I ABENDSCR=1 Q
 D ININV
 S ICC=1 D ^%VZEATT,^%VAFFICH,^%VAUTOST,POCLEPA^%VVIDEO
 G DEB
ININV 
 S RESUL(1)=BASE,RESUL(2)=IND,RESUL(3)=ON
 F %U=1:1:3 S TAB(%U)=RESUL(%U),PATOUCH(%U)=1
 Q
 
AFFI 
 
 
 I VAL="" D ^%VSQUEAK S AFF=0 Q
 S NT=VAL,ON=ORD
 D AFF^%QSNHIS2(BASE,IND,ON,0)
 D FIN(NT,ORD) S AFF=2 Q
 
SUPP 
 
 
 I VAL="" D ^%VSQUEAK S AFF=0 Q
 S AFF=1,DX=XG,DY=23 X XY
 G:$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de l' histogramme")_" "_VAL_" ?")'=1 FINS
 K ^[QUI]QUERYH(BASE,IND,ORD)
 S GLO("SUP",ATT,ORD)=VAL,AFF=2
FINS D FIN(VAL,ORD) Q
 
 
 
FIN(V,O) 
 S VAL=V,ORD=O Q
 
INIT(HISTO) 
 D ^%VZEATT
 K @(HISTO)
 S (ECART,NOCOL,OPTH)=1,LMARG=10,LMARD=2,LHIST=(DH-LMARG)-LMARD,HTEXT=4
 S HFHA=DV,HHIST=DV-6,FCOL="" S:'($D(LARG)) LARG=3
 D CONS
 S ECHEL=@HISTO@("MAX"),ECHEL=$S(ECHEL:ECHEL,1:1)
 S NBCOL=LHIST\(LARG+ECART) S:(NBCOL*(LARG+ECART))<LHIST NBCOL=NBCOL+1
 Q
CONS 
 N %A,%O,CPT,GL,MAX,ORDO,ABS,NUM
 S GL=^%SCRE("QSHISTO","GLOSTOC"),(CPT,MAX)=0
 S NUM="" F %A=1:1 S NUM=$O(@GL@(BASE,IND,ON,NUM)) Q:NUM=""  S ABS=$O(@GL@(BASE,IND,ON,NUM,"")) I ABS'="" S ORDO=$O(@GL@(BASE,IND,ON,NUM,ABS,"")) D INSG
 S @HISTO@("MAX")=MAX,@HISTO=CPT
 Q
INSG 
 Q:ORDO=""
 S CPT=CPT+1,@HISTO@(%A)=ORDO,@HISTO@(%A,"IND")=1
 S @HISTO@(%A,"IND",ABS)=ORDO_"^"_ABS,@HISTO@(%A,"TEXT")=ABS
 S:ORDO>MAX MAX=ORDO Q
 
ORDRE(WHOIS,BASE,IND) 
 N %G,G,OR,ON,LON
 S ON=$$INVERS^%QMDATE($$DATE^%QMDATE)_" "_$$HEURE^%QMDATE_" "_WHOIS
 S OR="",LON=$L(ON)
 S OR=$O(^[QUI]QUERYH(BASE,IND,ON))
 I $E(OR,1,LON)'=ON S OR="" G MN
 S G=OR
BC S G=$O(^[QUI]QUERYH(BASE,IND,G)) G:G="" MN
 G:$E(G,1,LON)'=ON MN
 S OR=G G BC
MN S ON=ON_" "_($P(OR," ",4)+1)
 Q ON

