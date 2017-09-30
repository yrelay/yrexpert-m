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

;%QWR3CO^INT^1^59547,73886^0
QWR3CO(REG,DOM) 
 
 
 
 
 N OKCOND,C,I,LC,LT,TABC,GCOR3,GLO
 S GCOR3=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C3"")",DOM)
 S GCOR3=$$CONCAS^%QZCHAD(GCOR3,REG)
 K @(GCOR3)
 
 S OKCOND=1,@GCOR3@("P")=0
 S ICOND=""
 S GLO=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QW"",""R3"")",DOM)
 F %I=1:1 S ICOND=$O(@GLO@(REG,1,ICOND)) Q:ICOND=""  S RES=$$COMPCOND(ICOND) I RES=0 S @ERREUR@(CPTER)="Regle "_REG_" : erreur sur la condition "_ICOND,CPTER=CPTER+1,OKCOND=0
 G:'(OKCOND) ACTI
 F I=2:1 Q:'($D(@GLO@(REG,1,I)))  I @GLO@(REG,1,I,"ET") S @GCOR3@("P",@GLO@(REG,1,I-1,"LCODE"),"AVEC")=@GLO@(REG,1,I,"LCODE"),@GCOR3@("P",@GLO@(REG,1,I,"LCODE"),"LIE")=""
 
ACTI 
 S OKACTI=1,@GCOR3@("R")=0
 S IACTI=""
 F %I=1:1 S IACTI=$O(@GLO@(REG,2,IACTI)) Q:IACTI=""  S RES=$$COMPACTI(IACTI) I RES=0 S @ERREUR@(CPTER)="Regle "_REG_" : Erreur sur l'action "_ICOND,CPTER=CPTER+1
 
 
 S @GCOR3@("S")=1
 I $D(@GLO@(REG,"REAP")),@GLO@(REG,"REAP")="O" S @GCOR3@("S")=0
 Q
 
COMPCOND(ICOND) 
 N RA,NEWNB,GANA,ET
 D INIT^%QWANA(0,0,0)
 S (@GCOR3@("P"),NEWNB)=@GCOR3@("P")+1
 S GANA=$$CONCAS^%QZCHAD(GCOR3,"P,"_NEWNB)
 S OK=$$COND^%QWANA(@GLO@(REG,1,ICOND),GANA,"NORMAL","ET","")
 I '(OK) K @(GANA) Q 0
 S @GLO@(REG,1,ICOND,"LCODE")=NEWNB
 S @GLO@(REG,1,ICOND,"ET")=ET
 Q 1
 
COMPACTI(IACTI) 
 N RA,NEWNB,GANA
 D INIT^%QWANA(0,0,0)
 S (@GCOR3@("R"),NEWNB)=@GCOR3@("R")+1
 S GANA=$$CONCAS^%QZCHAD(GCOR3,"R,"_NEWNB)
 S OK=$$AFFEC^%QWANA(@GLO@(REG,2,IACTI),GANA,"")
 I '(OK) K @(GANA) Q 0
 S @GLO@(REG,2,IACTI,"LCODE")=NEWNB
 Q 1

