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

;%TLBAVEA^INT^1^59547,74028^0
%TLBAVEA ;;05:43 PM  23 Apr 1993; ; 28 Apr 93 10:34 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ATTR(NOEUD,DEFINDX,ATT,IND,VAR,REP) N TYP,A1
 
 I $$RED(NOEUD,"TYPE")'="VARIABLE" G ATTR2
 S ATT=$$RED(NOEUD,"TEXTE"),IND=DEFINDX,REP=CXT("%","BASE"),VAR=CXT("%","OBJET") Q 1
 
 
ATTR2 
 S ATT=$$RED($$RED(NOEUD,1),"TEXTE") G:$E(ATT)'="%" ATTR22
 
 S REP=CXT("%","BASE"),VAR=CXT("%","OBJET")
 S A1=$$RED(NOEUD,2) I A1=0 S IND=DEFINDX Q 1
 S IND=$$SUBST^%ANARBR2(A1,.CXT,"ATT^%TLIACT3",.POS)
 I (IND="")!(POS=0) Q 0
 Q 1
 
ATTR22 
 S A1=$$RED(NOEUD,2) I (A1=0)!(A1="") S IND=DEFINDX G VAR
 S IND=$$SUBST^%ANARBR2(A1,.CXT,"ATT^%TLIACT3",.POS)
 I (IND="")!(POS=0) Q 0
VAR S VAR=$$RED(NOEUD,3) I VAR=0 S VAR=CXT("@","OBJET"),REP=CXT("@","BASE") G FIN
 S VAR=$$RED(VAR,"TEXTE")
 G:$E(VAR)="%" FILS
 G:VAR'="LISTE" PROX
 S REP="L0",VAR=$$^%QCAZG("LISTE")
 I VAR="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Aucune liste diponible")) Q 0
 G FIN
PROX N VAR2
 S VAR2=VAR,REP=$$REPD^%QSGEL2(CXT("@","BASE"),VAR),VAR=$$OBJPROX^%QSCALVU(VAR,CXT("@","BASE"),CXT("@","OBJET"))
 I VAR="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver individu du repertoire ")_VAR2) Q 0
 G FIN
FILS I ('($D(CXT(VAR,"BASE"))))!('($D(CXT(VAR,"OBJET")))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer variable ")_VAR) Q 0
 S REP=CXT(VAR,"BASE"),VAR=CXT(VAR,"OBJET")
FIN Q 1
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

