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

;%QFGRAC0^INT^1^59547,73875^0
QFGRAC0 ;
 
 
 
 
 
 
FUSGR(LLISTEN,ZOOM,ACUMUL,GROAFF,UTIL,CFEN,VT) 
 N TEMP,LFUS,FUS,XX,MSG
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"FUSGR") K @(TEMP)
 S LFUS=$$CONCAS^%QZCHAD(TEMP,"LFUS"),MSG=""
 D EFF("Veuillez selectionner les groupes a fusionner")
 D ENS^%QUAPAGM(LFUS) I '($D(@LFUS)) K @(TEMP) Q
 D EFF("Veuillez selectionner le groupe destination")
 S FUS=$$UN^%QUAPAGM Q:FUS=""
 K @LFUS@(FUS) I '($D(@LFUS)) K @(TEMP) Q
 D EFF("")
 I '($$MES^%VZEOUI($$^%QZCHW("Confirmez vous la fusion"),"N")) Q
 D MSG^%VZEATT($$^%QZCHW("Fusion en cours"))
 I ((UTIL="E")!(UTIL="S"))!(UTIL="C") S MSG=$$TETE2^%QNEQU10(LFUS,FUS,UTIL)
 
 I (UTIL="G")!(UTIL="L") D FUSGR1(LLISTEN,LFUS,$$ADRLIS^%QSGEST7(FUS),.ZOOM,.XX,GROAFF,.CFEN,UTIL,VT)
 
 D AFFECL^%QFGREVA(FUS,$$ATAF^%QFGRACT(UTIL),1,GROAFF)
 D CARDL^%QSGES11(FUS,.XX)
 I ((UTIL="E")!(UTIL="S"))!(UTIL="C") D FUSGR3 I MSG'="" K @(TEMP) Q
 
 D TRI^%QSGES11(FUS,.XX)
 D LISTE^%QFGREVA(FUS,ACUMUL)
 
 D MAJFEN^%QFGRECR(ZOOM)
 K @(TEMP)
 Q
 
FUSGR3 N INCOMPL,OL,I,A,ADR,IND
 S INCOMPL=@VT@("INCOMPL")
 G:MSG="" KLFUS
 D ^%VZEAVT(MSG)
 S OL=""
 F I=0:0 S OL=$O(@LFUS@(OL)) Q:OL=""  S IND="",ADR=$$ADRLIS^%QSGEST7(OL) F A=0:0 S IND=$O(@ADR@(IND)) Q:IND=""  D RAPPEL1^%QFGRAC1(IND,FUS,GROAFF,ACUMUL,ZOOM,UTIL)
 
 Q
 
KLFUS 
 S OL=""
 F I=0:0 S OL=$O(@LFUS@(OL)) Q:OL=""  D KFUS
 Q
KFUS S A=$$SUPGR1^%QFGRACT(LLISTEN,.ZOOM,.XX,OL,GROAFF,.CFEN,UTIL)
 K @INCOMPL@(OL)
 Q
 
 
FUSGR1(LLISTEN,LFUS,ADRFUS,ZOOM,XX,GROAFF,CFEN,UTIL,VT) 
 N CARD,OL,I
 S XX=1,OL=""
 F I=0:0 S OL=$O(@LFUS@(OL)) Q:OL=""  D UNION^%QCALIST($$ADRLIS^%QSGEST7(OL),ADRFUS,ADRFUS,.CARD)
 D SUPLGR^%QFGRACT(LLISTEN,.ZOOM,.XX,LFUS,GROAFF,.CFEN,UTIL)
 Q
 
EFF(M) 
 S DX=0,DY=22 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO,BLK^%VVIDEO
 W $$^%QZCHW(M) D NORM^%VVIDEO
 Q
 
 
 
TRI(LLISTEN,FGR,LISTIND,FIND,ZOOM,FZOOM,CFEN) 
 N TEMP,MENT,ADR,CTR,MENT1,I,MODE,MODE1,GROSEL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TRI") K @(TEMP)
 S MENT=$$CONCAS^%QZCHAD(TEMP,"MENT")
 S MENT1=$$CONCAS^%QZCHAD(TEMP,"MENT1")
 D MENT(MENT),MENT1(MENT1,"TRIA","TRIM")
 F I=0:0 Q:$$SEL(MENT)
 D END("G")
 Q
SEL(MEN) 
 D CLFEN^%VVIDEO(0,22,2,RM-3),^%VQUIKMN(0,79,22,MEN,.ADR,.CTR)
 Q:(CTR="A")!(CTR="F") 1
 Q:ADR="" 0
 D @ADR Q 0
TRI0 F I=0:0 Q:$$SEL(MENT1)
 Q
TRI1 S MODE=1
 S GROSEL=$$CHOIX^%QFGRAC1 Q:GROSEL=""
 D TRI0 Q
TRIN S MODE=2
 D TRI0 Q
TRIA S MODE1="A" D TRIER($S(MODE=1:GROSEL,1:LLISTEN),MODE1)
 Q
TRIM S MODE1="M" D TRIER($S(MODE=1:GROSEL,1:LLISTEN),MODE1)
 Q
 
TRIER(LISTE,MODE1) 
 I MODE1="A" G TRIA2
 I MODE1="M" G TRIM2
 Q
MENT(MEN) 
 S @MEN@(1)=$$^%QZCHW("tri d'un groupe")_"^"_"TRI1"
 S @MEN@(2)=$$^%QZCHW("tri des groupes")_"^"_"TRIN"
 Q
MENT1(MEN,AUT,MAN) 
 S @MEN@(1)=$$^%QZCHW("tri automatique")_"^"_AUT
 S @MEN@(2)=$$^%QZCHW("tri manuel")_"^"_MAN
 Q
TRIA2 N A
 S A=$$TRIER^%QS0TRIE(LISTE) Q
TRIM2 N TEMP,MORE,I,OB,NONTRIE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TRIM2") K @(TEMP)
 S NONTRIE=$$CONCAS^%QZCHAD(TEMP,"NONTRIE")
 S MORE=$$CONCAS^%QZCHAD(TEMP,"MORE")
 D MANI1^%QS0EDIT(LISTE,"AJ^%QFGRAC0","SUP^%QFGRAC0")
 I '($D(@MORE)) K @(TEMP) Q
 
 S OB=$O(@MORE@(""))
 F I=0:0 Q:OB=""  D STOCK^%QSGES11(LISTE,OB) S OB=$O(@MORE@(OB))
 K @(TEMP)
 Q
TRIP 
 N ADR,%I,GLO,I,P,NUM,B
 D ^%VZEATT
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TRIPOSTE") K @(GLO)
 S ADR=$$ADRLIS^%QSGEST7(LISTIND),B=$$BASE^%QSGEST7(LISTIND)
 S I="" F %I=0:0 S I=$O(@ADR@(I)) Q:I=""  S P=$O(@GROAFF@(I,"")) D INS
 I $D(@GLO) D TRIGLO^%QSGE11(LISTIND,GLO)
 K @(GLO) Q
INS 
 S NUM=$$^%QSCALVA(B,I,"NUMERO.OPERATION") D NORMALIS^%QZNBN1(.NUM)
 I P="" S @GLO@("zz",NUM)=I
 E  S @GLO@($$AFGR^%QFGRACT(P),NUM)=I
 Q
 
 
 
TRII(LLISTEN,FGR,LISTIND,FIND,ZOOM,FZOOM,CFEN,GROAFF) 
 N TEMP,ADR,CTR,MENT2,I,MODE,LISTE,MODE1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TRII") K @(TEMP)
 S MENT2=$$CONCAS^%QZCHAD(TEMP,"MENT2")
 I ZOOM="" S LISTE=LISTIND
 I ZOOM'="" S LISTE=ZOOM
 D MENT1(MENT2,"TRIA2","TRIM2")
 S @MENT2@(3)=$$^%QZCHW("tri sur les postes")_"^"_"TRIP"
 F I=0:0 Q:$$SEL(MENT2)
 D END("I")
 Q
 
AJ 
 S OK=1 I TYP'="INDIVIDU" G PRES
 I '($$IR^%QSGEST5(BA,Y1)) D MSG^%VZEATT($$^%QZCHW("l'individu ")_Y1_$$^%QZCHW(" est inconnu dans la base ")_$$NOMLOG^%QSF(BA))
PRES I $D(@NONTRIE@(Y1)) D ^%VZEAVT($$^%QZCHW("Cet individu existe deja")) S OK=0 Q
 I '($D(@MORE@(Y1))) D ^%VZEAVT($$^%QZCHW("Cet individu ne provient pas de cette liste")) S OK=0 Q
 K @MORE@(Y1)
 S @NONTRIE@(Y1)="" Q
 
SUP 
 S OK=1
 S @MORE@(Y1)=""
 K @NONTRIE@(Y1) Q
 
END(A) 
 D INITAFF^%QFGRECR(LLISTEN,FGR,LISTIND,FIND,ZOOM,FZOOM,.CFEN)
 D USE^%QUAPAGM(CFEN(A))
 K @(TEMP)
 Q

