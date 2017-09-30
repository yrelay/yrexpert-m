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

;LKYG2^INT^1^59547,74868^0
LKYG2 ;
 
 
 
 
 
 
 
 
INDLI S LL2=$P(LL,"LIEN.",2)
 G:'($D(@LTRANS@(L,OB,REF,LL2))) BREFL^LKYGO
 S OBD=""
BOBD S OBD=$O(@LTRANS@(L,OB,REF,LL2,OBD))
 G:OBD="" FLI^LKYGO
 S RRREF=""
BRREF S RRREF=$O(@LTRANS@(L,OB,REF,LL2,OBD,RRREF))
 G:RRREF="" BOBD
 S IND=@LREFOBJ@(RRREF)
 S REPFILS=@LREFOBJ@(RRREF,"REP")
 S IND2=$$REFLIEN^%QSGES21(OB,LL2,IND)
 G:IND2="" BRREF
 S RREF=RRREF_"~"_I
 S @LREFOBJ@(RREF)=IND2
 S @LREFOBJ@(RREF,"REP")="LIEN.I"
 S @LREFOBJ@(RREF,"CH")=$O(@LLIEN@(LL,""))
 S @LATRAIT@(@LREFOBJ@(RREF,"CH"),RREF)=""
 S @LTRANS@(L,OB,REF)=""
 S @LTRANS@(L_"~"_LL2,IND,REF,LL,IND2,RREF)=""
 S I=I+1
 G BRREF
 
 
 
INDLI2 S LL2=$P(LL,"INVERSE.",2)
 S REPD=$$REPD^%QSGEL2($$LIENI^%QSGEL3,"SOURCE."_LL2)
 G:REPD="" FLI^LKYGO
 S TYPE=$$TYPE^%QSGEST9(REPD,LL2)
 
 S LLI=$$LIENI^%QSGEL2(REPD,REPI,LL2,TYPE)
 G:LLI="" FLI^LKYGO
 G:'($D(@LTRANS@(L,OB,REF,LLI))) BREFL^LKYGO
 S OBD=""
BOBD2 S OBD=$O(@LTRANS@(L,OB,REF,LLI,OBD))
 G:OBD="" FLI^LKYGO
 S RRREF=""
BRREF2 S RRREF=$O(@LTRANS@(L,OB,REF,LLI,OBD,RRREF))
 G:RRREF="" BOBD2
 S IND=@LREFOBJ@(RRREF)
 S REPFILS=@LREFOBJ@(RRREF,"REP")
 S IND2=$$REFLIEN^%QSGES21(IND,LL2,OB)
 G:IND2="" BRREF2
 S RREF=RRREF_"~"_I
 S @LREFOBJ@(RREF)=IND2
 S @LREFOBJ@(RREF,"REP")="LIEN.I"
 S @LREFOBJ@(RREF,"CH")=$O(@LLIEN@(LL,""))
 S @LATRAIT@(@LREFOBJ@(RREF,"CH"),RREF)=""
 S @LTRANS@(L,OB,REF)=""
 S @LTRANS@(L_"~"_LLI,IND,REF,LL,IND2,RREF)=""
 S I=I+1
 G BRREF2
 
INVL(REPI,LIEN) 
 N LL2,REPD
 S LL2=$P(LIEN,"INVERSE.",2)
 S REPD=$$REPD^%QSGEL2($$LIENI^%QSGEL3,"SOURCE."_LL2)
 Q:REPD="" ""
 S TYPE=$$TYPE^%QSGEST9(REPD,LL2)
 S LL2=$$LIENI^%QSGEL2(REPD,REPI,LL2,TYPE)
 Q LL2
 ;

