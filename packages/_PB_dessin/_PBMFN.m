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

;%PBMFN^INT^1^59547,73873^0
PTFN ;
 
 
 
 
 
 
 
 
 
 
 
INIT3(O,V,X,Y) D INIT2^%PBP5EC G FINIT
INIT2(O,V,X,Y) D INIT^%PBP5EC G FINIT
INIT4(O,V) D INIT2^%PBP5EC G SINIT
INIT5(O,V,X,Y) D INIT3^%PBP5EC G FINIT
INIT(O,V) D INIT^%PBP5EC
SINIT N X,Y S X=$$LEC^%PBSOV(O,V,"XO"),Y=$$LEC^%PBSOV(O,V,"YO")
 S:X="" X=$S($D(^[QUI]PTPOSIT("X",$I)):^[QUI]PTPOSIT("X",$I),1:^[QUI]PTPOSIT("X"))
 S:Y="" Y=$S($D(^[QUI]PTPOSIT("Y",$I)):^[QUI]PTPOSIT("Y",$I),1:^[QUI]PTPOSIT("Y"))
FINIT D ORIG^%PBP5EC2(X,Y) Q
 
FIN D FIN^%PBP5EC Q
 
 
POINT(X,Y,E) D POINT^%PBP5EC($$Y(X),$$Y(Y),E) Q
DROITE(X1,Y1,X2,Y2,E,TL,V) D DROITE^%PBP5EC($$X(X1),$$Y(Y1),$$X(X2),$$Y(Y2),E,TL,V) Q
TEXTE(X,Y,T,E,S) D TEXTE^%PBP5EC($$X(X),$$Y(Y),T,E,S) Q
ARC(X,Y,R,AD,AF,E,TL,V) D ARC^%PBP5EC($$X(X),$$Y(Y),R,AD,AF,E,TL,V) Q
CERCLE(X,Y,R,E,TL,V) D CERCLE^%PBP5EC($$X(X),$$Y(Y),R,E,TL,V) Q
ELLIPSE(X,Y,PR,GR,I,E,TL,V) D ELLIPSE^%PBP5EC($$X(X),$$Y(Y),PR,GR,I,E,TL,V) Q
DEMIE(X,Y,PR,GR,I,E,TL,V) D DEMIE^%PBP5EC($$X(X),$$Y(Y),PR,GR,I,E,TL,V) Q
X(X) Q X+PTEC("XO")
Y(Y) Q Y+PTEC("YO")
LOC(X,Y) 
 N EE,ERR,I,J,QQ,XX1,XX2,YY1,YY2
 F I=0:0 W *27,*26 R *EE,*XX1,*XX2,*YY1,*YY2,QQ Q:$$TLOC
 
 Q '(ERR)
TLOC() F J=1,6,13,80 G:EE=J @J
 D ^%VSQUEAK Q 0
1 S ERR=1 Q 1
6 G 80
13 G 80
80 D TRANSCOR(XX1,XX2,YY1,YY2,.X,.Y)
 S X=X-PTEC("XO"),Y=Y-PTEC("YO"),ERR=0 Q 1
 
TRANSCOR(X1,X2,Y1,Y2,X,Y) N X0,XX0,Y0,YY0
 S X0=256*((X1-32)\8),XX0=(X2+(32*(X1#8)))-32,X=(X0+XX0)*4
 S Y0=256*((Y1-32)\8),YY0=(Y2+(32*(Y1#8)))-32,Y=(Y0+YY0)*4
 Q
 
 
 
 
 
HORTO(X1,Y1,X2,Y2,XH1,YH1,XH2,YH2,CX,CY,C) N MAXX,MAXY,MINX,MINY
 S MAXX=4090-PTEC("XO"),MAXY=3120-PTEC("YO")
 S MINX=-(PTEC("XO")),MINY=-(PTEC("YO")) G:X1=X2 CALX G:Y1=Y2 CALY
 N P,X,Y S P=(Y2-Y1)/(X2-X1),CX=1/P,CY=1,C=((-((X1+X2)/2))/P)-((Y1+Y2)/2)
 S Y=(-(MINX*CX))-C,YH1=$S(Y>MAXY:MAXY,Y<MINY:MINY,1:Y),XH1=((-(YH1))-C)/CX
 S Y=(-(MAXX*CX))-C,YH2=$S(Y>MAXY:MAXY,Y<MINY:MINY,1:Y),XH2=((-(YH2))-C)/CX Q
CALX S CX=0,CY=1,C=(Y1+Y2)/-2,XH1=MINX,XH2=MAXX,YH1=-(C),YH2=-(C) Q
CALY S CX=1,CY=0,C=(X1+X2)/-2,XH1=-(C),XH2=-(C),YH1=MINY,YH2=MAXY Q

