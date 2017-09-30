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

;%QS9^INT^1^59547,73880^0
%QS9 ;
 
 
 
 
 
 
 
 
 
 
 
ANAL(REQ) N ACTIVAT,ANALOK,DIALOG
 S ACTIVAT=1,DIALOG=1 D GANAL
 D MAJ^%TLQUER2("^[QUI]RQS1(REQ,""CONTRAINTES"")","q."_REQ,1,0,ANALOK)
 Q
 
ANAL2(REQ,ACTIVAT,DIALOG,ANALOK) 
 N G
 D GANAL
 D MAJ^%TLQUER2("^[QUI]RQS1(REQ,""CONTRAINTES"")","q."_REQ,1,0,ANALOK)
 Q
 
DAFF() N %A,LSUPPR,NOLC,NOLV,REQ,ACTIVAT,ANALOK,DIALOG
 S LSUPPR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REQSUP") K @(LSUPPR)
 D ^%QUAPAD($$^%QZCHW("ANALYSE D'UNE REQUETE"))
 
 D ENS^%QUAPAGM(LSUPPR)
 I '($D(@LSUPPR)) D POCLEPA^%VVIDEO Q 1
 S ACTIVAT=0,DIALOG=1
 S (NOLC,NOLV)=1,REQ=""
 
 F %A=0:0 S REQ=$O(@LSUPPR@(REQ)) Q:REQ=""  D GANAL
 D MAJ^%TLQUER2("^[QUI]RQS1(REQ,""CONTRAINTES"")","q."_REQ,1,0,ANALOK)
 K @(LSUPPR)
 D POCLEPA^%VVIDEO Q 2
 
GANAL N PAR,TEMPO,A,BASE,COMM,CONT,DX,DY,II,IL,IV,%I,LVAR,OK,P1C,VAR,Y1,ROUTREAF
 I $$EXISTE^%TLQUER("q."_REQ)=0 D CREER^%TLQUER("q."_REQ)
 D MAJ^%TLQUER2("^[QUI]RQS1(REQ,""CONTRAINTES"")","q."_REQ,1,0,0)
 S ROUTREAF="REAFBIS^%QSQUEST"
 D KILL^%ANA($$^%QCAZG("^[QUI]RQS1(REQ,""COMPILATION"")"))
 K ^[QUI]RQS1(REQ,"COMPILATION")
 F IV=1:1 Q:'($D(^[QUI]RQS1(REQ,"VARIABLES",IV)))  S VAR(IV)=^[QUI]RQS1(REQ,"VARIABLES",IV),VAR(IV,"TETE")=$$^%QCAZG("^[QUI]RQS1(REQ,""VARIABLES"",IV,""TETE"")")+0
 S IV=IV-1
 F II=1:1 Q:'($D(^[QUI]RQS1(REQ,"CONTRAINTES",II)))  S CONT(II)=^[QUI]RQS1(REQ,"CONTRAINTES",II),CONT(II,"TETE")=$$^%QCAZG("^[QUI]RQS1(REQ,""CONTRAINTES"",II,""TETE"")"),CONT(II,"TABATT")=$$^%QCAZG("^[QUI]RQS1(REQ,""CONTRAINTES"",II,""TABATT"")")
 S II=II-1,IL=-1
 S BASE=^[QUI]RQS1(REQ,"BASE"),COMM=$S($D(^[QUI]RQS1(REQ,"COMM")):^[QUI]RQS1(REQ,"COMM"),1:"")
 S ANALOK=0
 I $$NOMINT^%QSF(BASE)="" D:DIALOG ^%VZEAVT($$^%QZCHW("Repertoire non defini dans le schema de donnees...")) Q
 I DIALOG D REAFF^%QSQUEST,POCLEPA^%VVIDEO W $$^%QZCHW("Analyse de "_REQ_" en cours ")
 S OK=1,DX=2,DY=6,P1C=0 F A=1:1:IV Q:'(OK)  S Y1=VAR(A),DY=DY+1,P1C=P1C+1 D UCA^%QSQUES3(0)
 I '(OK) D:DIALOG ^%VZEAVT($$^%QZCHW("Probleme au niveau des variables intermediaires ... "))
 Q:'(OK)
 S DX=2,DY=12,P1C=0 F A=1:1:II Q:'(OK)  S Y1=CONT(A),DY=DY+1,P1C=P1C+1 D UCA^%QSQUES2(0)
 I '(OK) D:DIALOG ^%VZEAVT($$^%QZCHW("Probleme au niveau d'un des criteres"))
 S ANALOK=OK Q:'(OK)
 F A=1:1:IV S ^[QUI]RQS1(REQ,"VARIABLES",A,"TETE")=VAR(A,"TETE")
 F A=1:1:II S ^[QUI]RQS1(REQ,"CONTRAINTES",A,"TETE")=CONT(A,"TETE"),^[QUI]RQS1(REQ,"CONTRAINTES",A,"TABATT")=CONT(A,"TABATT")
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PARAM") K @(TEMPO)
 D CHERCHPAR^%QSQUES2
 
 S I="" F %I=0:0 S I=$O(@TEMPO@(I)) Q:I=""  S PAR=@TEMPO@(I),^[QUI]RQS1(REQ,"PARAMETRES",I)=PAR
 K @(TEMPO)
 Q:'(ACTIVAT)
 D ^%QSACTRE(REQ,BASE) I RQSRESUL'="" S ^DERLISTE($I)=RQSRESUL
FIN Q

