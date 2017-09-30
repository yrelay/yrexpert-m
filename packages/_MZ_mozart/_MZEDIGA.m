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

;%MZEDIGA^INT^1^59547,73871^0
MOZEDIGA ;
 
 
 
 
 N CTRLA,Y1
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,"EDITION DE GAMMES")
LEC S DX=6,DY=8 D CLEBAS^%VVIDEO W "A editer : " S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" FIN I Y1="?" G LIST
 
 
NUGA I '($$IR^%QSGEST5($$GI^%MZQS,Y1)) D ^%VZEAVT($$^%QZCHW("Gamme inconnue")) G LEC
 S NUGA=Y1
PAFF S DX=6,DY=8 D GRENS,LECSUP G:CTRLA FIN
 D ^%MZLSTAR,CHA I $D(^POSENR($J)) D @SUP
FIN D CLEPAG^%VVIDEO K ^POSENR($J),NUGA,Y1,INT,PIE,PLA,DC,TBV,IMPR,LILIM,%ZZZ,VAL,PAGE,PAG,%PXH,GSM,NULI,LGAF,ZLI,%ZLG,CD,CF
 G FL
 
LECSUP S CTRLA=0,DX=0,DY=12 D CLEBAS^%VVIDEO X XY W $$^%QZCHW("impression sur ") S SUP=$$^%VZESOR("E"),DX=$X
 I SUP=-1 S CTRLA=1 Q
 S SUP=$S(SUP=1:"I",1:"E") G:(SUP'="I")&(SUP'="E") LECSUP
 S LILIM=15,IMPR=0 I SUP="I" S LILIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-15,1:50),IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0) S:IMPR=0 LILIM=15
 Q
GRENS 
 
 N %I,II,%UTIL,%TS
 I $D(^[QUI]MOZ("EDITION",WHOIS,$$GE^%MZQS)) S %TS=$$GE^%MZQS,%UTIL=WHOIS G GRENS2
 I $D(^[QUI]MOZ("EDITION","TRAZOM",$$GE^%MZQS)) S %TS=$$GE^%MZQS,%UTIL="TRAZOM" G GRENS2
 S %TS="STAND",%UTIL="TRAZOM"
GRENS2 S %I="" F II=1:1 S %I=$O(^[QUI]MOZ("EDITION",%UTIL,%TS,%I)) Q:%I=""  S VAL=^[QUI]MOZ("EDITION",%UTIL,%TS,%I),TBV($P(VAL,"^",1))=$$^%QSCALIN($$GI^%MZQS,NUGA,$P(VAL,"^",2),$P(VAL,"^",3))
 Q
I S DX=0,DY=12 D CLEBAS^%VVIDEO W "Impression de la gamme ",NUGA," en cours " D ZD^%QMDATE4,^%QMDAK0 O IMPR U IMPR
 F PAGE=1:1 Q:'($D(^POSENR($J,PAGE)))  D ENTET,AFFREN,AFF
 W ! C IMPR Q
E S PAG=1 G AFF1
SUIT D POCLEPA^%VVIDEO W $$L1^%QSLIB S DX=$X R *REP D TOUCHE^%INCCLAV(REP,.REP)
 Q:(REP=1)!(REP=6)  S Y1=$C(REP) G 45:Y1="+",45:Y1="=",43:Y1="-"
PAG D POCLEPA^%VVIDEO W "Page :" S DX=$X D ^%VLEC G SUIT:CTRLA,SUIT:CTRLF S %PCH=Y1 D ^%QZNBN1 I '(ISNUM) D ^%VSQUEAK G PAG
 S PAG=Y1 G AFF1
45 S PAG=PAGE+1 G AFF1
43 S PAG=PAGE-1 G AFF1
AFF1 I '($D(^POSENR($J,PAG))) D ^%VSQUEAK G SUIT
 S PAGE=PAG D CLEPAG^%VVIDEO,AFFREN,AFF G SUIT
ENTET H 5 W #,!,"Le : ",%DAT," a : ",HEURE,?26,"*** GAMME DE FABRICATION ***",!,!
 Q
AFFREN S %ZZZ=""
 S GSM="Page : "_PAGE_"/"_NBPAG W LSTAR,!,"| No de gamme  : ",NUGA,?40
 S %ZZZ=$O(TBV(%ZZZ)) G:%ZZZ="" STAR W $E(%ZZZ,1,12),?52,": ",$E(TBV(%ZZZ),1,37),?79,"|"
 S %ZZZ=$O(TBV(%ZZZ)) G:%ZZZ="" STAR W !,"| ",$E(%ZZZ,1,13),?15,"| ",$E(TBV(%ZZZ),1,37),?40
 S %ZZZ=$O(TBV(%ZZZ)) G:%ZZZ="" STAR W $E(%ZZZ,1,12),?52,": ",$E(TBV(%ZZZ),1,37)
STAR W ?79,"|",!,"|",?40-($L(GSM)\2),GSM,?79,"|",!,LSTAR,!
 Q
CHA K ^POSENR($J) D ^%VZEATT,^%MZS02(NUGA)
 S ZLI=100,PAGE=0,NULI=0 F %ZLG=1:1 S NULI=$N(^U($J,0,NULI)) Q:NULI=-1  S LGAF=$P(^U($J,0,NULI),"^",2) D AFFI
 S NBPAG=$S($D(^POSENR($J,PAGE)):PAGE,1:PAGE-1),DX=0,DY=6 D CLEBAS^%VVIDEO
 Q
AFFI S CD=1,CF=79
 S LGAF=$TR(LGAF,$C(1)," ")
TL S DC=$E(LGAF,CF) I (DC'=" ")&(DC'="") S CF=CF-1 G TL
 S ZLI=ZLI+1 I ZLI>LILIM S ZLI=1,PAGE=PAGE+1
 S ^POSENR($J,PAGE,ZLI)=$E(LGAF,CD,CF) Q:DC=""  S CD=CF+1,CF=CF+79 G TL
AFF F %ZLG=1:1 Q:'($D(^POSENR($J,PAGE,%ZLG)))  W !,^POSENR($J,PAGE,%ZLG)
 Q
 
LIST S SUP="E",%PGTR="^%MZPIMGA",V80=1 D ENTREE^%MZLISGA G:'($D(^GAMAIMP($J))) LEC S CTRLA="",CTRLF="" D LECSUP G:CTRLA!CTRLF FL
 S PGE=-1,^MOZTRAIT($J)="" D ^%MZLSTAR
 F ZP=1:1 S PGE=$N(^GAMAIMP($J,PGE)) Q:PGE=-1  S LGJ=-1 F ZL=1:1 S LGJ=$N(^GAMAIMP($J,PGE,LGJ)) Q:LGJ=-1  S NUGA=^GAMAIMP($J,PGE,LGJ) D GRENS,CHA,@SUP,CLEPAG^%VVIDEO Q:CTRLA
 
FL K ^OP($J),^U($J),^GAMAIMP($J),^MOZTRAIT($J) Q
 
EDIT(NUGA) 
 N CTRLA,Y1
 I '($$IR^%QSGEST5($$GI^%MZQS,NUGA)) D ^%VZEAVT("Gamme inexistante...") Q
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,"IMPRESSION DE GAMMES")
 G PAFF

