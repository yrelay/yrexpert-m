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

;%QXMEAT3^INT^1^59547,73887^0
%QXMEAT3 ;;02:44 PM  8 Dec 1992; 14 Oct 92  5:03 PM ; 08 Dec 92 11:54 AM
 
 
 
TRT(NOEUD,NUMND) 
 N ICOM,OR,VAL,LGLO,NOTE,REP,CXTACT,ICOMREQU,REQU,BREQU,VAR1,VAR2
 S ICOM=1,REP="ETAT"
 S LGLO=$$TEMP^%SGUTIL
 G:NUMND'=0 COMPROL
 S @GLOSTO@("O",NUMND,ICOM)="X|S W(""CXT"",""@"",""BASE"")=^PARAENT($J,%VNGA,""REPFOC"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S W(""CXT"",""@"",""OBJET"")=^PARAENT($J,%VNGA,""INDFOC"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S W(""CXT"",""%"",""BASE"")=""%""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S W(""CXT"",""%"",""OBJET"")=$J",ICOM=ICOM+1
COMPROL 
 S CXTACT=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",1)
 G:CXTACT=6 PROL6
 G:CXTACT=2 PROL2
 G:CXTACT=3 PROL3
 S @GLOSTO@("O",NUMND,ICOM)="X|S %REP=^PARAENT($J,%VNGA,""REPFOC"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %IND=^PARAENT($J,%VNGA,""INDFOC"")",ICOM=ICOM+1
 G CMPRL2
 
PROL2 S @GLOSTO@("O",NUMND,ICOM)="X|S %REP="""_$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %IND="""_$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",3)_"""",ICOM=ICOM+1
 G CMPRL2
 
PROL3 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 S @GLOSTO@("O",NUMND,ICOM)="X|S %REP=CXT("""_VAR1_""",""BASE"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %IND=CXT("""_VAR1_""",""OBJET"")",ICOM=ICOM+1
 G CMPRL2
 
PROL6 S REQU=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 S BREQU=$$^%QSCALIN("RQS",REQU,"OBJET",1)
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNGE(3)=$$ACTIVE^%QSINTER("""_REQU_""",""""),%REP="""_BREQU_""",%IND=""""",ICOM=ICOM+1
 S ICOMREQU=ICOM-1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %IND=$$SUIVL^%QS0XG1(%VNGE(3),%IND) S:%IND="""" %VNI(%VNGA,5)=9999999",ICOM=ICOM+1
 
CMPRL2 
 
 D MVG^%QSCALVA(REP,NOEUD,"COMMENTAIRE.PROLOGUE",LGLO,.TYP)
 S OR=$O(@LGLO@("")) I OR="" K @(LGLO) G TRTREG
 S NOTE=@LGLO@(OR)
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,1)=0",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,2)=11",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,3)=80",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,4)=11",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,5)="""_REP_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,6)="""_NOEUD_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,7)=""COMMENTAIRE.PROLOGUE""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,8)="""_NOTE_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,9)="""_OR_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,10)=%REP",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,11)=%IND",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,12)=""$$AFFICH^%QMEAROU""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|D COPY^%QCAGLC(""W(""""CXT"""")"",""^PARAENT($J,%VNGA+1,""""CXT"""")"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="D|AFFNOTE(%VNGA+1)",ICOM=ICOM+1
TRTREG S OR=""
BCREG S OR=$$NXTRIAO^%QSTRUC8(REP,NOEUD,"REGLE",OR) G:OR="" FINREG
 S VAL=$$VALEUR^%QSTRUC8(REP,NOEUD,"REGLE",OR)
 I $P(VAL,"\")'="TRAITER" G BC2
 
 
 
 
TRAITER 
 S VAL=$P(VAL,"\",2)
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""TRT"")="""_VAL_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""REP"")=%REP",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""IND"")=%IND",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|D COPY^%QCAGLC(""W(""""CXT"""")"",""^PARAENT($J,%VNGA+1,""""CXT"""")"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="D|TRAITER(%VNGA+1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|D COPY^%QCAGLC(""^PARASOR($J,%VNGA+1,""""CXT"""")"",""W(""""CXT"""")"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S %FIN=^PARASOR($J,%VNGA+1,""ABANDON"")",ICOM=ICOM+1
 Q
 
 
 G BCREG
 
 
 
BC2 I $P(VAL,"\")'="QUEMANDER" G BC3
QUEMAND 
 S VAL=$P(VAL,"\",2)
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""SAISIE"")="""_VAL_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""REP"")=%REP",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""IND"")=%IND",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|D COPY^%QCAGLC(""W(""""CXT"""")"",""^PARAENT($J,%VNGA+1,""""CXT"""")"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="D|QUEMANDER(%VNGA+1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|D COPY^%QCAGLC(""^PARASOR($J,%VNGA+1,""""CXT"""")"",""W(""""CXT"""")"")",ICOM=ICOM+1
 G BCREG
BC3 
FINREG 
 
 
 K @(LGLO)
 D MVG^%QSCALVA(REP,NOEUD,"COMMENTAIRE.EPILOGUE",LGLO,.TYP)
 S OR=$O(@LGLO@("")) I OR="" K @(LGLO) G FINND
 S NOTE=@LGLO@(OR)
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,1)=0",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,2)=11",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,3)=80",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,4)=11",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,5)="""_REP_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,6)="""_NOEUD_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,7)=""COMMENTAIRE.EPILOGUE""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,8)="""_NOTE_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,9)="""_OR_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,10)=%REP",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,11)=%IND",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,12)=""$$AFFICH^%QMEAROU""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|D COPY^%QCAGLC(""W(""""CXT"""")"",""^PARAENT($J,%VNGA+1,""""CXT"""")"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="D|AFFNOTE(%VNGA+1)",ICOM=ICOM+1
 
FINND I CXTACT=6 G FIN6
 G FINND2
FIN6 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNI(%VNGA,5)="_ICOMREQU,ICOM=ICOM+1
 G FINND2
FINND2 
 K @(LGLO)
 S @GLOSTO@("TITRE",NUMND)=$S($$OAIR^%QSGE5(REP,NOEUD,"TITRE",1):$$VALEUR^%QSTRUC8(REP,NOEUD,"TITRE",1),1:$P(NOEUD,",",2))
 
 S @GLOSTO@("V",NUMND)=1
 Q
 ;
 ;

