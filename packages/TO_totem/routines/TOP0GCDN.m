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

;TOP0GCDN^INT^1^59547,74873^0
TOP0GCDN ;
 
 K ^GRSOL($I),^GRIL($I) S %NBDEF=0,%NBSOL=1,ADR="DEB^TOP0GCDN",NOMTREE="^[QUI]CODNORM",ACCEPT=0,%NBPAR=5 D ^%QCAGTU2 S:STOP'=1 ACCEPT=0 G RESUL
DEB 
BEG S %TREFC="" Q:%PR=0
 I $D(%NBDEF(%PR)) S %NBDEF=%NBDEF-1 K %NBDEF(%PR)
 I ^VPAR($I,%PR)="" S ACCEPT=1 G SUIT
 I ^VPAR($I,%PR)="???" S ACCEPT=1 G SUIT
 I B(%PR)="???" S ACCEPT=1,%NBDEF=%NBDEF+1,%NBDEF(%PR)=1 G SUIT
 I B(%PR)=^VPAR($I,%PR) S ACCEPT=1 G SUIT
REFUS S ACCEPT=0,STOP="F" G END
SUIT S ^GRIL($I,%PR)=B(%PR) I %PR'=%NBPAR G END
 I %NBDEF=0 D REFC S STOP=1,COK=1 G END
REFC S REFC="",AP=-1 F YY=1:1 S AP=$N(^GRIL($I,AP)) Q:AP=-1  S REFC=REFC_$S(REFC="":"",1:",")_""""_^GRIL($I,AP)_""""
 S ^GRSOL($I,%NBDEF,%NBSOL)=REFC,%NBSOL=%NBSOL+1,STOP="F" K YY,AP
END Q
FIN K %NBDEF,%NBPAR,%NBSOL,%PR,%TREFC,B,NOM,C,^GRIL($I),^GRSOL($I),%BI,%BS,%VMAX,%VMIN,%VCOMP,%FCO,%DCO,%CROC1,%CROC2 Q
RESUL G:STOP=1 GNORM S %NBDEF=$N(^GRSOL($I,-1)) I %NBDEF=-1 S NORME="inconnu" G FIN
 S %BI=$N(^GRSOL($I,%NBDEF,-1)) I %BI=-1 S NORME="inconnu" G FIN
 S REFC=^GRSOL($I,%NBDEF,%BI)
GNORM S NORME=$P(@("^[QUI]CODNORM("_REFC_")"),"^",1) S:NORME="" NORME="inconnu" G FIN
TEST K ^VPAR($I) F I=1:1:5 W !,"Code norme ",I," : " R CDN S:CDN="" CDN="???" G:$A(CDN)<32 END S ^VPAR($I,I)=CDN
 D ^TOP0GCDN W !,?20,"===> NORME = ",NORME G TEST

