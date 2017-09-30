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

;%TLIACTB^INT^1^59547,74029^0
%TLIACTB ;
 
 
PART 
 N L,POS,NOL,BASE,REP,AT,TEMP,GLR,NAR,ATTA,INDA,VARA,REPA,IVAL,VAL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Partitionnement en cours"))
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLR=$$CONCAS^%QZCHAD(TEMP,"RESULTAT")
 S POS=1
 S NOL=$$RED(ACTI,3)
 I NOL=0 G LISTR
 S L=$$SUBST^%ANARBR2(NOL,.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer liste a partitionner")) G FIN
 G SUIT
LISTR 
 S L=$$^%QCAZG("LISTE")
 I L="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer liste a partitionner")) G FIN
SUIT S BASE=$$^%QSCALVA("L0",L,"OBJET")
 S REP=$$NOMINT^%QSF(BASE)
 S AT=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer attribut partitionnement")) G FIN
 I '($$AR^%QSGEST5(REP,AT)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut partitionnement inconnu")) G FIN
 D PART^%QS0PART(REP,L,AT,GLR)
 S NAR=$$RED(ACTI,1)
 I $$RED(NAR,"TYPE")="VALEUR.SPECIALE" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut recepteur de type variable active")) G FIN
 I '($$ATTR^%TLIACT4(NAR,.ATTA,.INDA,.VARA,.REPA)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Erreur sur attribut recepteur")) G FIN
 G:ATTA'=$$^%QZCHW("NOM") SAFF
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier attribut NOM")) G FIN
SAFF I ATTA="NOM" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier attribut NOM")) G FIN
 G:$$TYPE^%QSGEST9(REPA,ATTA)=0 SAFF2
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier un lien")) G FIN
SAFF2 
 
 
 I MODEX'=1 S IVAL="" F I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  S VAL=@GLR@(IVAL) D PA^%QSGESTI(REPA,VARA,ATTA,VAL,IVAL)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Partitionnement termine"))
FIN K @(TEMP) Q
 .
 
LIND 
 N L,POS,NOL,TEMP,GLR,GVAL,NAR,IVAL,TYP,INO,%I
 N PREF,SUF,BASE,REP,AT,ATTA,VARA,INDA,REPA
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLR=$$CONCAS^%QZCHAD(TEMP,"RESULTAT")
 S GVAL=$$CONCAS^%QZCHAD(TEMP,"VALEUR")
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Recherche indice en cours..."))
 S POS=1
 S NOL=$$RED(ACTI,3)
 I NOL=0 G LIND2
 S L=$$SUBST^%ANARBR2(NOL,.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer liste a traiter")) G FINI
 G LINDS
LIND2 
 S L=$$^%QCAZG("LISTE")
 I L="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer liste a traiter")) G FINI
LINDS S BASE=$$^%QSCALVA("L0",L,"OBJET")
 S REP=$$NOMINT^%QSF(BASE)
 S PREF=$$^%QSCALVA("L0",L,"ADRESSE")
 S AT=$$RED($$RED($$RED(ACTI,2),1),"TEXTE")
 I '($$AR^%QSGEST5(REP,AT)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut inconnu")) G FINI
 
 S SUF=""
BOUCLE 
 S SUF=$O(@PREF@(SUF))
 I SUF="" G FLIND
 K @(GVAL)
 D MVG^%QSCALVA(REP,SUF,AT,GVAL,.TYP)
 I @GVAL=0 G BOUCLE
 S INO="" F %I=1:1 S INO=$O(@GVAL@(INO)) Q:INO=""  S:'($D(@GLR@(INO))) @GLR@(INO)=""
 G BOUCLE
FLIND S NAR=$$RED(ACTI,1)
 I $$RED(NAR,"TYPE")="VALEUR.SPECIALE" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut recepteur de type variable active")) G FINI
 I '($$ATTR^%TLIACT4(NAR,.ATTA,.INDA,.VARA,.REPA)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Erreur sur attribut recepteur")) G FINI
 G:ATTA'=$$^%QZCHW("NOM") LIND3
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier attribut NOM")) G FINI
LIND3 G:$$TYPE^%QSGEST9(REPA,ATTA)=0 LIND4
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier un lien")) G FINI
LIND4 
 
 I MODEX'=1 S IVAL="" F %I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  D PA^%QSGESTI(REPA,VARA,ATTA,IVAL,IVAL)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Recherche terminee"))
FINI K @(TEMP) Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

