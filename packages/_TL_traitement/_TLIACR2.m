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

;%TLIACR2^INT^1^59547,74029^0
%TLIACR2 ;;06:31 PM  23 Dec 1991;
 
 
 
 
 
EDITL 
 N RE,OBB,PGM,NG,PERE,TYPINVO,CONFPRES,GLOCAL,QSDIA,NLI,NIVEDC,DEFETU
 S NIVEDC=$$GET^%SGVAR("NIVEDC")+1 D SET^%SGVAR("NIVEDC",NIVEDC)
 S GLOCAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"G"_NIVEDC) K @(GLOCAL)
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Appel de l'editeur de liens"))
 S TYPINVO=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(TYPINVO="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer type d'invocation")) S ECHEC=1 Q
 I ((TYPINVO'=1)&(TYPINVO'=2))&(TYPINVO'=0) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Type d'invocation non valide")) S ECHEC=1 Q
 S RE=$$RED(ACTI,2)
 I RE=0 S RE=CXT("@","BASE") G SRE2
 S RE=$$SUBST^%ANARBR2(RE,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer nom du repertoire")) S ECHEC=1 Q
 I RE="" S RE=CXT("@","BASE") G SRE2
SRE S RE=$$NOMINT^%QSF(RE)
 I RE="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Repertoire inconnu")) S ECHEC=1 Q
SRE2 S DEFETU=$$NOMLOG^%QSF(RE)
 S OBB=$$RED(ACTI,3)
 I OBB=0 S OBB=CXT("@","OBJET") G SOBB
 S OBB=$$SUBST^%ANARBR2(OBB,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer objet")) S ECHEC=1 Q
 I OBB="" S OBB=CXT("@","OBJET") G SOBB2
SOBB I '($$IR^%QSGEST5(RE,OBB)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Cet individu n'appartient pas au repertoire")) S ECHEC=1 Q
SOBB2 S NLI=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(NLI="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer lien")) S ECHEC=1 Q
 S DEFETU=DEFETU_$C(0)_$C(0)_NLI_$C(0)_$C(0)_OBB
 S CONFPRES=$$RED(ACTI,5)
 I CONFPRES=0 S CONFPRES="STANDARD" G SPRES
 S CONFPRES=$$SUBST^%ANARBR2(CONFPRES,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer configuration")) S ECHEC=1 Q
 S:CONFPRES="" CONFPRES="STANDARD"
SPRES I '($$EXISTE^%QULELOU(CONFPRES)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Configuration inexistante")) S ECHEC=1 Q
 S DEFETU=DEFETU_$C(0)_$C(0)_CONFPRES
 S @GLOCAL@("CONF")=1,@GLOCAL@("CONF","CF")=CONFPRES
 S @GLOCAL@("BASE")=1,@GLOCAL@("BASE","B")=$$NOMLOG^%QSF(RE)
 S @GLOCAL@("BASE","L")=NLI
 S @GLOCAL@("BASE","R",OBB)="",@GLOCAL@("BASE","R")="IND/"_OBB_"/0"
 S @GLOCAL@("DIAL")=1
 
 S QSDIA=$$RED(ACTI,6) G:QSDIA="" FINEDI
 S QSDIA=$$SUBST^%ANARBR2(QSDIA,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer dialogue")) S ECHEC=1 Q
 G:QSDIA="" DIA2
 I '($$EXIDIA^%QSATTR5(QSDIA)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Dialogue inexistant")) S ECHEC=1 Q
 S @GLOCAL@("DIAL","R",RE)=QSDIA
 
 
DIA2 S DEFETU=DEFETU_$C(0)_$C(0)_QSDIA
 S QSDIA=""
 G:$$TYPEL^%QSGES90(NLI)'<4 DIA3
 S QSDIA=$$RED(ACTI,7) G:QSDIA="" FINEDI
 S QSDIA=$$SUBST^%ANARBR2(QSDIA,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer dialogue")) S ECHEC=1 Q
 I QSDIA="" G DIA3
 I '($$EXIDIA^%QSATTR5(QSDIA)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Dialogue inexistant")) S ECHEC=1 Q
 S @GLOCAL@("D","R",$$REPD^%QSGEL2(RE,NLI))=QSDIA
DIA3 S DEFETU=DEFETU_$C(0)_$C(0)_QSDIA
 
 S QSDIA=""
 G:'($$QUAL^%QSGEL2(RE,NLI)) DIA4
 S QSDIA=$$RED(ACTI,8) G:QSDIA="" FINEDI
 S QSDIA=$$SUBST^%ANARBR2(QSDIA,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer dialogue")) S ECHEC=1 Q
 I QSDIA="" G DIA4
 I '($$EXIDIA^%QSATTR5(QSDIA)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Dialogue inexistant")) S ECHEC=1 Q
 S @GLOCAL@("DIAL","L",NLI)=QSDIA
DIA4 S DEFETU=DEFETU_$C(0)_$C(0)_QSDIA
 
 S QSDIA=""
 G:'($$QUAL^%QSGEL2($$REPD^%QSGEL2(RE,NLI),$$LIENI^%QSGEL2(RE,$$REPD^%QSGEL2(RE,NLI),NLI,$$TYPEL^%QSGES90(NLI)))) FINEDI
 S QSDIA=$$RED(ACTI,9) G:QSDIA="" FINEDI
 S QSDIA=$$SUBST^%ANARBR2(QSDIA,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer dialogue")) S ECHEC=1 Q
 I QSDIA="" G FINEDI
 I '($$EXIDIA^%QSATTR5(QSDIA)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Dialogue inexistant")) S ECHEC=1 Q
 S @GLOCAL@("DIAL","L",$$LIENI^%QSGEL2(RE,$$REPD^%QSGEL2(RE,NLI),NLI,$$TYPEL^%QSGES90(NLI)))=QSDIA
FINEDI S DEFETU=DEFETU_$C(0)_$C(0)_QSDIA
 
 
 K @(GLOCAL)
 D DEP^%SGVAR("NIVEDC")
 D ^%QULELO1("",DEFETU,0)
 D REAFF^%TLUTIL
 Q
 
 
ERR D:MODAF ADD^%TLIFEN("LOG","  "_MSG)
 S ECHEC=1
 Q
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

