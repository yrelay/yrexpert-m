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

;%QFGRDEC^INT^1^59547,73875^0
QFGRDEC(LISTIND,LLISTEN,FGR,FIND,FZOOM,ACUMUL,GROAFF,VT,UTIL,GOTO) ;;11:58 AM  1 Jul 1996
 
 
 N TEMP,MEN0,MENG,MENI,ADR,CTR,MSG,CFEN,ZOOM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S MEN0=$$CONCAS^%QZCHAD(TEMP,"MEN0")
 S MENG=$$CONCAS^%QZCHAD(TEMP,"MENG")
 S MENI=$$CONCAS^%QZCHAD(TEMP,"MENI")
 K @(TEMP)
 
 S GOTO="",ZOOM="",CFEN=""
 S CFEN("G")="QFGROUP",CFEN("I")="QFGRIND"
 D MEN0^%QFGRDE2(MEN0,UTIL),MENG^%QFGRDE2(MENG,UTIL),MENI^%QFGRDE2(MENI)
 
 D INIT
 
M0 O $I K CTR,ADR S CFEN=""
 I GOTO'="" G FIN
 D CLFEN^%VVIDEO(0,22,2,RM-3),CADRES^%QFGRECR
 D ^%VQUIKMN(0,79,22,MEN0,.ADR,.CTR)
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" D REAFF G M0
 G:ADR="" M0 G @ADR
 
IND0 
 D USE^%QUAPAGM(CFEN("I"))
IND O $I K CTR,ADR S CFEN="I"
 D CLFEN^%VVIDEO(0,22,2,RM-3),CADRES^%QFGRECR
 D ^%VQUIKMN(0,79,22,MENI,.ADR,.CTR) G:(CTR="A")!(CTR="F") M0
 I CTR="R" D REAFF G IND0
 G:ADR="" IND G:ADR="GROUPE0" @ADR
 D @ADR G IND0
 
GROUPE0 
 D USE^%QUAPAGM(CFEN("G"))
GROU W $$XY^%VVIDEO1(0,0) O $I
 S CFEN="G" K ADR,CTR
 D CLFEN^%VVIDEO(0,22,2,RM-3),CADRES^%QFGRECR
 D ^%VQUIKMN(0,79,22,MENG,.ADR,.CTR) G:(CTR="A")!(CTR="F") M0
 I CTR="R" D REAFF G GROUPE0
 G:ADR="" GROU G:ADR="IND0" @ADR
 D @ADR G GROUPE0
FIN D ENDAFF^%QFGRECR,CLFEN^%VVIDEO(0,22,2,RM-3),^%VZEATT
 K @(TEMP)
 Q
 
 
INSEP S GOTO="SEP"
 G M0
INCOM S GOTO="COM"
 G M0
MAJ D MAJ^%QNEQU11,REAFF G M0
ETU D ETU^%QNEQU12 G M0
HISTO D HISTO^%QNEQU12 G M0
REAFF D REAFF^%QFGRECR
 Q
AUT D CLFEN^%VVIDEO(0,22,2,RM-3)
 S DX=0,DY=23 X XY I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous vraiment (re)lancer un equilibrage automatique")_" ? ","N")=1 D AUT1 S GOTO="AUT"
 G M0
AUT1 
 I @VT@("REINIT")="OUI" D REINIT
 Q
REINIT 
 N ADR,I,L,ZOOM,XX,CFEN,UTIL,A
 S ZOOM="",XX="",CFEN="",UTIL=""
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN)
 I ((ADR="")!(ADR=0))!(LLISTEN="") D DEL^%QSGES11(LLISTEN) Q
 S L="" F I=0:0 S L=$O(@ADR@(L)) Q:L=""  S A=$$SUPGR1^%QFGRACT(LLISTEN,.ZOOM,.XX,L,GROAFF,.CFEN,UTIL)
 Q
 
VISU S GOTO="VISU" G M0
TRT S GOTO="TRT" G M0
 
 
CREGR D CREGR^%QFGRACT(LLISTEN,$$BASE^%QSGEST7(LISTIND),UTIL) Q
SUPGR D SUPGR^%QFGRACT(LLISTEN,GROAFF,.CFEN,.ZOOM,UTIL) Q
FUSGR D FUSGR^%QFGRAC0(LLISTEN,.ZOOM,ACUMUL,GROAFF,UTIL,.CFEN,VT) Q
DESIGN D CHDES^%QFGRACT(LLISTEN,.CFEN) Q
LISGR I $$AFFGR^%QFGRAC2(LLISTEN,FGR,.CFEN,GROAFF)=1 D EFF
 Q
ZOOM I CFEN("I")="QFGRIND" D ZOOMIN^%QFGRAC2(LLISTEN,.ZOOM,FZOOM,.CFEN) Q
 I CFEN("I")="QFGRZOOM" D ZOOMOUT^%QFGRAC2(.CFEN,.ZOOM)
 Q
TRI D TRI^%QFGRAC0(LLISTEN,FGR,LISTIND,FIND,ZOOM,FZOOM,.CFEN) Q
VISGR D GRP,REA("QFGRPP",1),INIT Q
 
 
AFFOBJ D AFFOBJ^%QFGRAC1(LLISTEN,LISTIND,GROAFF,ACUMUL,.CFEN,UTIL,ZOOM,VT)
 Q
RAPPEL D RAPPEL^%QFGRAC1(LLISTEN,LISTIND,GROAFF,ACUMUL,.CFEN,UTIL,ZOOM,VT) Q
REPORT D REPORT^%QFGRAC1(LLISTEN,LISTIND,GROAFF,ACUMUL,.CFEN,UTIL,ZOOM,VT) Q
TRII D TRII^%QFGRAC0(LLISTEN,FGR,LISTIND,FIND,ZOOM,FZOOM,.CFEN,GROAFF) Q
VISIN D INDP,REA("QFGINPP",1),INIT Q
 
 
ENT D GO^%QUAPAGM,COP
 Q
PLUS D PLUS^%QUAPAGM Q
MOINS D MOINS^%QUAPAGM Q
PAGE D PAGE^%QUAPAGM Q
REPER D REPER^%QUAPAGM Q
 
 
INIT 
 D INITAFF^%QFGRECR(LLISTEN,FGR,LISTIND,FIND,ZOOM,FZOOM,.CFEN)
 Q
 
EFF 
 D CLFEN^%VVIDEO(0,3,8,79),USE^%QUAPAGM(CFEN("G")),AFFICH^%QUAPAGM
 Q
 
COP 
 N I,GLO,ADRZ
 S GLO=$S(CFEN="G":FGR,CFEN("I")="QFGRIND":FIND,1:FZOOM)
 S @GLO@("SYN")=$$SYN^%QUAPAGM,@GLO@("SYN.A")=$$SYNA^%QUAPAGM
 S GLO=$$CONCAS^%QZCHAD(GLO,"C") K @(GLO)
 S ADRZ=$$ADRCOL^%QUAPAGM
 F I=1:1 Q:'($D(@ADRZ@(I)))  D COPCLE
 Q
COPCLE S @GLO@(I,"T")=@ADRZ@(I,"T")
 S @GLO@(I,"L")=@ADRZ@(I,"L")
 S @GLO@(I,"C")=@ADRZ@(I,"C")
 Q:'($D(@ADRZ@(I,"FCT")))
 S PART=$P(@ADRZ@(I,"FCT"),"VT1,V,C")
 
 I $E(PART,$L(PART))="," S PART=$E(PART,1,$L(PART)-1),PART=PART_")" G FC
 
 S PART=$E(PART,1,$L(PART)-1)
 
FC S @GLO@(I,"FCT")=PART Q
 
REA(FEN,COP) 
 D USE^%QUAPAGM(FEN),AFFICH^%QUAPAGM
 D GO^%QUAPAGM D:COP=1 COP
 D CLOSE^%QUAPAGM(FEN)
 Q
 
GRP 
 N GRPP
 S GRPP=$$CONCAS^%QZCHAD(TEMP,"GRPP")
 D ^%VZEATT,ALGRPP^%QFGRECR(LLISTEN,GRPP,FGR,.MSG)
 D OPEN^%QUAPAGM(GRPP,"QFGRPP"),CLEPAG^%VVIDEO
 Q
 
INDP 
 N INDPP
 S INDPP=$$CONCAS^%QZCHAD(TEMP,"INDPP")
 D ^%VZEATT,ALINDPP^%QFGRECR(LISTIND,INDPP,FIND,.MSG)
 D OPEN^%QUAPAGM(INDPP,"QFGINPP"),CLEPAG^%VVIDEO
 Q

