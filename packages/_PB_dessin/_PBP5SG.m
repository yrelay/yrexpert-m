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

;%PBP5SG^INT^1^59547,73874^0
PTGSEGME ;
 
 
 N A,B,C,D,E,%FONC
 I ENVL(%TERM,"ETAT-CRAYON")="SANS-CRAYON" G MOUV
 I $D(ENVL(%TERM,"EPAISSEUR")) G VOLUM
 S %FONC="SEG" D ^%PBPZ G MOUV
 
VOLUM N E,E2 S E2=ENVL(%TERM,"EPAISSEUR"),E=E2/2 Q:E2=0
 N A,%9LXY,X,X1,X2,X3,X4,X5,X6,Y,Y1,Y2,Y3,Y4,Y5,Y6
 S X1=0,Y1=0,X2=%9X2-%9X1,Y2=%9Y2-%9Y1
 S A("A")=((-($$ANGLE^%PBCACV(X1,Y1,X2,Y2)))+360)#360,A("X")=0,A("Y")=0,A("R")=1
 D XY^%PBCACV(X2,Y2,.A,.X2,.Y2)
 S A("A")=((-(A("A")))+360)#360,X=%9X1,Y=%9Y1
 D XY^%PBCACV(X1-E,Y1+E,.A,.X3,.Y3) S X3=X3+X,Y3=Y3+Y
 D XY^%PBCACV(X1-E,Y1-E,.A,.X4,.Y4) S X4=X4+X,Y4=Y4+Y
 D XY^%PBCACV(X2+E,Y2+E,.A,.X5,.Y5) S X5=X5+X,Y5=Y5+Y
 D XY^%PBCACV(X2+E,Y2-E,.A,.X6,.Y6) S X6=X6+X,Y6=Y6+Y
 K ENVL(%TERM,"EPAISSEUR") S %FONC="LIGBRI",%9LXY=X4_","_Y4_","_X3_","_Y3_","_X5_","_Y5_","_X6_","_Y6_","_X4_","_Y4 D ^%PBPZ
 S ENVL(%TERM,"EPAISSEUR")=E2 G MOUV
 
MOUV N %9X,%9Y S %9X=%9X2,%9Y=%9Y2,%FONC="MOUV" D ^%PBPZ Q

