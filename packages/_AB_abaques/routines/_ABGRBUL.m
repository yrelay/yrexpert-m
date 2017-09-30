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

;%ABGRBUL^INT^1^59547,73864^0
%ABGRBUL ;
 
 W !,!,?10,$$^%QZCHW("TITRE     : ") S DX=$X,DY=$Y D ^%VLEC I (CTRLA=1)!(CTRLF=1) D CLEPAG^%VVIDEO G FIN
 S TITRE=Y1
 W !,?10,$$^%QZCHW("No de Cde   : ") S DX=$X,DY=$Y D ^%VLEC I (CTRLA=1)!(CTRLF=1) D CLEPAG^%VVIDEO G FIN
 S CDE=Y1
 W !,?10,$$^%QZCHW("No de Poste : ") S DX=$X,DY=$Y D ^%VLEC I (CTRLA=1)!(CTRLF=1) D CLEPAG^%VVIDEO G FIN
 S POST=Y1
 W !,?10,$$^%QZCHW("No de Lot   : ") S DX=$X,DY=$Y D ^%VLEC I (CTRLA=1)!(CTRLF=1) D CLEPAG^%VVIDEO G FIN
 S LOT=Y1
 D ^%AB3STAR S IMPR=^TABIDENT(WHOIS,"PRINTER")
 K VSEL S LI=-1 F TR=0:0 S LI=$N(^[QUW]RESUGRIL(NUGR,LI)) Q:LI=-1  S PARA=^[QUW]RESUGRIL(NUGR,LI) I $D(VALRET(LI)),VALRET(LI)=$$^%QZCHW("OUI") S VSEL(PARA)=$$^%QZCHW("OUI")
 I '($D(VSEL)) W !,!,!,?10,$$^%QZCHW("Pas d'impression tous les prelevements sont negatifs [RETURN]") R *RET D CLEPAG^%VVIDEO G FIN
 O IMPR U IMPR W !,!,LSTAR,!,"|",?79,"|",!,"|",?10,$$^%QZCHW("Edite le : "),%DAT,?79,"|",!,"|",?79,"|",!,"|",$$^%QZCHW("  Titre : "),TITRE,?79,"|",!,"|",?79,"|",!,"|",?79,"|"
 S MSG=$$^%QZCHW("Cde : ")_CDE_$$^%QZCHW(" Poste : ")_POST_$$^%QZCHW(" Lot : ")_LOT W !,"|",?79,"|",!,"|",?40-($L(MSG)\2),MSG,?79,"|",!,"|",?79,"|",!,$$^%QZCHW("|  Pour : "),?79,"|",!,"|",?79,"|",!,"|",?10,NOMG,"/",NORM,"/",IDENT,?79,"|",!,"|",?40,"&",?79,"|"
 S PARA=-1 F TTR=0:0 S PARA=$N(^VPAR($I,PARA)) Q:PARA=-1  W !,"|",?10,PARA," = ",^VPAR($I,PARA),?79,"|"
 W !,"|",?79,"|",!,"|",?30,"--------------------",?79,"|",!,"|",?79,"|"
 S PARA=-1 F TTR=0:0 S PARA=$N(VSEL(PARA)) Q:PARA=-1  W !,"|",?20,PARA,?79,"|"
 W !,"|",?79,"|" S MSG=$$^%QZCHW($$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")") W !,"|",?77-$L(MSG),MSG,?79,"|",!,LSTAR,!,*23 C IMPR
FIN Q

