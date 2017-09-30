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

;TOERRAB2^INT^1^59547,74872^0
TOERRAB2 ;
 
N S ADER="RET1^TOVALIAB",NUGR=$N(^[QUW]DEFGROUP(NUGROU,"R",-1)) I NUGR=-1 S %ABEND=1 D:BATCH'=0 ERR1 D KILL G @ADER
 I '($D(^[QUW]GROUGRIL(NUGR))) S %ABEND=1 D:BATCH'=0 ERR1 D KILL G @ADER
 S NGR=$P($P(^[QUW]GROUGRIL(NUGR),"|",2),"^",1) D CADRE G AFFVAL
CADRE D CLEPAG^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Indetermination dans une evaluation d'abaque"),!,?20,$$^%QZCHW("pour "),YA S DX=10,DY=3 X XY W $$^%QZCHW("Erreur dans : ") S ADX=$X,ADY=$Y D BLD^%VVIDEO S DX=ADX,DY=ADY X XY W NGR D NORM^%VVIDEO Q
AFFVAL G:BATCH'=0 ERR2 K ^EVERROR($I) W ! S PP=-1 F UU1=1:1 S PP=$N(^TBPARV($I,PP)) Q:PP=-1  S VPP=^TBPARV($I,PP) W !,?10,PP," = " S ADX=$X,ADY=$Y D:VPP["??" BLD^%VVIDEO,REV^%VVIDEO S DX=ADX,DY=ADY X XY W VPP D NORM^%VVIDEO I VPP["??" S ^EVERROR($I,PP)=1
 D POCLEPA^%VVIDEO W $$^%QZCHW("RETURN pour continuer") R *RET D ^TOERROR,^TOTCADRE,KILL G @ADER
P S ADER="RETERR^TOVALIAB" I '($D(^[QUW]GROUGRIL(NUGR))) S %ABEND=1 D:BATCH'=0 ERR1 D KILL G @ADER
 S NGR=$P(^[QUW]GROUGRIL(NUGR),"|",2),NGRI="" F UU1=1:1 S NGRJ=$P(NGR,"^",UU1) Q:NGRJ=""  S NGRI=NGRI_" "_NGRJ
 S NGR=NGRI D CADRE G AFFVAL
KILL K NGR,ADX,ADY,VPP,NGRI,NGRJ Q
ERR1 S %ABEND=1,^CSTEST($I,"ERREUR")=$$^%QZCHW("Une abaque n'a pu etre identifiee ! Veuilez refaire une comprehension de toutes les abaques") Q
ERR2 S %ABEND=1,^CSTEST($I,"ERREUR")=$$^%QZCHW("Parametres indefinis dans l'abaque ")_NGR,PW=1,PP=-1 F UU1=1:1 S PP=$N(^TBPARV($I,PP)) Q:PP=-1  S VPP=^TBPARV($I,PP) S:VPP["?" ^CSTEST($I,"UNDEF",PP)=1
 K PP,PW,UU1,VPP G @ADER

