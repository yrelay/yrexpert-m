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

;%QAXCODE^INT^1^59547,73875^0
ZSYCODE ;
 
 
 
 
 
 N I,MES,R,REP,Y1
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,MSG=$$^%QZCHW("MAJ DU CODE COURANT"),GRAPH=1 D 4^%VZCD
 S DX=10,DY=8 X XY W $$^%QZCHW("Code courant : "),$$COD^%QAX
 D POCLEPA^%VVIDEO W $$^%QZCHW("Voulez-vous le modifier ") S REP=$$^%VZEOUI("N")
 Q:REP=-1  Q:REP=$$^%QZCHW("NON")  G @("REP"_REP)
REP0 Q
REP1 D POCLEPA^%VVIDEO S R=$$^%VZECH2($$^%QZCHW("Quelle valeur : "),"Defaut","Autre") Q:(R=1)!(R=6)  G @$E(R,1)
D S ^TOZE($I,"CODSYN")="" Q
A D POCLEPA^%VVIDEO,INIT^%QUCHOIP("^[QUI]ZSYNONY",1,"",0,10,80,12),AFF^%QUCHOIP
 S Y1=$$UN^%QUCHOIP Q:Y1=""
 S ^TOZE($I,"CODSYN")=Y1 Q

