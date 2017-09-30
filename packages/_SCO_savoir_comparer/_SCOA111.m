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

;%SCOA111^INT^1^59547,73887^0
SCOA1(REPS,OBJS,ACCOR,ARPREM,IGNORE,LISDOM,LISICIB,LISRSOU,LISRCIB,VISU,NLIST,%ROUT99) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N AT,OR,V1,V2,DOM,ECHEC,LISTE,REPSI,NBREG,SAVDOM
 N TEMPO S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 N LMALUS S LMALUS=$$CONCAS^%QZCHAD(TEMPO,"MALUS")
 N LATTS S LATTS=$$CONCAS^%QZCHAD(TEMPO,"ATT.SOURCE")
 N LATTC S LATTC=$$CONCAS^%QZCHAD(TEMPO,"ATT.CIBLE")
 N RESULTAT S RESULTAT=$$CONCAS^%QZCHAD(TEMPO,"RESULTAT")
 N LISTRES S LISTRES=$$CONCAS^%QZCHAD(TEMPO,"LISTE.RESULTAT")
 N CONTEXT S CONTEXT=$$CONCAS^%QZCHAD(TEMPO,"CONTEXTE"),@CONTEXT=0
 N EV S EV=$$CONCAS^%QZCHAD(TEMPO,"EVALUATION.POUR")
 N SAVDOM S SAVDOM=$$CONCAS^%QZCHAD(TEMPO,"SAUVEGARDE.DOMAINE")
 D SAVDOM^%SCOA222
 
 I VISU D AFF^%SCOA222,AFFSOU^%SCOA222(REPS,OBJS)
 S REPSI=$$NOMINT^%QSF(REPS) Q:REPSI=""
 D LOOPCI
 D RESDOM^%SCOA222
 K @(TEMPO)
 Q
 
LOOPCI 
 N CIBLE,REPC,FIRST,VIDE,STOP,NIV,SACCOR
 S REPC=""
LOOPC2 S STOP=0,NIV=0
 S REPC=$O(@LISICIB@(REPC))
 I REPC="" Q
 I '($D(@LISRCIB@(REPC))) W:VISU REPC_" "_$$^%QZCHW("n'est pas un repertoire cible") G LOOPC2
 S OBJCIB=""
LOOPC3 S OBJCIB=$O(@LISICIB@(REPC,OBJCIB))
 G:OBJCIB="" LOOPC2
 I VISU D CLEAR^%SCOA222,AFFCIB^%SCOA222(REPC,OBJCIB)
 
 S DOM="",FIRST=1,STOP=0,DESACOR=0
 D TRTDOM(LISDOM,DOM)
 G LOOPC3
 
TRTDOM(LDOM,DOM) 
LOOPDO 
 I '(FIRST) D FINDOM^%SCOA222
 Q:STOP
 
 S DOM=$O(@LDOM@(DOM)),FIRST=0
 I DOM="" D DEPIL^%SCOA222(.VIDE,CONTEXT),POCLEPA^%VVIDEO Q:VIDE  S NIV=NIV-1 G LOOPV2
 I '($D(^[QUI]SCOMDOM(DOM,"REP.SOURCE",REPS))) D ERR(REPS_" "_$$^%QZCHW("n'est pas un repertoire source du domaine")_" "_DOM) S FIRST=1 G LOOPDO
 I '($D(^[QUI]SCOMDOM(DOM,"REP.CIBLE",REPC))) S FIRST=1 G LOOPDO
 D:VISU CLEAR^%SCOA222
 D MALUS^%SCOA222(DOM,LMALUS)
 S NBREG=$S(IGNORE="NON":@LMALUS@(DOM),1:0)
 
 S MALUS=""
LOOPML 
 S MALUS=$ZP(@LMALUS@(DOM,MALUS))
 G:MALUS="" LOOPDO
 D:VISU AFFACC^%SCOA222(ACCOR,$S(NBREG'=0:1-(DESACOR/NBREG),1:"****"))
 S AT=""
LOOPAT 
 S AT=$ZP(@LMALUS@(DOM,MALUS,AT))
 G:AT="" LOOPML
 S OR=""
 S:'($D(@EV@(AT))) @EV@(AT)=0
LOOPOR 
 S OR=$ZP(@LMALUS@(DOM,MALUS,AT,OR))
 G:OR="" LOOPAT
 S V1=""
LOOPV1 
 S V1=$ZP(@LMALUS@(DOM,MALUS,AT,OR,V1))
 G:V1="" LOOPOR
 S V2=""
LOOPV2 
 S V2=$ZP(@LMALUS@(DOM,MALUS,AT,OR,V1,V2))
 G:V2="" LOOPV1
 
REGSUP 
 I %ROUT99'="" G @%ROUT99
 D:VISU AFFREG^%SCOA222(DOM,AT,OR,V1,V2)
 I OR="*" G REGSUP2
 S VAL1=$$^%QSCALIN(REPSI,OBJS,AT,OR)
 S VAL2=$$^%QSCALIN(REPC,OBJCIB,AT,OR)
 I (VAL1="")!(VAL2="") G FAUX
 I V1="=" G REGSUP3
 I V1="*" G REGSUP5
 I V2="*" G REGSUP6
 I VAL1'=V1 G FAUX
 I VAL2'=V2 G FAUX
 G ACT
REGSUP2 
 K @(LATTC),@(LATTS)
 D MVG^%QSCALVA(REPSI,OBJS,AT,LATTS,.TYP)
 D MVG^%QSCALVA(REPC,OBJCIB,AT,LATTC,.TYP)
 I V1="=" G REGSUP4
 I V1="*" G REGSUP21
 S OK=0,J="" F I=0:0 S J=$O(@LATTS@(J)) Q:J=""  I @LATTS@(J)=V1 S OK=1 Q
 I '(OK) G FAUX
REGSUP21 
 I V2="*" G ACT
 S OK=0,J="" F I=0:0 S J=$O(@LATTC@(J)) Q:J=""  I @LATTC@(J)=V1 S OK=1
 I '(OK) G FAUX
 G ACT
REGSUP3 
 I VAL1'=VAL2 S:IGNORE="OUI" NBREG=NBREG+1 G FAUX
 G ACT
REGSUP4 
 I @LATTC'=@LATTS G FAUX
 S OK=1,J=""
LREG4 
 S J=$O(@LATTS@(J))
 G:J="" FLREG4
 I '($D(@LATTC@(J))) S OK=0 G FLREG4
 I @LATTS@(J)'=@LATTC@(J) S OK=0 G FLREG4
 G LREG4
FLREG4 
 I '(OK) G FAUX
 G ACT
REGSUP5 
 I V2="*" G ACT
 I VAL2=V2 G ACT
 G FAUX
REGSUP6 
 I VAL1=V1 G ACT
 G FAUX
 
ACT 
 S @EV@(AT)=1
 S:IGNORE="OUI" NBREG=NBREG+1
 I '($D(^[QUI]SCOMPREG(DOM,AT,OR,V1,V2,"COND"))) D BONUS^%SCOA222 G SSDOM
 S REGLE=$$CONCAS^%QZCHAD("^[QUI]SCOMPREG",DOM_","_AT_","_OR_","_V1_","_V2_","_"COND")
 S OK=$$^%SCOAINT(REGLE,REPS,OBJS,REPC,OBJCIB,VISU,%ROUT99) K REGLE
 I OK G SSDOM
 S DESACOR=DESACOR+1 D:VISU AFFACC^%SCOA222(ACCOR,1-(DESACOR/NBREG))
 S ^[QUI]SCOMPREG(DOM,AT,OR,V1,V2,"MALUS")=MALUS+1
 K @LMALUS@(DOM,MALUS,AT,OR,V1,V2)
 S @LMALUS@(DOM,MALUS+1,AT,OR,V1,V2)=MALUS+1
 G LOOPV2
 
SSDOM 
 I '($D(^[QUI]SCOMPREG(DOM,AT,OR,V1,V2,"ACTION"))) D BONUS^%SCOA222 G LOOPV2
 
 S SACCOR=ACCOR
 D EMPIL^%SCOA222(.NIV,CONTEXT)
 
 S SSDOM=$O(^[QUI]SCOMPREG(DOM,AT,OR,V1,V2,"ACTION",""))
 D:VISU MSG^%VZEATT($$^%QZCHW("Execution partie action de ")_DOM_" : --> "_SSDOM)
 S LDOM=$$CONCAS^%QZCHAD("PILE",NIV) K @(LDOM)
 S @LDOM@(SSDOM)=""
 S ACCOR=^[QUI]SCOMPREG(DOM,AT,OR,V1,V2,"ACTION",SSDOM)
 S:ACCOR="=" ACCOR=SACCOR
 S DOM="",FIRST=1,DESACOR=0
 G LOOPDO
 
FAUX 
 G:IGNORE="OUI" LOOPV2
FAUX2 S DESACOR=DESACOR+1 D:VISU AFFACC^%SCOA222(ACCOR,$S(NBREG'=0:1-(DESACOR/NBREG),1:"****"))
 I $$ARRET(0) G LOOPDO
 G LOOPV2
ERR(M) 
 D ^%VZEAVT("ERREUR : "_M) Q
ARRET(FIN) 
 I FIN G ARRET2
 I ACCOR=1,DESACOR=0 Q 0
 I ACCOR=1,DESACOR'=0 Q 1
 I NBREG=0 Q 0
 I (ACCOR'<1)-(DESACOR/NBREG) Q 1
 Q 0
ARRET2 
 I NBREG=0 Q 0
 I ACCOR=1,DESACOR=0 Q 1
 I ACCOR=1,DESACOR'=0 Q 0
 I (ACCOR'<1)-(DESACOR/NBREG) Q 0
 Q 1

