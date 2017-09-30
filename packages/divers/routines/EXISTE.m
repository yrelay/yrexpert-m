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

;EXISTE^INT^1^59547,74867^0
EXISTE ;
RETERR S %RESULTAT="NON",$ZT=^TOZE($I,"A") Q:%ABEND=1  K ITEX S ITEX=$P(EXPFONC,"/",2,500) F IT=1:2 Q:$P(ITEX,"/",IT)=""  D TRAIT
 S %FTPH="^PHASADM($I,NUFA,TWREF,""PHAS"",""OK"")",%FTMC="^PHASADM($I,NUFA,TWREF,""MAC"",""OK"")",%FTENM="^TENTATIV($I,NUFA,TWREF,""MAC"")",%FTENP="^TENTATIV($I,NUFA,TWREF,""PHAS"")"
 G MAC:$D(ITEX("MAC")),PH:$D(ITEX("PH")),OP:$D(ITEX("OP")),CP:$D(ITEX("COMP")),FIN:1
MAC S %FMC=ITEX("MAC") G MACOP:$D(ITEX("OP")),MACPH:$D(ITEX("PH")),OK:$D(@%FTMC@(%FMC)),MAYBE:$D(@%FTENM@(%FMC))!$D(@%FTENP),FIN:1
MACOP S %FOP=ITEX("OP") G MCOPH:$D(ITEX("PH")),OK:$D(@%FTMC@(%FMC,%FOP)),MAYBE:$D(@%FTENM@(%FMC,%FOP))!$D(@%FTENP),FIN:1
MCOPH S %FPH=ITEX("PH") G OK:$D(@%FTMC@(%FMC,%FOP,%FPH)),MAYBE:$D(@%FTENM@(%FMC,%FOP,%FPH))!$D(@%FTENP@(%FPH,%FOP)),FIN:1
MACPH S %FPH=ITEX("PH"),%FOP=-1 F %U=1:1 S %FOP=$N(@%FTMC@(%FMC,%FOP)) Q:%FOP=-1  G:$D(@%FTMC@(%FMC,%FOP,%FPH)) OK
 S %FOP=-1 F %U=1:1 S %FOP=$N(@%FTENM@(%FMC,%FOP)) Q:%FOP=-1  G:$D(@%FTENM@(%FMC,%FOP,%FPH)) OK
 G MAYBE:$D(@%FTENP@(%FPH)),FIN:1
PH S %FPH=ITEX("PH") G:$D(ITEX("OP")) PHOP G OK:$D(@%FTPH@(%FPH)),MAYBE:$D(@%FTENP@(%FPH)),FIN:1
PHOP S %FOP=ITEX("OP") G OK:$D(@%FTPH@(%FPH,%FOP)),MAYBE:$D(@%FTENP@(%FPH,%FOP)),FIN:1
OP S %FOP=ITEX("OP"),%FPH=-1 F %U=0:0 S %FPH=$N(@%FTPH@(%FPH)) Q:%FPH=-1  G:$D(@%FTPH@(%FPH,%FOP)) OK
 S %FPH=-1 F %U=0:0 S %FPH=$N(@%FTENP@(%FPH)) Q:%FPH=-1  G:$D(@%FTENP@(%FPH,%FOP)) MAYBE
 G FIN
CP S %CP=ITEX("COMP") G:$D(ITEX("ART")) ART S %FPH="^PHASADM($I,NUFA,""COMP"")"
CPA G OK:$D(@%FPH@("OK",%CP)),FIN:$D(@%FPH@("NOK",%CP)),MAYBE:$D(@%FPH@(%CP)),FIN:1
ART S %ART=%FPH="^PHASADM($I,NUFA,""COMP"")" G:('($D(@%FPH@(%ART))))&('($D(@%FPH@("OK",%ART)))) FIN G MAYBE:$D(@%FPH@(%ART)) S %TWA=@%FPH@("OK",%ART),%FPH="^PHASADM($I,NUFA,%TWA,""COMP"")" G CPA
FIN K ITEX,%TWA,IT,%CP,%ART,%FOP Q
OK S %RESULTAT="OUI" G FIN
MAYBE S %PAAAF=0 G FIN
TRAIT I $P(ITEX,"/",IT)["^V($I,YA" S @("OB="_$P(ITEX,"/",IT)),@("VOB="_$P(ITEX,"/",IT+1)),ITEX(OB)=VOB Q
 S ITEX($P($P(ITEX,"/",IT),"""",2))=$P($P(ITEX,"/",IT+1),"""",2) Q

