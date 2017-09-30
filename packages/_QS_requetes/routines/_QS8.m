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

;%QS8^INT^1^59547,73880^0
%QS8 ;
 
 
 
 
DAFF() N REQ
 D ^%QUAPAD($$^%QZCHW("MODIFICATION D'UNE REQUETE"))
 S REQ=$$UN^%QUAPAGM Q:REQ="" 1
 D MODIF(REQ) Q 2
 
MODIF(REQ) 
 
 
 
 
 
 
 N BASE,BID,COMM,CONT,DEJACONT,DEJAVARI,I,II,%I,J,K,L,LVAR,NOLC,NOLV,OK,RQSRESUL,SAVLIS,TETE,UTIL,VAR,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S SAVLIS=$$CONCAS^%QZCHAD(TEMP,"SLIS")
 I '($D(^[QUI]RQS1(REQ,"ACTIVATIONS"))) S ^[QUI]RQS1(REQ,"ACTIVATIONS")=0 G NOSUP
 S I=^[QUI]RQS1(REQ,"ACTIVATIONS") G:I'>0 NOSUP
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Cette requete a deja ete activee ...") H 3
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer les anciennes listes ? : "))=1 G 79
78 S I=-1 F %I=0:0 S I=$N(^[QUI]RQS1(REQ,"ACTIVATIONS",I)) Q:I=-1  S @SAVLIS@(I)=""
 G NOSUP
79 K @(SAVLIS) D POCLEPA^%VVIDEO W $$^%QZCHW("OK ")
 S I=-1 F %I=0:0 S I=$N(^[QUI]RQS1(REQ,"ACTIVATIONS",I)) Q:I=-1  D SUPI2^%QS0SUPP(I) W "."
 K ^[QUI]RQS1(REQ,"ACTIVATIONS") S ^[QUI]RQS1(REQ,"ACTIVATIONS")=0
NOSUP D POCLEPA^%VVIDEO
 D KILL^%ANA($$^%QCAZG("^[QUI]RQS1(REQ,""COMPILATION"")"))
 K ^[QUI]RQS1(REQ,"COMPILATION")
 F I=1:1 Q:'($D(^[QUI]RQS1(REQ,"VARIABLES",I)))  S VAR(I)=^[QUI]RQS1(REQ,"VARIABLES",I),VAR(I,"TETE")=$$RECOP^%ANA(^[QUI]RQS1(REQ,"VARIABLES",I,"TETE"))
 F I=1:1 Q:'($D(^[QUI]RQS1(REQ,"CONTRAINTES",I)))  D CONTRA
 S I=-1 F %I=0:0 S I=$N(^[QUI]RQS1(REQ,"LVAR",I)) Q:I=-1  S LVAR(I)=^[QUI]RQS1(REQ,"LVAR",I)
 S BASE=^[QUI]RQS1(REQ,"BASE")
 S COMM=$S($D(^[QUI]RQS1(REQ,"COMM")):^[QUI]RQS1(REQ,"COMM"),1:"")
 F I=1:1 Q:'($D(CONT(I)))  S TETE=CONT(I,"TETE"),L=$$RED^%ANA(TETE,"VAR") F J=1:1 S K=$P(L,",",J) Q:K=""  S UTIL(K,TETE)=""
 S NOLV=1,NOLC=1,DEJAVARI=$D(VAR),DEJACONT=$D(CONT)
 D ^%QSQUEST(REQ,0)
 S J=0,I=-1
 F %I=0:0 S I=$N(@SAVLIS@(I)) Q:I=-1  S ^[QUI]RQS1(REQ,"ACTIVATIONS",I)="",J=J+1
 S ^[QUI]RQS1(REQ,"ACTIVATIONS")=J
 G:'(OK) FIN
 D ^%QSACTRE(REQ,BASE) Q:RQSRESUL=""
 S ^DERLISTE($I)=RQSRESUL
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Le resultat se trouve dans ")
 D BLD^%VVIDEO W RQSRESUL_" ("_^[QUI]RQS2(RQSRESUL,"CARD")_") "
 D NORM^%VVIDEO W $$^%QZCHW(" ... [RETURN]") R *BID
FIN K @(TEMP)
 Q
 
CONTRA N NXT,OXT,IAT,IIAT
 S CONT(I)=^[QUI]RQS1(REQ,"CONTRAINTES",I),CONT(I,"TETE")=$S($D(^[QUI]RQS1(REQ,"CONTRAINTES",I,"TETE")):$$RECOP^%ANA(^[QUI]RQS1(REQ,"CONTRAINTES",I,"TETE")),1:0)
 S CONT(I,"TABATT")=""
 I '($D(^[QUI]RQS1(REQ,"CONTRAINTES",I,"TABATT"))) Q
 S OXT=^[QUI]RQS1(REQ,"CONTRAINTES",I,"TABATT") Q:OXT=""  Q:'($D(^[QUI]RQSDON("RQS","ATT",OXT)))
 S NXT=$S($D(^[QUI]RQSGLO("RQS","NBATT")):^[QUI]RQSGLO("RQS","NBATT"),1:0)
 S (^[QUI]RQSGLO("RQS","NBATT"),NXT)=NXT+1
 S IAT="" F IIAT=0:0 S IAT=$O(^[QUI]RQSDON("RQS","ATT",OXT,IAT)) Q:IAT=""  S ^[QUI]RQSDON("RQS","ATT",NXT,IAT)=""
 S CONT(I,"TABATT")=NXT
 Q
 
LX D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous exploiter les resultats tout de suite ? :"),"O")=1 G C79
 G FIN
C79 D REQU^%QS0D G FIN
 Q

