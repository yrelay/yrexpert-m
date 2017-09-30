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

;TOP01BAT^INT^1^59547,74873^0
TOP01BAT ;
 
1 D VERI G:%U=0 FIN S %ROUTR="^TOP0SCED",%GLTES="^[QUI]PSRLPARF(ARC)",%TRCL="END^TOP01BAT",%GOCL=$$^%QZCHW("FIN"),NOMTAB="^[QUI]PSRLFILI",ADR="TRAIT1^TOP0EDC1" D BEG^TOP0EDC1 G T0
2 D VERI G:%U=0 FIN S %ROUTR="^TOP0SCED",%GLTES="^[QUI]PSRLPARF(ARC)",%TRCL="END^TOP01BAT",%GOCL=$$^%QZCHW("FIN") D ^TOP0EDC2 G T0
3 D VERI G:%U=0 FIN S %ROUTR="^TOP0SCED",%GLTES="^[QUI]PSRLPARF(ARC)",%TRCL="END^TOP01BAT",%GOCL=$$^%QZCHW("FIN") D ^TOP0EDC3 G T0
4 
 D VERI G:%U=0 FIN S %ROUTR="^TOP0SCED",%GLTES="^[QUI]PSRLPARF(ARC)",%TRCL="END^TOP01BAT",%GOCL=$$^%QZCHW("FIN") D ^TOP0EDC5 G T0
FIN K %ROUTR,%GLTES,%TRCL Q
END Q
T0 S ^TORQS($J)=0 K ^IDEMARC($I) G:'($D(^GLOCLI($I))) FIN S DX=0,DY=6 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Lancement batch : preparation en cours...") K ^ETUARC($I),^PARFIX($I) S %NE=0,ARC=-1
T1 S ARC=$N(^GLOCLI($I,ARC)) G:ARC=-1 T2 D BEG^TOP01ETU G T1
T2 D ZD^%QMDATE4,WHOIS^TOWWHOIS
 K ^V($I),^POSICOMP($I),^PILETUD($I),^TPBLIMP($I),^ARCOUR($I),^PHASADM($I),^GLOETUD($I),^NBRGLEV($I),^AIGNOR($I),^TENTATIV($I)
 I '($D(^[QUI]CPTEUR("BATCH",%DAT))) K ^[QUI]CPTEUR("BATCH") S ^[QUI]CPTEUR("BATCH",%DAT)=0
 D ^%QMDAK0 K ^BATCHCOU($I) S OBT="BAT"_$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),OR=^[QUI]CPTEUR("BATCH",%DAT)+1,OBT=OBT_$S($L(OR)<2:0,1:"")_OR,^BATCHCOU($I)=OBT,^BATCHCOU($I,"PGE")=1,^BATCHCOU($I,"LI")=8 K OBT,OR
 S ^BATCHCOU($I,"DEBUT")=%DAT_"|"_HEURE_"|" D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Lancement d'etudes TOTEM") D TO4^%VZCD
 S %NUBATCH=1,DX=0,DY=4
QU S:'($D(^[QUI]CPTEUR("BATCH",%DAT))) ^[QUI]CPTEUR("BATCH",%DAT)=0 S ^[QUI]CPTEUR("BATCH",%DAT)=^[QUI]CPTEUR("BATCH",%DAT)+1,BATCH=1,%NUBATCH=0
QU1 S %NUBATCH=$N(^ETUARC($I,%NUBATCH)) G:%NUBATCH=-1 QU2 D KILL S %P0=%NUBATCH D BEG^TOTEMP0 G QU1
QU2 D ^TOP01ARI,ZD^%QMDATE4,^%QMDAK0 S ^[QUI]RESBATCH(^BATCHCOU($I))=^BATCHCOU($I,"DEBUT")_%DAT_"|"_HEURE
 Q
KILL I '(DTM) K (PIMEN,%PROGEX,PIM,%1WW,BATCH,%NUBATCH,QUI,WHOIS) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="PIMEN","%PROGEX","PIM","%1WW","BATCH","%NUBATCH","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 D CURRENT^%IS,VARSYS^%QCSAP
 Q
VERI S %U=1 I $D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)) S %U=0,INT=$$^%QZCHW(" E X E C U T I O N ") D ^TONOEXEC
 Q

