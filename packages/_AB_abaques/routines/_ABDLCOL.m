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

;%ABDLCOL^INT^1^59547,73864^0
%ABDLCOL ;
 
 
 
 
 Q:'($D(^TACOMPIL($I)))
 D CLEPAG^%VVIDEO
 S %UCI=^TABIDENT($I,"%UCI"),QUCOM=%UCI
 S PAG=-1 F UU=0:0 S PAG=$N(^TACOMPIL($I,PAG)) Q:PAG=-1  S LI=-1 F VV=0:0 S LI=$N(^TACOMPIL($I,PAG,LI)) Q:LI=-1  D TRAIT
FIN Q
 
TRAIT N SSGR,IT,RR
 S RES=^TACOMPIL($I,PAG,LI),RR=1
 F IT="NOMG","NORM","IDENT","TYPGR" S @IT=$P(RES,"^",RR),RR=RR+1
 W !,NOMG,?40,NORM,?60,IDENT,?75,TYPGR,!,?20,$$^%QZCHW("Confirmez (O/N) ? ") R *REP
 S REP=$C(REP)
 I REP'=$$^%QZCHW("O") W $$^%QZCHW("Suppression non effectuee !") G END
 W " OK ! " S QU=$S(TYPGR["C":QUCOM,1:QUI) K ^[QU]PRONUM(NOMG,NORM),^[QU]OCGRIL(NOMG,NORM),^[QU]OCGRIL(NOMG_"/COMMENT",NORM)
 I '($D(^[QU]REFABAC(NOMG,NORM,IDENT))) G END
 S NUGR=^[QU]REFABAC(NOMG,NORM,IDENT),GROUP=$P(^[QU]GROUGRIL(NUGR),"|",1),SSGR=$P(^[QU]GROUGRIL(NUGR),"|",4)
 K ^[QU]GRUPLET(NUGR),^[QU]INTERGRI(NUGR),^[QU]REFABAC(NOMG,NORM,IDENT),^[QU]EVALGRIL(NUGR),^[QU]PARAGRIL(NUGR),^[QU]RESUGRIL(NUGR),^[QU]GROUGRIL(NUGR),^[QU]SSGRGRI(GROUP,SSGR,NUGR)
END Q

