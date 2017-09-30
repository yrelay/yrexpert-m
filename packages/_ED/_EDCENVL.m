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

;%EDCENVL^INT^1^59547,73868^0
%EDCENVL ;
 
 
 
INIT 
 S:'($D(VALPLA)) VALPLA=" "
 S:'($D(^V($J,"%","%X",1))) ^V($J,"%","%X",1)=0
 S:'($D(^V($J,"%","%Y",1))) ^V($J,"%","%Y",1)=0
 S:'($D(^V($J,"%","%TAILLE",1))) (^V($J,"%","%TAILLE",1),%9T)=1
 S:'($D(^V($J,"%","%EPAISSEUR",1))) (^V($J,"%","%EPAISSEUR",1),%9EPA)=1E-2
 S:'($D(^V($J,"%","%ORIENTATION",1))) (^V($J,"%","%ORIENTATION",1),%9O)="VERTICALE"
 Q
TUERLOC 
 K ^V($J,"GDX") Q
CREERLOC 
 N t,i S t="^V($j,""GDX"")" F i="%UU","%LIMXCM","%LIMYCM","%LIMX","%LIMY","%9EPA","%TRSLTXH","%TRSLTYH","%TRSLTXV","%TRSLTYV","%TRSLTX","%TRSLTY","%9O" S @t@(i)=@i
 Q
CHARGERLOC() 
 I '($D(^V($J,"GDX"))) Q 1
 N t,i S t="^V($j,""GDX"")" F i="%UU","%LIMXCM","%LIMYCM","%LIMX","%LIMY","%9EPA","%TRSLTXH","%TRSLTYH","%TRSLTXV","%TRSLTYV","%TRSLTX","%TRSLTY","%9O" S @i=@t@(i)
 Q 0
COOR 
 I '($D(^V($J,"%","%TAILLE",1))) G COOR2
 I $D(%9T),%9T=^V($J,"%","%TAILLE",1) G COOR2
 S %9T=^V($J,"%","%TAILLE",1)
COOR2 
 
 
 
 
 
SUITE 
 I '($D(^V($J,"%","%EPAISSEUR",1))) G SUI2
 I $D(%9EPA),%9EPA=(^V($J,"%","%EPAISSEUR",1)*1E-1) G SUI2
 S %FONC="EPAISSEUR",%9EPA=^V($J,"%","%EPAISSEUR",1)*1E-1 D ^%PBPZ
SUI2 G:VALPLA="P" PLACP
 G:VALPLA="P" PLACD
 S %9X=^V($J,"%","%X",1),%9Y=^V($J,"%","%Y",1) Q
PLACP 
 S %9X1=^V($J,"%","%X",1),%9Y1=^V($J,"%","%Y",1) Q
PLACD 
 S %9X1=^V($J,"%","%X",1),%9Y1=^V($J,"%","%Y",1) Q
 
GRAPH 
 
 N ACTION
 S ACTION=%FONC
 I '($D(^V($J,"%","%EPAISSEUR",1))) G GRA1
 I $D(%9EPA),%9EPA=(^V($J,"%","%EPAISSEUR",1)*1E-1) G GRA1
 S %FONC="EPAISSEUR",%9EPA=^V($J,"%","%EPAISSEUR",1)*1E-1 D ^%PBPZ
GRA1 I $D(%9O),%9O'=^V($J,"%","%ORIENTATION",1) G GRA2
 S %FONC=ACTION D GRAPH2
 S %FONC="CHARGER.VARIABLES" D ^%PBPZ
 Q
GRA2 I ^V($J,"%","%ORIENTATION",1)'="HORIZONTALE" G GRA3
 S %FONC="LANDSCAPE" D ^%PBPZ
 S %9O=$$^%QZCHW("HORIZONTALE")
 S %FONC=ACTION D GRAPH2
 S %FONC="PORTRAIT" D ^%PBPZ
 S %9O=$$^%QZCHW("VERTICALE")
 S %FONC="CHARGER.VARIABLES" D ^%PBPZ
 Q
GRA3 S %FONC="PORTRAIT" D ^%PBPZ
 S %9O=$$^%QZCHW("VERTICALE")
 S %FONC=ACTION D GRAPH2
 S %FONC="LANDSCAPE" D ^%PBPZ
 S %9O=$$^%QZCHW("HORIZONTALE")
 S %FONC="CHARGER.VARIABLES" D ^%PBPZ
 Q
GRAPH2 
 S (%9X,%9X1)=^V($J,"%","%X",1),(%9Y1,%9Y)=^V($J,"%","%Y",1)
 S %9X2=^V($J,"%","%X2",1),%9Y2=^V($J,"%","%Y2",1)
 D ^%PBPZ
 Q

