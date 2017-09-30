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

;%QNEQU11^INT^1^59547,73879^0
QNEQU11 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PLACER1(LISTIND,LMN,INDCOUR,AFF,GROAFF,ACUMUL,ZOOM,UTIL,SEL) 
 D PLACER(@VT@("TEMPS"),@VT@("INSEP"),@VT@("INSEPI"),@VT@("INC"),@VT@("INCOMPG"),@VT@("INCOMPL"),LISTIND,LMN,INDCOUR,AFF,GROAFF,ACUMUL,ZOOM,UTIL,SEL)
 Q
PLACER(TEMPS,INSEP,INSEPI,INC,INCOMPG,INCOMPL,LISTIND,LMN,INDCOUR,AFF,GROAFF,ACUMUL,ZOOM,UTIL,SEL) 
 N ADR,I,TRIE,A
 S AFF=0
 
 D AJINCOMP^%QNEQUI9(INDCOUR,INSEPI,INC,INCOMPG,INCOMPL,LMN)
 
 I (UTIL="S")!(UTIL="C") D AFFOBJ1^%QFGRAC1(INDCOUR,LMN,GROAFF,ACUMUL,ZOOM,UTIL) Q
 
 I ($D(@INSEPI@(INDCOUR))#10)=0 D AFFOBJ1^%QFGRAC1(INDCOUR,LMN,GROAFF,ACUMUL,ZOOM,UTIL) Q
 
 S TRIE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TRIE") K @(TRIE)
 S AFF=1,A=""
 S ADR=@INSEP@(@INSEPI@(INDCOUR))
 F I=0:0 S A=$O(@ADR@(A)) Q:A=""  S @TRIE@($$INDICE^%QSGE11(LISTIND,A))=A
 
 S A=""
 F I=0:0 S A=$O(@TRIE@(A)) Q:A=""  D AFFOBJ1^%QFGRAC1(@TRIE@(A),LMN,GROAFF,ACUMUL,ZOOM,UTIL) K @SEL@(A)
 
 
 Q
 
PLACE(TEMPS,INDCOUR,LMN,GROAFF,ACUMUL,ZOOM,UTIL) 
 D AFFOBJ1^%QFGRAC1(INDCOUR,LMN,GROAFF,ACUMUL,ZOOM,UTIL)
 Q
 
 
 
RAPPEL2(LMN,INDCOUR,AFF,GROAFF,ACUMUL,ZOOM,UTIL,SEL) 
 D RAPPEL(@VT@("TEMPS"),@VT@("INSEP"),@VT@("INSEPI"),@VT@("INC"),@VT@("INCOMPG"),@VT@("INCOMPL"),LMN,INDCOUR,.AFF,GROAFF,ACUMUL,ZOOM,UTIL,SEL)
 Q
RAPPEL(TEMPS,INSEP,INSEPI,INC,INCOMPG,INCOMPL,LMN,INDCOUR,AFF,GROAFF,ACUMUL,ZOOM,UTIL,SEL) 
 N ADR
 S AFF=0
 
 D SUINCOMP^%QNEQUI9(INDCOUR,INSEPI,INC,INCOMPG,INCOMPL,LMN)
 
 I (UTIL="S")!(UTIL="C") D RAPPEL1^%QFGRAC1(INDCOUR,LMN,GROAFF,ACUMUL,ZOOM,UTIL) Q
 
 I ($D(@INSEPI@(INDCOUR))#10)=0 D RAPPEL1^%QFGRAC1(INDCOUR,LMN,GROAFF,ACUMUL,ZOOM,UTIL) Q
 
 S AFF=1,A=""
 S ADR=@INSEP@(@INSEPI@(INDCOUR))
 F I=0:0 S A=$O(@ADR@(A)) Q:A=""  D RAPPEL1^%QFGRAC1(A,LMN,GROAFF,ACUMUL,ZOOM,UTIL) K @SEL@(A)
 Q
 
RAPPEL1(TEMPS,LMN,INDCOUR,GROAFF,ACUMUL,ZOOM,UTIL) 
 D RAPPEL1^%QFGRAC1(INDCOUR,LMN,GROAFF,ACUMUL,ZOOM,UTIL)
 Q
 
 
 
 
 
MAJ D MAJ1(@VT@("CYCLE"),@VT@("TEMPS"),@VT@("ETUDE"),LISTIND,LLISTEN,VT)
 Q
MAJ1(C,CATT,NOM,LISTIND,LLISTEN,VT) 
 N CARD,EQUI,N,CMAX,CYCLER,EQUIR,NTOT,EFTOT
 D MSG^%VZEATT($$^%QZCHW("Mise a jour des indicateurs"))
 D ^%QNEQUI6(LLISTEN,C,CATT,.EQUI,.N,.CMAX,.CYCLER,.EQUIR,.NTOT,.EFTOT)
 D AJOUT^%QNEQETU(NOM,"EQUILIBRE",EQUI,CATT)
 D AJOUT^%QNEQETU(NOM,"NOMBRE.POSTES",N,CATT)
 D AJOUT^%QNEQETU(NOM,"CONCESSION.MAXIMUM",CMAX,CATT)
 D AJOUT^%QNEQETU(NOM,"EQUILIBRE.REEL",EQUIR,CATT)
 D AJOUT^%QNEQETU(NOM,"CYCLE.REEL",CYCLER,CATT)
 D AJOUT^%QNEQETU(NOM,"NOMBRE.TOTAL.OPERATEURS",EFTOT,CATT)
 D AJOUT^%QNEQETU(NOM,"TEMPS.UNITAIRE",CYCLER*EFTOT,CATT)
 S CARD=$$CARD^%QSGEST7(LISTIND)
 D AJOUT^%QNEQETU(NOM,"NOMBRE.OPERATIONS.AFFECTEES",NTOT,CATT)
 D AJOUT^%QNEQETU(NOM,"NOMBRE.OPERATIONS.GAMME",CARD,1)
 D AJOUT^%QNEQETU(NOM,"TAUX.OPERATIONS.AFFECTEES",NTOT_"/"_CARD,CATT)
 D STATSET^%QNEQUI8(VT,"MAJ.INDICATEURS",1)
 S @VT@("EQUIR")=EQUIR,@VT@("TAUX")=NTOT_"/"_CARD,@VT@("CYCLER")=CYCLER
 D OFF^%VZEATT
 Q
 
FMAJ 
 D FMAJ1(@VT@("TEMPS"),@VT@("ETUDE"),LLISTEN,VT)
 Q
FMAJ1(CATT,NOM,LLISTEN,VT) 
 N %A,ADR,L
 D ON^%VZEATT
 D STATSET^%QNEQUI8(VT,"MAJ.INDICATEURS",0)
 D AJOUT^%QNEQETU(NOM,"EQUILIBRE.REEL","***",CATT)
 D AJOUT^%QNEQETU(NOM,"CYCLE.REEL","***",CATT)
 D AJOUT^%QNEQETU(NOM,"TAUX.OPERATIONS.AFFECTEES","***",CATT)
 S (@VT@("TAUX"),@VT@("EQUIR"))="***",@VT@("CYCLER")="***"
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN) Q:(ADR="")!(ADR=0)
 S L=""
 F %A=0:0 S L=$O(@ADR@(L)) Q:L=""  D PA^%QSGESTI("L0",L,"CONCESSION","***",CATT)
 Q

