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

;%SDESFLE^INT^1^59547,73889^0
SDESFLE(XD,YD,XA,YA,TYPL,VIS,OK,OBLI) 
 
 
 
 
 N R,TYP,D,ANGLE,ANG1,X1,X2,Y1,Y2,XX,YY
 S OK=1
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
DEB 
 D EFFBAS^%SDUMEN
 D AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez le point de depart de la fleche avec la mire"))
L0 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XD,.YD)
 I R=0,OBLI G L0
 D EFFBAS^%SDUMEN
 I R=0 S OK=0 Q
 D POINT^%PBMFN(XD,YD,0)
 
L11 D AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez le point d'arrivee de la fleche avec la mire"))
L1 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA)
 I R=0,OBLI G L1
 D EFFBAS^%SDUMEN
 I R=0 D POINT^%PBMFN(XD,YD,1) S OK=0 Q
 I (XD=XA)&(YD=YA) D ^%VSQUEAK G L11
 S ANGLE=$$ANGLE^%PBCACV(XD,YD,XA,YA)
 D AFFDRO(0),SIMPIN
 Q
CAL(XX,YY,ANGLE,SENS,X1,Y1,X2,Y2) 
 S D=40*SENS
 S ANG1=(150+ANGLE)#360,ANG2=(210+ANGLE)#360
 
 S X1=XX+(D*$$COS^%PBCACV(ANG1)),Y1=YY+(D*$$SIN^%PBCACV(ANG1))
 
 S X2=XX+(D*$$COS^%PBCACV(ANG2)),Y2=YY+(D*$$SIN^%PBCACV(ANG2))
 Q
AFFDRO(EF) 
 
 
 D DROITE^%PBMFN(XD,YD,XA,YA,EF,TYPL,VIS)
 Q
AFFSEG(XX,YY,X1,Y1,X2,Y2,EF) 
 
 
 D DROITE^%PBMFN(XX,YY,X1,Y1,EF,TYPL,VIS)
 D DROITE^%PBMFN(XX,YY,X2,Y2,EF,TYPL,VIS)
 Q
EFFSEG 
 D CAL(XA,YA,ANGLE,1,.X1,.Y1,.X2,.Y2)
 D DROITE^%PBMFN(XA,YA,X1,Y1,1,TYPL,VIS)
 D DROITE^%PBMFN(XA,YA,X2,Y2,1,TYPL,VIS)
 D EFF^%PBP5EC(0)
 Q
 
EFF(XD,YD,XA,YA,TYPL,VIS) 
 N R,TYP,D,ANGLE,ANG1,X1,X2,Y1,Y2
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
 S ANGLE=$$ANGLE^%PBCACV(XD,YD,XA,YA)
 D EFF11
 D EFF^%PBP5EC(0)
 Q
EFF11 D EFFSEG
 D POINT^%PBMFN(XD,YD,1),POINT^%PBMFN(XA,YA,1)
 D DROITE^%PBMFN(XD,YD,XA,YA,1,TYPL,VIS)
 Q
 
EXT(OBJ,VERS,EL,XD,YD,XA,YA,TYPL,VIS) 
 N R,D,ANGLE,ANG1,X1,X2,Y1,Y2,TYPE,ORIENT
 D INIT
 S ANGLE=$$ANGLE^%PBCACV(XD,YD,XA,YA)
 D ^%PBPZGRA
 D AFFDRO(0)
 G REAF2
 
REAF(OBJ,VERS,EL,XD,YD,XA,YA,TYPL,VIS) 
 N R,D,ANGLE,ANG1,X1,X2,Y1,Y2,TYPE,ORIENT
 D INIT
 I (TYPE="SIMPLE")&(ORIENT="INTERIEUR") Q
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
 S ANGLE=$$ANGLE^%PBCACV(XD,YD,XA,YA)
 D ^%PBPZGRA
 D EFF11,AFFDRO(0)
REAF2 
 I (TYPE="SIMPLE")&(ORIENT="INTERIEUR") G SIMPIN
 I (TYPE="SIMPLE")&(ORIENT="EXTERIEUR") G SIMPEX
 I ORIENT="EXTERIEUR" G DOUBEX
 G DOUBIN
 Q
SIMPIN 
 D CAL(XA,YA,ANGLE,1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XA,YA,X1,Y1,X2,Y2,0)
 Q
SIMPEX 
 D EFFSEG
 D CAL(XA,YA,ANGLE,-1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XA,YA,X1,Y1,X2,Y2,0)
 Q
DOUBEX 
 D SIMPEX
 D CAL(XD,YD,ANGLE,1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XD,YD,X1,Y1,X2,Y2,0)
 Q
DOUBIN 
 D SIMPIN
 D CAL(XD,YD,ANGLE,-1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XD,YD,X1,Y1,X2,Y2,0)
 Q
EFFKILL(OBJ,VERS,EL,XD,YD,XA,YA,TYPL,VIS) 
 
 N R,D,ANGLE,ANG1,X1,X2,Y1,Y2,TYPE,ORIENT,KILL
 S KILL=1
 D INIT
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
EFFKIL2 
 S ANGLE=$$ANGLE^%PBCACV(XD,YD,XA,YA)
 D ^%PBPZGRA
 I (TYPE="SIMPLE")&(ORIENT="INTERIEUR") G KSIMPIN
 I (TYPE="SIMPLE")&(ORIENT="EXTERIEUR") G KSIMPEX D AFFDR0(1)
 I ORIENT="EXTERIEUR" G KDOUBEX
 G KDOUBIN
 Q
KSIMPIN 
 D EFF11
 D:KILL EFFDRO
 Q
KSIMPEX 
 D CAL(XA,YA,ANGLE,-1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XA,YA,X1,Y1,X2,Y2,1)
 D:KILL EFFDRO
 Q
KDOUBEX 
 D CAL(XA,YA,ANGLE,-1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XA,YA,X1,Y1,X2,Y2,1)
 D CAL(XD,YD,ANGLE,1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XD,YD,X1,Y1,X2,Y2,1)
 D:KILL EFFDRO
 Q
KDOUBIN 
 D CAL(XD,YD,ANGLE,-1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XD,YD,X1,Y1,X2,Y2,1)
 D CAL(XA,YA,ANGLE,1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(XA,YA,X1,Y1,X2,Y2,1)
 D:KILL EFFDRO
 Q
EFFDRO 
 D AFFDRO(1)
 D EFF^%PBP5EC(0)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
EFFEXT(OBJ,VERS,EL,XD,YD,XA,YA,TYPE,ORIENT) 
 N R,D,ANGLE,ANG1,X1,X2,Y1,Y2,TYPL,KILL
 S TYPL="F",KILL=0
 G EFFKIL2
 
INIT 
 S TYPE=$$TYPFL^%SDEGEST(OBJ,VERS,EL),ORIENT=$$ORIENT^%SDEGEST(OBJ,VERS,EL)
 Q

