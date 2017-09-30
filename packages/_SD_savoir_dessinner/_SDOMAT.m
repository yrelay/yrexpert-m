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

;%SDOMAT^INT^1^59547,73889^0
%SDOMAT(OBJ,VERS) 
 
 
 
 
 
DEB 
 N GLOBJ,PAS,EL,INFO,TEMP,X1,X2,X3,Y1,Y2,Y3,TYP,VAL,MAT
 N HMIN,HMAX,VMIN,VMAX
 S MAT=$$ADR,PAS=$$PAS^%SDOCNT(OBJ,VERS)*188E-1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S INFO=$$CONCAS^%QZCHAD(TEMP,"INFO")
 S GLOBJ="^[QUI]SDOBJ(OBJ,VERS)"
 S EL=""
 D INIT(PAS)
LOOP S EL=$O(@GLOBJ@("EL",EL))
 G:EL="" FIN
 I '($D(@GLOBJ@("EL",EL,"PRES"))) G LOOP
 S VAL=@GLOBJ@("EL",EL,"PRES")
 S TYP=$P(VAL,"^",1)
 K @(INFO) D PRES^%SDEGEST(EL,INFO)
 D @TYP
 G LOOP
FIN 
 K @(TEMP)
 Q
EXT1 S X1=@INFO@(1,"X"),Y1=@INFO@(1,"Y")
 Q
EXT2 D EXT1
 S X2=@INFO@(2,"X"),Y2=@INFO@(2,"Y")
 Q
EXT3 D EXT2
 S X3=@INFO@(3,"X"),Y3=@INFO@(3,"Y")
 Q
1 
 D EXT3,DEL(EL,X1,Y1,X2,Y2,X3,Y3)
 Q
2 
 D EXT3,ELL(EL,X1,Y1,X2,Y2,X3,Y3)
 Q
3 
 D EXT1,POINT(EL,X1,Y1)
 Q
4 
 D EXT1,TEXTE(EL,X1,Y1)
 Q
5 
 D EXT2,DROITE(EL,X1,Y1,X2,Y2)
 Q
6 
 D EXT3,ARC(EL,X1,Y1,X2,Y2,X3,Y3)
 Q
7 
 D EXT2,CERCLE(EL,X1,Y1,X2,Y2)
 Q
8 
 D EXT2,RECT(EL,X1,Y1,X2,Y2)
 Q
9 
 D EXT2,FLECH(EL,X1,Y1,X2,Y2)
 Q
10 
 D EXT2,RACCO(EL,X1,Y1,X2,Y2)
 Q
ADR() 
 Q $$TEMP^%QZCHAD("MATRICE","")
 
ADR2() 
 Q $$TEMP^%QZCHAD("MATRICE.INVERSE","")
 
INIT(PAS) 
 N XMIN,XMAX,YMIN,YMAX,XO,YO,MAT,DX,DY
 S MAT=$$ADR K @(MAT)
 D INIT^%SDOAFFI
 S XO=PTEC("XO"),YO=PTEC("YO")
 
 
 S HMIN=((YMIN-YO)\PAS)*PAS
 
 S HMAX=((YMAX-YO)\PAS)*PAS
 
 S VMIN=((XMIN-XO)\PAS)*PAS
 
 S VMAX=((XMAX-XO)\PAS)*PAS
 S @MAT@("PAS")=PAS
 F DX=VMIN:PAS:VMAX F DY=HMIN:PAS:HMAX S @MAT@(DX,DY)=0
 
 S @MAT@(XMIN-XO,YMIN-YO)=0,@MAT@(XMIN-XO,YMAX-YO)=0,@MAT@(XMAX-XO,YMIN-YO)=0,@MAT@(XMAX-XO,YMAX-YO)=0
 S @MAT@("HMIN")=HMIN,@MAT@("VMIN")=VMIN,@MAT@("HMAX")=HMAX,@MAT@("VMAX")=VMAX
 Q
 
 
 
 
POINT(EL,X1,Y1) 
 D INSER(EL,X1,Y1)
 Q
DROITE(EL,X1,Y1,X2,Y2) 
 D INSER(EL,X1,Y1),INSER(EL,X2,Y2)
 Q
TEXTE(EL,X1,Y1) 
 D INSER(EL,X1,Y1)
 Q
ARC(EL,X1,Y1,X2,Y2,X3,Y3) 
 D INSER(EL,X1,Y1),INSER(EL,X2,Y2),INSER(EL,X3,Y3)
 Q
CERCLE(EL,X1,Y1,X2,Y2) 
 N I,D,X3,Y3
 D INSER(EL,X1,Y1)
 S D=$$DISTANCE^%PBCACV(X1,Y1,X2,Y2)
 
 F I=0:45:315 S X3=X1+(D*$$COS^%PBCACV(I)),Y3=Y1+(D*$$SIN^%PBCACV(I)) D INSER(EL,X3,Y3)
 Q
ELL(EL,X1,Y1,X2,Y2,X3,Y3) 
 N D,XC,YC,X4,Y4,ANG
 D MILIEU^%PBCACV(X1,Y1,X2,Y2,.XC,.YC)
 S D=$$DISTANCE^%PBCACV(XC,YC,X3,Y3),ANG=$$ANGLE^%PBCACV(XC,YC,X3,Y3)
 S X4=XC+(D*$$COS^%PBCACV(ANG+180)),Y4=YC+(D*$$SIN^%PBCACV(ANG+180))
 D INSER(EL,X1,Y1),INSER(EL,X2,Y2),INSER(EL,X3,Y3),INSER(EL,X4,Y4)
 Q
DEL(EL,X1,Y1,X2,Y2,X3,Y3) 
 D INSER(EL,X1,Y1),INSER(EL,X2,Y2),INSER(EL,X3,Y3)
 Q
RECT(EL,X1,Y1,X2,Y2) 
 N XH,YH,XB,YB
 I Y1>Y2 S XH=X1,YH=Y2,XB=X2,YB=Y1
 I Y1<Y2 S XH=X2,YH=Y1,XB=X1,YB=Y2
 D INSER(EL,X1,Y1),INSER(EL,X2,Y2),INSER(EL,XH,YH),INSER(EL,XB,YB)
 Q
FLECH(EL,X1,Y1,X2,Y2) 
 D INSER(EL,X1,Y1),INSER(EL,X2,Y2)
 Q
RACCO(EL,X1,Y1,X2,Y2) 
 D INSER(EL,X1,Y1),INSER(EL,X2,Y2)
 Q
 
 
 
INSER(EL,X,Y) 
 N MAT,MATINV
 S MAT=$$ADR,MATINV=$$ADR2
 S X=X\1,Y=Y\1
INSER2 I $D(@MAT@(X,Y))#10 G FINSER
 I $D(@MAT@(X)) S Y=$ZP(@MAT@(X,Y)) S:Y="" Y=@MAT@("HMIN") G FINSER
 S X=$ZP(@MAT@(X)) S:X="" X=@MAT@("VMIN")
 G INSER2
FINSER 
 I $D(@MAT@(X,Y,EL))#10 Q
 S @MAT@(X,Y,EL)="",@MAT@(X,Y)=@MAT@(X,Y)+1
 S @MATINV@(EL,X,Y)=""
 Q
 
 
KILL(EL) 
 N MATINV,MAT,DX,DY,I
 S MAT=$$ADR,MATINV=$$ADR2
 S DX="" F I=0:0 S DX=$O(@MATINV@(EL,DX)) Q:DX=""  S DY="" F I=0:0 S DY=$O(@MATINV@(EL,DX,DY)) Q:DY=""  K @MATINV@(EL,DX,DY),@MAT@(DX,DY,EL) S @MAT@(DX,DY)=@MAT@(DX,DY)-1
 Q

