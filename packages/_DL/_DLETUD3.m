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

;%DLETUD3^INT^1^59547,73867^0
DLETUD3 ;
 
 
 
 
 
 
 
 
VERIF(NOM,L,NL,MOD,SENS,LIM,CAPA,TRT,DEC,TYPDEC,COCONT,MAXITER) 
 
 N MSG,TYPD
 S MSG=""
 I (MOD'="REEL")&(MOD'="SIMULATION") Q $$^%QZCHW("Mode d'evaluation incorrect")
 I (SENS'="AVAL")&(SENS'="AMONT") Q $$^%QZCHW("Sens de jalonnement incorrect")
 I TRT'=1 S LIM=$$INTF^%QMDAUC($$REP^%DLETUDE,"DATE.LIMITE.DEBUT",LIM) I LIM="" Q $$^%QZCHW("Date limite incorrecte")
 I (CAPA'="OUI")&(CAPA'="NON") Q $$^%QZCHW("Indicateur de respect des capacites machines incorrect")
 I '($$EX^%QSGEST7(NL)) S NL=""
 D RECUP(NOM,.L,.NL,.MSG,TRT) I MSG'="" Q MSG
 I L'="",$$^%QSCALVA($$LAN^%DLCON2,L,$$LIEN1^%QSGEL2($$LAN^%DLCON2,$$ART^%DLCON2,3))="" S MSG=$$RLAN^%DLCON2_" "_$$^%QZCHW("non relie a un")_" "_$$RART^%DLCON2 Q MSG
 I $$EXETU^%DLANCUC(NOM,L,TRT)=1 S MSG=" " Q MSG
 
 I TRT=0 Q MSG
 
 
 S MSG=$$VERDEC^%DLPARAM(.DEC)
 I DEC="NON" S (TYPDEC,COCONT,MAXITER)="" Q MSG
 
 S TYPD=^[QUI]RQSGLO("JALON","APP","TYPDEC")
 
 I TYPDEC="" S TYPDEC=$$DEF^%DLETUC(TYPD) G PAR
 D PARTIE^%DLPARAM(TYPDEC,TYPD,.TYPDEC,.MSG)
 I MSG'="" S (COCONT,MAXITER)="" Q MSG
PAR I TYPDEC="C" S MAXITER=""
 I TYPDEC="R" S COCONT=""
 
 I COCONT'="" S MSG=$$VERCOEF^%DLPARAM(COCONT) I MSG'="" Q MSG
 
 I MAXITER'="" S MSG=$$VERITER^%DLPARAM(MAXITER)
 Q MSG
 
 
RECUP(NOM,L,NL,MSG,TRT) 
 S MSG=""
 I (L="")&(NL="") S MSG=$$^%QZCHW("Vous devez definir soit une liste de lancements, soit un lancement") Q
 I NL="" G CRLI
 
 I $$BASE^%QSGEST7(NL)'=$$LAN^%DLCON2 S MSG=$$^%QZCHW("La liste")_" "_NL_" "_$$^%QZCHW("ne contient pas des")_" "_$$RLAN^%DLCON2 Q
 
 I $$CARD^%QSGEST7(NL)>1 S L="" Q
 I L="" S A=$$ADRLIS^%QSGEST7(NL),L=$O(@A@("")) Q
 
 I $$EXI^%QSGES11(NL,L)=0 S MSG=$$RLAN^%DLCON2_" "_L_" "_$$^%QZCHW("n'appartient pas a la liste")_" "_NL Q
 Q
CRLI 
 S NL=$$NOM^%QSGES11("JLX")
 D MSG^%VZEATT($$^%QZCHW("Creation de la liste")_" "_NL)
 D CRETYP^%QSGES11($$LAN^%DLCON2,NL,"JLX",0,"JALONNEMENT",$$STO^%QSGES11(NL),$$^%QZCHW("LISTE.DE.LANCEMENTS.")_" "_NOM,"INDIVIDU",$$STOTRI^%QSGES11)
 D STOCK^%QSGES11(NL,L),CARDL^%QSGES11(NL,1)
 I TRT D:MODEX=2 STIND^%TLBAATT("L0",NL,"","","AJOUT")
 Q
 
 
HELP(YY1) 
 N TEMP,LETU,NL,ETU,COL,CARD
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HELP") K @(TEMP)
 S COL=$$CONCAS^%QZCHAD(TEMP,"COL")
 S LETU=$$CONCAS^%QZCHAD(TEMP,"LETU")
 S ETU=$$REP^%DLETUDE
 
 D ^%VZEATT
 D ^%QSGES13(ETU,"TYPE.ETUDE","JALONNEMENT",1,LETU)
 S NL=$$NOM^%QSGES11("TMP")
 D COPY^%QSGES11(NL,ETU,.CARD,LETU)
 D CREER^%QSGES11(ETU,NL,"TMP",CARD,"SELJLX","","")
 
 D COL
 D INIT^%QUAPAGM(COL),AFF
 
 S YY1=$$UN^%QUAPAGM
 D END^%QUAPAGM
 D DEL^%QSGES11(NL)
 K @(TEMP)
 I YY1="" Q 0
 Q 1
COL 
 N GL
 S @COL@("X")=0,@COL@("Y")=3,@COL@("L")=79,@COL@("H")=20
 
 S @COL@("LIS")=NL,@COL@("B")=ETU,@COL@("A")=$$ADRLIS^%QSGEST7(NL)
 S @COL@("ATT")=1,@COL@("LR")=13
 S @COL@("AFF")="AFF2^%DLETUD3",@COL@("ECRAN")="AFF^%DLETUD3",@COL@("PADLINE")="POCLEPA^%VVIDEO"
 
 S GL=$$CONCAS^%QZCHAD(COL,"C")
 S @GL@(1,"T")=$$^%QZCHW("Lancement"),@GL@(1,"L")=15,@GL@(1,"C")="LANCEMENT"
 S @GL@(2,"T")=$$^%QZCHW("Liste.lancements"),@GL@(2,"L")=15,@GL@(2,"C")="LISTE.LANCEMENTS"
 S @GL@(3,"T")=$$^%QZCHW("Commentaire"),@GL@(3,"L")=15,@GL@(3,"C")="COMMENTAIRE"
 S @GL@(4,"T")=$$^%QZCHW("Mode.evaluation"),@GL@(4,"L")=12,@GL@(4,"C")="MODE.EVALUATION"
 S @GL@(5,"T")=$$^%QZCHW("Sens.jalonnement"),@GL@(5,"L")=10,@GL@(5,"C")="SENS.JALONNEMENT"
 S @GL@(6,"T")=$$^%QZCHW("Date.limite"),@GL@(6,"L")=10,@GL@(6,"FCT")="$$DAT^%DLETUD3",@GL@(6,"C")="DATE.LIMITE.DEBUT"
 S @GL@(7,"T")=$$^%QZCHW("Respect.capa"),@GL@(7,"L")=10,@GL@(7,"C")="RESPECT.CAPACITES.MACHINES"
 Q
 
AFF 
 D CLEPAG^%VVIDEO,AFF2,AFFICH^%QUAPAGM Q
AFF2 
 D ^%VZCD(0,39,0,2,1,0,NL_" ("_CARD_" "_$$NOMLOG^%QSF(ETU)_"s)") Q
 
DAT(VT1,V,C) 
 N D,R
 S R=$$REP^%DLETUDE
 S D=$$^%QSCALVA(R,V,C)
 Q $$AFFI^%QMDAUC(R,C,D)

