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

;%QMEXATL^INT^1^59547,73878^0
%QMEXATL ;;02:15 PM  2 Sep 1993; 14 Oct 92  5:03 PM ; 12 May 93  9:05 AM
 
 
 
 
 
 
PROLLIS 
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 G:(VAR1="")!(VAR1=" ") LISTE1 G:$E(VAR1)="%" LISTE3 G LISTE2
 
LISTE1 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")=^PARAENT($J,%VNGA,""REPFOC"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""SUIVANT"")=""$$SUIV2^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESREP"")=""$$REP2^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESIND"")=""$$IND2^%QMEXAT5""",ICOM=ICOM+1
z S @GLOSTO@("O",NUMND,ICOM)="X|I $E(^TOZE($J,""JRN""),$L(^TOZE($J,""JRN""))-1) D SET^%SGVAR(""COMCXT"","" tous les individus du repertoire ""_^PARAENT($J,%VNGA+1,""REPFOC""))",ICOM=ICOM+1
 D NODE^%QMEXAT5
 Q
 
 
 
LISTE2 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")="""_VAR1_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|I $E(^TOZE($J,""JRN""),$L(^TOZE($J,""JRN""))-1) D SET^%SGVAR(""COMCXT"","" tous les individus de la liste """_VAR1_""")",ICOM=ICOM+1
 G LISTEG
 
 
 
LISTE3 
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")=$$^%QSCALIN(""%"",$J,"""_VAR1_""",1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|I $E(^TOZE($J,""JRN""),$L(^TOZE($J,""JRN""))-1) D SET^%SGVAR(""COMCXT"","" tous les individus de la liste ""_$$^%QSCALIN(""%"",$J,"""_VAR1_""",1))",ICOM=ICOM+1
LISTEG 
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""SUIVANT"")=""$$SUIV3^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESREP"")=""$$REP3^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESIND"")=""$$IND3^%QMEXAT5""",ICOM=ICOM+1
 D NODE^%QMEXAT5
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION","SUPPRESSION.DE.LA.LISTE")
 S:VAR1="OUI" @GLOSTO@("O",NUMND,ICOM)="X|D ELIML^%QS0XG1(^PARAENT($J,%VNGA+1,""STO""))",ICOM=ICOM+1
 Q
 
 
 
 
 
PROREQ S REQU=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 S BREQU=$$^%QSCALIN("RQS",REQU,"OBJET",1)
 S @GLOSTO@("O",NUMND,ICOM)="X|S %BREQU="_$$GETCH($$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",3),""""""),ICOM=ICOM+1
 I '($D(^[QUI]RQS1(REQU,"PARAMETRES"))) G REQU2
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(12)=$$TEMP^%SGUTIL",ICOM=ICOM+1
 S IPAR=""
REQU1 S IPAR=$O(^[QUI]RQS1(REQU,"PARAMETRES",IPAR)) G:IPAR="" REQU10
 S NOMPAR=^[QUI]RQS1(REQU,"PARAMETRES",IPAR)
 S @GLOSTO@("O",NUMND,ICOM)="X|S @%VNG(12)@("""_NOMPAR_""")="_$$GETCH($$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",IPAR+3),"^PARAENT($J,%VNGA,""INDFOC"")"),ICOM=ICOM+1
 G REQU1
REQU10 
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")=$$ACTIVEP^%QSINTER("""_REQU_""",%BREQU,%VNG(12)),%VNG(9)="""_BREQU_""",%VNG(10)="""" K @%VNG(12)",ICOM=ICOM+1
 G REQU3
REQU2 
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")=$$ACTIVE^%QSINTER("""_REQU_""",%BREQU),%VNG(9)="""_BREQU_""",%VNG(10)=""""",ICOM=ICOM+1
REQU3 
 S @GLOSTO@("O",NUMND,ICOM)="X|I $E(^TOZE($J,""JRN""),$L(^TOZE($J,""JRN""))-1) D SET^%SGVAR(""COMCXT"","" tous les individus de la liste ""_^PARAENT($J,%VNGA+1,""STO"")_""(construite par la requete "_REQU_")"")",ICOM=ICOM+1
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION","VARIABLE.D.INSTANCIATION")
 I VAR1'="" S @GLOSTO@("O",NUMND,ICOM)="X|D PA^%QSGESTI(""%"",$J,"""_VAR1_""",^PARAENT($J,%VNGA+1,""STO""),1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""SUIVANT"")=""$$SUIV3^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESREP"")=""$$REP3^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESIND"")=""$$IND3^%QMEXAT5""",ICOM=ICOM+1
 D NODE^%QMEXAT5
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION","SUPPRESSION.DE.LA.LISTE")
 S:VAR1'="NON" @GLOSTO@("O",NUMND,ICOM)="X|D ELIML^%QS0XG1(^PARAENT($J,%VNGA+1,""STO""))",ICOM=ICOM+1
 Q
 
GETCH(VAR,VALDEF) 
 I (VAR="")!(VAR=" ") Q VALDEF
 I $E(VAR)="%" Q "$$^%QSCALIN(""%"",$J,"""_VAR_""",1)"
 Q """"_VAR_""""
 
 
 
PROLLIES 
 S NOMLIEN=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 S INDI=$$GETCH($$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",3),"^PARAENT($J,%VNGA,""INDFOC"")")
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")=$$INIT^%QULARBE("_INDI_","""_NOMLIEN_""")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""SUIVANT"")=""$$SUIV4^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESREP"")=""$$REP4^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESIND"")=""$$IND4^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|I $E(^TOZE($J,""JRN""),$L(^TOZE($J,""JRN""))-1) D SET^%SGVAR(""COMCXT"","" tous les individus lies par le lien "_NOMLIEN_""")",ICOM=ICOM+1
 D NODE^%QMEXAT5
 Q
 
 
 
 
PROREP S REQU=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 I (REQU="")!(REQU=" ") S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")=^PARAENT($J,%VNGA,""REPFOC"")",ICOM=ICOM+1 G REP2
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")=$$NOMINT^%QSF("""_REQU_""")",ICOM=ICOM+1
REP2 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""SUIVANT"")=""$$SUIV5^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESREP"")=""$$REP5^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESIND"")=""$$IND5^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|I $E(^TOZE($J,""JRN""),$L(^TOZE($J,""JRN""))-1) D SET^%SGVAR(""COMCXT"","" tous les individus du repertoire "_REQU_""")",ICOM=ICOM+1
 D NODE^%QMEXAT5
 Q
 ;

