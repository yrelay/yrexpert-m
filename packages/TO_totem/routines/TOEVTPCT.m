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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOEVTPCT^INT^1^59547,74872^0
TOEVTPCT(ART,NUF,TW) 
 K TC G:'($D(^[QUI]ATPCTGAM(YA))) FIN S TC("DUR")=$S($D(^[QUI]ATPCTGAM(YA,1,1)):^[QUI]ATPCTGAM(YA,1,1),1:""),TC("COU")=$S($D(^[QUI]ATPCTGAM(YA,1,2)):^[QUI]ATPCTGAM(YA,1,2),1:"")
 S YA="$TC",OP=-1,TC("COUT")=0,TC("DURT")=0
LOP S OP=$N(^[QUI]CARATPC(NUF,TW,OP)) G:OP=-1 FPP K ^V($I,YA) S PP=-1
LPP S PP=$N(^[QUI]CARATPC(NUF,TW,OP,PP)) G:PP=-1 DUR S ^V($I,YA,PP)=^[QUI]CARATPC(NUF,TW,OP,PP) G LPP
DUR S $ZT="G ERR",TC("TYP")="DUR",@("TC(""VAL"")="_TC("DUR")),^[QUI]DUREE(NUF,TW,OP)=TC("VAL"),TC("DURT")=TC("DURT")+TC("VAL")
COU S TC("TYP")="COU",@("TC(""VAL"")="_TC("COU")),^[QUI]COUT(NUF,TW,OP)=TC("VAL"),TC("COUT")=TC("COUT")+TC("VAL")
 G LOP
FPP S ^[QUI]COUT(NUF,TW)=TC("COUT"),^[QUI]DUREE(NUF,TW)=TC("DURT")
FIN K TC,OP,PP Q
ERR I TC("TYP")="DUR" S ^[QUI]DUREE(NUF,TW,OP)="???" G COU
 S ^[QUI]COUT(NUF,TW,OP)="???" G LOP

