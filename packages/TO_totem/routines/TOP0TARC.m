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

;TOP0TARC^INT^1^59547,74874^0
TOP0TARC ;
 
 D CLEPAG^%VVIDEO,REV^%VVIDEO S DX=31,DY=0 X XY W "ACCES PAR No TOTEM" D NORM^%VVIDEO
LEC S DX=0,DY=8 D CLEBAS^%VVIDEO W "No TOTEM : " S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" LEC S NUFA=Y1 G:$D(^[QUI]TREEWORK(NUFA)) TR
 S NF=$N(^[QUI]TREEWORK(NUFA)) I NF[NUFA S NUFA=NF G TR
 D ^%VSQUEAK G LEC
TR S RESUL(1)=$P(^[QUI]TREEWORK(NUFA,0),"^",10) I RESUL(1)="" D ^%VSQUEAK,POCLEPA^%VVIDEO W "Il n'y a pas de fiche correspondant a ce numero !!!" H 2 G LEC
 S RESUL(2)=$N(^[QUI]PSRLFILI(RESUL(1),-1)),CH=^[QUI]PSRLFILI(RESUL(1),RESUL(2))
 F I=1:1 S V=$P(CH,"^",I) Q:V=""  S RESUL(I+2)=V
 S SCR="PSRLFILI",NR=RESUL(1) D ^%VAFIGRI,^%VAFISCR,LOOP1^TOP0RECC
FIN K Y1,RESUL,CH,V,I,NR,SCRE Q

