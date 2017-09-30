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

;%QUBKKV^INT^1^59547,73884^0
%QUBKKV ;;02:52 PM  26 Feb 1992; ; 27 Jul 93  4:56 PM
 
 
 
 
 
 
 
 
 N NOMSM,TABRES
 D CLEPAG^%VVIDEO
 S DX=6,DY=10 X XY W $$^%QZCHW("nom de la saisie :") S DX=26 X XY R NOMSM Q:NOMSM=""
 I NOMSM="?" S NOMSM=$$UN^%PKCHOIX("^[QUI]RQSGLO(""QUBKGR"")",40,5,20) Q:NOMSM=""  S DX=26,DY=10 X XY W NOMSM G INI2
 Q:'($$EX^%QUBKKGE(NOMSM))
INI2 S TABRES=$$TEMP^%SGUTIL
 D VALID(NOMSM,TABRES,1)
 D ^%VZEAVT($S(@TABRES:$$^%QZCHW("Validation correcte"),1:$$^%QZCHW("Probleme sur la validation")))
 K @(TABRES)
 Q
 
ALL N NOMSM,TABRES,%N
 S TABRES=$$TEMP^%SGUTIL
 S NOMSM="" F %N=0:0 S NOMSM=$O(^[QUI]RQSGLO("QUBKGR",NOMSM)) Q:NOMSM=""  K @(TABRES) D MSG^%VZEATT($$^%QZCHW("Validation de ")_NOMSM),VALID(NOMSM,TABRES,0) I '(@TABRES) D ^%VZEAVT($$^%QZCHW("Validation de ")_NOMSM_" : "_$$^%QZCHW("Problemes")) K @(TABRES)
 D OFF^%VZEATT
 Q
 
 
 
VALID(NOMSM,GLORES,VISU) 
 N GL,CO,%CO,FE,%FE,DEFB,GLODEF,VAL,FORM,KEMPLOI,ATTUT,INDX,ATTRI,GLOVAL,C,%AT,AT,%F,F,%L,L,NBCO,FRM,ESSAI,TYFRM,FORM2,IRES,NUM,FATALER,NBCO2,GLOCOL,SWI
 S IRES=0,FATALER=0,@GLORES=1
 
 S GLODEF=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QUBKGR"")",NOMSM)
 S GLOCOL=$$CONCAS^%QZCHAD(GLODEF,"C")
 
 S GLOVAL=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QUBKGR"")",NOMSM) K @(GLOVAL)
 S GL=$$CONCAS^%QZCHAD(GLOVAL,"G")
 S FORM=$$CONCAS^%QZCHAD(GLOVAL,"F")
 S FORM2=$$CONCAS^%QZCHAD(GLOVAL,"F2")
 S KEMPLOI=$$CONCAS^%QZCHAD(GLOVAL,"K")
 S CONDIT=$$CONCAS^%QZCHAD(GLOVAL,"C")
 
 S ATTUT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"A"),NUM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"N")
 K @(ATTUT),@(NUM)
 
 S DEFB=@GLODEF@("D")
 S @GL@("L")=$P(DEFB,"^"),@GL@("H")=$P(DEFB,"^",2),@GL@("X")=$P(DEFB,"^",3),@GL@("Y")=$P(DEFB,"^",4),@GL@("TI")=$P(DEFB,"^",5)
 
 
 
 S @NUM=1
 S CO="" F %CO=1:1 S CO=$O(@GLOCOL@(CO)) Q:CO=""  S @NUM@(%CO)=@GLOCOL@(CO) I %CO'=CO S @NUM=0
 S (@GLOVAL@("VNBCOL"),NBCO)=%CO-1
 I NBCO=0 D MES("E","il n'y a pas de colonnes principales !") G FINERR
 I @(NUM)  K @(NUM) G SUITE
 D MES("W","renumerotation des colonnes principales")
 K @(GLOCOL) F %CO=1:1:NBCO S @GLOCOL@(%CO)=@NUM@(%CO)
 K @(NUM)
 
 
SUITE F CO=1:1:NBCO S C(CO)=1 D MKCOL^%QUBKKV2(CO) G:FATALER FINERR
 
 
 
 S @NUM=1
 S CO="" F %CO=1:1 S CO=$O(@GLODEF@("CC",CO)) Q:CO=""  S @NUM@(%CO)=@GLODEF@("CC",CO) I %CO'=CO S @NUM=0
 S (@CONDIT@("NBCOL"),NBCO2,@GLOVAL@("VNBCO2"))=%CO-1
 I NBCO2=0 S @CONDIT@("NBCOND")=0 G SUITE3
 I @(NUM)  K @(NUM) G SUITE2
 D MES("W","renumerotation des colonnes conditionnelles")
 K @GLODEF@("CC") F %CO=1:1:NBCO2 S @GLODEF@("CC",%CO)=@NUM@(%CO)
 K @(NUM)
 
 
SUITE2 S CONDCOUR="",FENCOUR=0
 F CO=1:1:NBCO2 S CFC(CO)=1 D MKCC G:FATALER FINERR
 I FENCOUR'=0 S @CONDIT@("DEF","FEN",FENCOUR,"F")=%CO-1
 S @CONDIT@("NBCOND")=FENCOUR
 S @CONDIT@("DEF","X")=0,@CONDIT@("DEF","Y")=14,@CONDIT@("DEF","L")=78,@CONDIT@("DEF","H")=6,@CONDIT@("DEF","TI")=$$^%QZCHW("informations conditionnelles")
 S @CONDIT@("DEF","UCONT","CTRB")="CTRBCC^%QUBKKU"
 
 
SUITE3 S CO="" F %CO=1:1 S CO=$O(@FORM@(CO)) Q:CO=""  D MKFORM^%QUBKKV2(CO) G:FATALER FINERR
 
 
 S CO="" F %CO=1:1 S CO=$O(@FORM2@(CO)) Q:CO=""  D MKFORM2^%QUBKKV2(CO) G:FATALER FINERR
 
 
 G:@CONDIT@("NBCOND")=0 SUITE4
 S FE="" F %FE=0:0 S FE=$O(@CONDIT@("COND",FE)) Q:FE=""  D MKCOND^%QUBKKV2(FE) G:FATALER FINERR
 
SUITE4 
 S %CO=1,FE="" F %FE=1:1 S FE=$O(@GLODEF@("F",FE)) Q:FE=""  D MKFEN G:FATALER FINERR
 S @GLOVAL@("VNBFEN")=%FE-1
 
 K @(ATTUT)
 Q
 
FINERR K @(GLOVAL),@(ATTUT)
 Q
 
 
 
MKCC G:$P(@GLODEF@("CC",CO),"^")=CONDCOUR MKCC2
 
 S:FENCOUR'=0 @CONDIT@("DEF","FEN",FENCOUR,"F")=CO-1
 S CONDCOUR=$P(@GLODEF@("CC",CO),"^")
 S FENCOUR=FENCOUR+1
 S @CONDIT@("DEF","FEN",FENCOUR,"D")=CO,@CONDIT@("DEF","FEN",FENCOUR,"L")=0,@CONDIT@("COND",FENCOUR)=CONDCOUR
MKCC2 
 S @CONDIT@("DEF","LI",CO,"L")=$P(@GLODEF@("CC",CO),"^",2),@CONDIT@("DEF","LI",CO,"T")=$P(@GLODEF@("CC",CO),"^",5)
 
 S ATTRI=$P(@GLODEF@("CC",CO),"^",3),INDX=$P(@GLODEF@("CC",CO),"^",4)
 S SWI="T"
 
 S @CONDIT@("DEF","LI",CO,"U")=$S(ATTRI="NOM":"NOWAY^%QUBKKU",SWI="T":"UCFCT^%QUBKKU2",SWI="J":"UCFCJ^%QUBKKU2",SWI="C":"UCFCC^%QUBKKU2")
 S:INDX="" INDX=1
 I INDX=1 S @ATTUT@(1000-$L(ATTRI),ATTRI,"CFC("_CO_")")=""
 S @ATTUT@(-(($L(ATTRI)+2)+$L(INDX)),ATTRI_"CFC("_INDX_")","C("_CO_")")=""
 I $P(@GLODEF@("CC",CO),"^",6)'="" S @FORM2@(CO)=$P(@GLODEF@("CC",CO),"^",6)
 Q
 
 
 
MKFEN S @GL@("FEN",%FE,"L")=$P(@GLODEF@("F",FE),"^"),@GL@("FEN",%FE,"D")=%CO,%CO=%CO+$P(@GLODEF@("F",FE),"^",2),@GL@("FEN",%FE,"F")=%CO-1
 I '($D(@GL@("LI",%CO-1))) D MES("E",$$^%QZCHW("Il manque des colonnes pour construire toutes les fenetres")) S FATALER=1 Q
 S CO=@GL@("FEN",%FE,"D")
MKKK I @GL@("LI",CO,"L")>@GL@("FEN",%FE,"L") D MES("E",$$^%QZCHW("La colonne")_" "_CO_" "_$$^%QZCHW("ne rentre pas dans sa fenetre"))
 I CO<@GL@("FEN",%FE,"F") S CO=CO+1 G MKKK
 Q
 
 
MES(NATURE,MESSAGE) 
 S IRES=IRES+1
 I VISU W !,$S(NATURE="W":$$^%QZCHW("warning"),NATURE="E":$$^%QZCHW("erreur"),1:"")," ",$$^%QZCHW(MESSAGE)
 S @GLORES@(IRES)=MESSAGE
 S:NATURE="E" @GLORES=0
 Q

