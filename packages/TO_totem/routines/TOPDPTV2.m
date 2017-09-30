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

;TOPDPTV2^INT^1^59547,74874^0
TOPDPTV2 ;
 
 K B S B(%PR)=%WT("%1C")
BEG S %TREFC="" Q:%PR=1
 I $D(%NBDEF(%PR)) S TVL("%NBDEF")=TVL("%NBDEF")-1 K %NBDEF(%PR)
 I '($D(^[QUW]EVALGRIL(NUGR))) S STOP=1,TVL("ACCEPT")=0 G END
 S PARA=^[QUW]EVALGRIL(NUGR,%PR-1),COK=0
 I ^VPAR($I,PARA)="" S TVL("ACCEPT")=1 G SUIT
 I ^VPAR($I,PARA)="Indefini" S TVL("ACCEPT")=1 G SUIT
 I B(%PR)="   " S TVL("ACCEPT")=1,TVL("%NBDEF")=TVL("%NBDEF")+1,%NBDEF(%PR)=1 G SUIT
 I ^[QUW]PARAGRIL(NUGR,PARA)=1 G BRAQ
 I B(%PR)=^VPAR($I,PARA) S TVL("ACCEPT")=1 G SUIT
REFUS S TVL("ACCEPT")=0,STOP="F" G END
BRAQ S ATEST=^[QUW]INTERGRI(NUGR,B(%PR))
 I ^VPAR($I,PARA)["," D GUPLEB G COND
 S $ZT="REFUS",%INT=^VPAR($I,PARA),@("TVL(""%CONDIT"")="_ATEST)
COND I TVL("%CONDIT")=1 S TVL("ACCEPT")=1 G SUIT
 G REFUS
SUIT S ^GRIL($I,PARA)=B(%PR) I %PR'=(TVL("%NBPAR")+1) G END
 I TVL("%NBDEF")=0 S STOP=1,COK=1 G END
 S TVL("REFC")=NUGR,TVL("AP")=-1 F TVL("YY")=1:1 S TVL("AP")=$N(^[QUW]EVALGRIL(NUGR,TVL("AP"))) Q:TVL("AP")=-1  S TVL("REFC")=TVL("REFC")_","""_^GRIL($I,^[QUW]EVALGRIL(NUGR,TVL("AP")))_""""
 S ^GRSOL($I,TVL("%NBDEF"),TVL("%NBSOL"))=TVL("REFC"),TVL("%NBSOL")=TVL("%NBSOL")+1,STOP="F"
END K B Q
GUPLEB D T01 G:TVL("%SCPR")="N" T11
 S (%BI,TVL("%BI"))=TVL("%VMIN"),(%BS,TVL("%BS"))=TVL("%VMAX"),@("TVL(""%CONDIT"")="_ATEST) G FIN1
T11 S $ZT="ERR" F %INT=TVL("%VMIN"),TVL("%VMAX") S @("TVL(""%CONDIT"")="_ATEST) G:TVL("%CONDIT")=0 FIN1
 G FIN1
T01 S TVL("%VCOMP")=^VPAR($I,PARA) D INTE
 I TVL("%VMIN")="" S TVL("%VMIN")=-99999999
 I TVL("%VMIN")["=>" S TVL("%VMIN")=-99999999
 I TVL("%VMAX")="" S TVL("%VMAX")=99999999
 Q
FIN1 K TVL("%BI"),TVL("%BS"),TVL("%VMAX"),TVL("%VMIN"),TVL("%VCOMP"),TVL("%FCO"),TVL("%DCO"),TVL("%CROC1"),TVL("%CROC2") Q
ERR S TVL("%CONDIT")=0 G FIN1
INTE S TVL("%VMIN")=$P(TVL("%VCOMP"),",",1),TVL("%VMAX")=$P(TVL("%VCOMP"),",",2)
 S TVL("%CROC1")=$E(TVL("%VMIN"),1),TVL("%CROC2")=$E(TVL("%VMAX"),$L(TVL("%VMAX"))),TVL("%FCO")="'>",TVL("%DCO")="'<"
 I (TVL("%CROC1")="[")!(TVL("%CROC1")="]") S TVL("%VMIN")=$E(TVL("%VMIN"),2,299),TVL("%FCO")=$S(TVL("%CROC1")="[":"'<",1:">")
 I (TVL("%CROC2")="[")!(TVL("%CROC2")="]") S TVL("%VMAX")=$E(TVL("%VMAX"),1,$L(TVL("%VMAX"))-1),TVL("%DCO")=$S(TVL("%CROC2")="]":"'>",1:"<")
 Q

