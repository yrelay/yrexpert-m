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

;%QSANAL^INT^1^59547,73880^0
%QSANAL(REQ,TRACE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TET,L,OK,IV,VAR,II,CONT,IL,LVAR,BASE,COMM,Y1,DY,P1C,DX,A,TEMPO
 N ERVAR,LP,OKTOT,ERCRIT
 S OK=1,LP=$$^%QCAZG("^[QUI]PBMANA(""REQUETE"")")+1,OKTOT=1
 S ERVAR=$$^%QZCHW("Probleme au niveau de la variable intermediaire")
 S ERCRIT=$$^%QZCHW("Probleme au niveau du critere")_" "
 
 D KILL^%ANA($$^%QCAZG("^[QUI]RQS1(REQ,""COMPILATION"")"))
 K ^[QUI]RQS1(REQ,"COMPILATION")
 I '($D(^[QUI]RQS1(REQ,"ACTIVATIONS"))) S ^[QUI]RQS1(REQ,"ACTIVATIONS")=0
 F IV=1:1 Q:'($D(^[QUI]RQS1(REQ,"VARIABLES",IV)))  S VAR(IV)=^[QUI]RQS1(REQ,"VARIABLES",IV),VAR(IV,"TETE")=$S($D(^[QUI]RQS1(REQ,"VARIABLES",IV,"TETE")):^[QUI]RQS1(REQ,"VARIABLES",IV,"TETE"),1:0)
 S IV=IV-1
 F II=1:1 Q:'($D(^[QUI]RQS1(REQ,"CONTRAINTES",II)))  D CONTRA
 S II=II-1,IL=-1
 S BASE=^[QUI]RQS1(REQ,"BASE"),COMM=$S($D(^[QUI]RQS1(REQ,"COMM")):^[QUI]RQS1(REQ,"COMM"),1:"")
 
 W:TRACE !,$$^%QZCHW("Analyse des variables intermediaires : "),!
 S DX=2,DY=6,P1C=0
 F A=1:1:IV S Y1=VAR(A),DY=DY+1,P1C=P1C+1 W:TRACE !,"   ",Y1 D UCA^%QSQUES3(0) I '(OK) W:TRACE !,"  ",ERVAR D NEWER S ^[QUI]PBMANA("REQUETE",LP)="   "_ERVAR_" -> "_Y1,LP=LP+1,OKTOT=0,OK=1
 
 W:TRACE !,!,$$^%QZCHW("Analyse des criteres : "),!
 S DX=2,DY=12,P1C=0 F A=1:1:II S Y1=CONT(A),DY=DY+1,P1C=P1C+1 W:TRACE !,"   ",Y1 D UCA^%QSQUES2(0) I '(OK) W:TRACE !,"  ",ERCRIT D NEWER S ^[QUI]PBMANA("REQUETE",LP)="   "_ERCRIT_A_" -> "_CONT(A),LP=LP+1,OKTOT=0,OK=1
 S ^[QUI]PBMANA("REQUETE")=LP-1
 Q:'(OKTOT) 0
 W:TRACE !,!,$$^%QZCHW("Analyse des parametres : "),!
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 D CHERCHPAR^%QSQUES2
 
 F A=1:1:IV S ^[QUI]RQS1(REQ,"VARIABLES",A,"TETE")=VAR(A,"TETE")
 F A=1:1:II S ^[QUI]RQS1(REQ,"CONTRAINTES",A,"TETE")=CONT(A,"TETE"),^[QUI]RQS1(REQ,"CONTRAINTES",A,"TABATT")=CONT(A,"TABATT")
 K ^[QUI]RQS1(REQ,"PARAMETRES")
 S IV="" F A=0:0 S IV=$O(@TEMPO@(IV)) Q:IV=""  W:TRACE !,"   ",@TEMPO@(IV) S ^[QUI]RQS1(REQ,"PARAMETRES",IV)=@TEMPO@(IV)
 K @(TEMPO)
 Q 1
 
CONTRA S CONT(II)=^[QUI]RQS1(REQ,"CONTRAINTES",II)
 S CONT(II,"TETE")=$S($D(^[QUI]RQS1(REQ,"CONTRAINTES",II,"TETE")):^[QUI]RQS1(REQ,"CONTRAINTES",II,"TETE"),1:0)
 S CONT(II,"TABATT")=$S($D(^[QUI]RQS1(REQ,"CONTRAINTES",II,"TABATT")):^[QUI]RQS1(REQ,"CONTRAINTES",II,"TABATT"),1:"")
 Q
NEWER Q:'(OKTOT)
 S ^[QUI]PBMANA("REQUETE",LP)=REQ,LP=LP+1
 S ^[QUI]PBMANA("REQUETE",LP)=$TR($J(" ",$L(REQ))," ","-"),LP=LP+1
 Q
 ;

