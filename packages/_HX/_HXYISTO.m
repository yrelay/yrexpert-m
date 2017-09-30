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

;%HXYISTO^INT^1^59547,73870^0
HXYISTO(L,ATOT,ATCUM,N,P,OPT,GSTO,FTOT,FREG,FCOL,FSYN,BI,BS,BO,ABC,OPTH) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N R,T,INVC
 S OPT=$$^%QCAZG("OPT"),T=$P(ATOT,"^"),R=$P(ATCUM,"^")
 I FTOT="" S FTOT="$$^%QSCALVA"
 S FTOT=$$CONCAT^%QZCHAD("A="_FTOT,"REP,IND,ATT")
 I FREG="" S FREG="$$^%QSCALVA"
 S FREG=$$CONCAT^%QZCHAD("A="_FREG,"REP,IND,ATT")
 I FCOL'="" S FCOL=$$CONCAT^%QZCHAD("A="_FCOL,"REP,ATT,COL")
 I FSYN="" S FSYN="$$ZSX"
 S FSYN=$$CONCAT^%QZCHAD("A="_FSYN,"APP,REP,ATT,VAL,.ER")
 S INVC=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INVCOL") K @(INVC)
 D ^%HXYCAL(L,T,R,N,P,GSTO,BI,BS,BO,ABC,OPTH,FTOT,FREG,FCOL,ATCUM)
 D VISU(L,ATOT,ATCUM,N,P,OPT,FTOT,FREG,FCOL,FSYN,BI,BS,BO,ABC,OPTH,T,R,GSTO,0,"")
 Q
 
 
 
 
 
VISU(L,ATOT,ATCUM,N,P,OPT,FTOT,FREG,FCOL,FSYN,BI,BS,BO,ABC,OPTH,T,R,HISTO,IMPR,TYP,TIT) 
 N ECHEL,NBCOL,CARD,COLON,CUMUL,MENU,REPER,REPI,TEXT,TEXT2,I,ADR,CTR,TEMP,INVC
 N MDCOL,NOCOL,ECART,LARG,LMARG,LMARD,LHIST,HTEXT,HFHA,HHIST,LMENU,REPR,REPT,SSCUMUL
 D INIT^%HXYIST2,INV^%HXPARAM(HISTO,INVC)
 D MKGRA,MKCOL,MKTEX
 I IMPR=1 D PRINT^%HXYIMP("la totalite de l'histogramme",$S(TYP="G":"graphique",1:"standard"),0,TIT) G FIN
 D REAFF
 D MENU^%HXPARAM(MENU)
 
SEL D POCLEPA^%VVIDEO
 D ^%VQUIKMN(LMARG,MDCOL-LMARD,LMENU,MENU,.ADR,.CTR) G:ADR'="" @ADR
 I CTR="R" D REAFF G SEL
 I CTR="J" D ENTR^%HXYIMP G SEL
 I CTR="B" G TYPE
 G:"AF"[CTR FIN
 D ^%VSQUEAK G SEL
ENTRE 
 I $$^%HXYIST3(HISTO,INVC,R,T,OPT,TEMP) D MENU^%HXPARAM(MENU) G AFF
 G SEL
DIRECT 
 D POCLEPA^%VVIDEO,MES^%VLECFL2(R_": ",.CTR,.I)
 I (CTR'="")!(I="") D ^%VSQUEAK G SEL
 S I=$$SYN(FSYN,"ZHYDI",REPR,R,I) I I="" D ^%VSQUEAK G SEL
 I $D(@INVC@(I)) G DI
 I '(N) S I=$O(@INVC@(I))
 E  S I=$ZP(@INVC@(I))
 I I="" D ^%VSQUEAK G SEL
DI S NOCOL=@INVC@(I)
 D MKGRA,MKTEX,MKCOL,REAFF
 G ENTRE
 
GAUCH 
 I $D(@HISTO@(NOCOL-NBCOL)),(NOCOL-NBCOL)'=0 G GOK
 I NOCOL=1 D ^%VSQUEAK G SEL
 S NOCOL=NBCOL+1
GOK S NOCOL=NOCOL-NBCOL
 G AFF2
 
DROIT 
 I '($D(@HISTO@(NOCOL+NBCOL))) D ^%VSQUEAK G SEL
 S NOCOL=NOCOL+NBCOL
 G AFF2
 
ECHEL 
 D ECHEL^%HXPARAM(ECHEL,.CTR,.I)
 I ((CTR=0)!(I=""))!(I=ECHEL) G SEL
 S ECHEL=I
 D MKCOL,MKGRA,REAFF2 G SEL
 
LARGE 
 D LARG^%HXPARAM(LHIST,ECART,.LARG,.NBCOL,.CTR)
 I CTR=0 G SEL
 G AFF2
 
TYPE 
 G:$$TYPE^%QSGESPE(R_"/"_$$NOMLOG^%QSF(REPR))="DATE" DATE
 G:N'=1 SEL
PAS D PAS^%HXPARAM(P,.CTR,.I)
 I ((CTR=0)!(I=""))!(I=P) G SEL
 S P=I,I=$P(HISTO,",",2) D MPAS^%HXIHITU($TR(I,"""",""),P,1)
 G CALC
DATE 
 D DATE^%HXPARAM(R,REPR,"REAFF^%HXYIST2",.Y1,.CTR,.I)
 I ((CTR=0)!(I=""))!(I=Y1) G SEL
 
CALC 
 D ^%HXYCAL(L,T,R,N,P,HISTO,BI,BS,BO,ABC,OPTH,FTOT,FREG,FCOL,ATCUM)
 D INV^%HXPARAM(HISTO,INVC)
 S NOCOL=1 G AFF
 
AFF S ECHEL=@HISTO@("MAX")
 D MKGRA,MKCOL,MKTEX,REAFF G SEL
AFF2 D MKCOL,MKTEX,REAFF2 G SEL
 
FIN K @(TEMP) Q
 
 
 
REAFF D REAFF^%HXYIST2 Q
REAFF2 D REAFF2^%HXYIST2 Q
 
AFGRA D AFGRA^%HXYIST2 Q
AFCOL D AFCOL^%HXYIST2 Q
AFTEX D AFTEX^%HXYIST2 Q
MKGRA D MKGRA^%HXYIST2 Q
MKCOL D MKCOL^%HXYIST2 Q
MKTEX D MKTEX^%HXYIST2 Q
 
VAL(FT,REP,IND,ATT) N A S @(FT) Q A
FCOL(FT,REP,ATT,COL) N A S @(FT) Q A
SYN(FT,APP,REP,ATT,VAL) N A,ER S @(FT) Q A
ZSX(APP,REP,ATT,VAL,ER) 
 S ER=0 I $P(ATT,"^",1)'="NOM" Q VAL
 
 Q $$S^%QAX(VAL)

