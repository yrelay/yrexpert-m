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

;TOP0TRC1^INT^1^59547,74874^0
TOP0TRCL ;
 
 D POCLEPA^%VVIDEO W $$L23^%QSLIB2("(S)uppres., CTRLG gomme, (V)isualis., (P)arametres significatifs") S DX=0,PY=7
DEB S MPASX=0,MPASY=1,NXI=-1,NXS=79,NYI=7,NYS=22
DEB1 S DY=PY+1 S:DY>21 (DY,PY)=21 S DX=0 X XY D ^%VZECUR G:X1=1 1 S PY=$Y
 G:'($D(^POSENR($I,PAGE,PY))) DEB1 G:((((X1'=1)&(X1'=83))&(X1'=86))&(X1'=80))&(X1'=7) DEB1
 G @X1
FIN Q
END K OPAGE,%QUIT,COM,LY,PY,PDL,MPASX,MPASY,NXI,NXS,NYI,NYS,TYMOD,ADPY,DPY,GF,DE,FI,PARAM Q
1 G END
83 D BLD^%VVIDEO,BLK^%VVIDEO S DY=PY X XY W "S" S DX=2 X XY D AFFI,NORM^%VVIDEO S ^FLASUP($I,$P(^POSENR($I,PAGE,PY),"^",1))=1 G DEB1
7 W " " S DY=PY X XY D AFFI,NORM^%VVIDEO K ^FLASUP($I,$P(^POSENR($I,PAGE,PY),"^",1)) G DEB1
86 S ^PAGE=PAGE D ^TOP0VIFL S (OPAGE,PAGE)=^PAGE,%QUIT=1,IOM=80 D CADRE^TOP0SEEC,BEG1^TOP0SEEC K ^PAGE G AFPAG
80 S ^PAGE=PAGE D ^TOP0VIZS S (OPAGE,PAGE)=^PAGE,%QUIT=1,IOM=80 D CADRE^TOP0SEEC,BEG1^TOP0SEEC K ^PAGE G AFPAG
AFFI S COL=1 F XX=3,15,40,55,67 W ?XX,$P(^POSENR($I,PAGE,PY),"^",COL) S COL=COL+1
 Q
AFPAG S PAG="Page "_PAGE_"/"_NBPAG,DX=40-($L(PAG)\2),DY=6 X XY W PAG G TOP0TRCL

