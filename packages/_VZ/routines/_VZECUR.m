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
;! Nomprog     : %VZECUR                                                      !
;! Module      : Vidéo (V)                                                    !
;! But         : Gestion du mouvement du curseur.                             !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;! Exemple :                                                                  ! 
;! S NON=0,DX=4,DY=4,MPASX=1,MPASY=1,NXI=1,NXS=77,NYI=1,NYS=21 X XY D ^%VZECUR
;!                                                                            !
;!     NON=0,                                                                 !
;!     DX=4, position de départ en X ;                                        !
;!     DY=2, position de départ en Y ;                                        !
;!     MPASX=4, pas du déplacement en X ;                                     !
;!     MPASY=2, pas du déplacement en Y ;                                     !
;!     NXI=3, position du coin haut droit  X ;                                !
;!     NXS=77, position du coin haut droit Y ;                                !
;!     NYI=1, position du coin bas gauche X ;                                 !
;!     NYS=21 position du coin bas gauche Y ;                                 !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%VZECUR ;
MMOVCUR ;
 
 N ZB,%F
 S:'($D(IOM)) IOM=80 D ECHOFF^%VVIDEO
LOOP1 S:'($D(IOM)) IOM=80 I ($D(ATT)#10)'=1 S ATT=10000
LOOP 
 ;HL2 R *X1:ATT
 R *X1:ATT S X1=$$^%VCONVT(X1)
 S:X1=-1 X1=13
 
 ;HL2 G:$$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) FLEC
 IF ($A($ZB)=27)&($$FLECHE^%INCCLAV(X1,.X1,.X2,.X3)) G FLEC
 D TOUCHE^%INCCLAV(X1,.X1)
 I X1=27 G @X1
 E  G FIN
ECRI 
 S Y=$A($E(ZB,2))
 D ^%VZANVT G 27+1:$D(%XLEC)
 I (Y=127)!(Y=13) G @Y
 E  S DX=DX+1,C=C_$C(Y) G ECRI
127 S DX=DX-1 I DX<PX S PX=DX X XY G ECRI
 E  X XY W " " X XY S LON=$L(C)-1,C=$E(C,1,LON) G ECRI
13 Q
27 G:MODTM BELL
 R *X2
 G:X2=91 271
 R *X3
 G FIN0
271 R *X3
 G:(X3<48)!(X3>57) FIN0
272 R *X3
 S X3=$C(X3)
 G:X3="~" FIN0
 G 272
FIN0 G FIN:(X2=27)!(X3=27) I (((X1'=27)!(X2'=91))!(X3'>64))!(X3'<69) G BELL
 G FLEC
BELL D ^%VSQUEAK G LOOP
 ;HL2 FLEC D @X3,TEST G LOOP
FLEC D @X3,MOV G LOOP
SHOW X XY W "*" Q
CLEPOS X XY Q
FIN D ECHON^%VVIDEO Q
65 S DDX=0,DDY=-(MPASY) Q
66 S DDX=0,DDY=MPASY Q
67 S DDY=0,DDX=MPASX Q
68 S DDY=0,DDX=-(MPASX) Q

 ;HL2 TEST S NX=DX+DDX,NY=DY+DDY W:'(DTM) *-1 I (((NX'>NXI)!(NX'<NXS))!(NY'>NYI))!(NY'<NYS) D ^%VSQUEAK Q
MOV S NX=DX+DDX,NY=DY+DDY I (((NX'>NXI)!(NX'<NXS))!(NY'>NYI))!(NY'<NYS) D ^%VSQUEAK Q
 S DX=NX,DY=NY D CLEPOS K NX,NY Q
SQUEAK D ^%VSQUEAK Q
 W *7,*7,*-1 Q

