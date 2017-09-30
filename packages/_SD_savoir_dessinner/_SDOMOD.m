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

;%SDOMOD^INT^1^59547,73889^0
SDOMOD(OBJ,VERS,%PORT,%TERM) 
 
 
 
 
 N MENMOD,MENSEL,ADR,CTR,TEMP,NUM,NUM2,SOURCE,SAVE,DIF,PAS,DEJAF,XM,YM,MAT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENMOD=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S MENSEL=$$CONCAS^%QZCHAD(TEMP,"MENU2")
 S DIF=$$CONCAS^%QZCHAD(TEMP,"DIFFERENCES")
 S MAT=$$ADR^%SDOMAT,DEJAF=0
 D MENU(MENMOD)
 D MENU2(MENSEL)
AFF1 D EFFBAS^%SDUMEN
DIAL 
 D AFF^%SDUMEN(0,0,MENMOD)
DIAL2 D SEL^%SDUMEN(MENMOD,.ADR,.CTR)
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G DIAL
 G @ADR
FIN 
 K @(TEMP)
 Q
 
 
ECR 
 S PAS=$$PAS^%SDOCNT(OBJ,VERS)
 I '(DEJAF) D ^%SDOGRIL(OBJ,VERS,%PORT,%TERM,PAS,0) S DEJAF=1
SEL D SEL^%SDOGRIL(.XM,.YM)
 I (XM="")!(YM="") G DIAL
 I @MAT@(XM,YM)=1 S EL=$O(@MAT@(XM,YM,"")) G SUITE
 
 D CHOIX(.EL)
 G:EL="" DIAL
 
SUITE S GLAFF=$$CONCAS^%QZCHAD(TEMP,"NEW.POINT") K @(GLAFF)
 D EXT(OBJ,VERS,EL,.TYP)
AFF2 D AFF^%SDUMEN(0,0,MENSEL)
DIAL3 D SEL^%SDUMEN(MENSEL,.ADR,.CTR)
 I (CTR="A")!(CTR="F") G AFF1
 I CTR="R" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G DIAL
 G @ADR
 
SUPP 
 D ^%SDEDEF2(EL,TYP,2,CONT,GLAFF,1)
 I %TERM="VT-340",DEJAF D ^%SDOGRIL(OBJ,VERS,%PORT,%TERM,PAS,0)
 G SEL
 
MOD 
 D ^%SDEDEF2(EL,TYP,1,CONT,GLAFF,1)
 I %TERM="VT-340",DEJAF D ^%SDOGRIL(OBJ,VERS,%PORT,%TERM,PAS,0)
 G SEL
 
CHOIX(EL) 
 N NOEL,LIST
 S LIST=$$CONCAS^%QZCHAD(TEMP,"LISTE") K @(LIST)
 S EL="",NOEL=""
 F I=0:0 S NOEL=$O(@MAT@(XM,YM,NOEL)) Q:NOEL=""  S @LIST@($E(^[QUI]SDTEXT(OBJ,VERS,NOEL),1,70))=""
 D ALFA^%SDEDEF,BLD^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez un element"),0),NORM^%VVIDEO
 S EL=$$UN^%PKCHOIX(LIST,2,3,20)
 S EL=$$GETLBLAN^%VTLBLAN($P(EL,";",1))
 D GRAPH^%SDEDEF
 I %TERM="VT-340" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 Q
EXT(OBJ,VERS,EL,TYP) 
 S TYP=$E($$TYPELEM^%SDEGEST(OBJ,VERS,EL),1,5)
 Q
 
 
EDIT 
 D ALFA^%SDEDEF
 
 D AVANT
 D EDIT^%SDOSTEX(OBJ,VERS)
 
 D APRES
 G DIAL
EFF 
 I '(DEJAF) D ^%VSQUEAK G DIAL2
 I %TERM="VT-340" D VT340^%SDEDEF S DEJAF=0 G FIN
 I DEJAF D ^%SDOGRIL(OBJ,VERS,%PORT,%TERM,PAS,1) S DEJAF=0
 G FIN
MENU(MN) 
 S @MN@(1)=$$^%QZCHW("SELECTION.ECRAN")_"^"_"ECR"
 S @MN@(2)=$$^%QZCHW("MODIFICATION.SYNTAXE")_"^"_"EDIT"
 S @MN@(3)=$$^%QZCHW("EFFACEMENT.QUADRILLAGE")_"^"_"EFF"
 Q
MENU2(MN) 
 S @MN@(1)=$$^%QZCHW("MODIFICATION.SYNTAXE")_"^"_"MOD"
 S @MN@(2)=$$^%QZCHW("SUPPRESSION")_"^"_"SUPP"
 Q
AVANT 
 N EL,I
 S SOURCE="^["""_QUI_"""]SDTEXT("""_OBJ_""","""_VERS_""")"
 S SAVE=$$CONCAS^%QZCHAD(TEMP,"TEXTE") K @(SAVE)
 S EL="" F I=0:0 S EL=$O(@SOURCE@(EL)) Q:EL=""  Q:EL="COM"  S @SAVE@(EL)=@SOURCE@(EL)
 Q
 
APRES 
 
 N TYP1,EL,REAF S EL="",REAF=0
 K @(DIF)
LOOP S EL=$O(@SAVE@(EL)) G:EL="" FAPRES
 I '($D(@SOURCE@(EL))) S REAF=1 G LOOP
 S CH1=@SAVE@(EL),CH2=@SOURCE@(EL)
 S TYP1=$P(CH1,";",1),TYP2=$P(CH2,";",1)
 I TYP1=TYP2 G LOOP
 
 S @DIF@(EL)=TYP2
 G LOOP
FAPRES 
 D GRAPH^%SDEDEF,^%PBPZGRA
 I %TERM="VT-340" G FAPRES1
 I '(REAF) Q
FAPRES1 
 D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 Q

