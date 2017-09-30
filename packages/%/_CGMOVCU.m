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
;! Module      : Caractères graphiques (CG)                                   !
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

;%CGMOVCU^INT^1^59547,73867^0
MMOVCUR S:'($D(IOM)) IOM=80 O 0 U 0,0:(RM:1),0:(IOM)
 
LOOP1 S:'($D(IOM)) IOM=80 I '($D(ATT)) S ATT=10000
LOOP R *X1:ATT S:X1=-1 X1=13
 ;;NONDTM
 
 ;;FINNONDTM
 ;;DTM
 I $$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) D @X3,TEST G LOOP
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 I X1=27 G @X1
 E  G FIN
ECRI R *Y
 ;;NONDTM
 
 ;;FINNONDTM
 ;;DTM
 I $$FLECHE^%INCCLAV(Y,.X1,.X2,.X3) D @X3,TEST G LOOP
 D TOUCHE^%INCCLAV(Y,.Y)
 G:Y=27 27
 ;;FINDTM
 I (Y=127)!(Y=13) G @Y
 E  S DX=DX+1,C=C_$C(Y) G ECRI
127 S DX=DX-1 I DX<PX S PX=DX X XY G ECRI
 E  X XY W " " X XY S LON=$L(C)-1,C=$E(C,1,LON) G ECRI
13 Q
27 ;;NONDTM
 
 
 
 ;;FINNONDTM
 ;;DTM
 G:MODTM REFUS
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
 ;;FINDTM
REFUS D ^%VSQUEAK G LOOP
SHOW X XY W "*" Q
CLEPOS X XY Q
FIN0 G:(X2'=27)&(X3'=27) REFUS
FIN O 0:(RM:0) U 0:(IOM) Q
65 S DDX=0,DDY=-(MPASY) Q
66 S DDX=0,DDY=MPASY Q
67 S DDY=0,DDX=MPASX Q
68 S DDY=0,DDX=-(MPASX) Q
TEST S NX=DX+DDX,NY=DY+DDY W *-1 I (((NX'>NXI)!(NX'<NXS))!(NY'>NYI))!(NY'<NYS) D SQUEAK Q
 S DX=13,DY=19 X XY W $J("",37)
 I $D(POS(NY,NX)) D BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO X XY W POS(NY,NX) D NORM^%VVIDEO
F1 S DX=NX,DY=NY D CLEPOS K NX,NY Q
SQUEAK W *7,*7,*-1 Q

