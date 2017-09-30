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

;%VZECUR1^INT^1^59547,74037^0
MOVCUR O 0 U 0,0
 
 S DX=40,DY=10 X XY
LOOP 
 R *X1
 ;;DTM 
 I $$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) D @X3,TEST G LOOP
 D TOUCHE^%INNCLAV(X1,.X1)
 ;;FINDTM
 I X1=27 G @X1
 E  S PX=DX,PY=DY O 0 W $C(X1) S C=$C(X1),DX=DX+1
ECRI R *Y
 ;;DTM
 D TOUCHE^%INCCLAV(Y,.Y)
 ;;FINDTM
 I (Y=127)!(Y=13) G @Y
 E  S DX=DX+1,C=C_$C(Y) G ECRI
127 S DX=DX-1 I DX<PX S PX=DX X XY G ECRI
 E  X XY W " " X XY S LON=$L(C)-1,C=$E(C,1,LON) G ECRI
13 Q
27 ;;NONDTM
 
 
 ;;FINNONDTM
 ;;DTM
 G:MODTM BELL
 R *X2
 G:X2=91 271
 R *X3
 G BELL
271 R *X3
 G:(X3<48)!(X3>57) BELL
272 R *X3
 S X3=$C(X3)
 G:X3="~" BELL
 G 272
BELL D ^%VSQUEAK G LOOP
SHOW X XY W "*" Q
CLEPOS X XY Q
FIN O 0 Q
65 S DDX=0,DDY=-1 Q
66 S DDX=0,DDY=1 Q
67 S DDY=0,DDX=1 Q
68 S DDY=0,DDX=-1 Q
TEST S NX=DX+DDX,NY=DY+DDY I (((NX'>1)!(NX'<78))!(NY'>1))!(NY'<23) D SQUEAK Q
 S DX=NX,DY=NY D CLEPOS K NX,NY Q
SQUEAK D ^%VSQUEAK Q

