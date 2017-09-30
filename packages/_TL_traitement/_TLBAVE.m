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

;%TLBAVE^INT^1^59547,74028^0
%TLBAVE() ;;11:27 AM  28 Oct 1993; 23 Apr 93 10:40 AM ; 28 Oct 93 11:36 AM
 
 
 
 
 
 
 
 
 
EXEC 
 N V,L,IDEB,QUIT,POS,VAL,VAR1,VAR2,VAR3,VAR4,ADROU
 
 I '($D(^%RQSGLO("MOTEUR","TRT","VERBE",NOM,"ADRESSE.DE.LA.ROUTINE",1))) Q 0
 S ADROU=^%RQSGLO("MOTEUR","TRT","VERBE",NOM,"ADRESSE.DE.LA.ROUTINE",1)
 Q:ADROU="COMPILATION.SPECIFIQUE" 0
 S PARCO("TRT")=TRT
 S IPAR="",IDEB=1,QUIT=0
 F IPAR=1:1 Q:'($D(^[QUI]ANSA(ACTI,IPAR)))  D TRTND(IPAR,^[QUI]ANSA(ACTI,IPAR)) Q:QUIT
 I QUIT S ECHEC=1 Q 1
 
 I MODAF,$D(^%RQSGLO("MOTEUR","TRT","VERBE",NOM,"TEXTE.PROLOGUE",1)) D ADD^%TLIFEN("LOG",$$^%QZCHW(^%RQSGLO("MOTEUR","TRT","VERBE",NOM,"TEXTE.PROLOGUE",1)))
 S @("RES="_ADROU_"(1,"_(IDEB-1)_")")
 
 I MODAF,$D(^%RQSGLO("MOTEUR","TRT","VERBE",NOM,"TEXTE.EPILOGUE",1)) D ADD^%TLIFEN("LOG",$$^%QZCHW(^%RQSGLO("MOTEUR","TRT","VERBE",NOM,"TEXTE.EPILOGUE",1)))
 
 I MODAF,$D(^%RQSGLO("MOTEUR","TRT","VERBE",NOM,"RAFRAICHIR.APRES.EXECUTION",1)),^%RQSGLO("MOTEUR","TRT","VERBE",NOM,"RAFRAICHIR.APRES.EXECUTION",1)="OUI" D REAFF^%TLUTIL
 Q 1
 
TRTND(IPAR,NOEUD) 
 S TYPPAR=$$TYPPAR^%TLOCMP(NOM,IPAR)
 G:TYPPAR="EXPR" EXPR
 G:TYPPAR="REPERTOIRE" REPINT
 G:TYPPAR="STRING" STRING
 G:TYPPAR="NOMIND" NOMIND
 G:TYPPAR="POURCENT" PCT
 G:TYPPAR="ATT" ATT
 G:TYPPAR="INDIVIDU" IND
 G:TYPPAR="QUELCONQUE" QLQ
 G:TYPPAR="ATTRIBUT" ATTRIB
 
 
 
EXPR I NOEUD=0 S V(IDEB)=$C(0),IDEB=IDEB+1 Q
 S QUIT=0,POS=1,L=$$SUBST^%ANARBR2(NOEUD,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S QUIT=1 Q
 S V(IDEB)=$S(L="":$C(0),1:L),IDEB=IDEB+1
 Q
 
STRING I NOEUD=0 S V(IDEB)="",IDEB=IDEB+1 Q
 S QUIT=0,POS=1,L=$$SUBST^%ANARBR2(NOEUD,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S QUIT=1 Q
 S V(IDEB)=L,IDEB=IDEB+1
 Q
 
REPINT I NOEUD=0 S V(IDEB)=CXT("@","BASE"),IDEB=IDEB+1 Q
 S QUIT=0,POS=1,L=$$SUBST^%ANARBR2(NOEUD,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S QUIT=1 Q
 I L="" S V(IDEB)=CXT("@","BASE"),IDEB=IDEB+1 Q
 S L=$$NOMINT^%QSF(L)
 I L="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("Repertoire inconu")) S QUIT=1 Q
 S V(IDEB)=L,IDEB=IDEB+1
 Q
 
NOMIND I NOEUD=0 S V(IDEB)=CXT("@","OBJET"),IDEB=IDEB+1 Q
 S QUIT=0,POS=1,L=$$SUBST^%ANARBR2(NOEUD,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$PBEVAL) S QUIT=1 Q
 I L="" S V(IDEB)=CXT("@","OBJET"),IDEB=IDEB+1 Q
 S V(IDEB)=L,IDEB=IDEB+1
 Q
 
 
PCT S L=$$RED(NOEUD,"TEXTE") I $E(L)'="%" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("Un attribut temporaire etait attendu")) S QUIT=1 Q
 S V(IDEB)=L,IDEB=IDEB+1
 Q
 
 
 
IND I NOEUD=0 S V(IDEB)=CXT("@","BASE"),V(IDEB+1)=CXT("@","OBJET"),IDEB=IDEB+2 Q
 S VAR1=$$RED(NOEUD,"TYPE") I VAR1="ATTRIBUT" S NOEUD=$$RED(NOEUD,1)
 S VAR1=$$RED(NOEUD,"TEXTE")
 I VAR1="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("Individu symbolique inconnu")) S QUIT=1 Q
 I ('($D(CXT(VAR1,"BASE"))))!('($D(CXT(VAR1,"OBJET")))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("Individu symbolique inconnu")) S QUIT=1 Q
 S V(IDEB)=CXT(VAR1,"BASE"),V(IDEB+1)=CXT(VAR1,"OBJET"),IDEB=IDEB+2 Q
 
 
 
 
 
 
 
ATT I '($$ATTR^%TLBAVEA(NOEUD,1,.VAR1,.VAR2,.VAR3,.VAR4)) S MSG=$$^%QZCHW("Imposs. reconnaitre attribut") D:MODAF ADD^%TLIFEN("LOG",MSG) S QUIT=1 Q
 S QUIT=0,POS=1,L=$$SUBST^%ANARBR2(NOEUD,.CXT,"ATT^%TLIACT3",.POS)
 
 S:(L="")!(POS=0) L=$C(0)
 S V(IDEB)=VAR1,V(IDEB+1)=VAR2,V(IDEB+2)=VAR4,V(IDEB+3)=VAR3,V(IDEB+4)=L,IDEB=IDEB+5
 Q
 
 
 
QLQ I '($$ATTR^%TLBAVEA(NOEUD,$C(0),.VAR1,.VAR2,.VAR3,.VAR4)) S (V(IDEB),V(IDEB+1),V(IDEB+2),V(IDEB+3))=$C(0) G QLQ2
 S V(IDEB)=VAR1,V(IDEB+1)=VAR2,V(IDEB+2)=VAR4,V(IDEB+3)=VAR3
QLQ2 S QUIT=0,POS=1,L=$$SUBST^%ANARBR2(NOEUD,.CXT,"ATT^%TLIACT3",.POS)
 
 S:(L="")!(POS=0) L=$C(0)
 
 S V(IDEB+4)=L,IDEB=IDEB+5
 Q
 
 
 
 
 
 
 
ATTRIB I '($$ATTR^%TLBAVEA(NOEUD,$C(0),.VAR1,.VAR2,.VAR3,.VAR4)) S MSG=$$^%QZCHW("Imposs. reconnaitre attribut") D:MODAF ADD^%TLIFEN("LOG",MSG) S QUIT=1 Q
 S V(IDEB)=$S(VAR4=CXT("%","BASE"):1,1:0)
 S V(IDEB+1)=VAR1,V(IDEB+2)=VAR2,V(IDEB+3)=VAR4,V(IDEB+4)=VAR3
 S IDEB=IDEB+5
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 
PBEVAL() 
 N MES
 I IPAR=1 S MES="   "_$$^%QZCHW("Impossible d'evaluer le premier parametre") Q MES
 S MES="   "_$$^%QZCHW("Impossible d'evaluer le")_" "_IPAR_" "_$$^%QZCHW("eme parametre") Q MES
 
 
 
 
 
 
 
DEFF S TYPPAR=$$TYPPAR^%TLOCMP(NOMVERB,IPAR)
 ;
 ;
 ;
 ;
 ;
 ;

