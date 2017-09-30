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

;TOTBPED^INT^1^59547,74876^0
TOTBPED ;
 
 D POCLEPA^%VVIDEO S PDL=$$L23^%QSLIB2("(S)election") W PDL S DX=0,PY=7
DEB S MPASX=0,MPASY=1,NXI=-1,NXS=79,NYI=7,NYS=21
DEB1 S DY=PY+1 S:DY>20 (DY,PY)=20 S DX=0 X XY D ^%VZECUR G:X1=1 1 S PY=$Y
 G:'($D(^LISTAFF($I,EGAP,PY))) DEB1 G:(X1'=1)&(X1'=83) DEB1
 G @X1
FIN Q
END K COM,LY,PY,PDL,MPASX,MPASY,NXI,NXS,NYI,NYS,TYMOD,ADPY,DPY,GF,DE,FI,PARAM,%ART,%ETUD,LUSER Q
1 G END
83 S LUSER=^LISTAFF($I,EGAP,PY),DX=0,DY=PY D REV^%VVIDEO,BLK^%VVIDEO X XY W "  ",LUSER,"  " D NORM^%VVIDEO
 S %ETUD=$$GETLBLAN^%VTLBLAN($E(LUSER,1,12)),%ART=$$GETLBLAN^%VTLBLAN($E(LUSER,13,47))
 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D ^%QCAMEMS S TIT="" D ^TOTBEDET,POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D ^%QCAMEMR,REAFF
 G TOTBPED
REAFF D CLEPAG^%VVIDEO,TO4^%VZCD S DX=40-($L(GAP)\2),DY=5 X XY W GAP S DX=0,DY=6 X XY W TIT S DX=0,DY=8 X XY D AFF1^TOAFFPAG Q

