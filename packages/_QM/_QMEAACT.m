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

;%QMEAACT^INT^1^59547,73877^0
%QMEAACT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ACT(RP,S,XG1,YG1,LH1,LV1,XG2,YG2,LH2,LV2,BASE,IND) 
 N RAFFECT,RAFFICH
 S RAFFECT="",RAFFICH=""
ACTDEB N TEMP,DES,DON,TYP,DESAT,DESDON,HOVER
 N VAL,I
 I '($$IR^%QSGEST5(RP,S)) D ^%VZEAVT($$^%QZCHW("La saisie")_" "_S_" "_$$^%QZCHW("est inexistante")) Q
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S DES=$$CONCAS^%QZCHAD(TEMP,"DESCRIP")
 S DON=$$CONCAS^%QZCHAD(TEMP,"DONNEES")
 S DESDON=$$CONCAS^%QZCHAD(TEMP,"DESDON")
 S DESAT=$$CONCAS^%QZCHAD(TEMP,"DESAT")
 D DESC(RP,S,DES)
 I $O(@DES@(""))="" K @(TEMP) Q
 D INITS(DES,DON)
 D POSIT^%QMEAAC1(DES,HOVER,DESAT,DESDON)
 D CLEPAG^%VVIDEO
 D AFPRES^%QMEACL2(RP,S,XG1,YG1,LH1,LV1,1)
 D AFF^%QMEACL1(XG2,YG2,LH2,LV2,DON)
 D STOC(RAFFECT,BASE,IND,DON,DES)
 K @(TEMP)
 Q
 
INITS(GL,DON) 
 N IN,%I,LL
 S IN=""
BINITS S IN=$O(@GL@(IN))
 Q:IN=""
 G:RAFFICH="" BINIT2
 S LL=@GL@(IN,"ORD")
 S LL=@GL@(IN,"ATT")_"("_LL_")^"
 S @("LL="_RAFFICH_"(LL,BASE,IND)")
 I LL'="" S @DON@(IN)=LL G BINITS
BINIT2 S @DON@(IN)=$S('($D(@GL@(IN,"VDEF"))):"",1:@GL@(IN,"VDEF"))
 G BINITS
 
STOC(RAFF,BA,IN,DON,DES) 
 N %I,LI,VAT,AT,OR
 S LI=""
 F %I=1:1 S LI=$O(@DON@(LI)) Q:LI=""  S VAT=@DON@(LI) D:VAT'="" STO2
 Q
STO2 S AT=@DES@(LI,"ATT"),OR=@DES@(LI,"ORD")
 
 I RAFF'="" D @(RAFF_"(BA,IN,AT,VAT,OR)") Q
 I $E(AT)'="%" D PA^%QSGESTI(BA,IN,AT,VAT,OR)
 Q
 
DESC(REP,SAI,GL) 
 N ORD,ORD2,ADR
 S HOVER=$$^%QSCALVA(REP,SAI,"SENS.AFFICHAGE")
 S:HOVER="" HOVER="H"
 S ORD2=""
BORD 
 S ORD2=$$NXTRIAO^%QSTRUC8(REP,SAI,"ATTRIBUT",ORD2) G:ORD2="" BVD1
 S @GL@(ORD2,"ATT")=$$VALEUR^%QSTRUC8(REP,SAI,"ATTRIBUT",ORD2)
 S @GL@(ORD2,"ORD")=$S($$OAIR^%QSGE5(REP,SAI,"NUMERO.ORDRE",ORD2):$$VALEUR^%QSTRUC8(REP,SAI,"NUMERO.ORDRE",ORD2),1:1)
 G BORD
 
BNORD1 S ORD2=$$NXTRIAO^%QSTRUC8(REP,SAI,"NUMERO.ORDRE",ORD2)
 G:ORD2="" BVD1
 S @GL@(ORD2,"ORD")=$$VALEUR^%QSTRUC8(REP,SAI,"NUMERO.ORDRE",ORD2)
 G BNORD1
 
BVD1 S ORD2=$$NXTRIAO^%QSTRUC8(REP,SAI,"VALEUR.DEFAUT",ORD2)
 G:ORD2="" BLO
 S ORD=$$VALEUR^%QSTRUC8(REP,SAI,"VALEUR.DEFAUT",ORD2)
 S @GL@(ORD2,"VDEF")=$S($E(ORD)="%":$$^%QSCALVA(CXT("%","BASE"),CXT("%","OBJET"),ORD),1:ORD)
 G BVD1
 
BLO S ORD2=$O(@GL@(ORD2))
 G:ORD2="" BAI1
 S ORD=$$^%QSCALIN(REP,SAI,"LONGUEUR",ORD2) S:ORD="" ORD=15
 S @GL@(ORD2,"LONGUEUR")=ORD
 G BLO
 
BAI1 S ORD2=$$NXTRIAO^%QSTRUC8(REP,SAI,"AIDE",ORD2)
 G:ORD2="" BVL1
 S ORD=$$VALEUR^%QSTRUC8(REP,SAI,"AIDE",ORD2)
 S @GL@(ORD2,"AIDE","NOTE")=ORD,@GL@(ORD2,"AIDE","INDICE")=$$^%QSCALIN(REP,SAI,"INDICE.NOTE",ORD2)
 G BAI1
 
BVL1 S ORD2=$$NXTRIAO^%QSTRUC8(REP,SAI,"VALEUR.LEGALE",ORD2)
 Q:ORD2=""
 S ORD=$$VALEUR^%QSTRUC8(REP,SAI,"VALEUR.LEGALE",ORD2)
 S I=ORD2\100000
 S @GL@(I,"VL",ORD2-(100000*I))=ORD
 G BVL1
 
TEST N REP,SA,X1,Y1,L1,H1,X2,Y2,L2,H2
 S REP="SAISIE.I"
 D CLEPAG^%VVIDEO
 W !,"SAISIE : " R SA Q:SA=""
 I '($$IR^%QSGEST5(REP,SA)) D ^%VZEAVT($$^%QZCHW("La saisie ")_SA_$$^%QZCHW(" est inexistante")) G TEST
 W !,"PARAMETRES 1ERE FENETRE :"
 W !,"   COIN SUPERIEUR GAUCHE : X = " R X1
 W !,"                           Y = " R Y1
 W !,"   LARGEUR = " R L1
 W !,"   HAUTEUR = " R H1
 W !,"PARAMETRES 2EME FENETRE :"
 W !,"   COIN SUPERIEUR GAUCHE : X = " R X2
 W !,"                           Y = " R Y2
 W !,"   LARGEUR = " R L2
 W !,"   HAUTEUR = " R H2
 D ACT(REP,SA,X1,Y1,L1,H1,X2,Y2,L2,H2,"A","B")
 G TEST
TEST2 N SA
 W !,"SAISIE : " R SA Q:SA=""
 D ACT("SAISIE.I",SA,0,4,60,8,0,12,60,10,"A","B")
 G TEST2
TEST3 N SA
 W !,"SAISIE : " R SA Q:SA=""
 D ACT("SAISIE.I",SA,0,0,78,13,0,14,78,9,"A","B")
 G TEST3
 
 
 
 
 
 
 
 
 
 
ACTAFF(RP,S,XG1,YG1,LH1,LV1,XG2,YG2,LH2,LV2,BASE,IND,RAFFICH,RAFFECT) 
 G ACTDEB
 
TESTL 
 S CXT("@","BASE")="NOEUD.I",CXT("@","OBJET")="LAURENT"
 D ACTAFF("SAISIE.I","TEST LAURENT",0,0,80,10,0,10,80,13,"NOEUD.I","LAURENT","$$AFFICH^%QMEAROU","AFFECT^%QMEAROU")
 Q

