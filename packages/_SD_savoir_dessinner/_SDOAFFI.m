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

;%SDOAFFI^INT^1^59547,73889^0
SDOAFFI(OBJ,VERS,%PORT,%TERM) 
 
 
 
 
 
 
 
 
 
 
 
 D INIT
 D CADRE
 D REAF(OBJ,VERS,%PORT,%TERM)
 Q
 
INIT 
 
 S X=($$COOR^%SDOCNT(OBJ,VERS,"X")*188E-1)+2050,Y=($$COOR^%SDOCNT(OBJ,VERS,"Y")*188E-1)+1550
INIT2 
 D ORIG^%PBP5EC2(X,Y)
 
 S XMIN=200,XMAX=3900
 S YMIN=200,YMAX=2900
 Q
INITCOL 
 S X=$$COOR^%SDOCNT(COL,VERS,"X")+2050,Y=$$COOR^%SDOCNT(COL,VERS,"Y")+1550
 G INIT2
 
CADRE 
 N %FONC
 D ^%PBPZCLR
 S %FONC="PRENDRE" D ^%PBPZ
 D CADRE^%SDOCADR
 Q
 
REAF(OBJ,VERS,%PORT,%TERM) 
 S EL=""
 G REAF3
 
REAF2(OBJ,VERS,%PORT,%TERM,EL) 
 
REAF3 N SYNT,GLOBJ,GLOTXT,TEMP
 S SYNT=$$SYNT^%SDOCNT(OBJ,VERS)
 S GLOBJ="^[QUI]SDOBJ(OBJ,VERS)"
 S GLOTXT="^[QUI]SDTEXT(OBJ,VERS)"
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 F I=1:1 S EL=$O(@GLOTXT@(EL)) Q:EL=""  Q:EL="COM"  D AFFICH(GLOTXT,GLOBJ,EL)
 K @(TEMP) Q
 
AFFICH(GLOTXT,GLOBJ,EL) 
 I '($D(@GLOBJ@("EL",EL,"PRES"))) G SPR
 I @GLOBJ@("EL",EL,"PRES")="" G SPR
 G AFFIC2
SPR 
 N CH,TYP,PRES,GLAFF
 S PRES=$$CONCAS^%QZCHAD($P($ZPOS,"^",2),"PRES") K @(PRES)
 S GLAFF=$$CONCAS^%QZCHAD($P($ZPOS,"^",2),"GLAFF") K @(GLAFF)
 S CH=@GLOTXT@(EL),TYP=$E($$GETLBLAN^%VTLBLAN($P(CH,";",2)),1,5)
 I TYP="" Q
 S TYP=TYP_"^%SDEDEF(2,EL,SYNT,PRES,GLAFF,1)"
 D @TYP
 Q
AFFIC2 N X1,X2,X3,Y1,Y2,Y3,LIB,PLEIN,ORIENT,TYPL
 N TYPE,INFO
 S TYPE=$P(@GLOBJ@("EL",EL,"PRES"),"^",1)
 S INFO=$$CONCAS^%QZCHAD(TEMP,"INFO") K @(INFO)
 D PRES^%SDEGEST(EL,INFO)
 S TYPL="F"
 I (TYPE'=3)&(TYPL'=4) S TYPL=$$TYPL^%SDEDEF($P(@GLOTXT@(EL),"^",4))
 S VIS=1
 G @TYPE
 
1 
 D EXT3
 S XC=$P((X1+X2)/2,".",1),YC=$P((Y1+Y2)/2,".",1)
 S PR=$P($$DISTANCE^%PBCACV(X1,Y1,X2,Y2)/2,".",1)
 S GR=$P($$DISTANCE^%PBCACV(XC,YC,X3,Y3),".",1)
 S I=$P($$ANGLE^%PBCACV(XC,YC,X1,Y1),".",1)
 D DEMIE^%PBMFN(XC,YC,PR,GR,I,0,TYPL,VIS)
 Q
2 
 D EXT3
 S XC=$P((X1+X2)/2,".",1),YC=$P((Y1+Y2)/2,".",1)
 S PR=$P($$DISTANCE^%PBCACV(X1,Y1,X2,Y2)/2,".",1)
 S GR=$P($$DISTANCE^%PBCACV(XC,YC,X3,Y3),".",1)
 S I=$P($$ANGLE^%PBCACV(XC,YC,X1,Y1),".",1)
 D ELLIPSE^%PBMFN(XC,YC,PR,GR,I,0,TYPL,VIS)
 Q
3 
 D EXT1
 D TEXTE^%PBMFN(X1+20,Y1+20,@INFO@("LIB"),0,"H")
 Q
4 
 D EXT1
 D TEXTE^%PBMFN(X1,Y1,@INFO@("LIB"),0,"H")
 Q
5 
 D EXT2
 D DROITE^%PBMFN(X1,Y1,X2,Y2,0,TYPL,VIS)
 Q
6 
 D EXT3
 S D=$P($$DISTANCE^%PBCACV(X3,Y3,X1,Y1),".",1)
 S AD=$P($$ANGLE^%PBCACV(X3,Y3,X1,Y1),".",1)
 S AF=$P($$ANGLE^%PBCACV(X3,Y3,X2,Y2),".",1)
 D ARC^%PBMFN(X3,Y3,D,AD,AF,0,TYPL,VIS)
 Q
7 
 D EXT2
 S D=$P($$DISTANCE^%PBCACV(X1,Y1,X2,Y2),".",1)
 D CERCLE^%PBMFN(X1,Y1,D,0,TYPL,VIS)
 Q
8 
 D EXT2
 I Y1>Y2 S XH=X1,YH=Y2,XB=X2,YB=Y1
 I Y1<Y2 S XH=X2,YH=Y1,XB=X1,YB=Y2
 D DROITE^%PBMFN(X1,Y1,XB,YB,0,TYPL,VIS)
 D DROITE^%PBMFN(XB,YB,X2,Y2,0,TYPL,VIS)
 D DROITE^%PBMFN(X2,Y2,XH,YH,0,TYPL,VIS)
 D DROITE^%PBMFN(XH,YH,X1,Y1,0,TYPL,VIS)
 Q
9 
 D EXT2
 D EXT^%SDESFLE(OBJ,VERS,EL,X1,Y1,X2,Y2,TYPL,VIS)
 Q
10 
 D EXT2
 S EL1=@INFO@(1,"DROITE"),EL2=@INFO@(2,"DROITE")
 D EXT^%SDESRAC(OBJ,VERS,X1,Y1,X2,Y2,EL1,EL2,TYPL,VIS)
 Q
 
EXT1 S X1=@INFO@(1,"X"),Y1=@INFO@(1,"Y") Q
EXT2 D EXT1
 S X2=@INFO@(2,"X"),Y2=@INFO@(2,"Y") Q
EXT3 D EXT2
 S X3=@INFO@(3,"X"),Y3=@INFO@(3,"Y") Q

