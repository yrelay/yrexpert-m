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

;TONETTOT^INT^1^59547,74873^0
TONETTOT ;
 K ^TAB($J) F %U=0:1 S LTAB=$P($T(TAB+%U),";;",2) Q:LTAB=""  F %V=1:1 S GLO=$P(LTAB,",",%V) Q:GLO=""  S ^TAB($J,GLO)=1
 D ^%GLO S GLO=0 F %U=1:1 S GLO=$O(^UTILITY("GLO",GLO)) Q:GLO=""  K:'($D(^TAB($J,GLO))) @("^"_GLO) W "."
 K ^TAB($J),%U,LTAB,%V,GLO Q
TAB ;;PROGMOD,SIN,COS,ARCSIN,ARCOS,TANG,COTG,ARCTG,ARCCTG,PRECSTCT,ROUTINE,TOLISGLO,NAMEFUL,MN,SCRE,TABIDENT,SCRC,STRUCT,PRONUM,OCGRIL,GRUPLET,REFABAC,INTERGRI,OCUNIT,EVALGRIL
 ;;PARAGRIL,RESUGRIL,GRILRESU,GRTYPN,ABDEJEV,GROUGRIL,DEFGROUP,SSGRGRI,TIMCPGR,GRILEROR,SSGROUP,CPTEUR,UTILITY,TAB,TOZE,ENVIRON,ENVPAP,ENVCONF,MOZ,MOZ100,MOZ52,MOZCH,MOZMEM,MOZSAV,MOZWORD
 ;;SPREAD,SPRFONCS,SPRHELP,SPRLIGNE,SPRMEN10,SPRMEN11,SPRMEN12,SPRMEN13,SPRMEN14,SPRMEN15,SPRMEN16,SPRMEN17,SPRMEN18,SPRMEN19,SPRMEN20,SPRMEN21,SPRMEN22,SPRMEN5,SPRMEN6,SPRMEN9,SPRMENU,SPROPARA,SPROPVAL,SPRTMP,SPRTMP2,SPRTMP3

