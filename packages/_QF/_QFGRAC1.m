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

;%QFGRAC1^INT^1^59547,73875^0
QFGRAC1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFFOBJ(LLISTEN,LISTIND,GROAFF,ACUMUL,CFEN,UTIL,ZOOM,VT) 
 N GR,AFF,OK,TEMP,SEL,I,INDICE,INDAF,GROSEL,INDCOUR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AFFOBJ") K @(TEMP)
 S SEL=$$CONCAS^%QZCHAD(TEMP,"SEL")
 S SELTRIE=$$CONCAS^%QZCHAD(TEMP,"SELTRIE")
 S GROSEL=$$CHOIX G:GROSEL="" FINAF
 S OK="",AFF=0
 D ENS^%QUAPAGM(SEL)
 S INDCOUR=$O(@SEL@(""))
 G:INDCOUR="" FINAF
 F I=0:0 Q:INDCOUR=""  S @SELTRIE@($$INDICE^%QSGE11(LISTIND,INDCOUR))=INDCOUR,INDCOUR=$O(@SEL@(INDCOUR))
 
 S INDICE=""
 F I=0:0 S INDICE=$O(@SELTRIE@(INDICE)) Q:INDICE=""  S INDCOUR=@SELTRIE@(INDICE) D AFFO1
 D AFFEND("","A")
 G FINAF
 
AFFO1 S INDAF=$$AFIN^%QFGRACT(LISTIND,INDCOUR)
 
 G:(UTIL'="L")&(UTIL'="C") SAFF
 
 G:'($D(@GROAFF@(INDCOUR,GROSEL))) AFDIR
 D MES(INDAF_" "_$$^%QZCHW("est deja place dans le groupe")_" "_$$AFGR^%QFGRACT(GROSEL)) Q
SAFF S GR=$O(@GROAFF@(INDCOUR,""))
 I GR'="" D MES(INDAF_" "_$$^%QZCHW("est deja place dans le groupe")_" "_$$AFGR^%QFGRACT(GR)) Q
 
AFDIR D MES($$^%QZCHW("affectation de")_" "_INDAF)
 I UTIL="E" S OK=$$AFFOBJ1^%QNEQU13(LISTIND,GROSEL,INDCOUR,.AFF,ACUMUL)
 I UTIL="S" S OK=$$AFFOBJ2^%QNEQU14(LISTIND,GROSEL,INDCOUR)
 I UTIL="C" S OK=$$AFFOBJ3^%QNEQU15(LISTIND,GROSEL,INDCOUR)
 I OK'="" D MES(OK) Q
 
 I ((UTIL="E")!(UTIL="S"))!(UTIL="C") D PLACER1^%QNEQU11(LISTIND,GROSEL,INDCOUR,.AFF,GROAFF,ACUMUL,ZOOM,UTIL,SELTRIE)
 I (UTIL="G")!(UTIL="L") D AFFOBJ1(INDCOUR,GROSEL,GROAFF,ACUMUL,ZOOM,UTIL)
 Q
 
AFFOBJ1(INDCOUR,GROSEL,GROAFF,ACUMUL,ZOOM,UTIL) 
 Q:$D(@GROAFF@(INDCOUR,GROSEL))
 D STOCK^%QSGES11(GROSEL,INDCOUR)
 S @GROAFF@(INDCOUR,GROSEL)=""
 D IND^%QFGREVA(GROSEL,INDCOUR,ACUMUL,1)
 D MAJ Q
 
 
 
RAPPEL(LLISTEN,LISTIND,GROAFF,ACUMUL,CFEN,UTIL,ZOOM,VT) 
 N GR,AFF,TEMP,SEL,I,INDAF,INDCOUR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"RAPPEL") K @(TEMP)
 S SEL=$$CONCAS^%QZCHAD(TEMP,"SEL")
 D ENS^%QUAPAGM(SEL)
 S INDCOUR=$O(@SEL@("")) G:INDCOUR="" FINAF
 F I=0:0 Q:INDCOUR=""  D RAPP1 S INDCOUR=$O(@SEL@(INDCOUR))
 D AFFEND("","R")
 G FINAF
 
RAPP1 S INDAF=$$AFIN^%QFGRACT(LISTIND,INDCOUR)
 S GR=$O(@GROAFF@(INDCOUR,""))
 I GR="" D MES(INDAF_" "_$$^%QZCHW("n'est pas affecte")) Q
RADIR D MES($$^%QZCHW("rappel de")_" "_INDAF)
 I (UTIL="G")!(UTIL="L") D RAPPEL1(INDCOUR,GR,GROAFF,ACUMUL,ZOOM,UTIL)
 I ((UTIL="E")!(UTIL="S"))!(UTIL="C") D RAPPEL2^%QNEQU11(GR,INDCOUR,.AFF,GROAFF,ACUMUL,ZOOM,UTIL,SEL)
 Q
RAPPEL1(INDCOUR,GR,GROAFF,ACUMUL,ZOOM,UTIL) 
 Q:'($D(@GROAFF@(INDCOUR,GR)))
 D ELIMI^%QSGES11(GR,INDCOUR)
 K @GROAFF@(INDCOUR,GR)
 D IND^%QFGREVA(GR,INDCOUR,ACUMUL,-1)
 D MAJ Q
 
 
 
REPORT(LLISTEN,LISTIND,GROAFF,ACUMUL,CFEN,UTIL,ZOOM,VT) 
 N LMN,GR,AFF,OK,TEMP,SEL,I,INDICE,INDAF,GROSEL,INDCOUR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AFFOBJ") K @(TEMP)
 S SEL=$$CONCAS^%QZCHAD(TEMP,"SEL"),OK="",AFF=0
 S SELTRIE=$$CONCAS^%QZCHAD(TEMP,"SELTRIE")
 S GROSEL=$$CHOIX I GROSEL="" G FINAF
 D ENS^%QUAPAGM(SEL)
 S INDCOUR=$O(@SEL@("")) I INDCOUR="" G FINAF
 F I=0:0 Q:INDCOUR=""  S @SELTRIE@($$INDICE^%QSGE11(LISTIND,INDCOUR))=INDCOUR,INDCOUR=$O(@SEL@(INDCOUR))
 S INDICE=""
 F I=0:0 S INDICE=$O(@SELTRIE@(INDICE)) Q:INDICE=""  S INDCOUR=@SELTRIE@(INDICE) D TEST
 D AFFEND("","A")
 G FINAF
 
TEST 
 S INDAF=$$AFIN^%QFGRACT(LISTIND,INDCOUR)
 S (LMN,GR)=$O(@GROAFF@(INDCOUR,""))
 G:GR="" NAFF
 I $D(@GROAFF@(INDCOUR,GROSEL)) D MES(INDAF_" "_$$^%QZCHW("est deja place dans le groupe selectionne")) Q
 D AFDIR Q:OK'=""
 D RADIR Q
NAFF 
 D MES(INDAF_" "_$$^%QZCHW(" n'est pas affecte"))
 I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous l'affecter ? "),"N")'=1 Q
 D AFDIR Q
 
CHOIX() 
 D CLFEN^%VVIDEO(0,22,2,RM-3),POCLEPA^%VVIDEO
 W $$^%QZCHW("Veuillez selectionner le groupe destination")
 D USE^%QUAPAGM(CFEN("G"))
 S GROSEL=$$UN^%QUAPAGM
 D USE^%QUAPAGM(CFEN("I")),POCLEPA^%VVIDEO
 Q GROSEL
 
FINAF K @(TEMP) Q
 
AFFEND(INDCOUR,T) 
 D ENTETE^%QFGRECR
 
 I CFEN("I")="QFGRIND" D AFFICH^%QUAPAGM
 
 I CFEN("I")="QFGRZOOM" D MODIF^%QUAPAGM(INDCOUR)
 D USE^%QUAPAGM(CFEN("G"))
 
 I T="A" D AFFP^%QUAPAGM(GROSEL)
 D AFFICH^%QUAPAGM,USE^%QUAPAGM(CFEN("I"))
 Q
 
MES(M) D MSG^%VZEATT(M) H 3 Q
 
MAJ 
 Q:(UTIL="S")!(UTIL="C")
 D FMAJ^%QNEQU11 Q

