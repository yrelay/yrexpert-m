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

;TO3RESUM^INT^1^59547,74870^0
TO3RESUM ;
 
 S %DEC=$S($D(^TABIDENT(WHOIS,"DECIMALES")):^TABIDENT(WHOIS,"DECIMALES"),1:2),CTRLA=0,CTRLF=0 K ^PARALFA($J)
 D:DEV="ECR" CLEPAG^%VVIDEO W:DEV'="ECR" # D EDIT Q:(CTRLF=1)!(CTRLA=1)
 W !,LSTAR W:DEV="IMPR" !,!,! I DEV="ECR" S DX=0,DY=23 X XY W $$^%QZCHW("entrer RETURN pour continuer.") R FR
 Q
EDIT I DEV="E" S DX=0,DY=6 X XY W $$^%QZCHW("Un instant...")
 S TEXP="^[QUI]EXPL(YA,NT)",NT=-1 F I=1:1 S NT=$N(@TEXP) Q:NT=-1  I $E(NT,1)'="%",(@TEXP'="%%")&((@TEXP'="ABAC")&(@TEXP'="I%%")),$D(^[QUI]TVPAR(NUFA,TWREF,NT)) S VL=^[QUI]TVPAR(NUFA,TWREF,NT) D V,U S ^PARALFA($J,"E",NT)=VL_"^"_UNIT
 S NT=-1 F I=1:1 S NT=$N(@TEXP) Q:NT=-1  I $E(NT,1)'="%",(@TEXP="%%")!((@TEXP="ABAC")!(@TEXP="I%%")),$D(^[QUI]TVPAR(NUFA,TWREF,NT)) S VL=^[QUI]TVPAR(NUFA,TWREF,NT) D V,U S ^PARALFA($J,"I",NT)=VL_"^"_UNIT
 S NT=-1 F I=1:1 S NT=$N(^[QUI]TVPAR(NUFA,TWREF,NT)) Q:NT=-1  I ($E(NT,1)'="$")&($E(NT,1)'="%"),'($D(^[QUI]EXPL(YA,NT))) S VL=^[QUI]TVPAR(NUFA,TWREF,NT) D V,U S ^PARALFA($J,"I",NT)=VL_"^"_UNIT
 Q:'($D(^PARALFA($J)))  D CLEPAG^%VVIDEO,ENTET S LI=10,STP=0 F TYPA="E","I" S PA=-1 F ZP=1:1 S PA=$N(^PARALFA($J,TYPA,PA)) Q:PA=-1  D AFF Q:STP
 Q
AFF S RAPA=^PARALFA($J,TYPA,PA) W !,"|",?3,PA,?47," = ",$P(RAPA,"^",1),?67,"(",TYPA,")",?72,$P(RAPA,"^",2),?79,"|" S LI=LI+1 I LI>LILIM D SUIT
 Q
U S U="^[QUI]UNITE(YA,NT)",UNIT="" I $D(@U) S %CH=@U,%LGR=5 D ^%QZCHBK S UNIT=%CH K %CH,%LGR
 Q
V S PCH=VL D TO^%QZNBN1 I ISNUM=1 S VL=$J(VL,15,%DEC)
 S %CH=VL,%LGR=15 D ^%QZCHBK S VL=%CH K %CH,%LGR Q
SUIT I DEV="ECR" D POCLEPA^%VVIDEO W $$L14^%QSLIB1 R *RET D TOUCHE^%INCCLAV(RET,.RET),CLEPAG^%VVIDEO S:RET=1 CTRLA=1,STP=1 S:RET=6 CTRLF=1,STP=1 Q:(RET=1)!(RET=6)  W !,$$^%QZCHW("Suite des parametres de :"),!,?5,TOID,!,! S LI=$Y Q
 W !,LSTAR,# D ENTET S LI=10 Q
ENTET 
 S %PPAGE=%PPAGE+1 D ^TOHAUPAG(IMPR,%DDATE,%HHEUR,%TTITR,%PPAGE)
 W !,!,LSTAR,!,"|",?10,NUC,?20,$$^%QZCHW("Parametres de : "),?79,"|",!,"|",?79,"|",!,"|",?10,TOID,?79,"|",!,LSTAR,!,"|",?79,"|"
 Q

