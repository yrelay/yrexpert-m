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

;%VGRA^INT^1^59547,74035^0
VVGRA ;
 
 
 
 
 
 
DROITE(X1,Y1,X2,Y2,NO) 
 N HH,VV
 S HH=$$CARSPE^%VVIDEO("q")
 S VV=$$CARSPE^%VVIDEO("x")
 D G0ON^%VVIDEO
 D DR(X1,Y1,X2,Y2)
 D G0OFF^%VVIDEO
 S DX=X1,DY=Y1 X XY W "*"
 S DX=X2,DY=Y2 X XY W "*"
 Q:NO=""
 S DX=$S(X2>X1:X1+((X2-X1)\2),1:X2+((X1-X2)\2))
 S DY=$S(Y2>Y1:Y1+((Y2-Y1)\2),1:Y2+((Y1-Y2)\2))
 X XY W "D"_NO
 Q
 
DR(X1,Y1,X2,Y2) 
 I X1=X2 D VERT(X1,Y1,Y2) Q
 I Y1=Y2 D HOR(Y1,X1,X2) Q
 N DIFX,DIFY
 S DIFX=X2-X1,DIFY=Y2-Y1
 G:(((DIFX'=1)&(DIFX'=-1))&(DIFY'=1))&(DIFY'=-1) DR3
 N MX,MY
 S MX=$J($$SQR^%TLCAMTH((DIFX\2)*(DIFX\2)),1,0)
 S MY=$J($$SQR^%TLCAMTH((DIFY\2)*(DIFY\2)),1,0)
 G:(DIFX'=1)&(DIFX'=-1) DR2
 
 G:DIFY>0 DR11
 D VERT(X2,Y2,Y2+MY),VERT(X1,(Y2+MY)+1,Y1)
 S DX=X1,DY=(Y2+MY)+1 X XY
 I DIFX=1 W "/" Q
 W "\" Q
DR11 D VERT(X1,Y1,Y1+MY),VERT(X2,(Y1+MY)+1,Y2)
 S DX=X2,DY=(Y1+MY)+1 X XY
 I DIFX=1 W "\" Q
 W "/"
 Q
DR2 
 G:DIFX>0 DR21
 D HOR(Y2,X2,X2+MX),HOR(Y1,(X2+MX)+1,X1)
 S DX=X2+MX
 I DIFY=1 S DY=Y2 X XY W "/" Q
 S DY=Y1 X XY W "\" Q
 Q
DR21 D HOR(Y1,X1,X1+MX),HOR(Y2,(X1+MX)+1,X2)
 S DX=X1+MX
 I DIFY=1 S DY=Y2 X XY W "\" Q
 S DY=Y1 X XY W "/"
 Q
 
DR3 
 S A=(Y1-Y2)/(X1-X2)
 S B=Y1-(A*X1)
 S C=$S(A>0:"\",1:"/")
 G:X1>X2 DR4
 F DX=X1:1:X2 S DY=$J((A*DX)+B,1,0) X XY W C
 Q
DR4 F DX=X2:1:X1 S DY=$J((A*DX)+B,1,0) X XY W C
 Q
 
HOR(Y,X1,X2) 
 N DX,DY
 S DY=Y
 G:X2<X1 HOR2
 F DX=X1:1:X2 X XY W HH
 Q
HOR2 F DX=X2:1:X1 X XY W HH
 Q
 
VERT(X,Y1,Y2) 
 N DX,DY
 S DX=X
 G:Y2<Y1 VERT2
 F DY=Y1:1:Y2 X XY W VV
 Q
VERT2 F DY=Y2:1:Y1 X XY W VV
 Q
 
TESTD 
 D CLEPAG^%VVIDEO
 W !,"1er point - DX : " R X1 Q:X1=""
 W !,"1er point - DY : " R Y1 G:Y1="" TESTD
 W !,"2eme point - DX : " R X2 G:X2="" TESTD
 W !,"2eme point - DY : " R Y2 G:Y2="" TESTD
 W !,"No de la droite : " R NO G:NO="" TESTD
 D CLEPAG^%VVIDEO
 D DROITE(X1,Y1,X2,Y2,NO)
 D ^%VZEAVT("")
 G TESTD
 
ARC(X1,Y1,X2,Y2,ANG,NO) 
 
 G:Y2>Y1 BAS
 G:X2<X1 HG
 I ANG>0 D ANG1(X1,Y1,X2,Y2,NO) G FIN
 D ANG3(X2,Y2,X1,Y1,NO)
 G FIN
HG I ANG>0 D ANG4(X1,Y1,X2,Y2,NO) G FIN
 D ANG2(X2,Y2,X1,Y1,NO)
 G FIN
BAS G:X2<X1 BG
 I ANG>0 D ANG2(X1,Y1,X2,Y2,NO) G FIN
 D ANG4(X2,Y2,X1,Y1,NO)
 G FIN
BG I ANG>0 D ANG3(X1,Y1,X2,Y2,NO) G FIN
 D ANG1(X2,Y2,X1,Y1,NO)
 
FIN 
 S DX=X1,DY=Y1 X XY W "*"
 S DX=X2,DY=Y2 X XY W "*"
 Q
 
ANG1(X1,Y1,X2,Y2,NO) 
 S DY=Y1
 F DX=X1:1:X2 X XY W "."
 S DX=X2
 F DY=Y2:1:Y1 X XY W ":"
 I NO'="" S DX=X2,DY=Y1 X XY W "A"_NO
 Q
 
ANG2(X1,Y1,X2,Y2,NO) 
 S DX=X1
 F DY=Y1:1:Y2 X XY W ":"
 F DX=X1:1:X2 X XY W "."
 I NO'="" S DX=X1,DY=Y2 X XY W "A"_NO
 Q
 
ANG3(X1,Y1,X2,Y2,NO) 
 S DY=Y1
 F DX=X2:1:X1 X XY W "."
 S DX=X2
 F DY=Y1:1:Y2 X XY W ":"
 I NO'="" S DX=X2,DY=Y1 X XY W "A"_NO
 Q
 
ANG4(X1,Y1,X2,Y2,NO) 
 S DX=X1
 F DY=Y2:1:Y1 X XY W ":"
 S DY=Y2
 F DX=X2:1:X1 X XY W "."
 I NO'="" S DX=X1,DY=Y2 X XY W "A"_NO
 Q
 
TESTA 
 D CLEPAG^%VVIDEO
 W !,"1er point - DX : " R X1 Q:X1=""
 W !,"1er point - DY : " R Y1 G:Y1="" TESTA
 W !,"2eme point - DX : " R X2 G:X2="" TESTA
 W !,"2eme point - DY : " R Y2 G:Y2="" TESTA
 W !,"Angle       : " R ANG G:ANG="" TESTA
 W !,"No de l'arc : " R NO G:NO="" TESTA
 D CLEPAG^%VVIDEO
 D ARC(X1,Y1,X2,Y2,ANG,NO),^%VZEAVT("")
 G TESTA

