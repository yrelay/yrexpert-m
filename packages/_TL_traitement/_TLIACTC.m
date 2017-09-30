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

;%TLIACTC^INT^1^59547,74029^0
%TLIACTC ;;02:03 PM  11 Jul 1991
 
 
VALO 
 N L,POS,NOL,TEMP,GLR,GVAL,NAR,IVAL,VAL,TYP,INO,%I
 N PREF,SUF,BASE,REP,AT,ATTA,VARA,INDA,REPA
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLR=$$CONCAS^%QZCHAD(TEMP,"RESULTAT")
 S GVAL=$$CONCAS^%QZCHAD(TEMP,"VALEUR")
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Valorisation en cours"))
 S POS=1
 S NOL=$$RED(ACTI,3)
 I NOL=0 G VALO2
 S L=$$SUBST^%ANARBR2(NOL,.CXT,"ATT^%TLIACT3",.POS)
 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer liste a traiter")) S ECHEC=1 G FIN1
 G VALOS
VALO2 
 S L=$$^%QCAZG("LISTE")
 I L="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer liste a traiter")) S ECHEC=1 G FIN1
VALOS S BASE=$$^%QSCALVA("L0",L,"OBJET")
 S REP=$$NOMINT^%QSF(BASE)
 S PREF=$$^%QSCALVA("L0",L,"ADRESSE")
 S AT=$$RED($$RED($$RED(ACTI,2),1),"TEXTE")
 I '($$AR^%QSGEST5(REP,AT)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut inconnu")) S ECHEC=1 G FIN1
 
 S SUF=""
BOUCLE 
 S SUF=$O(@PREF@(SUF))
 I SUF="" G FVALO
 K @(GVAL)
 D MVG^%QSCALVA(REP,SUF,AT,GVAL,.TYP)
 I @GVAL=0 G BOUCLE
 S INO="" F %I=1:1 S INO=$O(@GVAL@(INO)) Q:INO=""  S VAL=@GVAL@(INO) S:'($D(@GLR@(VAL))) @GLR@(VAL)=""
 G BOUCLE
FVALO S NAR=$$RED(ACTI,1)
 I $$RED(NAR,"TYPE")="VALEUR.SPECIALE" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut recepteur de type variable active")) S ECHEC=1 G FIN1
 I '($$ATTR^%TLIACT4(NAR,.ATTA,.INDA,.VARA,.REPA)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Erreur sur attribut recepteur")) S ECHEC=1 G FIN1
 G:ATTA'=$$^%QZCHW("NOM") VALO3
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier attribut NOM")) S ECHEC=1 G FIN1
VALO3 G:$$TYPE^%QSGEST9(REPA,ATTA)=0 VALO4
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier un lien")) S ECHEC=1 G FIN1
VALO4 
 
 I MODEX'=1 S IVAL="" F %I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  D PA^%QSGESTI(REPA,VARA,ATTA,IVAL,IVAL)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Valorisation terminee"))
FIN1 K @(TEMP) Q
 
 
VALI 
 N TEMP,GLR,ATV,INDV,NAR,IVAL,VAL,TYP,%I,REP,AT,ATTA,VARA,INDA,REPA
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLR=$$CONCAS^%QZCHAD(TEMP,"RESULTAT")
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Valorisation en cours"))
 S ATV=$$RED(ACTI,2)
 I '($$OBJET^%TLIACT7(ATV,.REP,.INDV)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver individu a traiter")) S ECHEC=1 G FIN2
 S AT=$$RED($$RED(ATV,1),"TEXTE")
 I '($$AR^%QSGEST5(REP,AT)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut inconnu")) S ECHEC=1 G FIN2
 
 D MVG^%QSCALVA(REP,INDV,AT,GLR,.TYP)
 I @GLR=0 S ECHEC=1 G FIN2
 
 S NAR=$$RED(ACTI,1)
 I $$RED(NAR,"TYPE")="VALEUR.SPECIALE" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attribut recepteur de type variable active")) S ECHEC=1 G FIN2
 I '($$ATTR^%TLIACT4(NAR,.ATTA,.INDA,.VARA,.REPA)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Erreur sur attribut recepteur")) S ECHEC=1 G FIN2
 G:ATTA'=$$^%QZCHW("NOM") VALI2
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier attribut NOM")) S ECHEC=1 G FIN2
VALI2 G:$$TYPE^%QSGEST9(REPA,ATTA)=0 VALI3
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit modifier un lien")) S ECHEC=1 G FIN2
VALI3 
 
 I MODEX'=1 S IVAL="" F %I=1:1 S IVAL=$O(@GLR@(IVAL)) Q:IVAL=""  S VAL=@GLR@(IVAL) D PA^%QSGESTI(REPA,VARA,ATTA,VAL,VAL)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Valorisation terminee"))
FIN2 K @(TEMP) Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

