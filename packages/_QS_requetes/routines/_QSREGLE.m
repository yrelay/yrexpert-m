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

;%QSREGLE^INT^1^59547,73883^0
QSREGLE(ACT,XG,YH,DH,DV,BASE,IND,ATT,VAL,ORD,GLO,AFF) 
 
 N DUP,LIGN,TYP,SAIDIR
 I ACT="S" G SUPP
 I ACT="C" G AFFI
 S SAIDIR=0
 I (ACT="M")&(VAL'="") G MOD
 S SAIDIR=1
 G SAIS
 
SAIS 
 
 
NQ D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY S VAL=$$^%VZAME1($$^%QZCHW("Nom de la regle ?"))
 I $$EXISTE^%TLGEST(VAL) D ^%VZEAVT($$^%QZCHW("cette regle existe deja")) G NQ
 I VAL="" D FIN("","") S AFF=1 Q
 D CRE(BASE,IND,.VAL,.ORD)
 I VAL="" D FIN(VAL,ORD) Q
 I (TYP="duplication")&(ORD="") D FIN(VAL,ORD) Q
 D SAISD(.ON)
MOD D ^%TLSAISI(VAL),CLEPAG^%VVIDEO,FIN(VAL,ORD)
 S AFF=2 Q
 
FIN(V,O) 
 S VAL=V,ORD=O Q
 
CRE(BASE,IND,NT,ON) 
 D POCLEPA^%VVIDEO
TYP S TYP=$$^%VZECH2("","creation","duplication") D POCLEPA^%VVIDEO I (TYP=1)!(TYP=6) S AFF=1 G VIDE
 G:(TYP'="creation")&(TYP'="duplication") TYP
 Q:TYP="creation"
 D INIT^%QUCHOIP("^[QUI]TTL",1,"",XG,YH,DH,DV),AFF^%QUCHOIP S ON=$$UN^%QUCHOIP D END^%QUCHOIP
 I ON="" S AFF=2 G VIDE
 D RECTRT^%TLGEST(WHOIS,QUI,ON,WHOIS,QUI,NT,1,1)
 Q
VIDE 
 S (ON,NT)="" Q
 
SAISD(ON) 
 N GL,TY,%G,G
 S ON=$$INVERS^%QMDATE($$DATE^%QMDATE)_" "_$$HEURE^%QMDATE_" "_WHOIS
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GL") K @(GL)
 D MVG^%QSCALVA(BASE,IND,ATT,GL,.TY)
 S OR=""
 S G="" F %G=0:0 S G=$O(@GL@(G)) Q:G=""  I G[ON S OR=G
 S ON=ON_" "_($P(OR," ",4)+1),GLO("AJ",ATT,ON)=VAL
 Q
 
AFFI 
 
 
 N TTT
 I VAL="" D ERR Q
 S NT=VAL,ON=ORD
 S TTT=VAL
 D REAFFI^%TLSAISI
 D VISU^%QULIMO(0,8,80,15,"^[QUI]TTL("""_VAL_""",2)",1)
 D CLEPAG^%VVIDEO,FIN(VAL,ORD) S AFF=2 Q
 
SUPP 
 
 
 I VAL="" D ERR Q
 S AFF=1,DX=XG,DY=23 X XY
 N GL,TY,INDI
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLSUP") K @(GL)
 S NB=0 D MVG^%QSCALVA(BASE,IND,ATT,GL,.TY)
 I @GL>1 S INDI="" F I=1:1 S INDI=$O(@GL@(INDI)) Q:INDI=""  S:@GL@(INDI)=VAL NB=NB+1,ORD=INDI
 I (@GL>1)&(NB>1) D POCLEPA^%VVIDEO S DX=XG,DY=23 X XY S ORD=$$^%VZAME1($$^%QZCHW("Indice de la note ?")) G:ORD="" FINS
 S:@GL=1 ORD=$O(@GL@(""))
 D POCLEPA^%VVIDEO G:$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de la regle ")_VAL_" ?")'=1 FINS
 D SUPP^%TLINTER(VAL)
 S GLO("SUP",ATT,ORD)=VAL
FINS D FIN(VAL,ORD) Q
ERR D ^%VSQUEAK S AFF=0 Q

