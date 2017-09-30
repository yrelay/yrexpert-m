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

;%TLIACT7^INT^1^59547,74029^0
TLIACT7 ;
 
 
 
 
 
HISTO 
 N ATHIST,LAT,IND,NATHIST,ORHIST,INDHIST,REPHIST,POS,OK,REP,INDI
 N VALHIST,TEMPO,IL,NIL,SAVB,SAVO,L,LP,LB,%L,DAT,HEUR,LHIST
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Historique"))
 S ATHIST=$$RED(ACTI,1),ORHIST=$$RED(ATHIST,2),POS=1
 S NATHIST=$$RED($$RED(ATHIST,1),"TEXTE")
 S LAT=$$RED(ACTI,2)
 I '($$OBJET(ATHIST,.REP,.INDI)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver individu sur lequel appliquer l'historique")) Q
 S REPHIST="HISTORIQUE"
 I '($$REP^%QSGEST5(REPHIST)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Repertoire ")_REPHIST_$$^%QZCHW(" inexistant")) Q
 S LHIST=$$LIEN1^%QSGEL2(REP,REPHIST,3)
 I LHIST="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Pas de lien HISTORIQUE a partir du repertoire ")_REPHIST) Q
 S DAT=$$DATE3^%QMDATE,HEUR=$$HEURE^%QMDATE
 S ORHIST=$$SUBST^%ANARBR2(ORHIST,.CXT,"ATT^%TLIACT3",.POS)
 S VALHIST=$$^%QSCALIN(REP,INDI,NATHIST,ORHIST)
 D ATT^%TLIACT3(NATHIST,VALHIST)
 Q:VALHIST=""
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HISTOR")
 K @(TEMPO)
 S:ORHIST="" ORHIST=1
 S @TEMPO@(NATHIST,ORHIST)=VALHIST
 S @TEMPO@("DATE.PEREMPTION",1)=DAT
 S @TEMPO@("HEURE.PEREMPTION",1)=HEUR
 G:LAT=0 HISTO2
 S SAVO=CXT("@","OBJET"),SAVB=CXT("@","BASE")
 F IL=2:1 S NIL=$$RED(ACTI,IL) Q:NIL=0  D LECAT
 G:MODEX=1 FINHISTO
HISTO2 S NATHIST=DAT_" "_HEUR_"'"_($P($H,",",2)#60)_" "_NATHIST
 S AT=-1
 F %AT=0:0 S AT=$N(@TEMPO@(AT)) Q:AT=-1  S OR=-1 F %OR=0:0 S OR=$N(@TEMPO@(AT,OR)) Q:OR=-1  S L=@TEMPO@(AT,OR) D AFFAT^%TLIACTS(REPHIST,NATHIST,AT,L,OR)
 D ADDS^%QSGEST3(REP,INDI,LHIST,REPHIST,NATHIST)
FINHISTO K @(TEMPO)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin de l'historique"))
 Q
 
LECAT N NOMA,INDA,VALA,POS
 S NOMA=$$RED($$RED(NIL,1),"TEXTE")
 I $E(NOMA)="%" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit sauvegarder des variables temporaires")) Q
 I NOMA=$$^%QZCHW("NOM") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit utiliser attribut NOM")) Q
 I $$TYPE^%QSGEST9(REPHIST,NOMA)'=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit utiliser attribut lien")) Q
 S INDA=$$RED(NIL,2) I INDA=0 S INDA=1 G LECAT2
 S POS=1,INDA=$$SUBST^%ANARBR2(INDA,.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(INDA="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer l'indice")) Q
LECAT2 S POS=1,VALA=$$SUBST^%ANARBR2(NIL,.CXT,"ATT^%TLIACT3",.POS)
 Q:(VALA="")!(POS=0)
 S NOMA=$$RED($$RED(NIL,1),"TEXTE")
 S @TEMPO@(NOMA,INDA)=VALA Q
 
OBJET(IND,REP,INDI) N REPL,OB,BA
 S INDI=$$RED($$RED(IND,1),"TEXTE")
 Q:$E(INDI)="%" 0
 S OB=$$RED(IND,3)
 G:OB'=0 SOBJ1
 S REP=CXT("@","BASE"),INDI=CXT("@","OBJET") Q 1
SOBJ1 S OB=$$RED(OB,"TEXTE")
 G:$E(OB)'="%" SOBJ
 S REP=$$^%QCAZG("CXT(OB,""BASE"")"),INDI=$$^%QCAZG("CXT(OB,""OBJET"")")
 Q:(REP="")!(INDI="") 0
 Q 1
SOBJ S REP=$$REPD^%QSGEL2(CXT("@","BASE"),OB)
 S INDI=$$OBJPROX^%QSCALVU(OB,CXT("@","BASE"),CXT("@","OBJET"))
 Q:(INDI="")!(REP="") 0
 Q 1
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

