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

;%VCREM02^INT^1^59547,74034^0
GECREM02 ;; 22 Jan 87 11:06 AM ; 23 Jul 87 11:16 AM
 
CHAR K DEF,LIBEL,CHAR
 F %U=0:1 S LI=$P($T(LIB+%U),";;",2) Q:LI=""  S IT=$P(LI,"#",1),IT1=$P(IT,"/",1),IT2=$P(IT,"/",2),LIBEL(IT1)=IT2,CHAR(IT2)=$S(($D(^MASQUE(M,"DESC",IT2))#10)=1:^MASQUE(M,"DESC",IT2),1:""),DEF(IT2)=$P(LI,"#",2)
 D ^%VCREM05
 S I="ROUSTOC" S:CHAR(I)'="" ^MASQUE(M,"DESC",I)=CHAR(I) K:CHAR(I)="" ^MASQUE(M,"DESC",I)
 S I="ROUCHAR" S:CHAR(I)'="" ^MASQUE(M,"DESC",I)=CHAR(I) K:CHAR(I)="" ^MASQUE(M,"DESC",I)
 D CLEPAG^%VVIDEO Q
LIB ;;Routine de stockage/ROUSTOC#Donner la sequence de stockage des donnees ex:^STOCX,^%VAUTSTO
 ;;Routine de chargement/ROUCHAR#Donner la sequence de chargement des donnees ex:^%VCHAR

