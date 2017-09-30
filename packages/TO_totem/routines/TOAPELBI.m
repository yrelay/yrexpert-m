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

;TOAPELBI^INT^1^59547,74871^0
TOAPELBI ;;02:00 PM  1 Jun 1989
 
 
 
 K ^AFFPAG($I) D CLEPAG^%VVIDEO
 S TIT=$$^%QZCHW("APPEL DES BLOCS IMPLICITES") D ^TOGETART
 S ADSTO="ACQDON^TOAPELBI",EGAP=0 G:'($D(^COMPILVU($I))) FIN
 S DX=0,DY=6 D CLEBAS^%VVIDEO K TIT
LECSUP S DX=0,DY=12 D CLEBAS^%VVIDEO
 
 S DX=10 X XY W $$^%QZCHW("Impression sur ") S SUP=$$^%VZESOR("E") G:(SUP'=1)&(SUP'=0) FIN
 S SUP=$S(SUP=0:"E",1:"I")
 S LILIM=21 I SUP="I" S LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-4,1:62)
 S DX=0,DY=6 D CLEBAS^%VVIDEO W $$^%QZCHW("Un instant...")
 S ARTI=-1 F %AA=1:1 S ARTI=$N(^COMPILVU($I,ARTI)) Q:ARTI=-1  S LI=500 D ^TORESBIM
 I $D(^AFFPAG($I)) D @SUP
FIN K ^COMPILVU($I),^AFFPAG($I),EGAP,LI,ARTI,SUP,LILIM,%AA,ADSTO,IMPR,PAGE,TIT,%DAT,HEURE,DOLARI Q
ACQDON S LI=LI+1 I LI>LILIM S LI=7,EGAP=EGAP+1
 S ^AFFPAG($I,EGAP,LI)=VAL Q
E D ^TOPAGIN Q
I D ZD^%QMDATE4,^%QMDAK0 S IMPR=0,DOLARI=$I I $D(^TABIDENT(WHOIS,"PRINTER")) S IMPR=^TABIDENT(WHOIS,"PRINTER")
 O IMPR U IMPR F PAGE=1:1 Q:'($D(^AFFPAG(DOLARI,PAGE)))  D ENTET F LI=8:1 Q:'($D(^AFFPAG(DOLARI,PAGE,LI)))  W !,^AFFPAG(DOLARI,PAGE,LI)
 W !,# C IMPR Q
ENTET W $$^%QZCHW("Le : "),%DAT,$$^%QZCHW(" a : "),HEURE,$$^%QZCHW("     *** APPEL DES BLOCS IMPLICITES ***"),?65,$$^%QZCHW("Page : "),PAGE,!
 Q

