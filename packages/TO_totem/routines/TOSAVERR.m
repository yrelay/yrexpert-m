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

;TOSAVERR^INT^1^59547,74875^0
TOSAVERR ;
 K ^VERR($J) S TB=$P($T(VAR),";;",2) F %U=1:1 S IT=$P(TB,",",%U) Q:IT=""  S:$D(@IT) ^VERR($J,0,IT)=@IT
 S IT=-1 F %U=0:0 S IT=$N(B(IT)) Q:IT=-1  S ^VERR($J,1,"B",IT)=B(IT)
 S IT=-1 F %U=0:0 S IT=$N(NOM(IT)) Q:IT=-1  S ^VERR($J,1,"NOM",IT)=NOM(IT)
FIN K B,NOM,TB,IT Q
VAR ;;%TREFC,%8DEB,NOMTREE,ADR,%PR,NVIRG,NOM,STOP
RES K B,NOM S IT=-1 F %U=1:1 S IT=$N(^VERR($J,0,IT)) Q:IT=-1  S @IT=^VERR($J,0,IT)
 S TB=-1 F %U=0:0 S TB=$N(^VERR($J,1,TB)) Q:TB=-1  S IT=-1 F %U=0:0 S IT=$N(^VERR($J,1,TB,IT)) Q:IT=-1  S @TB@(IT)=^VERR($J,1,TB,IT)
 K TB,IT,%U,^VERR($J) Q

