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

;DUREE^INT^1^59547,74866^0
DUREE ;
 
RETERR S %RESULTAT="1???",$ZT=^TOZE($I,"A") Q:%ABEND=1  K ITEX S ITEX=$P(EXPFONC,"/",2,500),IIT=1,(%FPH,%FOP)="" F IT="%FPH","%FOP" I $P(ITEX,"/",IIT)'="" D TRAIT S IIT=IIT+1
 G:((%FPH="")!%FOP)="" FIN
PH G:'($D(^PHASADM($I,NUFA,TWREF,"PHAS","OK",%FPH,%FOP))) PH1 S %FOG=^PHASADM($I,NUFA,TWREF,"PHAS","OK",%FPH,%FOP) I '($D(^[QUI]DUREE(NUFA,TWREF,%FOP_"/"_%FOG))) S %PAAAF=0 G FIN
 S %RESULTAT=^[QUI]DUREE(NUFA,TWREF,%FOP_"/"_%FOG) G FIN
PH1 I $D(^TENTATIV($I,NUFA,TWREF,"PHAS",%FPH,%FOP)) S %PAAAF=0 G FIN
FIN K %FOG,IIT,%FPH,%FOP,ITEX,IT Q
TRAIT I $P(ITEX,"/",IIT)["^V($I,YA" S @("OB="_$P(ITEX,"/",IIT)),@IT=OB Q
 S @IT=$P($P(ITEX,"/",IIT),"""",2) Q

