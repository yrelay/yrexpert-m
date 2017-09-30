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

;TOP0AID1^INT^1^59547,74873^0
TOP0AID1 ;
 
JOUR S DX=0,RET=0,(YDEP,DY)=6 D CLEBAS^%VVIDEO S DAT=-1 F I=1:1 S DAT=$N(^[QUI]P0GETARC(DAT)) Q:(DAT="z")!(DAT=-1)  S VAL=$E(DAT,5,6)_"/"_$E(DAT,3,4)_"/"_$E(DAT,1,2) D CP1,AFF Q:RET=1
 S DX=0,DY=6 G FIN
HEURE S RET=0,DX=0,DY=7,YDEP=9 D CLEBAS^%VVIDEO W ?27,"RECUPERATION DU :",DAAT S HORO=-1,DY=YDEP X XY F I=1:1 S HORO=$N(^[QUI]P0GETARC(DATE,HORO)) Q:HORO=-1  S VAL=$P(HORO,".",1)_"H"_$P(HORO,".",2) D CP2,AFF Q:RET=1
 S DX=0,DY=7
FIN I RET'=1 D POCLEPA^%VVIDEO W "[RETURN]" R *RET
 D CLEBAS^%VVIDEO K DAT,HORO,I,VAL,RET,YDEP Q
AFF S RET="" X XY W VAL S DY=DY+1 I (DY=23)&(DX=60) W $$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET) S DX=0,DY=YDEP D CLEBAS^%VVIDEO Q
 I DY=23 S DY=YDEP,DX=DX+20
 Q
CP1 S CL=0,PA=0,HH=-1,TCP="^[QUI]P0GETARC(DAT)" F %U=1:1 S HH=$N(@TCP@(HH)) Q:HH=-1  S CC=-1 F %U1=1:1 S CC=$N(@TCP@(HH,CC)) Q:CC=-1  S:$D(^[QUI]CLICHE(CC)) CL=1 S:$D(^[QUI]PARCLICH(CC)) PA=1 Q:(CL'=0)&(PA'=0)
SUF S SUF="("_$S(CL=1:"C",1:"")_" "_$S(PA=1:"Z",1:"")_")" S:SUF="( )" SUF="" S VAL=VAL_SUF Q
CP2 S CL=0,PA=0,HH=-1,TCP="^[QUI]P0GETARC(DATE,HORO)",CC=-1 F %U1=1:1 S CC=$N(@TCP@(CC)) Q:CC=-1  S:$D(^[QUI]CLICHE(CC)) CL=1 S:$D(^[QUI]PARCLICH(CC)) PA=1 Q:(CL'=0)&(PA'=0)
 G SUF

