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

;%LXCHSYN^INT^1^59547,73870^0
%LXCHSYN ;
 
 S ^[QUI]TOLEXS(" ")="",ADR="TRAIT^%LXCHSYN",NOMTAB="^[QUI]TOLEXS" D ^%VTENR
 K ^[QUI]TOLEXS(" ") Q
TRAIT W !,B1 K ^[QUI]TOLEXS(B1) S UU=-1 F VV=0:0 S UU=$N(%RS(UU)) Q:UU=-1  I %RS(UU)'="" S ^[QUI]TOLEXS(B1,%RS(UU))="",^[QUI]TOSYNONY(%RS(UU),B1)="" D STO2
 Q
STO2 S:'($D(^[QUI]CPTEUR("TOLEX"))) ^[QUI]CPTEUR("TOLEX")=0
 S (NLEX,^[QUI]CPTEUR("TOLEX"))=^[QUI]CPTEUR("TOLEX")+1
 S ^[QUI]PLEX("TOLEX",NLEX)=%RS(UU)
 D BUILT
 K NLEX,PRX,YY,FIC,PP,P Q
BUILT S YY="TOLEX",PRX=%RS(UU),P="^[QUI]PLEXP(YY," F I=1:1 S FIC=$P(PRX,".",I),PP=P_""""_FIC_""""_")",P=P_""""_FIC_""""_"," Q:FIC=""  S @PP=NLEX
 Q

