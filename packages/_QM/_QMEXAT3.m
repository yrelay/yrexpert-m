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

;%QMEXAT3^INT^1^59547,73878^0
%QMEXAT3 ;;04:02 PM  16 Dec 1992; 14 Oct 92  5:03 PM ; 15 Apr 93  3:53 PM
 
 
 
 
 
 
NODE0 
 
 
 
 
 
 
 S @GLOSTO@("O",NUMND,ICOM)="X|D COPY2^%QCAGLC(""^PARAENT(""_$J_"",""_%VNGA_"",""""CXT"""")"",""CXT"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S CXT(""@"",""BASE"")=^PARAENT($J,%VNGA,""REPFOC"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S CXT(""@"",""OBJET"")=^PARAENT($J,%VNGA,""INDFOC"")",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S CXT(""%"",""BASE"")=""%""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S CXT(""%"",""OBJET"")=$J",ICOM=ICOM+1
 Q
 
 
 
COMPROL 
 N NOTE,LGLO,TYP
 S LGLO=$$TEMP^%SGUTIL
 D MVG^%QSCALVA(REP,NOEUD,"COMMENTAIRE.PROLOGUE",LGLO,.TYP)
 S OR=$O(@LGLO@("")) I OR="" K @(LGLO) Q
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
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,10)=%VNG(9)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,11)=%VNG(10)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,12)=""$$AFFICH^%QMEAROU""",ICOM=ICOM+1
 
 S @GLOSTO@("O",NUMND,ICOM)="D|AFFNOTE(%VNGA+1)",ICOM=ICOM+1
 Q
 
 
 
 
TRAITER 
 S VAL=$P(VAL,"\",2)
 S @GLOSTO@("O",NUMND,ICOM)="X|I %VNE(%VNGA,3) D INFOPLUS^%QULELVW(%VNI(%VNGA,11),1_$C(0)_1_$C(0)_""traitement "_VAL_"""_$C(0)_2_$C(0)_1_$C(0)_""sur individu ""_%VNG(10))",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|K ^PARAENT($J,%VNGA+1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""TRT"")="""_VAL_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""REP"")=%VNG(9)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""IND"")=%VNG(10)",ICOM=ICOM+1
 
 S @GLOSTO@("O",NUMND,ICOM)="D|TRAITER(%VNGA+1)",ICOM=ICOM+1
 
 
 S @GLOSTO@("O",NUMND,ICOM)="X|S:^PARASOR($J,%VNGA+1,""ABANDON"") %FIN=^PARASOR($J,%VNGA+1,""ABANDON"")-1",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|K ^PARASOR($J,%VNGA+1)",ICOM=ICOM+1
 Q
 
 
 
 
QUEMAND 
 S VAL=$P(VAL,"\",2)
 S @GLOSTO@("O",NUMND,ICOM)="X|K ^PARAENT($J,%VNGA+1)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""SAISIE"")="""_VAL_"""",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""REP"")=%VNG(9)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,""IND"")=%VNG(10)",ICOM=ICOM+1
 
 S @GLOSTO@("O",NUMND,ICOM)="D|QUEMANDER(%VNGA+1)",ICOM=ICOM+1
 
 S @GLOSTO@("O",NUMND,ICOM)="X|K ^PARAENT($J,%VNGA+1)",ICOM=ICOM+1
 Q
 
 
 
 
COMEPIL 
 N NOTE,LGLO,TYP
 S LGLO=$$TEMP^%SGUTIL
 D MVG^%QSCALVA(REP,NOEUD,"COMMENTAIRE.PROLOGUE",LGLO,.TYP)
 K @(LGLO)
 D MVG^%QSCALVA(REP,NOEUD,"COMMENTAIRE.EPILOGUE",LGLO,.TYP)
 S OR=$O(@LGLO@("")) I OR="" K @(LGLO) Q
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
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,10)=%VNG(9)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,11)=%VNG(10)",ICOM=ICOM+1
 S @GLOSTO@("O",NUMND,ICOM)="X|S ^PARAENT($J,%VNGA+1,12)=""$$AFFICH^%QMEAROU""",ICOM=ICOM+1
 
 S @GLOSTO@("O",NUMND,ICOM)="D|AFFNOTE(%VNGA+1)",ICOM=ICOM+1
 K @(LGLO) Q
 ;

