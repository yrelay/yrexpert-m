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

;%TLWAR^INT^1^59547,74031^0
TEST ;
 S CREDIT=1,NIVEAU=1,YDEP=0,SCORE=0
DEB D CLEPAG^%VVIDEO,CUROF^%VVIDEO,PGC,GEN S TUE=0,MPASX=1,MPASY=-1,NXI=0,NXS=78,NYI=20,NYS=22,DX=40,DY=21,OLDH=$P($H,",",2)
LEC I $P($H,",",2)>(OLDH+1) D AV2 G:TUE FIN S OLDH=$P($H,",",2)
 G:TUE FIN X XY W " " D ^%TLWARM I $P($H,",",2)>(OLDH+1) D AV2 G:TUE FIN S OLDH=$P($H,",",2)
 G:TUE FIN G:(X1=1)!(X1=6) FIN1 I $P($H,",",2)>(OLDH+1) D AV2 G:TUE FIN S OLDH=$P($H,",",2)
 G:TUE FIN G:X1=32 T I $P($H,",",2)>(OLDH+1) D AV2 G:TUE FIN S OLDH=$P($H,",",2)
 G LEC
FIN S CREDIT=CREDIT-1 G:CREDIT'<0 DEB
FIN2 D CLEPAG^%VVIDEO S DYH=12,MSG="Votre score : "_SCORE,DXG=20-($L(MSG)\2) D BIG^%VVIDEO H 3
FIN1 D CLEPAG^%VVIDEO,CURON^%VVIDEO Q
T S OOX=$X,OOY=$Y I $P($H,",",2)>(OLDH+1) D AV2 G:TUE FIN S OLDH=$P($H,",",2)
 
 F DY=20:-1:0 D TPOS Q:MORT  X XY W "|" X XY W " "
 I $P($H,",",2)>(OLDH+1) D AV2 G:TUE FIN S OLDH=$P($H,",",2)
 
 S DX=OOX,DY=21 X XY W " " I $P($H,",",2)>(OLDH+1) D AV2 G:TUE FIN S OLDH=$P($H,",",2)
 G LEC
TPOS I $P($H,",",2)>(OLDH+1) D AV2 Q:TUE  S OLDH=$P($H,",",2)
 S MORT=0 F I=1:1:NIVEAU*3 I $D(POS(I)) S XX=POS(I,1),YY=POS(I,2) I (DX=XX)&(DY=YY) S MORT=1,NBEC=1 K POS(I) D ECLAIR Q
 I MORT X XY W " " K POS(I) S SCORE=SCORE+(10*NIVEAU),DX=35,DY=23 X XY W "SCORE : ",SCORE Q:$D(POS)
 I '($D(POS)) S YDEP=YDEP+2 S:(NIVEAU#2)=0 CREDIT=CREDIT+1 S NIVEAU=NIVEAU+1 S:YDEP>14 YDEP=10 D CLEPAG^%VVIDEO,GEN S DX=40,DY=21 X XY
 Q
GEN S DY=YDEP F I=1:1:NIVEAU*3 S DX=$R(78) S:DX=0 DX=1 S POS(I,1)=DX,POS(I,2)=DY X XY W *27,"N",$C(33) X XY
 D POCLEPA^%VVIDEO W "CREDIT : ",CREDIT,?36,"SCORE : ",SCORE,?60,"NIVEAU : ",NIVEAU Q
AV S OOX=$X,OOY=$Y
AV2 Q:TUE  F I=1:1:3 D AV1
 G:DY>20 TUE G:(DX=OOX)&(DY=OOY) TUE S DX=OOX,DY=OOY X XY
 Q
AV1 Q:'($D(POS))  S E=$R((NIVEAU*3)+1) G:E=0 AV1 G:'($D(POS(E))) AV1 S DX=POS(E,1),DY=POS(E,2) X XY W " " S DY=DY+1 X XY W *27,"N",$C(33) X XY S POS(E,2)=DY
 Q
TUE Q:TUE  S TUE=1,NBEC=3 D ECLAIR F I=1:1:3 D ^%VSQUEAK
 Q
ECLAIR F J=1:1:NBEC D ONTTREV^%VVIDEO,EC1
 Q
EC1 F I=1:1:1200
 D OFTTREV^%VVIDEO F I=1:1:1200
 Q
PGC W *27,"*A",*27,"P1;1;1{AN^wwww^N/?ENNNNE?;???ww???/MMNNNNMM",*27,"\"
 Q

