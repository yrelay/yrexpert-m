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

;%QMEXAT2^INT^1^59547,73878^0
%QMEXAT2 ;;03:05 PM  22 Dec 1992; 14 Oct 92  5:03 PM ; 14 Jan 93  9:59 AM
 
 
 
 
TRT(NOEUD,NUMND) 
 N ICOM,OR,VAL,LGLO,NOTE,REP,CXTACT,ICOMREQU,REQU,BREQU,VAR1,VAR2
 S ICOM=1,REP="ETAT.RESEAU"
 S LGLO=$$TEMP^%SGUTIL
 I NUMND=0 D NODE0^%QMEXAT3
 
 S @GLOSTO@("O",NUMND,ICOM)="X|D PA^%QSGESTI(""%"",$J,""%NOM.DU.NOEUD"","""_NOEUD_""",1)",ICOM=ICOM+1
 S CXTACT=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",1)
 G:CXTACT="LISTE" PROLLIS
 G:CXTACT="REQUETE" PROREQ
 G:CXTACT="LIES" PROLLIES
 
 
 
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 S:VAR1="" VAR1=" "
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(9)="_$S(VAR1=" ":"^PARAENT($J,%VNGA,""REPFOC"")",$E(VAR1)="%":"$$^%QSCALIN(""%"",$J,"""_VAR1_""",1)",1:"$$NOMINT^%QSF("""_VAR1_""")"),ICOM=ICOM+1
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",3)
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(10)="_$$GETCH(VAR1,"^PARAENT($J,%VNGA,""INDFOC"")"),ICOM=ICOM+1
 G TXTREG
 
 
 
PROLLIS 
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 G:(VAR1="")!(VAR1=" ") LISTE1 G:$E(VAR1)="%" LISTE3 G LISTE2
 
LISTE1 S @GLOSTO@("O",NUMND,ICOM)="X|S (%VNG(3),%VNG(9))=^PARAENT($J,%VNGA,""REPFOC""),%VNG(10)="""" S:%VNG(9)="""" %VNI(%VNGA,5)=999999999",ICOM=ICOM+1
 S ICOMREQU=ICOM-1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(10)=$$NXTRI^%QSTRUC8(%VNG(9),%VNG(10)) S:%VNG(10)="""" %VNI(%VNGA,5)=99999999",ICOM=ICOM+1
 G TXTREG
 
LISTE2 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(3)="""_VAR1_""",%VNG(9)=$$BASE^%QSGEST7("""_VAR1_"""),%VNG(10)="""" S:%VNG(9)=0 %VNI(%VNGA,5)=99999999",ICOM=ICOM+1
 S ICOMREQU=ICOM-1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(10)=$$SUIVL^%QS0XG1(%VNG(3),%VNG(10)) S:%VNG(10)="""" %VNI(%VNGA,5)=9999999",ICOM=ICOM+1
 G TXTREG
 
LISTE3 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(3)=$$^%QSCALIN(""%"",$J,"""_VAR1_""",1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(9)=$$BASE^%QSGEST7(%VNG(3)),%VNG(10)="""" S:%VNG(9)=0 %VNI(%VNGA,5)=99999999",ICOM=ICOM+1
 S ICOMREQU=ICOM-1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(10)=$$SUIVL^%QS0XG1(%VNG(3),%VNG(10)) S:%VNG(10)="""" %VNI(%VNGA,5)=9999999",ICOM=ICOM+1
 G TXTREG
 
 
 
PROREQ S REQU=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 S BREQU=$$^%QSCALIN("RQS",REQU,"OBJET",1)
 S @GLOSTO@("O",NUMND,ICOM)="X|S %BREQU="_$$GETCH($$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",3),""""),ICOM=ICOM+1
 I '($D(^[QUI]RQS1(REQU,"PARAMETRES"))) G REQU2
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(12)=$$TEMP^%SGUTIL",ICOM=ICOM+1
 S IPAR=""
REQU1 S IPAR=$O(^[QUI]RQS1(REQU,"PARAMETRES",IPAR)) G:IPAR="" REQU10
 S NOMPAR=^[QUI]RQS1(REQU,"PARAMETRES",IPAR)
 S @GLOSTO@("O",NUMND,ICOM)="X|S @%VNG(12)@("""_NOMPAR_""")="_$$GETCH($$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",IPAR+3),"^PARAENT($J,%VNGA,""INDFOC"")"),ICOM=ICOM+1
 G REQU1
REQU10 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(3)=$$ACTIVEP^%QSINTER("""_REQU_""",%BREQU,%VNG(12)),%VNG(9)="""_BREQU_""",%VNG(10)="""" K @%VNG(12)",ICOM=ICOM+1
 G REQU3
REQU2 
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(3)=$$ACTIVE^%QSINTER("""_REQU_""",%BREQU),%VNG(9)="""_BREQU_""",%VNG(10)=""""",ICOM=ICOM+1
REQU3 S ICOMREQU=ICOM-1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(10)=$$SUIVL^%QS0XG1(%VNG(3),%VNG(10)) S:%VNG(10)="""" %VNI(%VNGA,5)=9999999",ICOM=ICOM+1
 G TXTREG
 
GETCH(VAR,VALDEF) 
 I (VAR="")!(VAR=" ") Q VALDEF
 I $E(VAR)="%" Q "$$^%QSCALIN(""%"",$J,"""_VAR_""",1)"
 Q """"_VAR_""""
 
 
 
PROLLIES 
 S NOMLIEN=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 S INDI=$$GETCH($$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",3),"^PARAENT($J,%VNGA,""INDFOC"")")
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(3)=$$INIT^%QULARBE("_INDI_","""_NOMLIEN_"""),%VNG(11)=""""",ICOM=ICOM+1
 S ICOMREQU=ICOM-1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(11)=$$NEXT^%QULARBE(%VNG(3),%VNG(11))",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|I %VNG(11)="""" S %VNI(%VNGA,5)=9999999 D FIN^%QULARBE(%VNG(3))",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(9)=$$GETREP^%QULARBE(%VNG(3),%VNG(11)),%VNG(10)=$$GETIND^%QULARBE(%VNG(3),%VNG(11))",ICOM=ICOM+1
 G TXTREG
 
TXTREG 
 
 
 D COMPROL^%QMEXAT3
 
 S OR=""
BCREG S OR=$$NXTRIAO^%QSTRUC8(REP,NOEUD,"REGLE",OR) G:OR="" FINREG
 S VAL=$$VALEUR^%QSTRUC8(REP,NOEUD,"REGLE",OR)
 
 I $P(VAL,"\")="TRAITER" D TRAITER^%QMEXAT3 G BCREG
 
 I $P(VAL,"\")="QUEMANDER" D QUEMAND^%QMEXAT3 G BCREG
 G BCREG
 
FINREG 
 S ATNASSO=$$^%QSCALIN(REP,NOEUD,"RESEAU.ASSOCIE",1)
 G:ATNASSO="" COMEPIL
 
 S @GLOSTO@("O",NUMND,ICOM)="X|K ^PARAENT($J,%VNGA+1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""REPFOC"")=%VNG(9)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""INDFOC"")=%VNG(10)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="C|"_ATNASSO_"(%VNGA+1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|K ^PARASOR($J,%VNGA+1)",ICOM=ICOM+1
 
COMEPIL 
 D COMEPIL^%QMEXAT3
 
CXTFIN 
 I ((CXTACT="LIES")!(CXTACT="LISTE"))!(CXTACT="REQUETE") S @GLOSTO@("O",NUMND,ICOM)="X|S %VNI(%VNGA,5)="_ICOMREQU,ICOM=ICOM+1
 
 K @(LGLO)
 S @GLOSTO@("TITRE",NUMND)=$S($$OAIR^%QSGE5(REP,NOEUD,"TITRE",1):$$VALEUR^%QSTRUC8(REP,NOEUD,"TITRE",1),1:$P(NOEUD,",",2))
 S TIT=$$^%QZCHW("Etat")_" : "_$P(NOEUD,",",2)
 I $$VAIR^%QSGE5(REP,NOEUD,"NOTE",TIT) S ORD=$$NXTRIAVO^%QSTRUC8(REP,NOEUD,"NOTE",TIT,""),@GLOSTO@("DOC",NUMND)=REP_"^"_NOEUD_"^NOTE^"_TIT_"^"_ORD
 
 S @GLOSTO@("V",NUMND)=1
 Q
 ;
 ;

