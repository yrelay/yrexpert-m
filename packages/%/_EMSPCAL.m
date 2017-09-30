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

;%EMSPCAL^INT^1^59547,73869^0
%EMSPCAL(TEMP) 
 
 
 
 
 
 
 
 
 N ELEM,SOM,R,GRAV
 
 S ELEM=$$CONCAS^%QZCHAD(TEMP,"ELEM")
 
 I '($D(@ELEM)) S @TEMP@("RESULTAT")=0 Q
 S GRAV=$$CONCAS^%QZCHAD(TEMP,"GRAV")
 
 
 D CALGS(ELEM,GRAV,.SOM),^%VZEAVT("Somme des longueurs = "_SOM)
 
 D CALCR(ELEM,GRAV,SOM,.R),^%VZEAVT("R = "_R)
 
 S @TEMP@("RESULTAT")=$J(2*$$SQR^%TLCAMTH((2*R)*SOM),1,2)
 Q
 
 
CALGS(ELEM,GRAV,SOM) 
 
 
 
 N NUM,CGNUM,P1,P2,ANG,ANG2,PI
 D MSG^%VZEATT($$^%QZCHW("Recherche des centres de gravite et calcul des longueurs des elements"))
 S PI=31415926535E-10
 S NUM="",SOM=0
 S @GRAV@("LONG",0)=0
BCN S NUM=$O(@ELEM@(NUM)) Q:NUM=""
 D GRAV($$CONCAS^%QZCHAD(ELEM,NUM),$$CONCAS^%QZCHAD(GRAV,"CGRAV"),NUM,.CGNUM)
 S SOM=SOM+CGNUM
 S @GRAV@("LONG",NUM)=SOM G BCN
 
GRAV(GLO,GRAV,NUM,RES) 
 
 
 I @GLO="ARC" G ARC
DRT 
 S RES=$$CGR(@GLO@("P1X"),@GLO@("P1Y"),@GLO@("P2X"),@GLO@("P2Y"))
 S @GRAV@(NUM,"X")=(@GLO@("P1X")+@GLO@("P2X"))/2
 Q
ARC 
 S RES=$$CGR(@GLO@("P1X"),@GLO@("P1Y"),@GLO@("C1X"),@GLO@("C1Y"))
 S ANG=@GLO@("ANG")
 I @GLO@("OR")="-" S ANG2=$$ANG(@GLO@("P1X"),@GLO@("P1Y"),@GLO@("C1X"),@GLO@("C1Y"))
 E  S ANG2=$$ANG(@GLO@("P2X"),@GLO@("P2Y"),@GLO@("C1X"),@GLO@("C1Y"))
 S P1=RES*($$SIN^%TLCAMTH(ANG)/((ANG*PI)/180))
 S P2=(P1*$$TG^%TLCAMTH(ANG/2))*$$SIN^%TLCAMTH(ANG2)
 S P1=P1*$$COS^%TLCAMTH(ANG2)
 S @GRAV@(NUM,"X")=(@GLO@("C1X")-P1)+P2
 S RES=((RES*ANG)*PI)/180
 I RES<0 S RES=RES*-1
 Q
 
CGR(X1,Y1,X2,Y2) 
 N RES
 S RES=((X2-X1)*(X2-X1))+((Y2-Y1)*(Y2-Y1))
 Q $$SQR^%TLCAMTH(RES)
 
ANG(X1,Y1,X2,Y2) 
 N ANG1
 S ANG1=$S((X1-X2)'=0:$$ARCTG^%TLCAMTH($$ABS^%TLCAMTH(Y1-Y2)/$$ABS^%TLCAMTH(X1-X2)),Y1<Y2:270,1:90)
 I Y1>Y2 G SUP
 I Y1<Y2 G INF
 
 I X1<X2 Q 0
 Q 180
SUP I X1<X2 Q ANG1
 I X1>X2 Q 180-ANG1
 
 Q 90
INF I X1>X2 Q 180+ANG1
 I X1<X2 Q 360-ANG1
 
 Q 270
 
 
CALCR(ELEM,GRAV,SOM,R) 
 N POLX,POLY,NUM,DER,PI
 D MSG^%VZEATT($$^%QZCHW("Calcul de R"))
 S PI=31415926535E-10
 S POLX=(-1/3)*SOM,POLY=5E-1*SOM
 
 S @GRAV@("COPINT",0,"X")=0
 S @GRAV@("COPINT",0,"Y")=0
 S @GRAV@("ANG",0)=POLY/POLX
 
 S NUM=""
BCR S NUM=$O(@ELEM@(NUM)) G:NUM="" FINR
 S @GRAV@("ANG",NUM)=(@GRAV@("LONG",NUM)-POLY)/(POLX*-1)
 
 S @GRAV@("COPINT",NUM,"X")=@GRAV@("CGRAV",NUM,"X")
 S @GRAV@("COPINT",NUM,"Y")=(@GRAV@("ANG",NUM-1)*(@GRAV@("CGRAV",NUM,"X")-@GRAV@("COPINT",NUM-1,"X")))+@GRAV@("COPINT",NUM-1,"Y")
 
 
 G BCR
 
FINR 
 S DER=$ZP(@ELEM@(""))
 S R=(@GRAV@("COPINT",DER,"Y")-(@GRAV@("ANG",DER)*@GRAV@("COPINT",DER,"X")))/(@GRAV@("ANG",0)-@GRAV@("ANG",DER))
 Q

