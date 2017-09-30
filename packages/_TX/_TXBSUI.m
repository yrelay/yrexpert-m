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

;%TXBSUI^INT^1^59547,74031^0
%TXBSUI ;;04:21 PM  5 Oct 1993; ; 26 Mar 93  4:18 PM
 
 
 
SUIVA(ART) Q $$NXTRI^%QSTRUC8("ARTICLE",ART)
 
 
SUIVAF(ART,FRN) Q $$NXTRIAO^%QSTRUC8("FOURNISSEUR",FRN,"PEUT.LIVRER",ART)
 
 
 
 
SUIVF(FRN) Q $$NXTRI^%QSTRUC8("FOURNISSEUR",FRN)
 
SUIVFA(FRN,ART) Q $$NXTRIAO^%QSTRUC8("ARTICLE",ART,"FOURNISSEUR.POSSIBLE",FRN)
 
SUIVFC(FRN,CONTR) 
 N FRX,TAB
 S FRX=$$^%QSCALVA("CONTRAT",CONTR,"FOURNISSEUR.RETENU")
 S TAB(FRX)=""
 Q $O(TAB(FRN))
 
SUIVFM(FRN,COMM) 
 Q $$SUIVFC(FRN,$P(COMM,",",1,2))
 
SUIVFL(FRN,LIVR) 
 Q $$SUIVFC(FRN,$P(LIVR,",",1,2))
 
 
 
 
SUIVC(CONTR) Q $$NXTRI^%QSTRUC8("CONTRAT",CONTR)
 
SUIVCA(CONTR,ART) 
 N NOM S NOM=$P(CONTR,",",2)
 S NOM=$$NXTRIAO^%QSTRUC8("ARTICLE",ART,"CONTRAT.ETABLI",NOM)
 Q:NOM="" "" Q ART_","_NOM
 
SUIVCF(CONTR,FRN) Q $$NXTRIAO^%QSTRUC8("FOURNISSEUR",FRN,"CONTRACTANT",CONTR)
 
SUIVCAF(CONTR,ART,FRN) N C1,C2
 S C1=CONTR
SVCAF2 S C1=$$NXTRI^%QSTRUC8("CONTRAT",C1) Q:C1="" ""
 G:'($$VAIR^%QSGE5("CONTRAT",C1,"ARTICLE.CONCERNE",ART)) SVCAF2
 G:'($$VAIR^%QSGE5("CONTRAT",C1,"FOURNISSEUR.RETENU",FRN)) SVCAF2
 Q C1
 
 
 
 
SUIVM(COMM) Q $$NXTRI^%QSTRUC8("COMMANDE",COMM)
 
 
SUIVMC(COMM,CNTRA) 
 N NOM S NOM=$P(COMM,",",3)
 S NOM=$$NXTRIAO^%QSTRUC8("CONTRAT",CNTRA,"COMMANDE.DU.CONTRAT",NOM)
 Q:NOM="" "" Q CNTRA_","_NOM
 
 
SUIVMF(COMM,FRN) 
 N C1

