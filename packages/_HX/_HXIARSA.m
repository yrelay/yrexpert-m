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

;%HXIARSA^INT^1^59547,73869^0
HXIARSA ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
VISU(L,TOT1,GR,N,P,TOT2,FTOT1,FREG,FTOT2,ABC,OPTH,T,R,T2,ABC2,OPTH2,HISTO1,HISTO2,IMPR,TYP,TIT) 
 N CHECH,ECART,ECHEL,HFHA,HTEXT,LARG,LHIST,LMARG,NBCOL,NOCOL,MDCOL,LMARD,LMENU
 N INVC1,INVC2,CARD,COLON,CUMUL,MENU,REPER,REPI,TEXT,TEXT2,I,ADR,CTR,REPR,SSCUMUL,TEMP
 D INIT^%HXIIST2
 I IMPR=1 S CHECH=0,TYP=$S(TYP="G":"graphique",1:"standard") D BOUCL^%HXIIMP(TOT1,GR,OPTH,TOT2,OPTH2,TYP,TIT) G FIN
 D POCLEPA^%VVIDEO
 S CHECH=$$MES^%VZEOUI($$^%QZCHW("Les deux histogrammes ont-ils la meme echelle"),"N")
 D CLEPAG^%VVIDEO,AFF^%HXIIMP(0,TOT1,GR,OPTH,TOT2,1,OPTH2,TYP)
 D DIAL(HISTO1,INVC1,1,TYP,TEMP)
 
FIN K @(TEMP)
 Q
 
VTOT(FTOT,REP,INDIV,ATOT) 
 N VALTOT S @(FTOT) Q VALTOT
VTOT2(FTOT2,REP,INDIV,ATOT2) 
 N VALTOT S @(FTOT2) Q VALTOT
VREG(FREG,REP,INDIV,AREG) 
 N VALREG S @(FREG) Q VALREG
VATR(REP,INDIV,ATR,HIS) 
 I HIS=1 Q $$VTOT(FTOT1,REP,INDIV,ATR)
 I HIS=2 Q $$VTOT(FTOT2,REP,INDIV,ATR)
 Q
 
 
PTENTR(GL,HIS,IMPR,TOT,GR,OPTH,TYP) 
 I CHECH S ECHEL(HIS)=$S(HIS=2:ECHEL(1),$D(ECHEL(HIS)):ECHEL(HIS),1:@GL@("MAX"))
 E  S ECHEL(HIS)=$S($D(ECHEL(HIS)):ECHEL(HIS),1:@GL@("MAX"))
 S CUMUL=@GL@("TOTAL")
 I ECHEL(HIS)=0 D MSG^%VZEATT($$^%QZCHW("Toutes les valeurs de")_" "_T_" "_$$^%QZCHW("sont nulles")) H 2 Q
 D MKGRA^%HXIIST2(GL,HIS,OPTH),MKCOL^%HXIIST2(GL,HIS,OPTH),MKTEX^%HXIIST2(GL,HIS,OPTH)
 D:IMPR=0 AFF^%HXIIST2(GL,HIS,OPTH)
 D:IMPR=1 REAFFI^%HXIIMP(GL,HIS,OPTH)
 Q
 
 
DIAL(GL,INVC,HIS,TYP,TEMP) 
DIAL2 
 
 D PREP(MENU,HIS)
SEL 
 D POCLEPA^%VVIDEO
 S DX=0 X XY W "(",$S(HIS=1:"G",1:"D"),")"
 D ^%VQUIKMN(3,79,LMENU,MENU,.ADR,.CTR) G:ADR'="" @ADR
 I "AF"[CTR S DX=0,DY=MENU D CLEBAS^%VVIDEO Q:HIS=1  G FIN2
 I CTR="R" D CLEPAG^%VVIDEO G AFF
 I CTR="J" D IMP^%HXIIMP(TYP) G AFF
 I CTR="B" G TYPE
 D ^%VSQUEAK G SEL
 
ENTRE 
 S CS=NOCOL
SMEN S NOCOL=CS
 D AFF^%HXIIMP(0,TOT1,GR,OPTH,TOT2,1,OPTH2,TYP)
 S I=$$^%HXIIST3(GL,INVC,HIS,R,$S(HIS=1:T,1:T2),REPR,TEMP) G:I=2 FIN2
 I I=1 D CLEPAG^%VVIDEO,AFF^%HXIIMP(0,TOT1,GR,OPTH,TOT2,1,OPTH2,TYP)
 D PREP(MENU,HIS)
 G SEL
DIRECT 
 D ACCES^%HXPARAM(R,NUM,INVC,.CTR,.I)
 I (I="")!(CTR=0) D ^%VSQUEAK G SEL
 S CS=@INVC@(I)
 G SMEN
 
AUTRE 
 I HIS=1 S GL=HISTO2,INVC=INVC2,HIS=2 G DIAL2
 I HIS=2 S GL=HISTO1,INVC=INVC1,HIS=1 G DIAL2
 Q
 
GAUCH 
 I $D(@GL@(NOCOL-NBCOL)),(NOCOL-NBCOL)'=0 G GOK
 I NOCOL=1 D ^%VSQUEAK G SEL
 S NOCOL=NBCOL+1
GOK S NOCOL=NOCOL-NBCOL
 G AFF
 
DROIT 
 I '($D(@GL@(NOCOL+NBCOL))) D ^%VSQUEAK G SEL
 S NOCOL=NOCOL+NBCOL
 G AFF
 
LARGE 
 D LARG^%HXPARAM(LHIST,ECART,.LARG,.NBCOL,.CTR)
 I CTR=0 G SEL
 G AFF
 
ECHEL 
 G:ECHEL(HIS)=0 SEL
 D ECHEL^%HXPARAM(ECHEL(HIS),.CTR,.I)
 I ((CTR=0)!(I=ECHEL(HIS)))!(I="") G SEL
 S ECHEL(HIS)=I
 D MKCOL^%HXIIST2(GL,HIS,$S(HIS=1:OPTH,1:OPTH2)),MKGRA^%HXIIST2(GL,HIS,$S(HIS=1:OPTH,1:OPTH2))
 D AFCOL^%HXIIST2(GL,HIS),AFTEX^%HXIIST2(GL,HIS),AFGRA^%HXIIST2(GL,HIS)
 G SEL
 
FIN2 D AFF^%HXIIMP(0,TOT1,GR,OPTH,TOT2,1,OPTH2,TYP)
 S GL=HISTO1,INVC=INVC1,HIS=1
 G DIAL2
 
TYPE 
 G:$$TYPE^%QSGESPE(R_"/"_$$NOMLOG^%QSF(REPR))="DATE" DATE
 G:N'=1 SEL
PAS D PAS^%HXPARAM(P,.CTR,.I)
 I ((CTR=0)!(I=""))!(P=I) G SEL
 S P=I,I=$P(GL,",",2)
 D MPAS^%HXIHITU($TR(I,"""",""),P,1)
 G CALC
DATE 
 D DATE^%HXPARAM(R,REPR,"AFF^%HXIIMP(0,TOT1,GR,OPTH,TOT2,1,OPTH2,TYP)",.Y1,.CTR,.I)
 I ((CTR=0)!(I=""))!(I=Y1) G SEL
 
CALC 
 S L=@TEMP@("LISTE"),R=@TEMP@("R"),T=@TEMP@("T"),T2=@TEMP@("T2")
 D ^%HXICAL(L,T,R,FTOT1,FREG,N,P,HISTO1,GR,ABC,OPTH)
 D ^%HXICAL(L,T2,R,FTOT2,FREG,N,P,HISTO2,GR,ABC2,OPTH2)
 D INV^%HXPARAM(HISTO1,INVC1),INV^%HXPARAM(HISTO2,INVC2)
 K ECHEL(1),ECHEL(2)
 S NOCOL=1
 G AFF
 
AFF D AFF^%HXIIMP(0,TOT1,GR,OPTH,TOT2,1,OPTH2,TYP)
 G SEL
 
PREP(MEN,HIS) 
 D MENU^%HXPARAM(MEN)
 S @MEN@(7)=$$^%QZCHW($S(HIS=1:"Histo.droit",1:"Histo.gauche"))_"^AUTRE"
 Q

