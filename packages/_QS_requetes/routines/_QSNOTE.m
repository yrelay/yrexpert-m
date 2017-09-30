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
;! HL002 ! HL     ! 20/07/12 ! Deviceparameter unknown                        !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSNOTE^INT^1^59547,73882^0
QSNOTE(ACT,XG,YH,DH,DV,BASE,IND,ATT,VAL,ORD,GLO,AFF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N LIGN,TYP,SAID
 S LIGN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(LIGN)
 G:ACT="S" SUPP G:ACT="C" AFFI
 G:ACT="I" INSE G SAIS
 
SAIS 
 
 
 S SAID=0
 I ACT="M" G:(VAL'="")&(ORD'="") MOD
NQ S SAID=1
 G:(VAL'="")&(ACT="M") CREORD
 D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY S VAL=$$^%VZAME1($$^%QZCHW("Nom de la note ?"))
 I VAL="" D FIN("","") S AFF=1 G END
CREORD D CRE(BASE,IND,.VAL,.ORD)
 I VAL="" D FIN(VAL,ORD) G END
 I (TYP="duplication")&(ORD="") D FIN(VAL,ORD) G END
MOD D NOT(BASE,IND,VAL,.ORD),FIN(VAL,ORD)
 S AFF=2
END K @(LIGN) Q
 
 
INSE 
 
 
 
 G:VAL="" NQ
 N TAB,CTR
 S (DX,PCX)=1,(DY,PCY)=23,YG=VAL X XY W YG X XY
 S TAB("DX")=XG+2,TAB("DY")=(YH+DV)-1,TAB("PCX")=DX,TAB("PCY")=DY,TAB("%LGX")=XG-1,TAB("%LDX")=(DX+DH)-1,TAB("MSG")=$$^%QZCHW("modification du nom de la note")
 ;HL002 I '(DTM) O 0:(RM:1)
 O $I
 D MODIF^%VLECFLD(YG,"TAB",.CTR,.VAL)
 I (VAL="")!(CTR="A") D FIN("","") S AFF=1 G END
 
 D FIN(VAL,ORD)
 S GLO("MOD",ATT,ORD)=VAL
 S AFF=2 G END
 
FIN(V,O) 
 S VAL=V,ORD=O Q
 
CRE(BASE,IND,NT,ON) 
 N DUP
 D POCLEPA^%VVIDEO
TYP S TYP=$$^%VZECH2("","creation","duplication") D POCLEPA^%VVIDEO I (TYP=1)!(TYP=6) S AFF=1 G VIDE
 G:(TYP'="creation")&(TYP'="duplication") TYP
 Q:TYP="creation"
 I '($$OKR^%INCOIN("QMEC")) D CHOIX^%QSNOTE3(XG,YH,DH,DV,ATT,"DUP") G TDUP
 
 I (BASE=$$BASE^%QMEA)&(ATT=$$AIDE^%QMEA) D CHOIX^%QMEAUT(XG,YH,DH,DV,ATT,"DUP") G TDUP
 D CHOIX^%QSNOTE3(XG,YH,DH,DV,ATT,"DUP")
TDUP I '($D(DUP)) S AFF=2 G VIDE
 D SAISD(.ON) S SAID=0
 D DUPLN(QUI,DUP("REP"),DUP("IND"),DUP("ORD"),QUI,BASE,IND,ON)
 Q
VIDE 
 S (ON,NT)="" Q
 
NOT(BASE,IND,NT,ON) 
 D:SAID=1 SAISD(.ON)
 D TETE^%QSNOTE3
 D ZLISTE3^%QULIMO(XG,YH,DH,DV,LIGN,1,"UC^%QSNOTE","UC^%QSNOTE",1)
 D INSER^%QSNOTE3(BASE,IND,ON,LIGN)
 Q
 
SAISD(ON) 
SAIS2 S ON=$$ORDRE(WHOIS,BASE,IND)
 S GLO("AJ",ATT,ON)=NT
 S:ACT="I" GLO("SUP",ATT,1)=""
 Q
UC 
 S OK=1 Q
 
COPN 
 D DUPL(BASE,IND,ON2,QUI,IND,ON)
 Q
 
AFFI 
 
 
 I VAL="" D ^%VSQUEAK S AFF=0 Q
 S NT=VAL,ON=ORD D TETE^%QSNOTE3
 D VISU^%QULIMO(XG,YH,DH,DV,LIGN,1)
 D FIN(VAL,ORD) S AFF=2 G END
 
 
SUPP 
 
 
 I VAL="" D ^%VSQUEAK S AFF=0 Q
 S AFF=1,DX=XG,DY=23 X XY
 G:$D(ORD) SUPP2
 N GL,TY,INDI
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SUP") K @(GL)
 S NB=0 D MVG^%QSCALVA(BASE,IND,ATT,GL,.TY)
 I @GL>1 S INDI="" F I=1:1 S INDI=$O(@GL@(INDI)) Q:INDI=""  S:@GL@(INDI)=VAL NB=NB+1,ORD=INDI
 I (@GL>1)&(NB>1) D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY S ORD=$$^%VZAME1($$^%QZCHW("Indice de la note ?")) G:ORD="" FINS
 S:@GL=1 ORD=$O(@GL@(""))
 K @(GL)
SUPP2 D POCLEPA^%VVIDEO
 G:$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de")_" "_VAL_" ("_ORD_") ?")'=1 FINS
 K ^[QUI]QUERYT(BASE,IND,ORD)
 S GLO("SUP",ATT,ORD)=VAL,AFF=2
FINS D FIN(VAL,ORD) Q
 
 
DUPL(BASE1,IND1,OR1,QUI2,IND2,OR2) 
 N QUI1,BASE2
 S QUI1=QUI,BASE2=BASE1
 G DUPLC
 
 
DUPLN(QUI1,BASE1,IND1,OR1,QUI2,BASE2,IND2,OR2) 
 
DUPLC 
 N T,%T,P,%P
 S (P,T)=""
 S ^[QUI2]QUERYT(BASE2,IND2,OR2,"EXIST")=""
 F %T=0:0 S T=$O(^[QUI1]QUERYT(BASE1,IND1,OR1,"LIGNE",T)) Q:T=""  S ^[QUI2]QUERYT(BASE2,IND2,OR2,"LIGNE",T)=^[QUI1]QUERYT(BASE1,IND1,OR1,"LIGNE",T)
 F %P=0:0 S P=$O(^[QUI1]QUERYT(BASE1,IND1,OR1,"PARAMETRE",P)) Q:P=""  S T="" F %T=0:0 S T=$O(^[QUI1]QUERYT(BASE1,IND1,OR1,"PARAMETRE",P,T)) Q:T=""  S ^[QUI2]QUERYT(BASE2,IND2,OR2,"PARAMETRE",P,T)=^[QUI1]QUERYT(BASE1,IND1,OR1,"PARAMETRE",P,T)
 Q
 
ORDRE(WHOIS,BASE,IND) 
 N %G,G,OR,ON,LON
 S ON=$$INVERS^%QMDATE($$DATE^%QMDATE)_" "_$$HEURE^%QMDATE_" "_WHOIS
 S OR="",LON=$L(ON)
 S OR=$O(^[QUI]QUERYT(BASE,IND,ON))
 I $E(OR,1,LON)'=ON S OR="" G MN
 S G=OR
BC S G=$O(^[QUI]QUERYT(BASE,IND,G)) G:G="" MN
 G:$E(G,1,LON)'=ON MN
 S OR=G G BC
MN S ON=ON_" "_($P(OR," ",4)+1)
 Q ON

