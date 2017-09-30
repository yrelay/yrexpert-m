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

;%EDFDUPP^INT^1^59547,73869^0
EDFDUPPL ;
 
 
 
 
 N C,FIN,I,INIT
DEB D CLEPAG^%VVIDEO
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("DUPLICATION D'UN FORMAT")
 D 4^%VZCD
L0 S DX=0,DY=5 D CLEBAS^%VVIDEO
 S DX=10,DY=10 X XY W $$^%QZCHW("Format a dupliquer : ") S DX=$X,DY=$Y
 D ^%VLEC Q:CTRLA!(Y1="")
 G:('($F(Y1,"*",0)))&('($F(Y1,"?",0))) TEST
 
 D INIT^%QUCHOIP("^[QUI]EDFORMAT","",1,0,5,79,17),AFF^%QUCHOIP S Y1=$$UN^%QUCHOIP D END^%QUCHOIP Q:Y1=""
TEST S INIT=Y1 I '($D(^[QUI]EDFORMAT(INIT))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Ce format n'existe pas ... refuse") H 3 G L0
LL0 D POCLEPA^%VVIDEO W $$^%QZCHW("Nom de la duplication : ") S DX=$X,DY=$Y D ^%VLEC
 Q:CTRLA!(Y1="")
 I $D(^[QUI]EDFORMAT(Y1)) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Un modele de ce nom existe deja ... refuse [RETURN]") R *DX:^TOZE($I,"ATTENTE") G LL0
 D POCLEPA^%VVIDEO W $$^%QZCHW("Duplication en cours ...") D DUPL^%EDFGEST(WHOIS,QUI,INIT,WHOIS,QUI,Y1)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Duplication terminee ...") Q

