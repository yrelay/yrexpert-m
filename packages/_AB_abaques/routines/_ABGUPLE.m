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

;%ABGUPLE^INT^1^59547,73864^0
%ABGUPLE ;
 
 K B S B(%PR)=%1C
BEG S %TREFC="" Q:%PR=1
 I $D(%NBDEF(%PR)) S %NBDEF=%NBDEF-1 K %NBDEF(%PR)
 I '($D(^[QUW]EVALGRIL(NUGR))) S STOP=1,ACCEPT=0 G END
 S PARA=^[QUW]EVALGRIL(NUGR,%PR-1),COK=0
 I ^VPAR($I,PARA)="" S ACCEPT=1 G SUIT
 I ^VPAR($I,PARA)="Indefini" S ACCEPT=1 G SUIT
 I B(%PR)="   " S ACCEPT=1,%NBDEF=%NBDEF+1,%NBDEF(%PR)=1 G SUIT
 I ^[QUW]PARAGRIL(NUGR,PARA)=1 G BRAQ
 I B(%PR)=^VPAR($I,PARA) S ACCEPT=1 G SUIT
REFUS S ACCEPT=0,STOP="F" G END
BRAQ S ATEST=^[QUW]INTERGRI(NUGR,B(%PR))
 I ^VPAR($I,PARA)["," D GUPLEB G COND
 S $ZT="REFUS",%INT=^VPAR($I,PARA),@("%CONDIT="_ATEST)
COND I %CONDIT=1 S ACCEPT=1 G SUIT
 G REFUS
SUIT S ^GRIL($I,PARA)=B(%PR) I %PR'=(%NBPAR+1) G END
 I %NBDEF=0 S STOP=1,COK=1 G END
 S REFC=NUGR,AP=-1 F YY=1:1 S AP=$N(^[QUW]EVALGRIL(NUGR,AP)) Q:AP=-1  S REFC=REFC_","""_^GRIL($I,^[QUW]EVALGRIL(NUGR,AP))_""""
 S ^GRSOL($I,%NBDEF,%NBSOL)=REFC,%NBSOL=%NBSOL+1,STOP="F" K REFC,YY,AP
END Q
GUPLEB D T0 G:%SCPR="N" T1
 S %BI=%VMIN,%BS=%VMAX,@("%CONDIT="_ATEST) G FIN1
T1 S $ZT="ERR" F %INT=%VMIN,%VMAX S @("%CONDIT="_ATEST) G:%CONDIT=0 FIN1
 G FIN1
T0 S %VCOMP=^VPAR($I,PARA) D INTE
 I %VMIN="" S %VMIN=-99999999
 I %VMIN["=>" S %VMIN=-99999999
 I %VMAX="" S %VMAX=99999999
 Q
FIN1 K %BI,%BS,%VMAX,%VMIN,%VCOMP,%FCO,%DCO,%CROC1,%CROC2 Q
ERR S %CONDIT=0 G FIN1
INTE S %VMIN=$P(%VCOMP,",",1),%VMAX=$P(%VCOMP,",",2)
 S %CROC1=$E(%VMIN,1),%CROC2=$E(%VMAX,$L(%VMAX)),%FCO="'>",%DCO="'<"
 I (%CROC1="[")!(%CROC1="]") S %VMIN=$E(%VMIN,2,299),%FCO=$S(%CROC1="[":"'<",1:">")
 I (%CROC2="[")!(%CROC2="]") S %VMAX=$E(%VMAX,1,$L(%VMAX)-1),%DCO=$S(%CROC2="]":"'>",1:"<")
 Q

