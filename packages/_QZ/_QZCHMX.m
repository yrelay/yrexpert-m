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
;! HL001 ! HL     ! 14/07/18 ! Erreur %GTM-E-INVCMD                           !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QZCHMX^INT^1^59547,73887^0
QZCHMX(CH) 
 
 
 
 
 
 
 
 
 
 ;HL001 S $ZT="ERR^%QZCHMX"
 S $ZT="G ERR^%QZCHMX"
 S CH=CH+0
 S $ZT="" Q 0
ERR 
 S $ZT=""
 D ^%VZEAVT(CH_" : "_$$^%QZCHW("valeur de type <nombre>E<nombre> inacceptable"))
 Q 1
 
 
DIR(CH) 
 ;HL001 S $ZT="ERRD^%QZCHMX"
 S $ZT="G ERRD^%QZCHMX"
 S CH=CH+0
 S $ZT="" Q 0
ERRD 
 S $ZT=""
 Q 1
 
 
TEST N CH,R S DX=0,DY=22 D CLEBAS^%VVIDEO X XY W "Chaine de caracteres : " R CH
 Q:CH=""
 S R=$$^%QZCHMX(CH) D ^%VZEAVT("Resultat = "_R)
 G TEST
 
TESTD N CH,R S DX=0,DY=22 D CLEBAS^%VVIDEO X XY W "Chaine de caracteres : " R CH
 Q:CH=""
 S R=$$DIR^%QZCHMX(CH) D ^%VZEAVT("Resultat = "_R)
 G TESTD

