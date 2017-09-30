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

;%HXITOD2^INT^1^59547,73870^0
HXITOD2(L,T,R,NUM,PAS,ECL,NUM2,PAS2) 
 
 
 
 
 
PTENTR(HIS,IMPR,OPTH,TYP) 
 
 
 
 
 N GL,INVC
 Q:'($$INIT(HIS,.GL,.INVC))
 D:IMPR=0 AFF^%HXIISS2(GL,HIS,OPTH)
 D:IMPR=1 AFFI^%HXIIMPD(GL,HIS,OPTH)
 Q
 
INIT(HIS,GL,INVC) 
 I '($D(IMPR)) S IMPR=0
 I HIS=1 S GL=PARGLS_","_1_")",INVC=PARGLCS_","_1_")"
 I HIS'=1 S GL=PARGLS_","_HIS_","_INDCOCOU_")",INVC=PARGLCS_","_HIS_","_INDCOCOU_")"
 S CUMUL=$S($D(@GL@("TOTAL"))#10:@GL@("TOTAL"),1:0)
 I CHECH S ECHEL(HIS)=$S(HIS=2:ECHEL(1),$D(ECHEL(HIS)):ECHEL(HIS),$D(@GL@("MAX"))#10:@GL@("MAX"),1:0)
 E  S ECHEL(HIS)=$S($D(ECHEL(HIS)):ECHEL(HIS),$D(@GL@("MAX"))#10:@GL@("MAX"),1:0)
 I HIS=1 Q:'($D(@PARGL@(1,NOCOL(1)))) 0
 I HIS=2 Q:'($D(@PARGL@(2,INDCOCOU,NOCOL(2)))) 0
 Q 1
 
PREP(HIS) 
 
 
 
 S DY=LMENU,DX=LMARG(HIS)+8
 D MENU^%HXPARAM(MENU)
 Q
 
TAILLE D @MDCOL^%VVIDEO Q
 
DIAL(GL,HIS,INVC,TYP,TEMP) 
DIAL2 
 
 
 
 I HIS=1 S @TEMP@("REPS")=REPR,@TEMP@("ATT")=R
 I HIS=2 S @TEMP@("REPS")=REPE,@TEMP@("ATT")=ECL
 D PREP(HIS)
SEL D POCLEPA^%VVIDEO X XY W "(",$S(HIS=1:"G",1:"D"),")"
 D ^%VQUIKMN(5,79,LMENU,MENU,.ADR,.CTR)
 G:ADR'="" @ADR
 I CTR="R" D AFF^%HXIISS2(GL,HIS,$S(HIS=1:OPTH,1:OPTH2)) G SEL
 I CTR="J" D IMP^%HXIIMPD(OPTH,OPTH2,TYP),REAFF G SEL
 I CTR="B" G TYPE
 I "AF"[CTR S DX=0,DY=LMENU D CLEBAS^%VVIDEO G:HIS=1 FIN1 G FIN2
 D ^%VSQUEAK G SEL
 
ENTRE 
 S CS=NOCOL(HIS)
SMEN I HIS=1 S (NOCOL(1),INDCOCOU)=CS,NOCOL(2)=1 D PTENTR(1,0,OPTH,TYP),PTENTR(2,0,OPTH2,TYP)
 I HIS=2 S NOCOL(2)=CS D PTENTR(2,0,OPTH2,TYP)
 S I=$$^%HXIISS3(GL,INVC,HIS,@TEMP@("ATT"),T,@TEMP@("REPS"),TEMP)
 G:I=2 FIN2
 
 I I=3,$$INIT(2,.GL,.INVC) S HIS=2 D AFF^%HXIISS2(GL,2,OPTH2) G DIAL2
 
 I I=1 D CLEPAG^%VVIDEO,TAILLE,PTENTR(1,0,OPTH,TYP),PTENTR(2,0,OPTH2,TYP)
 D PREP(HIS)
 G SEL
DIRECT 
 D ACCES^%HXPARAM(@TEMP@("ATT"),$S(HIS=1:NUM,1:NUM2),INVC,.CTR,.I)
 I (I="")!(CTR=0) D ^%VSQUEAK G SEL
 S CS=@INVC@(I)
 G SMEN
 
GAUCH 
 G:'($D(@GL@(NOCOL(HIS)-NBCOL(HIS)))) SUITE0
 G:(NOCOL(HIS)-NBCOL(HIS))'=0 GOK
SUITE0 I NOCOL(HIS)=1 D ^%VSQUEAK G SEL
 S NOCOL(HIS)=1
 I HIS=1 S INDCOCOU=1 G FIN2
 G FIN3
GOK S NOCOL(HIS)=NOCOL(HIS)-NBCOL(HIS)
 I HIS=1 S INDCOCOU=NOCOL(1) G FIN2
 G FIN3
 
DROIT 
 I '($D(@GL@(NOCOL(HIS)+NBCOL(HIS)))) D ^%VSQUEAK G SEL
 S (NOCOL(HIS))=NOCOL(HIS)+NBCOL(HIS)
 I HIS=1 S INDCOCOU=NOCOL(1) G FIN2
 G FIN3
 
ECHEL 
 G:ECHEL(HIS)=0 SEL
 D ECHEL^%HXPARAM(ECHEL(HIS),.CTR,.I)
 I ((CTR=0)!(I=ECHEL(HIS)))!(I="") G SEL
 S ECHEL(HIS)=I
 S I=$S(HIS=1:OPTH,1:OPTH2)
 D MKCOL^%HXIISS2(GL,HIS,I),MKGRA^%HXIISS2(GL,HIS,I)
 D AFCOL^%HXIISS2(GL,HIS),AFTEX^%HXIISS2(GL,HIS),AFGRA^%HXIISS2(GL,HIS)
 G SEL
 
LARGE 
 S I=LARG(HIS),II=NBCOL(HIS)
 D LARG^%HXPARAM(LHIST(HIS),ECART,.I,.II,.CTR)
 I CTR=0 G SEL
 S LARG(HIS)=I,NBCOL(HIS)=II K II
 I HIS=1 S INDCOCOU=NOCOL(HIS) G FIN2
 G FIN3
 
FIN1 
 S L=@TEMP@("LISTE")
 Q
FIN2 
 D PTENTR(1,0,OPTH,TYP),PTENTR(2,0,OPTH2,TYP)
 S GL=PARGLS_","_1_")",HIS=1,INVC=PARGLCS_","_1_")"
 G DIAL2
FIN3 D AFF^%HXIISS2(GL,HIS,$S(HIS=1:OPTH,1:OPTH2))
 G SEL
 
TYPE 
 G:$$TYPE^%QSGESPE(@TEMP@("ATT")_"/"_$$NOMLOG^%QSF(@TEMP@("REPS")))="DATE" DATE
 I HIS=1 G:NUM'=1 SEL
 I HIS=2 G:NUM2'=1 SEL
PAS D PAS^%HXPARAM($S(HIS=1:PAS,1:PAS2),.CTR,.I)
 I (CTR=0)!(I="") G SEL
 I HIS=1 S PAS=I
 I HIS=2 S PAS2=I
 S I=$P(PARGL,",",2)
 D MPAS^%HXIHITU($TR(I,"""",""),$S(HIS=1:PAS,1:PAS2),HIS)
 G CALC
DATE 
 D DATE^%HXPARAM(@TEMP@("ATT"),@TEMP@("REPS"),"REAFF^%HXITOD2",.Y1,.CTR,.I)
 I ((CTR=0)!(I=""))!(I=Y1) G SEL
 
CALC 
 S L=@TEMP@("LISTE"),T=@TEMP@("T"),R=@TEMP@("R"),ECL=@TEMP@("ECL")
 D ^%HXICALC(L,T,R,NUM,PAS,ECL,NUM2,PAS2,FT,FGR,FECL,PARGL,PARGLC,ABC,OPTH,ABC2,OPTH2,ATGROUP,ATECL)
 I HIS=1 S (INDCOCOU,NOCOL(1),NOCOL(2))=1 D PTENTR(1,0,OPTH,TYP),PTENTR(2,0,OPTH2,TYP)
 I HIS=2 S NOCOL(2)=1 D PTENTR(2,0,OPTH2,TYP)
 G SEL
 
REAFF D PTENTR(1,0,OPTH,TYP),PTENTR(2,0,OPTH2,TYP)
 Q

