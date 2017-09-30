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

;TOIVEVAL^INT^1^59547,74872^0
TOIVEVAL ;
 D ^%VTIME,^TOIVPOP,RFSH^TOEVCOUR K ^CSTEST($J),^M($I) D ZD^%QMDATE4,INT^%QMDAK0 S ^CSTEST($J,"DATE")=%DAT,^CSTEST($J,"DEB")=HEURE,^CSTEST($J,"ETUDE")=%ART
 K ^V($I),^FMATSEL($J),^EVAL($J) S ID=$P(%ART,":",2),%ART=$P(%ART,":",1),(%ARTYA,%ARTYB,YA,YB)=%ART I $D(^[QUI]ACOMMEB(%ART)) S (%ARTYA,YA)=$P(^[QUI]ACOMMEB(%ART),"^",1)
 D ^TO4GEXPL S NU=-1
LEX S NU=$N(^TO4GEXPL($I,NU)) G:NU=-1 T0 S PARA=^TO4GEXPL($I,NU),VPA=$P(ID,"/",NU),CHP=^[QUI]EXPLICI(YA,NU,PARA) D ^TOTVLEG G:'(VOK) FIN S ^V($I,YA,PARA)=VPA G LEX
T0 S ^V($I,%ARTYA,$$^%QZCHW("PERE"))=%ARTYA,%ABEND=0,(%TREFC,%TABTV,%TABRA,TWREF,NOMTREE,%PR,STOP)="X" K ^ADRTRAIT($J) F %U=0:1 S LI=$P($T(TR+%U),";;",2) Q:LI=""  F %V=1:1 S %W=$P(LI,"/",%V) Q:%W=""  S ^ADRTRAIT($J,$P(%W,",",1))="^"_$P(%W,",",2)
 S %MMAX=$S($D(^[QUI]MAXMAT(YA)):$P(^[QUI]MAXMAT(YA),"^",1),1:999)
 K ^U($J) S PARA=-1 F %U=0:0 S PARA=$N(^V($I,%ARTYA,PARA)) Q:PARA=-1  S ^U($J,%ARTYA,PARA)=^V($I,%ARTYA,PARA)
 D:^BUT6($J)<2 ORD^TOIVGBUT D BUT S NBT="",TYPART(%ART)=$$^%QZCHW("ART")
LBUT S %ABEND=0 K ^V($I,%ARTYA) S IDM=0,PARA=-1 F %U=1:1 S PARA=$N(^U($J,%ARTYA,PARA)) Q:PARA=-1  S ^V($I,%ARTYA,PARA)=^U($J,%ARTYA,PARA)
LBUT0 S NBT=$O(^BUT3($J,NBT)) G:NBT="" FIN S BUT=^BUT3($J,NBT),%DOM=$P(BUT,"~",1),%IMPL=$P(BUT,"~",2) I %DOM=$$^%QZCHW("IMPLICI"),$D(^EVAL($J,%ARTYA,$$^%QZCHW("IMPLICI"),%IMPL)) K ^BUT3($J,NBT),^BUT2($J,$$^%QZCHW("IMPLICI"),%IMPL) G LBUT0
 S %KNM=0,%ETM=0,%TS="^TS($J)",%TE="^TE($J)",%TC="^TC($J)" G:$D(^[QUI]TOIVTRI(%ART,%DOM,%IMPL)) MAT0
 S %TR="^[QUI]TOIVTRI(%ART,%DOM,%IMPL,0)" D ^TOIVBACK G MAT01:%ETM,EVBUT
MAT01 K @(%TS),@(%TE),@(%TC),@(%TR) G MAT
MAT0 S MT=$N(^[QUI]TOIVTRI(%ART,%DOM,%IMPL,-1)) G:MT'=0 MAT S %TR="^[QUI]TOIVTRI(%ART,%DOM,%IMPL,0)"
EVBUT D AFF,FAFF G LBUT
MAT K ^EVCOUR($J) S ^EVCOUR($J)=%DOM_"^"_%IMPL,%DOM=$$^%QZCHW("MATIERE"),%ETM=0,%IMPL=-1,%TS="^TS($J)",%TE="^TE($J)",%TC="^TC($J)" G:$D(^FMATSEL($J,%ARTYA)) MAT2
LMAT S %ABEND=0,%IMPL=$N(^[QUI]SENSFICH(%ART,1,%DOM,%IMPL)) G:%IMPL=-1 MAT1 S %TR="^[QUI]TOIVTRI(%ART,%DOM,%IMPL)" G:$D(@%TR) EVBUTM D ^TOIVBACK
EVBUTM D AFF G:%ABEND LMAT S:$D(FMATSEL) ^FMATSEL($J,%ARTYA)=$S($D(^FMATSEL($J,%ARTYA)):^FMATSEL($J,%ARTYA)+1,1:1),^FMATSEL($J,%ARTYA,$N(FMATSEL(TWREF,-1)))=1
 I $D(^FMATSEL($J,%ARTYA)),^FMATSEL($J,%ARTYA)'<%MMAX G MAT1
 G LMAT
MAT1 K ^U($J) S PARA=-1 F %U=1:1 S PARA=$N(^V($I,%ARTYA,PARA)) Q:PARA=-1  S ^U($J,%ARTYA,PARA)=^V($I,%ARTYA,PARA)
MAT2 S %KNM=1,%MC=-1,%DOM=$P(^EVCOUR($J),"^",1),%IMPL=$P(^EVCOUR($J),"^",2),NUFAI=NUFA,%YY=0
LMAT1 S %ABEND=0 K ^V($I,%ARTYA) S PARA=-1 F %U=1:1 S PARA=$N(^U($J,%ARTYA,PARA)) Q:PARA=-1  S ^V($I,%ARTYA,PARA)=^U($J,%ARTYA,PARA)
 S (IDM,%YY)=%YY+1
 S %MC=$N(^FMATSEL($J,%ART,%MC)) G:%MC=-1 LBUT S ^V($I,YA,$$^%QZCHW("MATIERE"))=%MC,%TR="^[QUI]TOIVTRI(%ART,%DOM,%IMPL,%MC(1))",%MF=%MC K %MC S %MC=%MF G:'($D(^M($I,%MC))) PMT1 S %MC(1)=^M($I,%MC,"FAMMAT"),P1=-1
 K ^V($I,%MC(1)) F %U=1:1 S P1=$N(^M($I,%MC,P1)) Q:P1=-1  S ^V($I,%MC(1),P1)=^M($I,%MC,P1)
 G PMT2
PMT1 D ^TOIVEPMT G:'($D(%MC(1))) LMAT1
PMT2 G:$D(@%TR) LMAT12 D ^TOIVBACK S @%TR@(0)=%MC
LMAT12 I $D(^VM($I,%ARTYA,%MC)) S P1=-1 F %U=1:1 S P1=$N(^VM($I,%ARTYA,%MC,P1)) Q:P1=-1  S ^V($I,%ARTYA,P1)=^VM($I,%ARTYA,%MC,P1)
 D AFF,FAFF G LMAT1
FIN D INT^%QMDAK0 S ^[QUI]TOIVANTE(0,NUFA,%ART,0)=^CSTEST($J,"ETUDE")_"^"_^CSTEST($J,"DATE")_"^"_^CSTEST($J,"DEB")_"^"_HEURE_"^"_$S($D(^PSRL($J)):^PSRL($J),1:""),%YY=0 F %U=1:1 S %YY=$N(^BUT($J,%YY)) Q:%YY=-1  S ^[QUI]TOIVANTE(0,NUFA,%ART,%YY)=^BUT($J,%YY)
 S ^[QUI]TOIVANTE(1,%ART,NUFA)=1
FINS S:'($D(BATCH)) BATCH=1 G:BATCH'=1 FINC
 S DAT=^CSTEST($J,"DATE"),DAT=$P(DAT,"/",3)_"/"_$P(DAT,"/",2)_"/"_$P(DAT,"/",1),^[QUI]RESTEST(%ART,DAT,%ART,$I,^CSTEST($J,"DEB"))=^CSTEST($J,"ETUDE")_"^"_NUFA_"^"_$S($D(^FMATSEL($J,%ARTYA)):^FMATSEL($J,%ARTYA),1:0)_"^"_$I_"^"_HEURE
FINC G:'($D(^PSRL($J))) FINF S ^[QUI]PSRLRTES(^PSRL($J),NUFA)=%ART_"^"_^CSTEST($J,"DATE")_"^"_%ART_"^"_^CSTEST($J,"ETUDE")_"^"_$S($D(^FMATSEL($J,%ARTYA)):^FMATSEL($J,%ARTYA),1:0)_"^"_$I_"^"_^CSTEST($J,"DEB")_"^"_HEURE
FINF Q
TRAIT S YB=$P(%RG,"^",1),YA=$S($D(^[QUI]ACOMMEB(YB)):$P(^[QUI]ACOMMEB(YB),"^",1),1:YB),%REG=$P(%RG,"^",2),DOM=$P(^[QUI]IREPFICH(YA,%REG),"^",1) Q:'($D(^ADRTRAIT($J,DOM)))  D @^ADRTRAIT($J,DOM) Q
AFF S %RGI=0
LAFF S %RGI=$N(@%TR@(%RGI)) Q:%RGI=-1  S %RG=@%TR@(%RGI) D TRAIT Q:%ABEND=1  G LAFF
FAFF G:%DOM'=$$^%QZCHW("IMPLICI") END S ^[QUI]EVBACK(NUFA,IDM,%DOM,%IMPL)=$S($D(^V($I,%ARTYA,%IMPL)):^V($I,%ARTYA,%IMPL),1:"???"),%U="^[QUI]TOIVDEF(%ART,%DOM,%IMPL,%ART,%DOM)",PARA=-1 F %V=0:0 S PARA=$N(^V($I,%ARTYA,PARA)) Q:PARA=-1  S @%U@(PARA)=1
 G:IDM=0 IDM0 S ^[QUI]EVBACK(NUFA,IDM,%DOM,$$^%QZCHW("MATIERE"))=%MC K ^VM($J,%ARTYA,%MC) S P1=-1 F %U=1:1 S P1=$N(^V($I,%ARTYA,P1)) Q:P1=-1  S ^VM($I,%ARTYA,%MC,P1)=^V($I,%ARTYA,P1)
IDM0 S PARA=-1 F %U=0:0 S PARA=$N(^BUT2($J,$$^%QZCHW("IMPLICI"),PARA)) Q:PARA=-1  I $D(^V($I,%ARTYA,PARA)) S ^[QUI]EVBACK(NUFA,IDM,$$^%QZCHW("IMPLICI"),PARA)=^V($I,%ARTYA,PARA),^EVAL($J,%ARTYA,$$^%QZCHW("IMPLICI"),PARA)=1
END Q
BUT K ^BUT3($J),^BUT2($J) S P1="" F %U=1:1 S P1=$O(^BUT1($J,P1)) Q:P1=""  S BUT=^BUT1($J,P1),^BUT3($J,P1)=BUT,^BUT2($J,$P(BUT,"~",1),$P(BUT,"~",2))=P1
 Q
CHAR S PREF="END^TOIVEVAL",POSF="TRAIT^TOIVEVAL",G="^BACKIMPL($J)" Q
TR ;;IMPLICI,TOIVIMPG/MATIERE,TOIVGMAT

