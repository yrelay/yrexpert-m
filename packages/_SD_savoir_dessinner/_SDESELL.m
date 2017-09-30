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

;%SDESELL^INT^1^59547,73889^0
SDESELL(XD,YD,XA,YA,XR,YR,TYPL,VIS,OK,OBLI) 
 
 
 
 
 N A,ATT,B,C,D,GR,I,IN,PAR,PR,R,R1,R2,XHA,XHD,XC,YHA,YHD,YC
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
 S OK=1
 
 D EFFBAS^%SDUMEN,AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez le point de depart de l'ellipse avec la mire"))
L0 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XD,.YD)
 I R=0,OBLI G L0
 D EFFBAS^%SDUMEN
 I R=0 S OK=0 G FIN
 D POINT^%PBMFN(XD,YD,0)
 D AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez le point d'arrivee de l'ellipse avec la mire"))
L1 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA)
 I R=0,OBLI G L1
 D EFFBAS^%SDUMEN
 I R=0 D EFF1 S OK=0 G FIN
 D POINT^%PBMFN(XA,YA,0)
 D HORTO^%PBMFN(XD,YD,XA,YA,.XHD,.YHD,.XHA,.YHA,.A,.B,.C)
 I %TERM="VT-340" D ^%PBPZGRA
 D DROITE^%PBMFN(XHD,YHD,XHA,YHA,0,"M",VIS)
 D AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez l'extremite du rayon sur l'axe avec la mire"))
L2 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XR,.YR)
 I R=0,OBLI G L2
 D EFFBAS^%SDUMEN
 I R=0 D EFF3 S OK=0 G FIN
 S D=((XR*A)+(YR*B))+C I $$SQROOT^%PBCACV(D*D)>5 D ^%VSQUEAK G L2
 D DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VIS)
 I B'=0 S YR=$P((((-(A))*XR)-C)/B,".",1)
 E  S XR=$P((((-(B))*YR)-C)/A,".",1)
 D CAL,CAL2
 D ELLIPSE^%PBMFN(XC,YC,PR,GR,I,0,TYPL,VIS) H 1
FIN Q
 
CAL S XC=$P((XD+XA)/2,".",1),YC=$P((YD+YA)/2,".",1)
 Q
CAL2 
 S PR=$P($$DISTANCE^%PBCACV(XD,YD,XA,YA)/2,".",1)
 S GR=$P($$DISTANCE^%PBCACV(XC,YC,XR,YR),".",1)
 S I=$P($$ANGLE^%PBCACV(XC,YC,XD,YD),".",1)
 Q
 
EFF1 D POINT^%PBMFN(XD,YD,1) Q
 
EFF2 D POINT^%PBMFN(XA,YA,1) Q
 
EFF3 D EFF1,EFF2,DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VIS) Q
 
EFF(XD,YD,XA,YA,XR,YR,TYPL,VIS) 
 N A,B,C,YC,XC,PR,GR
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
 D CAL,CAL2
 D ^%PBPZGRA,EFF1,EFF2,ELLIPSE^%PBMFN(XC,YC,PR,GR,I,1,TYPL,VIS),EFF^%PBP5EC(0)
 Q

