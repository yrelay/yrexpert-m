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

;%DLMACAP^INT^1^59547,73868^0
DLMACAP ;
 
 
 
 
 N OUI,NON,OUINON,I,%I,MA,REP,TITRE
 S TITRE=$$^%QZCHW("Respect des capacites des machines")
 D CLEPAG^%VVIDEO,^%VZCDB(TITRE,0)
 D ^%VZEATT
 S OUI=$$^%QZCHW("OUI"),NON=$$^%QZCHW("NON")
 S OUINON(1)=OUI,OUINON(0)=NON
 S GLOCAP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CAPA")
 K @(GLOCAP)
 S MA=""
 F %I=1:1 S MA=$O(^[QUI]DESMACH(MA)) Q:(MA="")!(MA="z")  S @GLOCAP@(%I,MA)=$S($D(^[QUI]DLMACAP(MA)):OUINON(^[QUI]DLMACAP(MA)),1:"")
 D CLEPAG^%VVIDEO,^%VZCDB(TITRE,0)
 D SPEC^%QUSAIS2(GLOCAP,0,1,78,22,0,"UC^%DLMACAP")
 D ^%VZEATT
 S I=""
 F %I=0:0 S I=$O(@GLOCAP@(I)) Q:I=""  S MA=$O(@GLOCAP@(I,"")),REP=@GLOCAP@(I,MA) S:REP'="" ^[QUI]DLMACAP(MA)=$S(REP=NON:0,1:1)
 Q
 
UC(Y1) 
 I (Y1'=OUI)&(Y1'=NON) D ^%VSQUEAK Q 0
 Q 1
 
RESPECT(MA) 
 Q:MA="" ""
 Q:'($D(^[QUI]DLMACAP(MA))) 1
 Q ^[QUI]DLMACAP(MA)
 ;

