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

;TOLOCOMP^INT^1^59547,74873^0
TOLOCOMP ;
 
 L  K ^DEJAVU($I) D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...")
 S IMPOSS=0,GG=-1 F I=1:1 S GG=$N(^NAMEFUL(GG)) Q:GG=-1  D TRAIT1 Q:IMPOSS=1
 G:IMPOSS=1 FINI
 F J=0:1 S LGL=$T(GLOB+J) Q:LGL=""  S GL=$P(LGL,";;",2),GL=$P(GL,";;",1) F I=1:1 S G=$P(GL,",",I) Q:G=""  D TRAIT Q:IMPOSS=1
FINI I IMPOSS=1 L  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("La comprehension de "),ARTI,$$^%QZCHW(" est impossible a executer dans l'immediat...") H 2
FIN D POCLEPA^%VVIDEO K ^DEJAVU($I),IMPOSS,GG,J,LGL,GL,G,I,GLO G END
END Q
TRAIT1 S G=GG D TRAIT G:IMPOSS=1 END S G=^NAMEFUL(GG),G=$P(G,"^",1) D TRAIT G END
TRAIT I $D(^DEJAVU($I,G)) G END
 S GLO="^[QUI]"_G_"(ARTI)" D ^TOLOCKGL S ^DEJAVU($I,G)=1
 G END
GLOB ;;REFLATER,AIMPLICI,CIMPLICI,ANOMENC,CNOMENC,AMBICYCL,CYCLE,AFORMULE,CFORMULE,CPHASE,PARINDEF,NOMARL,NOMSRL,NONTRI,RANG,IMPBIS,CMATIERE,AMATIERE,CSELMAT,ASELMAT
 ;;TREEIMP,TRI,KEMPLOI,NURG,NUIRG,CCOMPARA,LIBCYCLE,AOUTCONS,COUTCONS,ADIMOUT,CDIMOUT,CPTEUR,IMPLICI,VALITOLE,NOMENC,PHASE,OUTCONS,DIMOUT,FORMULE,MATIERE,SELMAT,MACSEL,COMPARAT

