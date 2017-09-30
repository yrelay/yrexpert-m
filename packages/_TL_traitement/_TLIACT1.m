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

;%TLIACT1^INT^1^59547,74029^0
%TLIACT1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
GO S STOP=0,ARRET=0,L=0 I ETIQ'="" G SGO
 
TRP S L=L+1 G:L>$ZP(@GLOSTO@("")) @RETOURGO
 I $$ISCTRLA^%SYSCLAV D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Abandon immediat ? : "),"N")'=0 D POCLEPA^%VVIDEO S ABANDON=1 D ^%EDEPLG,NETTOIE^%SYSSEMA(QUI) G @RETOURGO
 D CLEAR^%SYSUTI1
 S TETE=@GLOSTO@(L,"TETE"),COND=$$RED(TETE,1),ACTI=$$RED(TETE,2),TYP=$$RED(ACTI,"TYPE")
 G:TYP="ACTION" TLOKN1
 I TYP'="COMMENT" S RETOUROK="RETOKN" G TLOKS2
RETOKN G:STOP!(ABANDON!ARRET) @RETOURGO
 G TRP
TLOKN1 S TEXT=$$RED(ACTI,"TEXTE")
 I (((TEXT="$ETIQUETTE")!(TEXT="$PROLOGUE"))!(TEXT="$CORPS"))!(TEXT="$EPILOGUE") G SAUTET
 S RETOUROK="RETOKN1" G TLOKS2
RETOKN1 G:STOP!(ABANDON!(ARRET!HALT)) @RETOURGO
 G TRP
 
SAUTET F LI=L+1:1:$ZP(@GLOSTO@("")) S TETE=@GLOSTO@(LI,"TETE"),COND=$$RED(TETE,1) I COND=0 S ACTI=$$RED(TETE,2) I $$RED(ACTI,"TYPE")="ACTION" Q:$$RED(ACTI,"TEXTE")="$FIN"
 S L=LI G TRP
 
 
 
SGO S LI=0
SGO0 S LI=LI+1 G:LI>$ZP(@GLOSTO@("")) SGO1
 S TETE=@GLOSTO@(LI,"TETE"),ACTI=$$RED(TETE,2)
 I $$RED(ACTI,"TYPE")="ACTION",$$RED(ACTI,"TEXTE")="$ETIQUETTE" G:$$RED($$RED(ACTI,1),"TEXTE")=ETIQ SGO1
 G SGO0
 
SGO1 I PARTIE="" G SGO5
 S I=LI
SGO6 S LI=LI+1 I LI>$ZP(@GLOSTO@("")) S:PARTIE="CORPS" LI=I G SGO5
 S TETE=@GLOSTO@(LI,"TETE"),ACTI=$$RED(TETE,2)
 I $$RED(ACTI,"TYPE")'="ACTION" G SGO6
 I $$RED(ACTI,"TEXTE")="$ETIQUETTE" S LI=$ZP(@GLOSTO@("")) G SGO6
 I $$RED(ACTI,"TEXTE")'=("$"_PARTIE) G SGO6
SGO5 G:LI>$ZP(@GLOSTO@("")) @RETOURGO S L=LI-1
SGO2 S L=L+1 G:L>$ZP(@GLOSTO@("")) SGO3
 I $$ISCTRLA^%SYSCLAV D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Abandon immediat ? : "),"N") D POCLEPA^%VVIDEO,NETTOIE^%SYSSEMA(QUI) S ABANDON=1 G SGO3
 S TETE=@GLOSTO@(L,"TETE"),COND=$$RED(TETE,1),ACTI=$$RED(TETE,2),TYP=$$RED(ACTI,"TYPE")
 I TYP'="COMMENT" S RETOUROK="RETSTLOK" G TLOKS2
RETSTLOK G:STOP!(ARRET!(ABANDON!HALT)) SGO3
 G SGO2
SGO3 D:MODAF ADD^%TLIFEN("LISTE","") G @RETOURGO
 
 
 
 
 
 
TLOKS S COND=$$RED(TETE,1),ACTI=$$RED(TETE,2),TYP=$$RED(ACTI,"TYPE")
TLOKS2 D:MODAF POCLEPA^%VVIDEO
 G:TYP="COMMENT" @RETOUROK
 S TEXT=@GLOSTO@(L) D:MODAF ADD^%TLIFEN("ACT",TEXT)
 H:MODEX=1 2
 I COND=0 S NOEUACT=2 G BOUCACT
 
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("*Evaluation partie condition"))
 S CXT("@","OBJET")=IND
 S EXP=$$SUBST^%ANARBR2(COND,.CXT,"ATT^%TLIACT3",.POS) I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Evaluation impossible")) G @RETOUROK
 I EXP=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Partie condition fausse")) G @RETOUROK
 
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Partie condition vraie"))
 S NOEUACT=2,ACTI=$$RED(TETE,2)
 
BOUCACT D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("*Evaluation partie action"))
 S NOM=$$RED(ACTI,"TEXTE")
 G:NOM="$TRAITER" FTRT^%TLIACT9
 G:NOM="$TRAITERL" TRAITL^%TLIACTF
 G:NOM="$ITERER" ITER^%TLIACT4
 G:NOM="$ITERERVAL" ITERVAL^%TLIACT8
 G:NOM="$PARCOURIR.LIEN" PLIEN^%TLBAACA
 G:NOM="$PARCOURIR.NOMENCLATURE" PNOM^%TLBAACN
 G:NOM="$PARCOURIR.VALEURS" ITERVAL^%TLIACT8
 G:NOM="$REPETER" BOUCLER^%TLIACTA
 G:NOM="$AUSCULTER" ITEATT^%TLIACTH
 D ACTION^%TLIACT3
REBOUCA S NOEUACT=NOEUACT+1,ACTI=$$RED(TETE,NOEUACT)
 G:ACTI'=0 BOUCACT
 G @RETOUROK
 
 
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;
 ;

