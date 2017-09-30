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

;TODRIMOD^INT^1^59547,74871^0
TODRIMOD ;
 
B S %ABM=0 D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=^GLOMENU($I,%PROG,0) D TO4^%VZCD S DY=22,DX=27 X XY W $$^%QZCHW($$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")") D ZD^%QMDATE4,^%QMDAK0 S DY=22,DX=0 X XY W $$^%QZCHW("le "),%DAT,"  ",HEURE S DX=75 X XY W WHOIS S DX=5,DY=3 X ^TOLISRAM S DX=5,DY=3 X XY
C S DX=5,DY=6 X XY W $$^%QZCHW("Votre choix : ")
D S DX=$X,ATT=1 D ^%VLEC K ATT
 I (X1=-1)&(Y1="") G D
 I (CTRLA=1)!((CTRLF=1)!(Y1="")) G FIN
 S F=Y1 I F>0,F?.N,$D(^GLOMENU($I,%PROG,F)) S A=^GLOMENU($I,%PROG,F) I A'="" W " ",$P(A,";",2) S %PROGET=$P(A,";;",3) D @%PROGET G B
 I F="?" X ^TOLISRAM G C
 W " ???" H 1 S DX=0 X XY W "                                                     " G C
FIN Q

