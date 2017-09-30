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

;TO4GCYCL^INT^1^59547,74871^0
TO4GCYCL ;
 
 K ^NUNEWPT($I),^NEWPT($I,ARTI) D ^TO3CARDI,^TO3PTNOC,^TO3CAMEX
 I CAMAX=1 S ^NEWPT($I,ARTI,PTMAX)=1 G GCYCL
LOOP S PS=-1 F UU=0:0 S PS=$N(^SORTIE($I,ARTI,PTMAX,PS)) Q:PS=-1  D TRAIT
 D ^TO3CAMEX G:CAMAX>1 LOOP
GCYCL K ^NUNEWPT($I) D ^TO3MAKCY
FIN K CAMAX,PS,PTMAX,NUM Q
TRAIT S NUM=$S($D(^NUNEWPT($I,PTMAX)):^NUNEWPT($I,PTMAX)+1,1:1),^NUNEWPT($I,PTMAX)=NUM
 K ^SORTIE($I,ARTI,PTMAX,PS) S ^CARD($I,ARTI,PTMAX)=^CARD($I,ARTI,PTMAX)-1 S:$D(^SORTIE($I,ARTI,PS)) ^SORTIE($I,ARTI,PTMAX_"/"_NUM,PS)=1,^CARD($I,ARTI,PTMAX_"/"_NUM)=1,^NEWPT($I,ARTI,PTMAX_"/"_NUM)=1
 Q

