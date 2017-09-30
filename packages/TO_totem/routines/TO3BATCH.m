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

;TO3BATCH^INT^1^59547,74869^0
TO3BATCH ;
 
DEB 
 D WHOIS^TOWWHOIS
 K ^V($I),^POSICOMP($I),^PILETUD($I),^TPBLIMP($I),^PHASADM($I),^GLOETUD($I),^NBRGLEV($I),^TENTATIV($I),^AIGNOR($I) I $D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)) S INT=$$^%QZCHW(" E X E C U T I O N ") D ^TONOEXEC Q
 I '($D(^[QUI]CPTEUR($$^%QZCHW("BATCH"),%DAT))) K ^[QUI]CPTEUR($$^%QZCHW("BATCH")) S ^[QUI]CPTEUR($$^%QZCHW("BATCH"),%DAT)=0
 D ^%QMDAK0 K ^ETBATCH($I),^BATCHCOU($I) S OBT="BAT"_$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1),OR=^[QUI]CPTEUR($$^%QZCHW("BATCH"),%DAT)+1,OBT=OBT_$S($L(OR)<2:0,1:"")_OR,^BATCHCOU($I)=OBT,^BATCHCOU($I,"PGE")=1,^BATCHCOU($I,"LI")=8 K OBT,OR
 S ^BATCHCOU($I,"DEBUT")=%DAT_"|"_HEURE_"|" D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Lancement d'etudes TOTEM") D TO4^%VZCD
 S %NUBATCH=1,DX=0,DY=4
DEB1 S DX=0,DY=DY+2 X XY W $$^%QZCHW("Article  (ou $TOUT pour tous les batches ) : ") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") QU S ART=Y1 G:ART="$TOUT" TOUT
 I $D(^[QUI]PROBTEST(ART)) W $$^%QZCHW(" (Consultation)") D GETART G DEB1
GPAR S DX=10,DY=DY+1 X XY W $$^%QZCHW("Quantite : ") S DX=$X D ^%VLEC G:((CTRLA=1)!(CTRLF=1))!(Y1="") DEB1 S PCH=Y1 D TO^%QZNBN1 I '(ISNUM) W "???" G DEB1
 S ^ETBATCH($I,%NUBATCH)=ART_"?"_Y1_"?"_$P(ART,":",1),%NUBATCH=%NUBATCH+1 G DEB1
QU S:$D(^ETBATCH($I)) ^[QUI]CPTEUR($$^%QZCHW("BATCH"),%DAT)=^[QUI]CPTEUR($$^%QZCHW("BATCH"),%DAT)+1 S BATCH=1,%NUBATCH=0
QU1 S %NUBATCH=$N(^ETBATCH($I,%NUBATCH)) G:%NUBATCH=-1 QU2 D KILL,BEG^TOTEMIII G QU1
QU2 D ZD^%QMDATE4,^%QMDAK0 S ^[QUI]RESBATCH(^BATCHCOU($I))=^BATCHCOU($I,"DEBUT")_%DAT_"|"_HEURE
FIN Q
GETART S NF=-1 F UY=0:0 S NF=$N(^[QUI]PROBTEST(ART,NF)) Q:NF=-1  D GETAR1
 G FIN
GETAR1 I $D(^[QUI]PROBTEST(ART,NF))=1 S RS=^[QUI]PROBTEST(ART,NF) D ^%VKMULC G GETAR2
 S %NOM="^[QUI]PROBTEST(ART,NF)" D ^%VKMULNG
GETAR2 F UW=1:2:9 S UW1=UW+1 I $D(%RS(UW1)),%RS(UW1)'="" S QTE=$S(%RS(UW)="":1,1:%RS(UW)),ARP=%RS(UW1),^ETBATCH($I,%NUBATCH)=ARP_"?"_QTE_"?"_ART,%NUBATCH=%NUBATCH+1
 G FIN
KILL I '(DTM) K (PIMEN,%PROGEX,PIM,%1WW,BATCH,%NUBATCH,QUI,WHOIS) D CURRENT^%IS,VARSYS^%QCSAP Q
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="PIMEN","%PROGEX","PIM","%1WW","BATCH","%NUBATCH","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125),CURRENT^%IS,VARSYS^%QCSAP
 Q
TOUT S ART=-1 F %U=1:1 S ART=$N(^[QUI]PROBTEST(ART)) Q:ART=-1  D GETART
 G QU

