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

;%TLBALIS^INT^1^59547,74028^0
TLBALIS ;
 
INILIS() 
 N ADR,CARD,IND,NUM,TRI
 I MODEX=3 S REP=@GLOETD@(NIVEAU,"REPERTOIRE.INTERNE") G INPAR
 I '($$EXISTE^%TLINTER(TRT)) Q 1
 I '($$EX^%QS0(LISTE)) Q 1
 S REP=$$^%QSCALVA("L0",LISTE,"BASE") I REP="" Q 1
 S @GLOETD@(NIVEAU,"REPERTOIRE.INTERNE")=REP
 S @GLOETD@(NIVEAU,"REPERTOIRE.LOGIQUE")=$$NOMLOG^%QSF(REP)
 
 S ADR=$$^%QSCALVA("L0",LISTE,"ADRESSE") I ADR="" Q 1
 S TRI=$S($$^%QSCALVA("L0",LISTE,"TRIABLE")="OUI":1,1:0)
 S ADR=$S(TRI:$$ADRLT^%QSGEST7(LISTE),1:ADR)
 S CARD=0,(NUM,IND)=""
RECIND 
 I SIND=1 S IND=$O(INDIV(IND)) G REC2
 
 I TRI=0 S IND=$O(@ADR@(IND)) G REC2
 
 S NUM=$O(@ADR@(NUM)) I NUM="" G CCARD
 S IND=@ADR@(NUM)
REC2 I IND'="" S CARD=CARD+1,@GLOETD@(NIVEAU,"INDIVIDUS",CARD)=IND G RECIND
 
CCARD I CARD=0 Q 1
 S @GLOETD@(NIVEAU,"CARDINAL")=CARD
INPAR 
 
 
 S CXT("@","BASE")=REP
 I MODEX=3 Q 0
 S @GLOETD@(NIVEAU,"INDIVIDUS.TRAITES")=0
 S @GLOETD@(NIVEAU,"INDIVIDU.COURANT")=0
 Q 0
 
 
NEXT() 
 N ILIS,NBT,CARD
 I (ABANDON=2)!(ABANDON=3) Q 1
 I ABANDON=1 S @GLOETD@(NIVEAU,"INDIVIDU.COURANT")=@GLOETD@(NIVEAU,"CARDINAL")+1 Q 1
 I MODEX'=3 G BCLNEX
 S ILIS=@GLOETD@(NIVEAU,"INDIVIDU.COURANT")
 I ILIS>@GLOETD@(NIVEAU,"CARDINAL") S CXT("@","OBJET")=@GLOETD@(NIVEAU,"INDIVIDUS",$S($D(@GLOETD@(NIVEAU,"DERNIER.INDIVIDU.TRAITE")):@GLOETD@(NIVEAU,"DERNIER.INDIVIDU.TRAITE"),1:1)) Q 1
 S IND=@GLOETD@(NIVEAU,"INDIVIDUS",ILIS)
 G INCXT
BCLNEX 
 S ILIS=@GLOETD@(NIVEAU,"INDIVIDU.COURANT")+1
 S @GLOETD@(NIVEAU,"INDIVIDU.COURANT")=ILIS
 I ABANDON!(ILIS>@GLOETD@(NIVEAU,"CARDINAL")) Q 1
 
 S IND=@GLOETD@(NIVEAU,"INDIVIDUS",ILIS)
 
 I MODAF=2 D POINTER^%TLBAGF1("LIS",ILIS),ADD^%TLIFEN("LOG","** "_$$^%QZCHW("ind. courant")_" : "_IND_", "_$$^%QZCHW("rep.")_" : "_@GLOETD@(NIVEAU,"REPERTOIRE.LOGIQUE"))
 I '($$IR^%QSGEST5(CXT("@","BASE"),IND)) D:MODAF'=0 ADD^%TLIFEN("ATT",$$^%QZCHW("individu inconnu")) G BCLNEX
 
 S @GLOETD@(NIVEAU,"DERNIER.INDIVIDU.TRAITE")=ILIS
 S NBT=@GLOETD@(NIVEAU,"INDIVIDUS.TRAITES")+1,@GLOETD@(NIVEAU,"INDIVIDUS.TRAITES")=NBT
INCXT 
 S CXT("@","OBJET")=IND
 I MODAF=0 S CARD=@GLOETD@(NIVEAU,"CARDINAL") D INDBAS^%TLIACT3
 Q 0
 
 
FINLIS 
 
 Q
REINIT 
 S @GLOETD@(NIVEAU,"INDIVIDU.COURANT")=0
 S @GLOETD@(NIVEAU,"INDIVIDUS.TRAITES")=0
 Q

