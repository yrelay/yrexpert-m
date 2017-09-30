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

;%TLIACTO^INT^1^59547,74029^0
%TLIACTO ;
 
 
 
 
 
ELIMETU 
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Elimination d'une etude TOTEM"))
 N NODEVI,YA,YB,IDTOT,COMP,TANT,WW,NUFA,ARTCT,LI,%V,%U,GLO,KGL,MSG
 
 S NODEVI=$$RED(ACTI,1)
 S NODEVI=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom etude") G ERRJ
 I NODEVI="" S MSG=$$^%QZCHW("Nom etude incorrect") G ERRJ
 D:MODEX'=1 SUPEX^TODELDEV(NODEVI)
 D:MODEX'=1 SUP^TORQXIN(NODEVI)
 D:MODEX=2 STIND^%TLBAATT($$GI^TORQXIN,NODEVI,"","","SUPPRESSION")
 D:MODAF ADD^%TLIFEN(LOG,"  "_$$^%QZCHW("Etude eliminee"))
 Q
 
 
 
PORT 
 N NODEVI,GLOB,VARTEMP,NUMPT,ORDRE,TEMPRES,TEMP,VAR1,VAR2,VAR3
 N NOMVAR2,NOMVAR3,NOMVAR3,OKLEC
 S GLOB="^CAPTEUR"
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PORT") K @(TEMP)
 S TEMPRES=$$CONCAS^%QZCHAD(TEMP,"RES")
 D:MODAF ADD^%TLIFEN("LOG","     "_$$^%QZCHW("Lecture-ecriture sur un port externe"))
 
 S NODEVI=$$RED(ACTI,1)
 S NUMPT=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom du port") G ERRP
 I '($D(^%IS(NUMPT))) S MSG=$$^%QZCHW("Port inconnu") G ERRP
 S NODEVI=$$RED(ACTI,2)
 S CAPT=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom du capteur") G ERRP
 I '($D(^CAPTEUR(CAPT))) S MSG=$$^%QZCHW("Capteur inconnu") G ERRP
 S NODEVI=$$RED(ACTI,3)
 S ORDRE=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer ordre") G ERRP
 I '($D(^CAPTEUR(CAPT,ORDRE))) S MSG=$$^%QZCHW("Ordre inconnu pour ce capteur") G ERRP
 
 
 
 S NODEVI=$$RED(ACTI,4)
 S:NODEVI'=0 NOMVAR1=$$RED(NODEVI,"TEXTE"),VAR1=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 S NODEVI=$$RED(ACTI,5)
 S:NODEVI'=0 NOMVAR2=$$RED(NODEVI,"TEXTE"),VAR2=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 S NODEVI=$$RED(ACTI,6)
 S:NODEVI'=0 NOMVAR3=$$RED(NODEVI,"TEXTE"),VAR3=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 
 
 
 
 
 S OKLEC=1
 X ^CAPTEUR(CAPT,ORDRE)
 I OKLEC=0 S MES=$$^%QZCHW("Probleme lors de la lecture") G ERRP
 
 
 G:('($D(VAR1)))!('($D(NOMVAR1))) VAR2
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),NOMVAR1,VAR1,1,"AJOUT")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NOMVAR1,VAR1,1)
 D:MODAF ADD^%TLIFEN("LOG","   "_NOMVAR1_" <-- "_VAR1)
VAR2 G:('($D(VAR2)))!('($D(NOMVAR2))) VAR3
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),NOMVAR2,VAR2,1,"AJOUT")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NOMVAR2,VAR2,1)
 D:MODAF ADD^%TLIFEN("LOG","   "_NOMVAR2_" <-- "_VAR2)
VAR3 G:('($D(VAR3)))!('($D(NOMVAR3))) FINPORT
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),NOMVAR3,VAR3,1,"AJOUT")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NOMVAR3,VAR3,1)
 D:MODAF ADD^%TLIFEN("LOG","   "_NOMVAR3_" <-- "_VAR3)
FINPORT 
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Fin de la lecture"))
 K @(TEMP)
 Q
 
ERRJ D:MODAF ADD^%TLIFEN("LOG","  "_MSG)
 S ECHEC=1 Q
 
ERRP D:MODAF ADD^%TLIFEN("LOG","  "_MSG)
 S ECHEC=1 K @(TEMP) Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

