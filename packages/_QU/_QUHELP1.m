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

;%QUHELP1^INT^1^59547,73885^0
ZHELP ;
 
 S TITRE="ASSISTANCE UTILISATEUR"
 
 D CLEPAG^%VVIDEO,^%VZCD0(TITRE)
 S ADR=^TOZE($I,"LG")
 K ^PAGE($I) S PG=1,LIM=21,LI=8 F %U=0:1 S LIG=$P($T(@ADR+%U),";;",2) Q:LIG="*"  S ^PAGE($I,PG,LI)=LIG,LI=LI+1 I LI>LIM S PG=PG+1,LI=8
 S NBPG=$S($D(^PAGE($I,PG)):PG,1:PG-1),PG=1 D AFF
QU D POCLEPA^%VVIDEO W "+, -, page, ",$$L2^%QSLIB
 S DX=$X D ^%VLEC G:CTRLA=1 END G:Y1="" QU G PL:Y1="+",PL:Y1="=",MS:Y1="-" G:'($D(^PAGE($I,Y1))) QU S PG=Y1 D AFF G QU
PL S NPG=PG+1 G:'($D(^PAGE($I,NPG))) QU S PG=NPG D AFF G QU
MS S NPG=PG-1 G:'($D(^PAGE($I,NPG))) QU S PG=NPG D AFF G QU
END K ^PAGE($I),MSG,NPG,NBPG,PG,LI,LIM,%U,Y1 Q
AFF S DX=0,DY=6 D CLEBAS^%VVIDEO S DY=6,MSG="Page "_PG_"/"_NBPG,DX=40-($L(MSG)\2) X XY W MSG S LI=-1 F %U=1:1 S LI=$N(^PAGE($I,PG,LI)) Q:LI=-1  S DY=LI,DX=5 X XY W ^PAGE($I,PG,LI)
 Q
FR ;;     Ecrire ici le texte d'assistance en francais
 ;;      
 ;;
 ;;
 ;;
 ;;*
GB ;;                                 et ici en anglais
 ;;
 ;;*

