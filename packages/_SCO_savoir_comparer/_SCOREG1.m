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

;%SCOREG1^INT^1^59547,73888^0
SCOREG1 ;
 
 
 
 
 
 
AJ 
 N ADR S ADR="AJ1^%SCOREG1"
 G INIT
AJ1 
 S MODE="AJOUT"
 D SAISIE
 I (CTR="A")!(CTR="F") Q
 I DOM="" Q
 I $D(^[QUI]SCOMPREG(DOM,"EGALITE")) D ^%VZEAVT($$^%QZCHW("regles deja existantes")) G AJ1
 D ^%QUOLST(IN)
 D MAJREG
 G AJ1
CMS 
 N ADR S ADR="CMS1^%SCOREG1"
 G INIT
CMS1 
 S MODE="CMS"
 D SAISIE
 I (CTR="A")!(CTR="F") Q
 I DOM="" Q
 D REMPLIR
 D ^%QUOLST(IN)
 D MAJREG
 G CMS1
 
ENTETE 
 D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(5,2,3,70,1)
 S DX=60,DY=2 X XY D REV^%VVIDEO
 W $$^%QZCHW($S(MODE="AJOUT":"ajout",1:"modification")) D NORM^%VVIDEO
 Q
 
SAISIE 
 D ENTETE S DX=0,DY=3 X XY
 D LIRE2^%VREAD($$^%QZCHW("Domaine")_" : ","",8,RM-10,DY+1,DY-1,"","$$UCONT^%SCOREG1",.CTR,.DOM)
 Q
 
UCONT(Y1,REAF) 
 S REAF=0
 I Y1="" Q 1
 I Y1="?" G CHOIX
 I MODE="AJOUT" Q 1
 I '($D(^[QUI]SCOMPREG(Y1))) D ^%VZEAVT($$^%QZCHW("aucune regle")) Q 0
 Q 1
 
CHOIX 
 I MODE="AJOUT" D INIT^%QUCHOIP("^[QUI]SCOMDOM","",1,5,7,70,14)
 I MODE'="AJOUT" D INIT^%QUCHOIP("^[QUI]SCOMPREG","",1,5,7,70,14)
 D AFF^%QUCHOIP
 S Y1=$$UN^%QUCHOIP
 D END^%QUCHOIP
 Q:Y1="" 0
 Q 1
INIT 
 N TMP1 S TMP1=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TMP1)
 N CTR,DOM,RM,MODE,ROUTREEAF S RM=80,ROUTREAF="REAFI2^%SCOREG1"
 N REGLE S REGLE=$$CONCAS^%QZCHAD(TMP1,"REGLES")
 N REGLE2 S REGLE2=$$CONCAS^%QZCHAD(TMP1,"REGLE2S")
 N IN S IN=$$CONCAS^%QZCHAD(TMP1,"PARAM")
 S @IN@("X")=5,@IN@("Y")=7,@IN@("L")=70,@IN@("H")=14,@IN@("TI")=" "_$$^%QZCHW("Egalite stricte")_" "
 S @IN@("A")=REGLE
 S @IN@("AFF")="REAFI^%SCOREG1"
 S @IN@("LI",1,"T")=$$^%QZCHW("ATTRIBUT")
 S @IN@("LI",1,"X")=3
 S @IN@("LI",1,"U")="LEXIQ^%SCOREG1"
 S @IN@("LI",2,"T")=$$^%QZCHW("INDICE")
 S @IN@("LI",2,"X")=50
 S @IN@("LI",2,"U")="INDIC^%SCOREG1"
 G @ADR
 
REMPLIR 
 
 
 
 
 N AT,OR,V1,LIG S LIG=0 K @(REGLE),@(REGLE2)
 S AT=""
LOOPAT S AT=$O(^[QUI]SCOMPREG(DOM,"EGALITE",AT)) Q:AT=""
 S OR=""
LOOPOR S OR=$O(^[QUI]SCOMPREG(DOM,"EGALITE",AT,OR)) G:OR="" LOOPAT
 S LIG=LIG+1,@REGLE@(LIG)=AT_"^"_OR,@REGLE2@(AT,OR)=""
 G LOOPOR
 
MAJREG 
 
 
 N AT,OR,LIG
 S LIG=""
LOOPL S LIG=$O(@REGLE@(LIG))
 G:LIG="" KILL
 S AT=$P(@REGLE@(LIG),"^",1),OR=$P(@REGLE@(LIG),"^",2)
 I $D(^[QUI]SCOMPREG(DOM,"EGALITE",AT,OR)) K @REGLE2@(AT,OR) G LOOPL
 S ^[QUI]SCOMPREG(DOM,"EGALITE",AT,OR)=""
 S ^[QUI]SCOMPREG(DOM,"EGALITE",AT,OR,"MALUS")=0 K @REGLE2@(AT,OR)
 G LOOPL
KILL 
 S AT="" F I=1:1 S AT=$O(@REGLE2@(AT)) Q:AT=""  S OR="" F I=0:0 S OR=$O(@REGLE2@(AT,OR)) Q:OR=""  K ^[QUI]SCOMPREG(DOM,"EGALITE",AT,OR)
 Q
 
LEXIQ 
 
 I Y1="" S OK=0 Q
 N M,PCH S OK=1
 S OK=$$LEX^%LXSTOCK(Y1,.M) I OK=1 S Y1=M Q
 I OK=0 D ^%VZEAVT(Y1_$$^%QZCHW(" est inconnu au lexique"))
 I OK>1 D ^%VZEAVT(Y1_$$^%QZCHW(" est ambigu au lexique"))
 S PCH=Y1 D LEXIQ^%LXSTOCK(ROUTREAF) S M="",OK=$$LEX^%LXSTOCK(Y1,.M)=1
FLEXIQ S:OK=1 Y1=M
 Q
 
INDIC 
 S OK=1
 I Y1="" S Y1=1
 Q
 
REAFI 
 D ENTETE S DX=8,DY=3 X XY W $$^%QZCHW("Domaine")_" : "_DOM
 Q
REAFI2 
 
 D REAFI,AFF^%QUOLST2
 Q

