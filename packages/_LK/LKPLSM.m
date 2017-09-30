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

;LKPLSM^INT^1^59547,74867^0
LKPLSM ;
 
 
 
 
ACTIV(FILE,DATJOUR) 
 N PASS
 S PASS="YXP.TXP.NOUVEAU.MOUVEMENT"
 D EXEC(PASS,FILE,"","")
 Q
 
EPIGEN 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EXEC(PASS,FILE,ROUREST,RESTATT) 
 N DEV,OK,ENRG,X,X0,X1,AT,OR,PD,PF,L,REP
 N TABPOS,RESTRIC
 S TABPOS=$$TEMP^%SGUTIL
 S RESTRIC=$$TEMP^%SGUTIL
 
 S AT=""
DECO1 S AT=$O(^[QUI]LKYATR2(PASS,AT)) G:AT="" EXEC2 S OR=""
DECO2 S OR=$O(^[QUI]LKYATR2(PASS,AT,OR)) G:OR="" DECO1
 S PD=$O(^[QUI]LKYATR2(PASS,AT,OR,""))
 G:PD="" DECO2
 S PF=$P(^[QUI]LKYATR2(PASS,AT,OR,PD),"^"),@TABPOS@(AT,OR,"D")=PD,@TABPOS@(AT,OR,"F")=PF
 S @RESTRIC@(AT,OR)=0
 G DECO2
 
EXEC2 S X0=$S(ROUREST="":"",1:"ZL "_ROUREST_" X X1")
 S X1=$S(RESTATT="":"",1:"F I=0:1 S L=$P($T("_RESTATT_"+I),"";;"",2) Q:L=""""  S AT=$P(L,""/""),OR=$P(L,""/"",2) S @RESTRIC@(AT,OR)=1,@RESTRIC@(AT,OR,""X"")=$P(L,""/"",3,999)")
 X X0
 
 S REP=$P(^[QUI]LKY2(PASS),"^",3)
 
 
 D OPENFILE^%SYSUTI1(FILE,"R",.DEV,.OK) Q:'(OK)
 
 
NXENRG S ENRG=$$READ^%SYSUTI1(DEV,.OK) G:'(OK) FIN
 
 
 
 K VAL S AT=""
VAL1 S AT=$O(@TABPOS@(AT)) G:AT="" EXEC3 S OR=""
VAL2 S OR=$O(@TABPOS@(AT,OR)) G:OR="" VAL1
 S VAL(AT,OR)=$$GETLBLAN^%VTLBLAN($E(ENRG,@TABPOS@(AT,OR,"D"),@TABPOS@(AT,OR,"F")))
 I @RESTRIC@(AT,OR) S VALX=VAL(AT,OR) X @RESTRIC@(AT,OR,"X") G:'(OK) NXENRG
 G VAL2
 
EXEC3 S NOM=VAL("NOM",1)
 
 
 I '($$IR^%QSGE5(REP,NOM)) S X=$$CREER^%QSGEIND(REP,NOM,"",1,.MSG)
 
 
 S AT="" F %A=0:0 S AT=$O(VAL(AT)) Q:AT=""  S OR="" F %O=0:0 S OR=$O(VAL(AT,OR)) Q:OR=""  D PA^%QSGESTI(REP,NOM,AT,VAL(AT,OR),OR)
 D PA^%QSGESTI(REP,NOM,"DATE.RECUPERATION.PASSERELLE",$H,1)
 
 
 D PA^%QSGESTI(REP,NOM,"ETAT","NON.TRAITE",1)
 D PA^%QSGESTI(REP,NOM,"DATE.DU.JOUR",DATJOUR,1)
 
 G NXENRG
 
FIN D CLOSE^%SYSUTI1(DEV,"R")
 Q
 ;

