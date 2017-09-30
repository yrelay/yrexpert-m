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

;TONRPGO2^INT^1^59547,74873^0
%ZGOMENU ;;04:23 PM  29 Dec 1989; 20 Feb 86  3:51 PM
 
 K  G FIN
 ;;S DX=5,DY=2 S DX=$X-1 X XY W " ",!,! F I=1:1 S A=$T(FUN+I) Q:A=""  S POS=$S(I'<10:5,1:6) W ?POS,I,")  " S CHOI=$P(A,";;",2) F TP=1:1:3 W $P(CHOI,"#",TP) W:TP=3 !
FIN S DRIV=$P($T(+4),";;",2,999) D CURRENT^%IS
B S %ABM=0 D CLEPAG S DX=25,DY=0,MSG=" Globals output " X XY W MSG S DY=22,DX=27 X XY W $$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")" S DX=5,DY=3 X DRIV S DX=5,DY=3 X XY
C S DX=5,DY=2 X XY W "Votre choix : " S DX=$X R *Y1 D TOUCHE^%INCCLAV(Y1,.Y1) S:Y1=1 X1=1 Q:(Y1=1)!((Y1=6)!(Y1=13))  S F=$C(Y1) I F="" Q
 I F>0,F?.N S A=$T(FUN+F) I A'="" W " ",$P(A,";;",2),! D CLEPAG,@$P(A,";;",3) Q:%ABM=1  G B
 I F="?" S DX=$X-1 X XY W " ",!,! F I=1:1 S A=$T(FUN+I) G C:A="" S POS=$S(I'<10:5,1:6) W ?POS,I,")  ",$P(A,";;",2),!
 W " ???" H 1 S DX=0 X XY W "                                                     " G C
CLEPAG W *27,*91,*50,*74 S DX=0,DY=0 X XY
 I $D(SUB) W $S(SUB="C-ADM3":$C(26),SUB="C-TDV":$C(25),1:"")
 Q
FUN ;;
 ;;Globals-driver (MN,SCRE,...);;^TONRPGO1
 ;;Globals du Savoir-faire;;^TONRPGO6
 ;;Globals de la passerelle;;^%ZGOPSRL

