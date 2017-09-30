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
;! Nomprog     : %QSATTR2                                                     !
;! Module      : QS (Attribut)                                                !
;! But         : Manipuler un attribut d'un individu                          !
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
;! HL002 ! HL     ! 17/06/12 ! %GTM-E-DEVPARUNK, Deviceparameter unknown      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSATTR2^INT^1^59547,73880^0
QSATTR2 ;
 
 
 
 
 
 
 
 
 
 
REAFF 
 G REAFF^%QSATTR6
 
DELA N ORR
 S AA=^ATT($J,Z,LC),ATT=$P(AA," ("),ORD=$P($P(AA,")"),"(",2),VAL=^VAL($J,Z,LC) S:ORD="" ORD=1
 S REXT=$$ROUTMAJ^%QSGESPE(BA,ATT) I REXT'="" D EXE("S",ATT,VAL,ORD,REXT) Q
 I '($$^%QSDROIT(BA,ATT,"T",JE)) D ^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de supprimer")_" "_$S(COL:$$^%QZCHW("la valeur de")_" ",1:"")_$$^%QZCHW("cet attribut")) Q
 I COL G VIDE
DD D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("suppression de")_" "_ATT_" ? :")'=1 D POCLEPA^%VVIDEO Q
 D ^%VZEATT,SUP(ATT,VAL,ORD,.LC),PAGE^%QSATTR6
 Q
VIDE S ^VAL($J,Z,LC)="" D PAGA^%QSATTR6(AA)
 S DX=XC,DY=YC X XY D ZFLECHE^%VZATOU
 S ETIQ=$S(%F'="":%F,1:"DIR") I %F="" S DX=XC,DY=YC X XY
 Q
 
INSA N SATT,INDICE,ROU,II
INSA1 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("Attribut : ") Q:CTRLA!(Y1="")
 I Y1'["(" S (PCH2,PCH)=Y1
 I Y1["(" S (PCH2,PCH)=$$GETLBLAN^%VTLBLAN($P(Y1,"(")),INDICE=$P($P(Y1,"(",2,3),")",1)
 I ($E(Y1)="%")&$D(ORIG),ORIG="TRAIT" S CONCUR=1,PCHCOMP=PCH G INSA2
 D ^%LXABR
INSA2 I CONCUR=1 S ATT=PCHCOMP G OKA
 I CONCUR>1 D ^%VZEAVT($$^%QZCHW("ambigu au lexique")) G LEXIQU
 D ^%VZEAVT($$^%QZCHW("inconnu au lexique"))
LEXIQU D LEXIQ^%LXSTOCK(ROUTAFF) S PCH=PCH2 D ^%LXABR
 G:CONCUR=0 INSA1
 I CONCUR>1 D ^%VZEAVT($$^%QZCHW("ambigue au lexique")) G INSA1
 G INSA2
OKA I '($$^%QSDROIT(BA,ATT,"C",JE)) D ^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de creer cet attribut")) G INSA1
 S REXT=$$ROUTMAJ^%QSGESPE(BA,ATT) I REXT'="" S:'($D(INDICE)) INDICE="" D EXE("A",ATT,"",INDICE,REXT) Q
 I '($$AIR^%QSGEST5(BA,O,ATT)) S ORD=1 G OKM79
OKM79 I '($D(INDICE)) D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("no d'ordre")_" : ") G:CTRLA INSA1 S:Y1="" Y1=1
 S:$D(INDICE) Y1=INDICE
 I $$OAIR^%QSGE5(BA,O,ATT,Y1) D ^%VZEAVT($$^%QZCHW("numero d'ordre existant")) K INDICE G OKM79
 S ORD=Y1
GOATT D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("valeur")_" : ")
 G:CTRLA INSA1
 I Y1="" G:$$TYPE^%QSGESPE(ATT_"/"_$$NOMLOG^%QSF(BA))'="DATE" INSA1
 
 S VAL=Y1 I '($$FINT2^%QMDAUC(BA,ATT,.VAL)) D ^%VZEAVT($$^%QZCHW("saisie incorrecte")) G GOATT
 
 S II=$$^%QSPRVAL(BA,ATT,.VAL,XG,YH,LA,HA)
 I II=1 D CADR^%QSATTR6,TIT^%QSATTR6,HELP^%QSATTR6
 I II=2 D ^%VZEAVT($$^%QZCHW("valeur refusee")) G GOATT
 I VAL="" D PAGE^%QSATTR6 G INSA1
 D AJ(ATT,VAL,ORD) S SATT=^ATT($J,Z,$ZP(^ATT($J,Z,"")))
 S II=$$CHANG^%QSATTR6(BASE,ATT,VAL)
 D FINA(SATT) Q
 
MCONT S AA=^ATT($J,Z,LC),ATT=$P(AA," ("),ORD=$S(AA["(":$P($P(AA,"(",2),")"),1:1)
 S REXT=$$ROUTMAJ^%QSGESPE(BA,ATT)
 I REXT'="" D EXE("M",ATT,^VAL($J,Z,LC),ORD,REXT)
 Q
 
MVAL 
 S AA=^ATT($J,Z,LC),ATT=$P(AA," ("),ORD=$S(AA["(":$P($P(AA,"(",2),")"),1:1)
 I '($$^%QSDROIT(BA,ATT,"M",JE)) D ^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de modifier cet attribut")) Q
 S REXT=$$ROUTMAJ^%QSGESPE(BA,ATT) I REXT'="" D EXE^%QSGESP2("I",XG,YH,LA,HA,BA,O,ATT,^VAL($J,Z,LC),ORD,REXT) S VAL=^VAL($J,Z,LC) G MMVAL
 S CTRLA=0
MD S (DX,PCX)=XC,(DY,PCY)=YC,YG=$$AFFI^%QMDAUC(BA,ATT,^VAL($J,Z,LC))
 N TAB,II
 S TAB("DX")=XG+2,TAB("DY")=YH+HA,TAB("PCX")=DX,TAB("PCY")=DY
 S TAB("%LGX")=XC-1,TAB("%LDX")=DX+L1,TAB("MSG")=$$^%QZCHW("modification de la valeur")
MD1 ;HL002 I '(DTM) O 0:(RM:1)
 D MODIF^%VLECFLD(YG,"TAB",.CTR,.Y1)
 G:(Y1="")!(CTR="A") EVAL
 S VAL=Y1 I '($$FINT^%QMDAUC(BA,ATT,.VAL)) D ^%VZEAVT($$^%QZCHW("saisie incorrecte")) S DX=XC+1,DY=YC X XY G MD1
 
 S II=$$^%QSPRVAL(BA,ATT,.VAL,XG,YH,LA,HA)
 I II=1 D REAFF^%QSATTR6
 I II=2 D ^%VZEAVT($$^%QZCHW("valeur refusee")) S DX=XC+1,DY=YC X XY G MD1
 I VAL="" G EVAL
 D MOD(ATT,VAL,ORD,LC)
MMVAL I $$CHANG^%QSATTR6(BASE,ATT,VAL)=1 D REAFF^%QSATTR6
EVAL D AFFV(LC) Q
 
DATE 
 S ATT=$P(^ATT($J,Z,LC)," (")
 D POCLEPA^%VVIDEO
FD S Y1=$$^%VZAME1($$^%QZCHW("quel format")_" : ("_$$^%QSCALIN("ATTRIBUT",ATT_"/"_BASE,"DERNIER.FORMAT.UTILISE",$I)_") ") Q:Y1=""
 I Y1="?" D LIST^%QMDAUC,@ROUTAFF G DATE
 G:'($$COR^%QMDAUC(ATT,BA,.Y1)) FD
 Q
 
 
 
EXE(AC,A,V,OR,R) 
 
 D EXE^%QSGESP2(AC,XG,YH,LA,HA,BA,O,A,V,OR,R) Q
 
SUP(A,V,OR,LC) 
 N I S DX=XG+2,DY=((YH+2)+LC)-LDEP X XY W $J("",LA-4)
 D PS^%QSGESTI(BA,O,A,V,OR)
 K ^LATT($J,Z,A,OR)
 F I=LC+1:1 Q:'($D(^ATT($J,Z,I)))  S (AT,^ATT($J,Z,I-1))=^ATT($J,Z,I),^VAL($J,Z,I-1)=^VAL($J,Z,I),ORR=$P($P(AT," (",2),")") S:ORR="" ORR=1 S ^LATT($J,Z,$P(AT," ("),ORR)=I-1
 S I=$ZP(^ATT($J,Z,"")) I I'<LC K ^ATT($J,Z,I),^VAL($J,Z,I)
 G:I'=LC AELA G:LC'=LDEP XHOK
 S LC=LC-1,LFIN=LDEP-1,LDEP=(LFIN-HA)+5,YC=(YH+HA)-3,PAGE=PAGE-1 Q
XHOK S LC=LC-1,YC=YC-1
AELA Q
 
AJ(A,V,OR) 
 N DL S DL=$ZP(^ATT($J,Z,""))
 D PA^%QSGESTI(BA,O,A,V,OR),INST2^%QSATTR3(A,V,OR,.DL) Q
 
MOD(A,V,OR,LC) 
 S ^VAL($J,Z,LC)=V D PA^%QSGESTI(BA,O,A,V,OR)
 Q
 
FINA(ATT) 
 D PAGA^%QSATTR6(ATT) Q
 
AFFV(LC) 
 N AT S AT=$P(^ATT($J,Z,LC)," (")
 D POCLEPA^%VVIDEO S DX=XC,DY=YC X XY W $J("",L1+8)
 X XY W $E($$AFFI^%QMDAUC(BA,AT,^VAL($J,Z,LC)),1,L1)
 S DX=(DX+L1)+2 X XY W $$UNIT^%LXSTOCK(AT)
 Q

