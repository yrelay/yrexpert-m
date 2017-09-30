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

;%PBTEKEL^INT^1^59547,73874^0
PBTEKEL ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CERCLE 
 N X,Y,R,I,PX1,PX2,PY1,PY2,ANG,XX,YY
 S ANG=$S(%9R<70:5,1:10)
 S XX=%9X,YY=%9Y
 S %9X=%9R,%9Y=0
 D ^%PBCACO
 I $D(ELEM) S X=($P(ELEM,"^",2)-30)+$S($D(XT):XT,1:0),Y=($P(ELEM,"^",3)-30)+$S($D(YT):YT,1:0)
 I '($D(ELEM)) S X=((XX-PTEC("XO"))-30)+$S($D(XT):XT,1:0),Y=((YY-PTEC("YO"))-30)+$S($D(YT):YT,1:0),EF=PTEC("EFFACEMENT"),TL=PTEC("TYPE DE LIGNE"),INVIS=0
 I '($D(A)) S A=0
 D ROTO^%PBCACV(X,Y,A,.X,.Y)
 I A'=0 G CER1
 F I=0:ANG:360 S PX1=((%9R*$$COS(I))+%9X1S)+X,PY1=(%9Y1S+Y)-(%9R*$$SIN(I)),PX2=((%9R*$$COS((I+ANG)#360))+%9X1S)+X,PY2=(%9Y1S+Y)-(%9R*$$SIN((I+ANG)#360)) D TRACER(PX1,PY1,PX2,PY2)
 S %9X=XX,%9Y=YY
 Q
CER1 F I=A:ANG:360 S PX1=((%9R*$$COS(I))+%9X1S)+X,PY1=(%9Y1S+Y)-(%9R*$$SIN(I)),PX2=((%9R*$$COS((I+ANG)#360))+%9X1S)+X,PY2=(%9Y1S+Y)-(%9R*$$SIN((I+ANG)#360)) D TRACER(PX1,PY1,PX2,PY2)
 F I=0:ANG:A S PX1=((%9R*$$COS(I))+%9X1S)+X,PY1=(%9Y1S+Y)-(%9R*$$SIN(I)),PX2=((%9R*$$COS((I+ANG)#360))+%9X1S)+X,PY2=(%9Y1S+Y)-(%9R*$$SIN((I+ANG)#360)) D TRACER(PX1,PY1,PX2,PY2)
 S %9X=XX,%9Y=YY
 Q
 
ARC 
 N ANG,ANGLE S ANG=5
 S %9AD=%9AD#360,%9AF=%9AF#360
ARC0 N X,Y,R,I,PX1,PX2,PY1,PY2,XX,YY
 S XX=%9X,YY=%9Y
 I $D(ELEM)&('($D(%8ELIPS))) S X=($P(ELEM,"^",2)-30)+$S($D(XT):XT,1:0),Y=($P(ELEM,"^",3)-30)+$S($D(YT):YT,1:0) G ARC00
 S X=((%9X-PTEC("XO"))-30)+$S($D(XT):XT,1:0),Y=((%9Y-PTEC("YO"))-30)+$S($D(YT):YT,1:0),EF=PTEC("EFFACEMENT"),TL=PTEC("TYPE DE LIGNE"),INVIS=0
 I '($D(A)) S A=0
 D ROTO^%PBCACV(X,Y,A,.X,.Y)
ARC00 S %9X=%9R,%9Y=0 D ^%PBCACO
 I '($D(^COS(%9AF))) S %9AF=$O(^COS(%9AF))
 I '($D(^COS(%9AD))) S %9AD=$O(^COS(%9AD))
 I %9AF<%9AD G ARC1
 
 
 
 I (%9AD+ANG)>%9AF S PX1=((%9R*$$COS(%9AD))+%9X1S)+X,PY1=(%9Y1S+Y)+(%9R*$$SIN(%9AD)),PX2=((%9R*$$COS((%9AD+%9AF)#360))+%9X1S)+X,PY2=(%9Y1S+Y)+(%9R*$$SIN((%9AD+%9AF)#360)) D TRACER(PX1,PY1,PX2,PY2) Q
 F I=%9AD:ANG:%9AF S PX1=((%9R*$$COS(I))+%9X1S)+X,PY1=(%9Y1S+Y)+(%9R*$$SIN(I)),PX2=((%9R*$$COS((I+ANG)#360))+%9X1S)+X,PY2=(%9Y1S+Y)+(%9R*$$SIN((I+ANG)#360)) D TRACER(PX1,PY1,PX2,PY2) I ((I+ANG)+ANG)>%9AF Q
 S PX1=((%9R*$$COS(I))+%9X1S)+X,PY1=(%9Y1S+Y)+(%9R*$$SIN(I)),PX2=((%9R*$$COS(%9AF))+%9X1S)+X,PY2=(%9Y1S+Y)+(%9R*$$SIN(%9AF)) D TRACER(PX1,PY1,PX2,PY2)
 S %9X=XX,%9Y=YY
 Q
 
ARC1 
 
 F I=%9AD:ANG:360 S PX1=((%9R*$$COS(I))+%9X1S)+X,PY1=(%9Y1S+Y)+(%9R*$$SIN(I)),PX2=((%9R*$$COS((I+ANG)#360))+%9X1S)+X,PY2=(%9Y1S+Y)+(%9R*$$SIN((I+ANG)#360)) D TRACER(PX1,PY1,PX2,PY2)
 F I=0:ANG:%9AF S PX1=((%9R*$$COS(I))+%9X1S)+X,PY1=(%9Y1S+Y)+(%9R*$$SIN(I)),PX2=((%9R*$$COS((I+ANG)#360))+%9X1S)+X,PY2=(%9Y1S+Y)+(%9R*$$SIN((I+ANG)#360)) D TRACER(PX1,PY1,PX2,PY2) I ((I+ANG)+ANG)>%9AF Q
 S PX1=((%9R*$$COS(I))+%9X1S)+X,PY1=(%9Y1S+Y)+(%9R*$$SIN(I)),PX2=((%9R*$$COS(%9AF))+%9X1S)+X,PY2=(%9Y1S+Y)+(%9R*$$SIN(%9AF)) D TRACER(PX1,PY1,PX2,PY2)
 S %9X=XX,%9Y=YY
 Q
 
QUART 
 N X,Y,R,%9X1,%9X2,%9Y1,%9Y2,COS,SIN,%FONC,X1,X2,Y1,Y2,AF,AD,SAVX,SAVY,SAVR
 S SAVR=%9R,SAVX=%9X,SAVY=%9Y
 S X=635E-5*%9X,Y=195E-1-(635E-5*%9Y),R=635E-5*%9R
 S AD=%9AD,AF=%9AF
 S %FONC="ARC" D ^%PBPZ
 S COS=^COS($O(^COS(%9AD#360))),SIN=^SIN($O(^SIN(%9AD#360)))
 S X1=(R*COS)+X,Y1=Y-(R*SIN)
 S COS=^COS($O(^COS(%9AF#360))),SIN=^SIN($O(^SIN(%9AF#360)))
 S X2=(R*COS)+X,Y2=Y-(R*SIN)
 S %9X1=X,%9Y1=Y,%9X2=X1,%9Y2=Y1,%FONC="SEGMENT.TEXTE" D ^%PBPZ
 S %9X1=X,%9Y1=Y,%9X2=X2,%9Y2=Y2,%FONC="SEGMENT.TEXTE" D ^%PBPZ
 S ENVL(%TERM,"X")=X,ENVL(%TERM,"Y")=Y
 S %9AD=AD,%9AF=AF
 S %9R=SAVR,%9X=SAVX,%9Y=SAVY
 Q
 
TRACER(X1,Y1,X2,Y2) 
 D DROITE^%PBMFN(X1,Y1,X2,Y2,EF,TL,INVIS)
 Q
 
COS(I) 
 Q $$COS^%PBCACV(I)
SIN(I) 
 Q $$SIN^%PBCACV(I)

