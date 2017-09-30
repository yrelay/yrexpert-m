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

;%TLOPT14^INT^1^59547,74030^0
%TLOPT14 ;
 
 
 
 
 
 
 
 
 
 
SUPELE(IDEB,NBREG) 
 N OBJ,VERS,NUM
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Suppression d'1 element d'1 objet"))
 S OBJ=V(IDEB)
 
 S VERS=V(IDEB+1)
 
 S NUM=V(IDEB+2)
 
 D KILL^%SDEGES2(OBJ,VERS,NUM)
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Element de numero")_" "_NUM_" "_$$^%QZCHW("supprime"))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CNTCOL(IDEB,NBREG) 
 N COL,VERS,X0,Y0,ANG,ECH
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("maj caracteristiques d'1 collection"))
 
 S COL=V(IDEB)
 
 S VERS=V(IDEB+1)
 
 S X0=V(IDEB+2)
 S:X0="" X0=0
 
 S Y0=V(IDEB+3)
 S:Y0="" Y0=0
 
 S ANG=V(IDEB+4)
 S:ANG="" ANG=0
 
 S ECH=V(IDEB+5)
 S:ECH="" ECH=1
 
 
 D CRECOL^%SDCOCAR(COL,VERS,X0,Y0,ANG,ECH) ;;*
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("caracteristiques modifiees"))
 Q 1
 
 
 
 
 
 
 
 
 
 
 
CNTOBJ(IDEB,NBREG) 
 N OBJ,VERS,X0,Y0
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("maj contexte d'1 objet"))
 
 S OBJ=V(IDEB)
 
 S VERS=V(IDEB+1)
 
 S X0=V(IDEB+2)
 S:X0="" X0=0
 
 S Y0=V(IDEB+3)
 S:Y0="" Y0=0
 
 
 D CREOBJ^%SDOCNT(OBJ,VERS,X0,Y0,0,1,200,"O") ;;*
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("contexte modifie"))
 Q 1
 
 
 
 
 
 
 
 
SUPOBJ(IDEB,NBREG) 
 N OBJ,VERS,POS,MSG
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Suppression d'un objet graphique"))
 
 S OBJ=V(IDEB)
 
 S VERS=V(IDEB+1)
 D SUPPR^%SDOCMS(OBJ,VERS)
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Objet graphique supprime"))
 Q 1
 
 
 
 
 
 
 
 
 
SUPCOL(IDEB,NBREG) 
 N COL,VERS
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Suppression d'une collection"))
 
 S COL=V(IDEB)
 
 S VERS=V(IDEB+1)
 D SUPPR^%SDCCMS(COL,VERS)
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Collection supprimee"))
 Q 1
 ;
 ;

