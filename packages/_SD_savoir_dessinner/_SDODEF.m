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

;%SDODEF^INT^1^59547,73889^0
SDODEF ;
 
 
 
 
 I '($$EXIST^%SDXGEN) D ^%VZEAVT($$^%QZCHW("environnement d'exploitation non defini")) Q
 N %C,%R,OBJ,PK,VERS,X,Y
DEF 
 D ^%SDOBJ($$^%QZCHW("Definition d'un objet graphique"),2,.OBJ,.VERS)
 
 I OBJ="" Q
 K PK
 D POCLEPA^%VVIDEO
 
 I '($$EXI^%SDOCMS(OBJ,VERS)) D ^%VSQUEAK I $$MES^%VZEOUI($$^%QZCHW("Objet inexistant, voulez-vous le creer")_" ? ","N")'=1 G DEF
 D EXT(OBJ,VERS)
 G DEF
 
EXT(OBJ,VERS) 
 
 N GLCOMP,GLOBJ,GLOTYP,GLTEXT,TEMPO,TEMPREF,UCONT,ROUTREAF,DH,MAT
 N %PORT,%TERM,ADR,CTR,MENOBJ,CONT,TEMP
 D CLEPAG^%VVIDEO,NORM^%VVIDEO,^%VZEATT
 
 D ISESS^%SDEANTI(OBJ,VERS,.GLOTYP,.TEMPREF,.GLOBJ,.GLCOMP,.GLTEXT,.TEMPO)
 
 S UCONT="",ROUTREAF="",DH=78
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 
 S CONT=$$CONCAS^%QZCHAD(TEMP,"CONTEXTE") K @(CONT)
 D INITCONT(CONT),^%SDOMAT(OBJ,VERS)
 S %PORT=^TABIDENT(WHOIS,"ECRGRA"),%TERM=^TABIDENT(WHOIS,"TYPECR")
 
 D:(%PORT=0)!(%PORT=$I) CLEPAG^%VVIDEO,^%PBPZGRA
 S %FONC="INIT" D ^%PBPZ
 S %FONC="INIT.DESSIN" D ^%PBPZ
 S %FONC="CLEAR" D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 D ^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 
 S MENOBJ=$$CONCAS^%QZCHAD(TEMP,"MENOBJ") K @(MENOBJ)
 D MENU(MENOBJ)
DIAL 
 D AFF^%SDUMEN(0,0,MENOBJ)
 D SEL^%SDUMEN(MENOBJ,.ADR,.CTR)
 I (CTR="A")!(CTR="F") G FIN
 I CTR="R" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G DIAL
 G @ADR
FIN 
 
 D ESESS^%SDEANTI(GLOTYP,TEMPREF)
 
 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF
 
 K @($$ADR^%SDOMAT),@($$ADR2^%SDOMAT)
 
 K @(TEMP)
 
 
 D MAJVAR^%SDEGES3(OBJ,VERS)
 Q
 
 
ELEM 
 D ^%SDEDEF(OBJ,VERS,%PORT,%TERM,CONT)
 D EFFBAS^%SDUMEN G DIAL
TRANS 
 D ^%SDOTRSF(OBJ,VERS,%PORT,%TERM)
 D EFFBAS^%SDUMEN G DIAL
CONT 
 D ALFA^%SDEDEF
 D ^%VZCDB($$^%QZCHW("Contexte de l'objet"),0)
 
 S PAS=$$PAS^%SDOCNT(OBJ,VERS)
 S XORIG=$$COOR^%SDOCNT(OBJ,VERS,"X")
 S YORIG=$$COOR^%SDOCNT(OBJ,VERS,"Y")
 D ^%SDOCNT(OBJ,VERS,0)
 I PAS'=$$PAS^%SDOCNT(OBJ,VERS) D MSG^%VZEATT($$^%QZCHW("mise a jour de la matrice des coordonnees")),^%SDOMAT(OBJ,VERS)
 D GRAPH^%SDEDEF
 I %TERM="VT-340" D ^%SDOAFFI(OBJ,VERS,%PORT,%TERM) G CONT1
 I (XORIG'=$$COOR^%SDOCNT(OBJ,VERS,"X"))!(YORIG'=$$COOR^%SDOCNT(OBJ,VERS,"Y")) D ^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
CONT1 K PAS,XORIG,YORIG
 G DIAL
MOD 
 D ^%SDOMOD(OBJ,VERS,%PORT,%TERM)
 D EFFBAS^%SDUMEN G DIAL
INT 
 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF
 D SAUV
 
 
 D MAJVAR^%SDEGES3(OBJ,VERS)
 D EXT^%SDOINTP(OBJ,VERS)
 D RESTOR
 D CLEPAG^%VVIDEO,^%PBPZGRA,^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 G DIAL
 
INIT 
 
 S X=2050,Y=1550 D ORIG^%PBP5EC2(X,Y)
 
 S XMIN=200,XMAX=3900
 S YMIN=200,YMAX=2900
 Q
 
MENU(MENOBJ) 
 S @MENOBJ@(1)=$$^%QZCHW("Elements")_"^"_"ELEM"
 S @MENOBJ@(2)=$$^%QZCHW("Transformations")_"^"_"TRANS"
 S @MENOBJ@(3)=$$^%QZCHW("Contexte")_"^"_"CONT"
 S @MENOBJ@(4)=$$^%QZCHW("Modification")_"^"_"MOD"
 S @MENOBJ@(5)=$$^%QZCHW("INTERPRETER")_"^"_"INT"
 Q
 
INITCONT(CONT) 
 S @CONT@("EPAISSEUR")=$$EPAISSEUR^%SDXUTIL
 S @CONT@("TAILLE")=$$TAILLE^%SDXUTIL
 S @CONT@("TRAIT")=""""_$$TRAIT^%SDXUTIL_""""
 S @CONT@("VIS")=""""_$$LIBELLE^%SDXUTIL_""""
 S @CONT@("ECHELLE")=$$ECHELLE^%SDXUTIL
 S @CONT@("ORIENTATION")=$$ORIENT^%SDXUTIL
 
 S @CONT@("EXT")="""INTERIEUR"""
 S @CONT@("SIMP")="""SIMPLE"""
 Q
 
SAUV 
 D ^%VZEATT
 D MEM^%QCAMEM
 I '(DTM) K (QUI,WHOIS,OBJ,VERS,%PROGEX) G FSAUV
 N TEMPINT
 S TEMPINT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"KEXCLU") K @(TEMPINT)
 F I="QUI","WHOIS","OBJ","VERS","%PROGEX","TEMPINT" S @TEMPINT@(I)=""
 D KEXMEM^%QCAMEM(TEMPINT)
 K @(TEMPINT)
FSAUV 
 D CURRENT^%IS,VARSYS^%QCSAP
 Q
 
RESTOR 
 D ^%VZEATT
 D RMEM^%QCAMEM
 Q

