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

;%SDESARC^INT^1^59547,73889^0
SDESARC(XD,YD,XA,YA,XC,YC,TYPL,VIS,OK,OBLI) 
 
 
 
 
 N A,AD,AF,ATT,B,C,D,PAR,R,X,XHA,XHD,YHA,YHD
 S OK=1
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
 D EFFBAS^%SDUMEN,AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez le point de depart de l'arc de cercle avec la mire"))
L0 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XD,.YD)
 I R=0,OBLI G L0
 D EFFBAS^%SDUMEN
 I R=0 S OK=0 G FIN
 D POINT^%PBMFN(XD,YD,0)
 D AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez le point d'arrivee de l'arc de cercle avec la mire"))
L1 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA)
 I R=0,OBLI G L1
 D EFFBAS^%SDUMEN
 I R=0 S OK=0 D EFF1 G FIN
 D POINT^%PBMFN(XA,YA,0)
 D HORTO^%PBMFN(XD,YD,XA,YA,.XHD,.YHD,.XHA,.YHA,.A,.B,.C)
 I %TERM="VT-340" D ^%PBPZGRA
 D DROITE^%PBMFN(XHD,YHD,XHA,YHA,0,"M",VIS)
 D AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez le centre sur l'axe"))
 D ^%PBPZGRA
L2 S R=$$LOC^%PBMFN(.XC,.YC)
 I R=0,OBLI G L2
 D EFFBAS^%SDUMEN
 I R=0 D EFF3 S OK=0 G FIN
 S X=((A*XC)+(B*YC))+C I $$SQROOT^%PBCACV(X*X)>5 D ^%VSQUEAK G L2
 I %TERM'="VT-340" D DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VIS)
 I %TERM="VT-340" D DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VIS)
 I B'=0 S YC=$P((((-(A))*XC)-C)/B,".",1)
 E  S XC=$P((((-(B))*YC)-C)/A,".",1)
 D CAL
 D ARC^%PBMFN(XC,YC,D,AD,AF,0,TYPL,VIS)
FIN Q
 
CAL S D=$P($$DISTANCE^%PBCACV(XC,YC,XD,YD),".",1)
 S AD=$P($$ANGLE^%PBCACV(XC,YC,XD,YD),".",1)
 S AF=$P($$ANGLE^%PBCACV(XC,YC,XA,YA),".",1)
 Q
 
EFF1 D POINT^%PBMFN(XD,YD,1) Q
 
EFF2 D POINT^%PBMFN(XA,YA,1) Q
 
EFF3 D EFF1,EFF2,DROITE^%PBMFN(XHD,YHD,XHA,YHA,1,"M",VIS) Q
 
EFF(XD,YD,XA,YA,XC,YC,TYPL,VIS) 
 N AD,AF,D
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
 D CAL,^%PBPZGRA
 D ARC^%PBMFN(XC,YC,D,AD,AF,1,TYPL,VIS),EFF^%PBP5EC(0)
 Q

