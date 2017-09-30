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

;%QSNOTE2^INT^1^59547,73882^0
QSNOTE2 ;
 
 
 
 
AFF(XG,YH,DH,DV,BASE,IND,ATT,NT,ON,BA,INDIV,AFF) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N PPAGE
 
 S PPAGE=0
CORPS N LIGN,GPARAM,LIBPARAM
 S GPARAM=0
 G:'($D(^[QUI]QUERYT(BASE,IND,ON,"PARAMETRE"))) SAFF
 G:AFF="" SAFF
 S LIBPARAM=""
BPARAM S LIBPARAM=$O(^[QUI]QUERYT(BASE,IND,ON,"PARAMETRE",LIBPARAM))
 G:LIBPARAM="" SAFF
 S @("GPARAM(LIBPARAM)="_AFF_"(LIBPARAM,BA,INDIV)")
 G BPARAM
SAFF S DX=XG,DY=YH,T=""
 F %T=0:0 S T=$O(^[QUI]QUERYT(BASE,IND,ON,"LIGNE",T)) Q:T=""  S LIGN(T)=^[QUI]QUERYT(BASE,IND,ON,"LIGNE",T)
 D CLFEN^%VVIDEO(XG,YH,DV,DH),CARSA^%VVIDEO(XG,YH,DH,DV)
 D REAFF2^%QULIMO3(1,1,"LIGN",XG,YH,DH,DV,"GPARAM")
 S DX=(XG+(((DH-2)-$L(NT))\2))-1,DY=YH X XY W " " S DX=DX+1
 D BLD^%VVIDEO,REV^%VVIDEO X XY W NT D NORM^%VVIDEO
 S DX=DX+$L(NT) X XY W " "
 
 D:'(PPAGE) VISU^%QULIMO(XG,YH,DH,DV,"LIGN",1)
 Q
 
 
 
 
 
 
 
 
AFF2(XG,YH,DH,DV,BASE,IND,ATT,NT,ON,BA,INDIV,AFF,PPAGE) 
 G CORPS

