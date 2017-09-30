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

;%LXLISTE^INT^1^59547,73870^0
LEXLISTE ;
 S SPACE=2
 D CLEPAG^%VVIDEO,^%VZCD0("EDITION BREVE DU LEXIQUE")
 S DX=0,DY=8 X XY S EOUI=$$^%VZECH2("Edition sur : ","ecran","imprimante"),PRIN=0 I EOUI="imprimante" S PRIN=1,IO=$$^ZG("^TABIDENT(WHOIS,""PRINTER"")") S:IO="" PRIN=0 I PRIN O IO
 I '(PRIN) S IO=0
 S DY=10 X XY W $$L24^%QSLIB2," pour arreter l'edition"
 D EDIT I REP=1,PRIN U IO W !,!,!,"... abandon de l'edition ..."
 I PRIN U IO W # C IO
 Q
EDIT I PRIN D ENTETE
 D:'(PRIN) SMTHSCRL^%VVIDEO S MOT="" W *-1 S INI="",X=0
 F U=0:0 U 0 R *REP:0 D TOUCHE^%INCCLAV(REP,.REP) S MOT=$O(^[QUI]TOLEX(MOT)) Q:(MOT="")!(REP=1)  D EDMO
 I REP=1 U 0 D ^%VZEAVT("abandon de l'edition...")
 D:'(PRIN) JMPSCRL^%VVIDEO Q
EDMO 
 S MOTX=MOT_$J("",SPACE)
 I $E(MOT)'=INI D NWL S INI=$E(MOT) G WNL
 I X=0 S LG=0 G W
 I X>60 G WNL
 F U=20,40,60 Q:U>X
 S LG=U-X I ((X+$L(MOTX))+LG)>80 G WNL
 G W
 Q
NWL U IO W ! S X=0 Q
WNL S X=0,LG=0 U IO W !
W U IO W $J("",LG),MOTX S X=(X+$L(MOTX))+LG Q
ENTETE U IO W #,!,! S D=$$1^%QMDATE1
 U IO W "********************************************************"
 U IO W !,"*      EDITION DES TERMES DU LEXIQUE AU "_D_$J("",15-$L(D))_"*"
 U IO W !,"********************************************************"
 U IO W !,!,! Q

