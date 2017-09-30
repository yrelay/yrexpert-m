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

;TORQSB01^INT^1^59547,74875^0
TORQSB01 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
FIN K %ROUTR,%GLTES,%TRCL Q
END Q
T0(LIS,LATT) 
 
 S BS=$$^%QSCALVA("L0",L,"BASE")
 I BS="" D ^%VZEAVT($$^%QZCHW("impossible de retrouver le repertoire des individus de la liste")) Q
 S ^TORQS($J)=1 K ^IDEMARC($I) D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Lancement batch : preparation en cours...") K ^ETUARC($I),^PARFIX($I) S %NE=0,IND=-1
 S BASE=$$^%QSCALVA("L0",LIS,"BASE"),GLO=$$^%QSCALVA("L0",LIS,"ADRESSE")
 G END:BASE="",END:BASE'=BS,END:GLO="" S IND=""
 D LMARQ^TORQXIN(LIS)
 
 
T1 S IND=$$SUIVL^%QS0XG1(LIS,IND) I IND'="" D BEG^TORQSB02(BS,IND,LIS,.LATT) G T1
T2 
 D ZD^%QMDATE4,WHOIS^TOWWHOIS
 K ^V($I),^POSICOMP($I),^PILETUD($I),^TPBLIMP($I),^ARCOUR($I),^PHASADM($I),^GLOETUD($I),^NBRGLEV($I),^AIGNOR($I),^TENTATIV($I)
 I '($D(^[QUI]CPTEUR("BATCH",%DAT))) K ^[QUI]CPTEUR("BATCH") S ^[QUI]CPTEUR("BATCH",%DAT)=0
 D ^%QMDAK0 K ^BATCHCOUR($I) S OBT="BAT"_$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),OR=^[QUI]CPTEUR("BATCH",%DAT)+1,OBT=OBT_$S($L(OR)<2:0,1:"")_OR,^BATCHCOUR($I)=OBT,^BATCHCOUR($I,"PGE")=1,^BATCHCOUR($I,"LI")=8 K OBT,OR
 S ^BATCHCOUR($I,"DEBUT")=%DAT_"|"_HEURE_"|" D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Lancement d'etudes")_" "_$S($D(^KLNTOT($J)):"LINK",1:"TOTEM") D TO4^%VZCD
 S %NUBATCH=1,DX=0,DY=4
QU S:'($D(^[QUI]CPTEUR("BATCH",%DAT))) ^[QUI]CPTEUR("BATCH",%DAT)=0 S ^[QUI]CPTEUR("BATCH",%DAT)=^[QUI]CPTEUR("BATCH",%DAT)+1,BATCH=1,%NUBATCH=0
QU1 
 S %NUBATCH=$N(^ETUARC($I,%NUBATCH)) G:%NUBATCH=-1 QU2 D KILL S %P0=%NUBATCH D BEG^TOTEMP0 G QU1
QU2 
 D ^TOP01ARI,ZD^%QMDATE4,^%QMDAK0 S ^[QUI]RESBATCH(^BATCHCOUR($I))=^BATCHCOUR($I,"DEBUT")_%DAT_"|"_HEURE
 
 
 Q
KILL I '(DTM) K (PIMEN,%PROGEX,PIM,%1WW,BATCH,%NUBATCH,QUI,WHOIS) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="PIMEN","%PROGEX","PIM","%1WW","BATCH","%NUBATCH","QUI","WHOIS","TAB125","LIS" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 D CURRENT^%IS,VARSYS^%QCSAP
 Q
VERI S %U=1 I $D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)) S %U=0,INT=$$^%QZCHW(" E X E C U T I O N ") D ^TONOEXEC
 Q

