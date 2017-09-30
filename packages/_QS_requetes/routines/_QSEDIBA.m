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

;%QSEDIBA^INT^1^59547,73881^0
QSEDIBA ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %A,%I,%O,A,ARRET,ATR,ATT,BASE,CH,EA,EGAP,GL,GLO,GLZ,IMP,IND,INDIV,L,LIM,NL,OR,REP,SOR,TAB,TEMP,TYP,VAL,ZLG
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 D TIT
NL 
 S DX=10,DY=8 X XY S NL=$$^%VZAME1($$^%QZCHW("Nom de la liste ou du repertoire")_" : ") Q:NL=""
 I NL="?" S NL=$$SEL^%QS0SEL1("","") D TIT G:NL="" NL
SUIT S BASE=$$NOMINT^%QSF(NL)
 I $$REP^%QSGEST5(BASE) S INDIV=$$LISTIND^%QSGEST6(BASE) G SOR
 I '($$EX^%QSGEST7(NL)) D ^%VZEAVT($$^%QZCHW("Liste inconnue")) G NL
 S INDIV=$$ADRLIS^%QSGEST7(NL),BASE=$$BASE^%QSGEST7(NL)
 I INDIV="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les individus de la liste")) G NL
 I BASE="" D ^%VZEAVT($$^%QZCHW("Base de la liste inconnue")) G NL
 
SOR S DX=10,DY=11 X XY W $$^%QZCHW("Impression sur ") S SOR=$$^%VZESOR("E") Q:SOR=-1
 
 S DX=10,DY=14 X XY S ATR=$$^%VZECH2($$^%QZCHW("Attributs")_"  ","predefinis","tous") G:(ATR=1)!(ATR=6) SOR
 S ARRET=0,LIM=21,IMP=0
 G:SOR=0 EXEC
 I '($D(^TABIDENT(WHOIS,"TABTRA"))) G STA
 I ^TABIDENT(WHOIS,"TABTRA")'=0 S IMP=^TABIDENT(WHOIS,"TABTRA"),LIM=60 G EXEC
STA 
 S LIM=$S($D(^IMPRCOUR(WHOIS)):^IMPRCOUR(WHOIS)-5,1:60),IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 
EXEC 
 S REP=$$NOMLOG^%QSF(BASE),ATT=$$LISTATT2^%QSGEST6(BASE)
 D ALL^%QSATPR(REP,.TAB)
 
 D UNIT,INSER G @SOR
 
TIT D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("IMPRESSION D'UN REPERTOIRE"),0)
 Q
 
INSER 
 D EFF(2)
 S GLZ=0,ZLG=100,EGAP=0,L=30,IND=""
 F %I=1:1 S IND=$O(@INDIV@(IND)) Q:(IND="")!(IND="z")  D TRAIT Q:ARRET=1
 Q
TRAIT 
 S A=""
 F %A=0:0 S A=$O(@TEMP@("PRED",A)) Q:A=""  D TR Q:ARRET=1
 Q:ARRET=1
 
 S A=""
 
 I $E(ATR,1)="t" F %A=0:0 S A=$O(@ATT@(A)) Q:A=""  I '($D(@TEMP@("PRED",A))) D TR Q:ARRET=1
 
 I $E(ATR,1)="p" S GL=$$LISTATT1^%QSGEST6(BASE,IND) F %A=0:0 S A=$O(@GL@(A)) Q:A=""  I '($D(@TEMP@("PRED",A))) D TR Q:ARRET=1
 
 S GLZ=0,ZLG=100
 Q
TR 
 Q:($P(A,".",1)="LIEN")!($P(A,".",1)="INVERSE")
 
 S OR=$S(A'["(":"",1:$P($P(A,"(",2),")",1)),A=$P(A,"(",1)
 I OR'="" S VAL=$E($$AFFI^%QMDAUC(BASE,A,$$^%QSCALIN(BASE,IND,A,OR)),1,L) D INS Q
 
 S GLO=$$CONCAS^%QZCHAD(TEMP,"VAL") K @(GLO),TYP
 D MVG^%QSCALVA(BASE,IND,A,GLO,.TYP)
 I @GLO=0 S VAL="" D INS Q
 S OR="" F %O=0:0 S OR=$O(@GLO@(OR)) Q:OR=""  S VAL=$E($$AFFI^%QMDAUC(BASE,A,@GLO@(OR)),1,L) D INS Q:ARRET=1
 Q
INS 
 S EA=$$GETLBLAN^%VTLBLAN($$^%QZCHEV(A,L,"P"))
 I (OR'="")&(OR'=1) S EA=EA_" ("_OR_")",EA=$E(EA,1,L)
 I VAL="" S VAL=". . . . . . . . . . . . . . ."
 S CH=EA_$J("",L-$L(EA))_" "_VAL_$J("",L-$L(VAL))_" "_@TEMP@("UNIT",A)
 
 S GLZ=GLZ+1,ZLG=ZLG+1 I ZLG'>LIM G INT
 
 S ZLG=8,EGAP=EGAP+1
 D PAGE
 S @TEMP@("IND",EGAP)=IND
INT S @TEMP@("PAG",EGAP,ZLG)=CH
 W !,?5,CH
 
 S CH=$$MIN^%VMINUSC(@TEMP@("COMM",A))
 I CH'="" S CH=$E(CH,1,65),@TEMP@("PAG",EGAP,ZLG+1)=$J("",5)_CH,GLZ=GLZ+1,ZLG=ZLG+1 W !,?10,CH
 S @TEMP@("PAG",EGAP,ZLG+1)=""
 W ! S ZLG=ZLG+1,GLZ=GLZ+1
 I (GLZ#15)=0 D PAGE
 R *ARRET:0 Q
 
EFF(DY) S DX=0 D CLEBAS^%VVIDEO Q
 
PAGE D EFF(2),POCLEPA^%VVIDEO
 W ?10,$$^%QZCHW("(CTRLA) pour finir "),?60,$$^%QZCHW("Page : "),EGAP
 S DX=0,DY=2 X XY W ?30,REP," : ",IND,!
 W ?8,$$^%QZCHW("Attributs"),?40,$$^%QZCHW("Valeur"),?68,$$^%QZCHW("Unite"),!,?15,$$^%QZCHW("Commentaire"),!
 S GLZ=1
 Q
 
UNIT 
 N AT
 D ^%VZEATT
 
 F %A=1:1 Q:'($D(TAB(%A)))  S @TEMP@("PRED",$O(TAB(%A,"")))=""
 K TAB
 S A=""
 F %A=0:0 S A=$O(@ATT@(A)) Q:A=""  S @TEMP@("UNIT",A)=$$UNIT^%LXSTOCK(A),@TEMP@("COMM",A)=$$COMM^%LXSTOCK(A)
 S AT=""
 F %A=0:0 S AT=$O(@TEMP@("PRED",AT)) Q:AT=""  S A=$P(AT," (",1),@TEMP@("UNIT",A)=$$UNIT^%LXSTOCK(A),@TEMP@("COMM",A)=$$COMM^%LXSTOCK(A)
 Q
 
1 
 D IMPR^%QSEDIB2 Q
 
0 
 D ECR^%QSEDIB2 Q

