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

;TOPBSELE^INT^1^59547,74874^0
TOPBSELE ;
 
 D POCLEPA^%VVIDEO S PDL=$$L23^%QSLIB2("S selection, CTRLG gomme") W PDL S DX=0,PY=7
DEB S MPASX=0,MPASY=1,NXI=-1,NXS=79,NYI=7,NYS=22
DEB1 S DY=PY+1 S:DY>21 (DY,PY)=21 S DX=0 X XY D ^%VZECUR G:X1=1 1 S PY=$Y
 G:'($D(^POSENR($I,PAGE,PY))) DEB1 G:(X1'=1)&((X1'=7)&(X1'=83)) DEB1
 S ENR=^POSENR($I,PAGE,PY),ARC=$P(ENR,"^",1),NUFA=$P(ENR,"^",2) G @X1
FIN Q
END K COM,LY,PY,PDL,MPASX,MPASY,NXI,NXS,NYI,NYS,TYMOD,ADPY,DPY,GF,DE,FI,PARAM Q
1 G END
83 G:$D(^SELEC($I,PAGE,PY)) DEB1 S TWREF=-1 F TW=1:1 S TWREF=$N(^[QUI]TREEWORK(NUFA,TWREF)) Q:TWREF=-1  S ^SELEC($I,PAGE,PY)=NUFA_"^"_TWREF_"^"_ARC
 D BLD^%VVIDEO,BLK^%VVIDEO S DX=0,DY=PY X XY W "S" D AFFLG,NORM^%VVIDEO
 G DEB1
7 I $D(^SELEC($I,PAGE,PY)) K ^SELEC($I,PAGE,PY) S DX=0,DY=PY X XY W "  " D AFFLG
 G DEB1
AFFLG W ?4,ARC,?31,NUFA G FIN

