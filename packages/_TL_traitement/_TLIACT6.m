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

;%TLIACT6^INT^1^59547,74029^0
TLIACT6 ;
 
 
 
 
 
 
DEPOU 
 N NO,ATT,IND2,REP2,VA,MOD
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Depouillement individu en cours"))
 S MOD=$$RED($$RED(ACTI,1),"TEXTE")
 I (MOD'=0)&(MOD'=1) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Mode egal a 0 ou a 1")) Q
 G:$$RED(ACTI,2)=0 SELI
 S VA=$$RED($$RED(ACTI,2),"TEXTE"),IND2=$$^%QCAZG("CXT(VA,""OBJET"")"),REP2=$$^%QCAZG("CXT(VA,""BASE"")")
 I IND2="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer variable ")_VA) Q
 I REP2="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver repertoire de variable ")_VA) Q
 I (REP2="L0")!(REP2="RQS") Q
 D:MODEX'=1 DEP(REP2,IND2,MOD) G FINELI
SELI I (REP="L0")!(REP="RQS") Q
 D:MODEX'=1 DEP(REP,IND,MOD)
FINELI D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Individu depouille"))
 Q
 
DEP(BASE,IND,MODE) 
 N I,ATT,TYPE
 S ATT="" F I=0:0 S ATT=$$NXTRIA^%QSTRUC8(BASE,IND,ATT) Q:ATT=""  D DEP1
 Q
DEP1 I ATT="NOM" Q
 S TYPE=$$TYPE^%QSGEST9(BASE,ATT)
 I (TYPE=3)!(TYPE=1) Q
 I TYPE=2 D:MODE KFILS(BASE,IND,ATT) Q
 I TYPE'=0 Q
 D PSV^%QSGESTI(BASE,IND,ATT)
 Q
KFILS(BASE,IND,ATT) 
 N BASEF,NOMFI
 S BASEF=$$NOMINT^%QSF(ATT) I BASEF="" Q
 S NOMFI=$$NOMEX^%QSGES10(BASEF,$$^%QSCALVA(BASE,IND,ATT))
 I NOMFI="" Q
 D SX^%QSGESTK(BASEF,NOMFI)
 Q
 
 
TRIER 
 N LIST,R,I,ATTRIB,POS,ATT,ORD,NATT,RES
 S POS=1
 S LIST=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (LIST="")!('(POS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inexistante")) Q
 I '($$IR^%QSGEST5("L0",LIST)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inexistante")) Q
 S RES=1 F I=1:1 Q:'($D(^[QUI]ANSA(ACTI,2*I)))  S RES=$$RATT Q:'(RES)
 I '(RES) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer attributs de tri")) Q
 S R=$$TRIERT^%QS0TRIE(LIST,.ATTRIB)
 I MODAF=1 D REAF^%TLIFEN,IND^%TLIACT3,REAF^%QUPILF("ATT"),REAF^%QUPILF("ACT"),REAF^%QUPILF("LOG")
 I MODAF=2 D REAF^%TLBAIF(0)
 Q
RATT() 
 N INDX,LIE,NINDX,NLIE
 S NATT=$$RED($$RED(ACTI,(2*I)+1),1) I (NATT=0)!(NATT="") Q 0
 S ATT=$$RED(NATT,"TEXTE") I (NATT=0)!(NATT="") Q 0
 S POS=1,ORD=$$SUBST^%ANARBR2($$RED(ACTI,2*I),.CXT,"ATT^%TLIACT3",.POS) Q:'(POS) 0
 S INDX=1
 S NINDX=$$RED($$RED(ACTI,(2*I)+1),2)
 I (NINDX'=0)&(NINDX'="") S INDX=$$RED(NINDX,"TEXTE")
 S LIE=""
 S NLIE=$$RED($$RED(ACTI,(2*I)+1),3)
 I (NLIE'=0)&(NLIE'="") S LIE=$$RED(NLIE,"TEXTE")
 S ATTRIB(I)=ATT_"^"_ORD_"^"_INDX_"^"_LIE
 Q 1
 
 
INDIV N VT,RP,OBJ
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Creation individu intermediaire"))
 S VT=$$RED($$RED(ACTI,1),"TEXTE")
 I VT="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom variable temporaire")) S ECHEC=1 Q
 S RP=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(RP="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom repertoire")) S ECHEC=1 Q
 S RP=$$NOMINT^%QSF(RP)
 I RP="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Repertoire inexistant")) S ECHEC=1 Q
 S OBJ=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(RP="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom objet")) S ECHEC=1 Q
 I $L(OBJ,",")'=^[QUI]RQSNCLES(RP) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nom individu mal forme")) S ECHEC=1 Q
 I '($$IR^%QSGE5(RP,OBJ)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("  Individu inexistant")) S ECHEC=1 Q
 K CXT(VT)
 D PSO^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VT,1)
 S CXT(VT,"BASE")=RP,CXT(VT,"OBJET")=OBJ
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VT,OBJ,1)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Creation terminee"))
 Q
 
 
IMPRIM 
 N ETAT,IMP,POSS,LIS,TYP
 S POSS=1,ETAT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (ETAT="")!(POSS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Imposs evaluer nom ETAT")) S ECHEC=1 Q
 I '($D(^[QUI]QSETAT(ETAT))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Etat inexistant")) S ECHEC=1 Q
 S LIS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POSS)
 I POSS'=1 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la liste")) S ECHEC=1 Q
 I '($$EX^%QSGEST7(LIS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inexistante")) S ECHEC=1 Q
 S TYP=$$RED($$RED(ACTI,3),"TEXTE")
 I TYP="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Type de l'etat inexistant")) S ECHEC=1 Q
 S IMP=$$RED($$RED(ACTI,4),"TEXTE")
 I IMP="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Type d'impression inexistant")) S ECHEC=1 Q
 D:TYP="E" IMP^%QSETIMP(ETAT,LIS,1,0,1,IMP)
 D:TYP="T" IMP^%QSETTAB(ETAT,LIS,1,1,IMP)
 Q
 
 
IMPRL 
 N LIS,ATR,POSS,PCH,LILA,OA
 S POSS=1,LIS=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I POSS'=1 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom liste")) Q
 I '($$EX^%QSGEST7(LIS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inexistante")) Q
 S ATR=0
 S PCH=$$RED(ACTI,2) I PCH=0 S LILA="" G FIMP
 
 S LILA=$$SUBST^%ANARBR2(PCH,.CXT,"ATT^%TLIACT3",.POSS)
 I POSS'=1 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer liste attributs")) Q
 S OA=$P(LILA,"(",2) I OA'="" S OA=$P(OA,")")
 I $$LEX^%LXSTOCK($$GETLBLAN^%VTLBLAN($P(LILA,"(")),.PCH)=1 S ATR=1,LILA=PCH_$S(OA="":"",1:" ("_OA_")") G FIMP
 I '($$EX^%QMLILA(LILA)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Liste d'attributs inconnue")) Q
FIMP 
 D EXT^%QS0LEC2(LIS,LILA,ATR,"ceux de la liste")
 Q
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

