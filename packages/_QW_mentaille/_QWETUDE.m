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

;%QWETUDE^INT^1^59547,73886^0
QWETUDE ;
 
 
 
 
CMS 
 N ADR,CTR,CONTR,ETU,MEN,SCR,CMS,ABENDSCR,RESUL,PATOUCH,NOMTAB
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU")
 S SCR="QWETUDE",(CMS,ABENDSCR)=0,NOMTAB=^%SCRE(SCR,"GLOSTOC")
 S @MEN@(1)=$$^%QZCHW("Modification")_"^MO"
 S @MEN@(2)=$$^%QZCHW("Duplication")_"^DU"
 S @MEN@(3)=$$^%QZCHW("Suppression")_"^SU"
SAI 
 D AFF
 K CTR,ETU,RESUL,PATOUCH
 D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",9,RM-1,DY+1,DY-1,"AFF^%QWETUDE","$$UC^%QWETUD2",.CTR,.ETU)
 I (CTR'="")!(ETU="") K @(MEN) Q
AFFG 
 D AFF^%QWETUD2(ETU)
ACT 
 D POCLEPA^%VVIDEO,^%VQUIKMN(10,70,23,MEN,.ADR,.CONTR)
 G:(CONTR="A")!(CONTR="F") SAI
 G:ADR="" ACT G @ADR
MO 
 S DX=0,DY=11 D CLEBAS^%VVIDEO
 D POINT^%VCMS(SCR,"RESUL")
 
 I '($D(^[QUI]RQSGLO("QW","ETUDE",ETU))) G SAI
 G AFFG
DU 
 D POCLEPA^%VVIDEO
 G:$$MES^%VZEOUI($$^%QZCHW("Voulez-vous dupliquer l'etude")_" "_ETU_" : ","N")'=1 ACT
 S ICC=3,TAB(ICC)=$$POP D ^%VAFFICH
 D STOCK I ABENDSCR=1 G AFFG
 
 D COPIE^%QWETUD2(ETU,TAB(ICC))
 
 S DX=0,DY=11 D CLEBAS^%VVIDEO
 D POINT^%VCMS(SCR,"RESUL")
 G SAI
SU 
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer l'etude")_" "_ETU_" : ")=1 D SUP^%QWETUD2(ETU) G SAI
 G ACT
 
AFF 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("modification / duplication / suppression")_" "_$$^%QZCHW("d'une etude"),0)
 S DX=10,DY=5 Q
 
VERIF(TYP,IND,REP,DOM) 
 I ((TYP'="INDIVIDU")&(TYP'="ENSEMBLE.ATTRIBUTS"))&(TYP'="ENSEMBLE.INDIVIDUS") Q $$^%QZCHW("Objet etudie incorrect")
 I DOM="GENERAL" G VER2
 I '($$EXISTE^%QWDMU(DOM)) Q $$^%QZCHW("Domaine inconnu")
VER2 I TYP'="INDIVIDU" Q ""
 I IND="" Q $$^%QZCHW("Individu inconnu")
 I REP="" Q $$^%QZCHW("Repertoire inconnu")
 I $$OKR^%INCOIN("QS")=0 Q ""
 I $$REPM^%QSGEST9(REP)=2 Q ""
 Q $$^%QZCHW("Repertoire inconnu")
 
 
 
STOCK 
 N MSG
 S MSG=$$VERIF(RESUL(5),RESUL(6),RESUL(7),RESUL(8))
 I MSG="" D MSG^%VZEATT($$^%QZCHW("Sauvegarde de l'etude")) G ST2
 D ^%VZEAVT(MSG) I %AJM'="M" S ABENDSCR=1 Q
 F I=1:1:8 S RESUL(I)=AFRESU(I)
 D ^%VAFIGRI,^%VAFISCR
ST2 
 D ^%VAUTOST Q:ABENDSCR=1
 
 I $D(^[QUI]RQSGLO("QW","ET",RESUL(3))) G STO
 N INDETU
 I ($D(^[QUI]RQSGLO("QW","SVG"))#10)'=1 S ^[QUI]RQSGLO("QW","SVG")=0
 S INDETU=^[QUI]RQSGLO("QW","SVG"),^[QUI]RQSGLO("QW","SVG")=INDETU+1
 S ^[QUI]RQSGLO("QW","ET",RESUL(3))=INDETU
STO 
 D CREER^%QWETUD2(RESUL(3),RESUL(4),RESUL(5),RESUL(6),RESUL(7),RESUL(8))
 I RESUL(5)'="INDIVIDU" G FST
 N ADR,WWLSTOCK,WWSTOCK
 
 S ADR="^[QUI]RQSGLO(""QW"",""ET"")"
 S WWSTOCK=$$CONCAT^%QZCHAD(ADR,""""_RESUL(3)_""",""I""") K @(WWSTOCK)
 S WWLSTOCK=$$CONCAT^%QZCHAD(ADR,""""_RESUL(3)_""",""L""")
 D AJOUTER^%QWSTOI("INIT",RESUL(7),RESUL(6))
FST D POCLEPA^%VVIDEO Q
 
STOSIT 
 N CONT,I,IND,OR,REP,WWSTOCK
 S CONT=^[QUI]RQSGLO("QW","ETUDE",RESUL(3))
 I $P(CONT,"^",2)="ENSEMBLE.INDIVIDUS" Q
 D ^%VAUTOST Q:ABENDSCR=1
 S REP=$P(CONT,"^",4) I REP="" S REP="*"
 S IND=$P(CONT,"^",3) I IND="" S IND="*"
 S WWSTOCK=$$CONCAT^%QZCHAD("^[QUI]RQSGLO(""QW"",""ET"")",""""_RESUL(3)_""",""I""")
 F I=5:2:17 I RESUL(I)'="" S OR=$P($P(RESUL(I)," (",2),")",1) S:OR="" OR=1 D AFF^%QWSTOI("INIT",REP,IND,$P(RESUL(I)," (",1),OR,RESUL(I+1))
 Q
 
STOBUT(TCO) 
 N ATR,COMP,CONT,I,ICOND,IND,OR,P,REP,RES,WWBUT,TYP,VAL
 D ^%VAUTOST Q:ABENDSCR=1
 S WWBUT=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"","""_TCO_""")",RESUL(3))
 S WWBUT=$$CONCAS^%QZCHAD(WWBUT,RESUL(4)) K @(WWBUT)
 S CONT=^[QUI]RQSGLO("QW","ETUDE",RESUL(3))
 S TYP=$P(CONT,"^",2)
 S REP=$P(CONT,"^",4) I (REP="")&(TYP="ENSEMBLE.ATTRIBUTS") S REP="*"
 S IND=$P(CONT,"^",3) I (IND="")&(TYP="ENSEMBLE.ATTRIBUTS") S IND="*"
 S ICOND=1
 G @TCO
 
BUT 
 F I=RESUL(5),RESUL(6) S P=1 D:I'="*" EXTA I I="*" K @(WWBUT) Q
 Q
EXTA 
 S ATR=$P(I,",",P) Q:ATR=""
 I ATR["(" G EXTO
 I TYP="ENSEMBLE.INDIVIDUS" S RES="$$EXIRIA^%QWSTOL(REP,IND,"""_ATR_""")" G FA
 S RES="$$EXIRIA^%QWSTOL("""_REP_""","""_IND_""","""_ATR_""")" G FA
EXTO 
 S OR=$P($P(ATR,"(",2),")",1),ATR=$P(ATR," (")
 I TYP="ENSEMBLE.INDIVIDUS" S RES="$$EXIRIAO^%QWSTOL(REP,IND,"""_ATR_""","""_OR_""")" G FA
 S RES="$$EXIRIAO^%QWSTOL("""_REP_""","""_IND_""","""_ATR_""","""_OR_""")"
FA S @WWBUT@(ICOND,"E")=RES,P=P+1,ICOND=ICOND+1
 G EXTA
 
CONTR 
 F I=5:3:11 S ATR=RESUL(I),COMP=RESUL(I+1),VAL=RESUL(I+2) D:ATR'="" INSC
 Q
INSC I ATR["(" G INSO
 I TYP="ENSEMBLE.INDIVIDUS" S RES="$$A1B^%QWSTOL(REP,IND,"""_ATR_""")" G FC
 S RES="$$A1B^%QWSTOL("""_REP_""","""_IND_""","""_ATR_""")"
 G FC
INSO 
 S OR=$P($P(ATR,"(",2),")",1),ATR=$P(ATR," (")
 I TYP="ENSEMBLE.INDIVIDUS" S RES="$$A2B^%QWSTOL(REP,IND,"""_ATR_""","""_OR_""")" G FC
 S RES="$$A2B^%QWSTOL("""_REP_""","""_IND_""","""_ATR_""","""_OR_""")"
FC S @WWBUT@(ICOND,"E")=RES_COMP_""""_VAL_"""",ICOND=ICOND+1
 Q
 
POP() 
 Q $$GEN^%QCAPOP("MNP")

