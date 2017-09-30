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

;%ABIMPAR^INT^1^59547,73864^0
%ABIMPAR ;
 
 G:ARTI'["~" III F %U=2:1 S A=$P(ARTI,"~",%U) Q:A=""  D LEX
III S A=-1,CYY=1
 F PPP=1:1 S A=$N(^[QUI]FLIMPLI(ARTI,A)) Q:A=-1  D ABC
 S A=-1 F PPP=1:1 S A=$N(^[QUI]NOMENC(ARTI,A)) Q:A=-1  I A["~" S A1=$P(A,"~",1) D ^%ABINDIC($P(A,"~",2,999),"DIN") F %U=1:1 Q:'($D(DIN(%U)))  S A2=DIN(%U),^[QUI]INDICE(ARTI,"IND",A2,DIN,A1)=%U,^[QUI]INDICE(ARTI,"COMP",A1,DIN,A2)=%U
 
 K A,PPP,%CP,%TYEXP,CHUN,CP,PRX G FIN
ABC G:A'["~" CP S A1=$P(A,"~",1)
 D ^%ABINDIC($P(A,"~",2,999),"DIN") F %U=1:1 Q:'($D(DIN(%U)))  S A2=DIN(%U),^[QUI]INDICE(ARTI,"IND",A2,DIN,A1)=%U,^[QUI]INDICE(ARTI,"PARA",A1,DIN,A2)=%U
CP S CP=$N(^[QUI]FLIMPLI(ARTI,A,-1)) G:CP=-1 FIN D GUNITI,ESTIND
LEX S PRX=A D ^%ABBUILT
 I $D(^[QUI]EXPGIMP(A)) S %CP=A,%TYEXP="I%%" D ^%AB3GPSY
 G FIN
GUNITI S CHUN=^[QUI]FLIMPLI(ARTI,A,CP),^[QUI]UNITE(ARTI,A)=$P(CHUN,"^",1) G FIN
ESTIND S FOR=$P(CHUN,"^",18) I $E(FOR,1,7)'="$INDICE" K FOR,CHUN G FIN
 S ^[QUI]INDICE(ARTI,"IND",A,1,A)=1 G FIN
FIN Q

