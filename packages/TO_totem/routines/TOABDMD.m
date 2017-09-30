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

;TOABDMD^INT^1^59547,74871^0
TOABDMD ;
 
 S REF=$S($D(^[QUW]GROUGRIL(NUGR)):$P(^[QUW]GROUGRIL(NUGR),"|",2),1:""),REF=$TR(REF,"^","/")
 G:BATCH=0 DEB S %ABEND=1,^CSTEST($I,"ERREUR")=$$^%QZCHW("$DMD dans :")_REF G FIN
DEB D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Fonction $DMD sur abaque") D TO4^%VZCD
 S DY=6,DX=40-($L(REF)\2) D BLD^%VVIDEO X XY W REF D NORM^%VVIDEO
 S DY=8,DX=10 X XY W $$^%QZCHW("1 Vous abandonnez l'etude") S DY=DY+1 X XY W $$^%QZCHW("2 Vous fournissez les valeurs indefinies") S DY=DY+1 X XY W $$^%QZCHW("3 Vous desirez consulter les parametres deja definis")
 S DY=DY+2 X XY W $$^%QZCHW("Votre choix : ") R *REP S REP=$C(REP) G:(REP'=1)&((REP'=2)&(REP'=3)) DEB
 G @REP
1 S %ABEND=1 G FIN
3 D ^TOERRAFF G DEB
2 S DX=0,DY=8 D CLEBAS^%VVIDEO S DX=0,DY=8 X XY S VS=-1 F VT=1:1 S VS=$N(VPAR(VS)) Q:VS=-1  W ?(((VT-1)#2)*40)+5,VS," = ",VPAR(VS) I (VT#2)=0 W !
 S DY=$Y+1,DX=10 X XY
 S VS=-1 F VT=1:1 S VS=$N(^DOLDMD($I,VS)) G:VS=-1 FIN S DY=DY+1,DX=10 X XY D TRAIT
TRAIT W VS,?40," = " R VSV S ^V($I,YA,VS)=VSV,@%TABTV@(VS)=VSV
END Q
FIN K PROG,DXG,DXD,DYH,DYB,GRAPH,MSG,REP,VS,VT,VSQ,VSA,VSV,VSP Q

