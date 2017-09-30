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

;%ABPTGRX^INT^1^59547,73864^0
%ABPTGRX ;
 
 K ^POSENR($I),^POSFUL($I) S DX=0,DY=6 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO W $$L12^%QSLIB1
 S PAGE=0,LG=21,FINAF=0,FINAB=0,PA=-1 F PP=1:1 S PA=$N(^TACOMPIL($I,PA)) Q:PA=-1  S LI=-1 F LL=1:1 S LI=$N(^TACOMPIL($I,PA,LI)) Q:LI=-1  D TR Q:FINAF=1
FIN D ^%ABPTCHC K FINAF,FINAB,PA,PP,LI,LL Q
TR S NOMG=$P(^TACOMPIL($I,PA,LI),"^",1),FINAB=0
 F PGE=1:1 Q:'($D(^[QUI]OCGRIL(NOMG,"GRAPHE",PGE)))  F %COL=10,33,56 Q:'($D(^[QUI]OCGRIL(NOMG,"GRAPHE",PGE,"P",4,%COL)))  D TR1 Q:FINAB!FINAF
 Q
TR1 S NAME=^[QUI]OCGRIL(NOMG,"GRAPHE",PGE,"P",4,%COL),DATE=^[QUI]OCGRIL(NOMG,"GRAPHE",PGE,"P",5,%COL)
 S LG=LG+1 I LG>21 S LG=8,PAGE=PAGE+1
 S ^POSENR($I,PAGE,LG)=NAME_"^"_DATE_"^"_NOMG_"^"_PGE_"^"_%COL,DX=0,DY=LG X XY W ?3,NAME,?50,DATE
 R *REP:0 D TOUCHE^%INCCLAV(REP,.REP)
 S:REP=1 FINAF=1 S:REP=6 FINAB=1 Q

