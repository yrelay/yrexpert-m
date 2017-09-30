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

;TOERROR^INT^1^59547,74872^0
TOERROR ;
 
 S PROG=$P($ZE,">",2),PROG="^"_$P(PROG,"^",2)
DEB D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW(" Erreur dans ")_NUFA D TO4^%VZCD
 S DY=6,DX=10 X XY W $$^%QZCHW("1 Vous abandonnez l'etude") S DY=DY+1 X XY W $$^%QZCHW("2 Vous fournissez les valeurs indefinies") S DY=DY+1 X XY W $$^%QZCHW("3 Vous desirez consulter les parametres deja definis")
 S DY=DY+2 X XY W $$^%QZCHW("Votre choix : ") R *REP S REP=$C(REP) G:(REP'=1)&((REP'=2)&(REP'=3)) DEB
 G @REP
1 S %ABEND=1 G FIN
3 D ^TOERRAFF G DEB
2 S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=10,DY=5 X XY
 S VS=-1 F VT=1:1 S VS=$N(^EVERROR($I,VS)) Q:VS=-1  S DY=DY+1,DX=10 X XY D TRAIT
 G FIN
TRAIT I VS[$$^%QZCHW(" de ") S VSA=$P(VS,$$^%QZCHW(" de "),2),VSP=$P(VS,$$^%QZCHW(" de "),1),VSQ=VSP_$$^%QZCHW(" de ")_VSA G SUIT
 S VSQ=VS,VSP=VS,VSA=YA
SUIT W VSQ,?40," = " R VSV I $A(VSV)<32 S DE=$Y,FI=$Y D ^%ABNETTO X XY G SUIT
 I VSA=$$^%QZCHW("MATIERE") S:'($D(^V($I,YA,$$^%QZCHW("MATIERE")))) ^V($I,YA,$$^%QZCHW("MATIERE"))=$$^%QZCHW("Inconnue") S ^M($I,^V($I,YA,$$^%QZCHW("MATIERE")),VSP)=VSV,^[QUI]PARMAT(NUFA,TWREF,VSP)=VSV G END
 I VSA=$$^%QZCHW("ARTICLE") S ^V($I,^M($I,$$^%QZCHW("ARTICLE")),VSP)=VSV G RAIS
 S ^V($I,VSA,VSP)=VSV
RAIS S ^[QUI]TVPAR(NUFA,TWREF,VSP)=VSV,^[QUI]RAISON(NUFA,TWREF,VSP)="IMPLICIMODIFICATION"
END Q
FIN S:$D(PROG) ADERROR="RETERR"_PROG K PROG,DXG,DXD,DYH,DYB,GRAPH,MSG,REP,VS,VT,VSQ,VSA,VSV,VSP Q

