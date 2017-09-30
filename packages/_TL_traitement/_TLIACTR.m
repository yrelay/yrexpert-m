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

;%TLIACTR^INT^1^59547,74029^0
%TLIACTR ;
 
 
 
 
FEX N CH,FONC,I,LVAR,NACT,NPAR,POSS
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Appel d'une fonction externe"))
 S POSS=1,FONC=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(FONC="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom fonction externe")) S ECHEC=1 Q
 I '($D(^TTLEXTER(FONC))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fonction externe inconnue")) S ECHEC=1 Q
 S CH=^TTLEXTER(FONC)
 S NACT=$P(CH,"|",1),NPAR=$P(CH,"|",2)
 I $$RED(ACTI,NPAR+1)=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nombre de parametres incorrect")) S ECHEC=1 Q
 S POSS=1 F I=1:1:NPAR D TVAL Q:'(POSS)
 I '(POSS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer parametre")_" "_I) S ECHEC=1 Q
 D @(NACT_$S(NPAR=0:"",1:"("_$$PARAM_")"))
 D:MODAF REAFF^%TLUTIL,ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation terminee"))
 Q
TVAL S LVAR(I)=$$SUBST^%ANARBR2($$RED(ACTI,I+1),.CXT,"ATT^%TLIACT3",.POSS) Q
PARAM() N I,J,R
 S R="",S=""
 F I=1:1:NPAR S J=LVAR(I),J=$S(J="":"""""",J?.N:J,1:""""_$$ZSUBST^%QZCHSUB(J,"""","""""")_""""),R=R_I_",",S=S_J_","
 Q $E(S,1,$L(S)-1)
 
TRASAI 
 N SAI,CONT,TRTSA,ACTRT,STO,IMP,CONTN,ACTRTN,STON,IMPN,GLOSA,GRP
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Transfert de valeurs depuis une Saisie"))
 S CONT=0,TRTSA="",ACTRT=0,STO=1,IMP=1
 S POSS=1,SAI=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(SAI="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom Saisie")) S ECHEC=1 Q
 S GLOSA=$$ADR^%SRCOMP(SAI)
 I '($D(@GLOSA)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Saisie inexistante ou non validee")) S ECHEC=1 Q
 
 S CONTN=$$RED(ACTI,2)
 G:CONTN=0 TRSA1
 S CONT=$$SUBST^%ANARBR2(CONTN,.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(CONT="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer val. controles")) S ECHEC=1 Q
 S CONT=$S(CONT="O":1,CONT="N":0,1:"")
 I CONT="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Controles : ""O"" ou ""N"" uniquement")) S ECHEC=1 Q
TRSA1 S ACTRTN=$$RED(ACTI,3)
 G:ACTRTN=0 TRSA2
 S ACTRT=$$SUBST^%ANARBR2(ACTRTN,.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(ACTRT="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer contr. avec traitement")) S ECHEC=1 Q
 S ACTRT=$S(ACTRT="O":1,ACTRT="N":0,1:"")
 I ACTRT="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Controles par trait : ""O"" ou ""N"" uniquement")) S ECHEC=1 Q
 G:'(ACTRT) TRSA2
 
 S TRTSA=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(TRTSA="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom traitement")) S ECHEC=1 Q
 I '($$EXISTE^%TLINTER(TRTSA)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Traitement inconnu")) S ECHEC=1 Q
 
TRSA2 S STON=$$RED(ACTI,5)
 G:STON=0 TRSA3
 S STO=$$SUBST^%ANARBR2(STON,.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(STO="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer val. stockage")) S ECHEC=1 Q
 S STO=$S(STO="O":1,STO="N":0,1:"")
 I CONT="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Stockage : ""O"" ou ""N"" uniquement")) S ECHEC=1 Q
 
TRSA3 S IMPN=$$RED(ACTI,6)
 G:IMPN=0 TRAC
 S IMP=$$SUBST^%ANARBR2(IMPN,.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(IMP="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer val. impression")) S ECHEC=1 Q
 S IMP=$S(IMP="O":1,IMP="N":0,1:"")
 I IMP="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impression : ""O"" ou ""N"" uniquement")) S ECHEC=1 Q
 
TRAC D EXTERNE^%SRBATCH(SAI,CONT,STO,ACTRT,TRTSA,.GRP)
 D:IMP ^%SRTRIMP(SAI,GRP)
 Q
 
 
CRSAIS 
 N SAI,VAL,CPT,NOEUD,GLOSA,MES
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Creation d'un groupe de valeurs pour une Saisie"))
 S POSS=1,SAI=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(SAI="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom Saisie")) S ECHEC=1 Q
 
 S CPT=1
BCRSA S NOEUD=$$RED(ACTI,CPT+1)
 G:NOEUD=0 CRSAACT
 S VAL(CPT)=$$SUBST^%ANARBR2(NOEUD,.CXT,"ATT^%TLIACT3",.POSS)
 I '(POSS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer champ")_" "_CPT) S ECHEC=1 Q
 S CPT=CPT+1
 G BCRSA
 
CRSAACT 
 I '($$CREER^%SRTRANS(SAI,.VAL,MODAF'=0,.MES)) D:MODAF ADD^%TLIFEN("LOG","  "_MES) S ECHEC=1 Q
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

