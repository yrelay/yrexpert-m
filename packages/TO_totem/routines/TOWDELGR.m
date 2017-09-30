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

;TOWDELGR^INT^1^59547,74876^0
TOWDELGR ;
 S %ALL=RESUL(1),%ETAT=RESUL(2),%LARG=RESUL(3)
BEG S %EP=-1
LEP S %EP=$N(^[QUI]OCGRIL("GAMLAC",%ALL,%ETAT,%LARG,%EP)) G:%EP=-1 FLEP S EP=0+%EP,RFTO="LAF" F IT=%ALL,%ETAT,%LARG,EP S RFTO=RFTO_"/"_IT
 S NUET=$S($D(^[QUI]GAMLAF(RFTO)):^[QUI]GAMLAF(RFTO),1:"")
 K ^[QUI]OCGRIL("GAMLAC",%ALL,%ETAT,%LARG,%EP),^[QUI]GAMLAF(RFTO) I NUET'="" D KILL
 G LEP
FLEP K ^[QUI]SAISIGAM("GAMLAC",%ALL,%ETAT,%LARG) Q
KILL K ^[QUI]ANTETUDE("LAF",NUET),^[QUI]REFANTET("LAF",%ALL,EP,%ETAT,%LARG,NUET) S TB=$P($T(TBK),";;",2) F %U=1:1 S TBK=$P(TB,",",%U) Q:TBK=""  S TBK="^[QUI]"_TBK K @TBK@(NUET)
 Q
TBK ;;TVPAR,PHAS,CONS,DIM,RAISON,AUTOPLAF,SECT,DUREE,COUT

