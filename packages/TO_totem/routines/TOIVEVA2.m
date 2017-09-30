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

;TOIVEVA2^INT^1^59547,74872^0
TOIVEVAL ;
 D ^TOIVPOP,RFSH^TOEVCOUR K ^V($I) S ID=$P(%ART,":",2),%ART=$P(%ART,":",1),(%ARTYA,%ARTYB,YA,YB)=%ART I $D(^[QUI]ACOMMEB(%ART)) S (%ARTYA,YA)=$P(^[QUI]ACOMMEB(%ART),"^",1)
 D ^TO4GEXPL S NU=-1
LEX S NU=$N(^TO4GEXPL($I,NU)) G:NU=-1 T0 S PARA=^TO4GEXPL($I,NU),VPA=$P(ID,"/",NU),CHP=^[QUI]EXPLICI(YA,NU,PARA) D ^TOTVLEG G:'(VOK) FIN S ^V($I,YA,PARA)=VPA G LEX
T0 S %ABEND=0,(%TREFC,%TABTV,%TABRA,TWREF,NOMTREE,%PR,STOP)="X" K ^ADRTRAIT($J) F %U=0:1 S LI=$P($T(TR+%U),";;",2) Q:LI=""  F %V=1:1 S %W=$P(LI,"/",%V) Q:%W=""  S ^ADRTRAIT($J,$P(%W,",",1))="^"_$P(%W,",",2)
 S NBT=-1,TYPART(%ART)=$$^%QZCHW("ART")
LBUT S NBT=$N(^BUT($J,NBT)) G:NBT=-1 FIN S BUT=^BUT($J,NBT),%DOM=$P(BUT,"~",1),%IMPL=$P(BUT,"~",2),%KNM=0,%ETM=0,%TS="^TS($J)",%TE="^TE($J)",%TC="^TC($J)" G:$D(^[QUI]TOIVTRI(%ART,%DOM,%IMPL)) MAT0
 S %TR="^[QUI]TOIVTRI(%ART,%DOM,%IMPL,0)" D ^TOIVBACK G MAT01:%ETM,EVBUT
MAT01 K @(%TS),@(%TE),@(%TC),@(%TR) G MAT
MAT0 S MT=$N(^[QUI]TOIVTRI(%ART,%DOM,%IMPL,-1)) G:MT'=0 MAT S %TR="^[QUI]TOIVTRI(%ART,%DOM,%IMPL,0)"
EVBUT D AFF,FAFF G LBUT
MAT K ^EVCOUR($J) S ^EVCOUR($J)=%DOM_"^"_%IMPL,%DOM=$$^%QZCHW("MATIERE"),%ETM=0,%IMPL=-1,%TS="^TS($J)",%TE="^TE($J)",%TC="^TC($J)" K ^FMATSEL($J)
LMAT S %IMPL=$N(^[QUI]SENSFICH(%ART,1,%DOM,%IMPL)) G:%IMPL=-1 MAT1 S %TR="^[QUI]TOIVTRI(%ART,%DOM,%IMPL)" G:$D(@%TR) EVBUTM D ^TOIVBACK
EVBUTM D AFF S:$D(FMATSEL) ^FMATSEL($J,%ART,$N(FMATSEL(TWREF,-1)))=1 G LMAT
MAT1 S %KNM=1,%MC=-1,%DOM=$P(^EVCOUR($J),"^",1),%IMPL=$P(^EVCOUR($J),"^",2),NUFAI=NUFA,%YY=0
LMAT1 S %YY=%YY+1,NUFA=NUFAI_"."_$S(%YY<10:"00",%YY<100:"0",1:"")_%YY,%MC=$N(^FMATSEL($J,%ART,%MC)) G:%MC=-1 LBUT S ^V($I,YA,$$^%QZCHW("MATIERE"))=%MC,%TR="^[QUI]TOIVTRI(%ART,%DOM,%IMPL,%MC)" D ^TOIVEPMT G:$D(@%TR) LMAT12 D ^TOIVBACK S @%TR@(0)=%MC(1)
LMAT12 D AFF,FAFF G LMAT1
FIN Q
TRAIT S YB=$P(%RG,"^",1),YA=$S($D(^[QUI]ACOMMEB(YB)):$P(^[QUI]ACOMMEB(YB),"^",1),1:YB),%REG=$P(%RG,"^",2),DOM=$P(^[QUI]IREPFICH(YA,%REG),"^",1) Q:'($D(^ADRTRAIT($J,DOM)))  D @^ADRTRAIT($J,DOM) Q
AFF S %RGI=0
LAFF S %RGI=$N(@%TR@(%RGI)) Q:%RGI=-1  S %RG=@%TR@(%RGI) D TRAIT G LAFF
FAFF I %DOM=$$^%QZCHW("IMPLICI") S ^[QUI]EVBACK(NUFA,%IMPL)=$S($D(^V($I,%ARTYA,%IMPL)):^V($I,%ARTYA,%IMPL),1:"???")
END Q
CHAR S PREF="END^TOIVEVAL",POSF="TRAIT^TOIVEVAL",G="^BACKIMPL($J)" Q
TR ;;IMPLICI,TOIVIMPG/MATIERE,TOIVGMAT

