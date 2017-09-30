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

;%EDCRDGL^INT^1^59547,73869^0
%EDCRDGL ;
 N %FONC
 S %FONC="MOUV" D ^%PBPZ
 U %PORT W "LB",$E(%9STR,1,ENVL(%TERM,"LTEXTMAX")),$C(3),";",!
 Q
TEXT U %PORT W "PU;PA",%9X*10,",",(%LIMYCM-%9Y)*10,";",!
 I ^V($J,"%","%ORIENTATION",1)="VERTICALE" U %PORT W "DR0,1;"
 D DEB
 U %PORT W "LB",$E(%9STR,1,ENVL(%TERM,"LTEXTMAX")),$C(3),";",!
 I ^V($J,"%","%ORIENTATION",1)="VERTICALE" U %PORT W "DR;"
 Q
DEB 
 N I,J,COEFX,COEFY
 
 S COEFX=25E-1,COEFY=375E-2
 I ((((((((%9T=1)!(%9T=9))!(%9T=11))!(%9T=17))!(%9T=18))!(%9T=27))!(%9T=28))!(%9T=30))!(%9T=32) S J=35E-1 G CAL
 I ((((((((%9T=2)!(%9T=3))!(%9T=4))!(%9T=6))!(%9T=12))!(%9T=19))!(%9T=20))!(%9T=23))!(%9T=24) S J=3 G CAL
 I (((((%9T=5)!(%9T=13))!(%9T=21))!(%9T=25))!(%9T=26))!(%9T=31) S J=18E-1 G CAL
 I %9T=7 S J=1 G CAL
 I %9T=8 S J=35E-1 G CAL
 I %9T=10 S J=5 G CAL
 I ((%9T=14)!(%9T=22))!(%9T=33) S J=1 G CAL
 I %9T=15 S J=25E-1 G CAL
 I %9T=16 S J=12E-1 G CAL
 I %9T=29 S J=6 G CAL
 S J=2
CAL 
 S COEFX=2E-1*J,COEFY=375E-3*J
 U %PORT W "SR",COEFX,",",COEFY,";"
 Q
 
NOUVPAG 
 U 0
 U %PORT W "SP;",!
 D ^%VZEAVT($$^%QZCHW("Installez une nouvelle feuille sur la table tracante"))
 U %PORT W "SP1;",!
 Q
 ;
 ;

