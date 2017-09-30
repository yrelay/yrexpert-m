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

;TOAFRBAT^INT^1^59547,74871^0
TOAFRBAT ;
 
 S %TAF=1
TBATCH G:^CSTEST($I,"TEST")="*" FIN G:'($D(%NUBATCH)) FIN
 S ^CSTEST($I,"ETUDE.COMPLET")=NUFA
 D INT^%QMDAK0 S ^CSTEST($I,"FIN")=HEURE,INUFA=$P(NUFA,".",1),^CSTEST($I,"ETUDE")=INUFA,INUF=$E(INUFA,1,$L(INUFA)-1)_$C($A($E(INUFA,$L(INUFA)))-1)_"z",NBR=0 F %U=1:1 S INUF=$N(^[QUI]TREEWORK(INUF)) Q:INUF=-1  Q:$E(INUF,1,$L(INUFA))'=INUFA  S NBR=NBR+1
 G:('($D(ID0)))&('($D(^ETBATCH($I,%NUBATCH)))) FIN S ^CSTEST($I,"NBRE")=NBR,^CSTEST($I,"IDTOT")=$S($D(ID0):ID0,1:$P(^ETBATCH($I,%NUBATCH),"?",1))
 S ART=^CSTEST($I,$$^%QZCHW("ARTICLE")),DATE=^CSTEST($I,"DATE"),TEST=^CSTEST($I,"TEST"),DEBUT=^CSTEST($I,"DEBUT"),FIN=^CSTEST($I,"FIN"),ETUDE=^CSTEST($I,"ETUDE"),IDTOT=^CSTEST($I,"IDTOT"),NBRE=^CSTEST($I,"NBRE")
 S (ERRR,ERR)=$S($D(^CSTEST($I,"ERREUR")):^CSTEST($I,"ERREUR"),1:"RAS")
 S (RS,^[QUI]RESTEST(ART,DATE,TEST,$I,DEBUT))=IDTOT_"^"_ETUDE_"^"_NBRE_"^"_FIN_"^"_ERR
 S ERR=-1,LRS=$L(RS) F UU=6:1 S ERR=$N(^CSTEST($I,"UNDEF",ERR)) Q:ERR=-1  S LT=(LRS+$L(ERR))+2 Q:LT>500  S $P(RS,"^",UU)=ERR_" ?",LRS=$L(RS)
 K LRS,LT S ^[QUI]RESTEST(ART,DATE,TEST,$I,DEBUT)=RS G:%TAF=0 END G:'($D(^BATCHCOU($I))) FIN S PGE=^BATCHCOU($I,"PGE"),IDBAT=^BATCHCOU($I),LI=^BATCHCOU($I,"LI"),IDT=$P(IDTOT,"/",1),RS=IDTOT,%CAR="/" D ^%QZCHNBC S %NBCAR=%NBCAR+1
 S IDI="" F %U=2:1:%NBCAR S IDI="/"_$P(IDTOT,"/",%U) D TIDI
 D TIDIS S ^BATCHCOU($I,"PGE")=PGE,^BATCHCOU($I,"LI")=LI D ZD^%QMDATE4,^%QMDAK0 S ^[QUI]RESBATCH(^BATCHCOU($I))=^BATCHCOU($I,"DEBUT")_%DAT_"|"_HEURE G FIN
TIDI S LM=$L(IDT)+$L(IDI) I LM'>37 S IDT=IDT_IDI G END
TIDIS S ^[QUI]RESBATCH(IDBAT,PGE,LI)=$P(NUFA,".",1)_"|"_IDT_"|"_DEBUT_"|"_$S(ERRR="":"",ERRR="RAS":ERRR,1:"PB"),(NUFA,DEBUT,ERRR)="",IDT=IDI,LI=LI+1 I LI>21 S PGE=PGE+1,LI=8
 G END
END Q
FIN Q

