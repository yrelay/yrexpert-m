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

;%QMEXAT5^INT^1^59547,73878^0
%QMEXAT5 ;;10:56 AM  10 Aug 1993; 14 Oct 92  5:03 PM ; 12 May 93  8:59 AM
 
 
 
 
TRT(NOEUD,NUMND) 
 N ICOM,OR,VAL,LGLO,NOTE,REP,CXTACT,ICOMREQU,REQU,BREQU,VAR1,VAR2
 S ICOM=1,REP="ETAT.RESEAU"
 S LGLO=$$TEMP^%SGUTIL
 I NUMND=0 D NODE0^%QMEXAT3
 
 S @GLOSTO@("O",NUMND,ICOM)="X|D PA^%QSGESTI(""%"",$J,""%NOM.DU.NOEUD"","""_NOEUD_""",1)",ICOM=ICOM+1
 S CXTACT=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",1)
 I CXTACT="LISTE" D PROLLIS^%QMEXATL G FIN
 I CXTACT="REQUETE" D PROREQ^%QMEXATL G FIN
 I CXTACT="LIES" D PROLLIES^%QMEXATL G FIN
 I CXTACT="REPERTOIRE" D PROREP^%QMEXATL G FIN
 
 
 
 S @GLOSTO@("O",NUMND,ICOM)="X|S %VNG(9)=$$TEMP^%SGUTIL()",ICOM=ICOM+1
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",2)
 S:VAR1="" VAR1=" "
 S @GLOSTO@("O",NUMND,ICOM)="X|S @%VNG(9)@(1,""REP"")="_$S(VAR1=" ":"^PARAENT($J,%VNGA,""REPFOC"")",$E(VAR1)="%":"$$^%QSCALIN(""%"",$J,"""_VAR1_""",1)",1:"$$NOMINT^%QSF("""_VAR1_""")"),ICOM=ICOM+1
 S VAR1=$$^%QSCALIN(REP,NOEUD,"CONTEXTE.D.ACTIVATION",3)
 S @GLOSTO@("O",NUMND,ICOM)="X|S @%VNG(9)@(1,""IND"")="_$$GETCH(VAR1,"^PARAENT($J,%VNGA,""INDFOC"")"),ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|I $E(^TOZE($J,""JRN""),$L(^TOZE($J,""JRN""))-1) D SET^%SGVAR(""COMCXT"","" individu ""_@%VNG(9)@(1,""IND"")_"" du repertoire ""_@%VNG(9)@(1,""REP""))",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""STO"")=%VNG(9)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""SUIVANT"")=""$$SUIV1^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESREP"")=""$$REP1^%QMEXAT5""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""ACCESIND"")=""$$IND1^%QMEXAT5""",ICOM=ICOM+1
 D NODE
 S @GLOSTO@("O",NUMND,ICOM)="X|K @%VNG(9)",ICOM=ICOM+1
 
FIN 
 K @(LGLO)
 S @GLOSTO@("TITRE",NUMND)=$S($$OAIR^%QSGE5(REP,NOEUD,"TITRE",1):$$VALEUR^%QSTRUC8(REP,NOEUD,"TITRE",1),1:$P(NOEUD,",",2))
 S TIT=$$^%QZCHW("Etat")_" : "_$P(NOEUD,",",2)
 I $$VAIR^%QSGE5(REP,NOEUD,"NOTE",TIT) S ORD=$$NXTRIAVO^%QSTRUC8(REP,NOEUD,"NOTE",TIT,""),@GLOSTO@("DOC",NUMND)=REP_"^"_NOEUD_"^NOTE^"_TIT_"^"_ORD
 
 S @GLOSTO@("V",NUMND)=1
 Q
 
 
 
GETCH(VAR,VALDEF) 
 I (VAR="")!(VAR=" ") Q VALDEF
 I $E(VAR)="%" Q "$$^%QSCALIN(""%"",$J,"""_VAR_""",1)"
 Q """"_VAR_""""
 
 
NODE 
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""NOEUD"")="""_NOEUD_"""",ICOM=ICOM+1
 
 S @GLOSTO@("O",NUMND,ICOM)="D|EXECNODE(%VNGA+1)",ICOM=ICOM+1
 
 Q
 
 
SUIV1(STO,INDX) Q $O(@STO@(INDX))
REP1(STO,INDX) N RES S RES=@STO@(INDX,"REP") Q RES
IND1(STO,INDX) N RES S RES=@STO@(INDX,"IND") Q RES
 
SUIV2(STO,INDX) Q $$NXTRI^%QSTRUC8(STO,INDX)
REP2(STO,INDX) Q STO
IND2(STO,INDX) Q INDX
 
SUIV3(STO,INDX) Q $$SUIVL^%QS0XG1(STO,INDX)
REP3(STO,INDX) N RES S RES=$$BASE^%QSGEST7(STO) Q RES
IND3(STO,INDX) Q INDX
 
SUIV4(STO,INDX) Q $$NEXT^%QULARBE(STO,INDX)
REP4(STO,INDX) Q $$GETREP^%QULARBE(STO,INDX)
IND4(STO,INDX) Q $$GETIND^%QULARBE(STO,INDX)
 
SUIV5(STO,INDX) Q $$NXTRI^%QSTRUC8(STO,INDX)
REP5(STO,INDX) Q STO
IND5(STO,INDX) Q INDX
 ;
 ;

