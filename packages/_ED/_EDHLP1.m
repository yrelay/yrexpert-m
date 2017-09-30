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

;%EDHLP1^INT^1^59547,73869^0
%EDHLP1 ;
 
 
 
 
 N C,CH,I,MN1,LI
 S MN1=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MN1)
DEB 
 S @MN1="21^10^79"
 S @MN1@(1)=$$^%QZCHW("VERBES")_"^VERBES",@MN1@(1,"COM")=$$^%QZCHW("Presentation des verbes (extrait de MAN)")
 S @MN1@(2)=$$^%QZCHW("TOUCHES.DE.FONCTIONS")_"^TCHF",@MN1@(2,"COM")=$$^%QZCHW("Fonctions d'edition")
DIAL2 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Aide a l'utilisateur"))
 D ^%VQUIKMN(2,80,22,MN1,.AD,.CONTR)
 I ((CONTR="A")!(CONTR="F"))!(AD="FIN") G FIN
 I AD'="" S I=1,DY=YH+1,DX=XG+2 G @AD
 G DIAL2
VERBES D HELPV^%TLHELPN("FORMAT")
 G DIAL2
TCHF D TCHF^%QULIMH
 G DIAL2
 
FIN K @(MN1)
 D REAFF^%EDFDIAL
 Q
 ;
 ;
 ;
 ;
 ;

