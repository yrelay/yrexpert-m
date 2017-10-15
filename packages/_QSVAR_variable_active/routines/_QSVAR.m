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

;%QSVAR^INT^1^59547,73883^0
QSVAR ;
 
 
 
 
 
 
 N ADR,ADRES,CONTR,CTR,FEN,LCOUR,MEN,MENU,MES,TEMP,TYP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S @MENU="23^10^79"
 S @MENU@(1)=$$^%QZCHW("prologue")_"^AVANT"
 S @MENU@(1,"COM")=$$^%QZCHW("variables actives a activer avant la mise a jour de la base")
 S @MENU@(2)=$$^%QZCHW("epilogue")_"^APRES"
 S @MENU@(2,"COM")=$$^%QZCHW("variables actives a activer apres la mise a jour de la base")
ACTU D CLEPAG^%VVIDEO,^%VQUIKMN(0,80,22,MENU,.ADR,.CTR) G:(CTR="A")!(CTR="F") END
 G:ADR'="" @ADR G ACTU
END K @(TEMP) Q
AVANT D MENU("VARACTP") G ACTU
APRES D MENU("VARACTE") G ACTU
 
MENU(QU) 
 S TYP=$S(QU="VARACTP":"AVANT",1:"APRES")
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MENUVAR") K @(MEN)
 S @MEN="21^10^79"
 S @MEN@(1)=$$^%QZCHW("entrer")_"^ENTREE"
 S @MEN@(1,"COM")=$$^%QZCHW("entrer dans la fenetre")
 S @MEN@(2)=$$^%QZCHW("creer")_"^CREAT"
 S @MEN@(2,"COM")=$$^%QZCHW("creer une variable active")
 S @MEN@(3)=$$^%QZCHW("modifier")_"^MODIF"
 S @MEN@(3,"COM")=$$^%QZCHW("modifier une variable active")
 S @MEN@(4)=$$^%QZCHW("consulter")_"^CONSU"
 S @MEN@(4,"COM")=$$^%QZCHW("consulter une variable active")
 S @MEN@(5)=$$^%QZCHW("dupliquer")_"^DUPLI"
 S @MEN@(5,"COM")=$$^%QZCHW("dupliquer une variable active")
 S @MEN@(6)=$$^%QZCHW("supprimer")_"^SUPPR"
 S @MEN@(6,"COM")=$$^%QZCHW("supprimer des variables actives")
 S @MEN@(7)="+^PLUS",@MEN@(7,"EQU")="="
 S @MEN@(7,"COM")=$$^%QZCHW("avancer d'une page")
 S @MEN@(8)="-^MOINS",@MEN@(8,"EQU")="_"
 S @MEN@(8,"COM")=$$^%QZCHW("reculer d'une page")
 S @MEN@(9)=$$^%QZCHW("page")_"^PAGE"
 S @MEN@(9,"COM")=$$^%QZCHW("changer de page")
 S @MEN@(10)=$$^%QZCHW("repere")_"^REPER"
 S @MEN@(10,"COM")=$$^%QZCHW("consulter le repere des pages")
 S @MEN@(11)=$$^%QZCHW("reanalyser")_"^RANAL"
 S @MEN@(11,"COM")=$$^%QZCHW("reanalyser des variables actives")
 S @MEN@(12)=$$^%QZCHW("imprimer")_"^IMPRI"
 S @MEN@(12,"COM")=$$^%QZCHW("imprimer des variables actives")
 S LCOUR="" D PFEN
AFF2 D REAFF
ACT2 S DX=0,DY=22 D CLEBAS^%VVIDEO
ACTS D ^%VQUIKMN(0,80,22,MEN,.ADRES,.CONTR) G:CONTR="R" AFF2 G:(CONTR="A")!(CONTR="F") ENDACT
 G:ADRES'="" @ADRES G ACTS
ENDACT D END^%QUAPAGM Q
ENTREE D GO^%QUAPAGM G ACT2
RANAL S R=$$ANAL^%QSVAR2(TYP) G AFF2:R=2,ACT2:1
CREAT S R=$$CRE^%QSVAR2(TYP) G AFF2:R=2,ACT2:1
CONSU S R=$$AFF^%QSVAR2(TYP) G AFF2:R=2,ACT2:1
MODIF S R=$$MOD^%QSVAR2(TYP) G AFF2:R=2,ACT2:1
DUPLI S R=$$DUP^%QSVAR2(TYP) G AFF2:R=2,ACT2:1
SUPPR S R=$$SUP^%QSVAR2(TYP) G AFF2:R=2,ACT2:1
IMPRI S R=$$IMP^%QSVAR2(TYP) G AFF2:R=2,ACT2:1
PLUS D PLUS^%QUAPAGM G ACT2
MOINS D MOINS^%QUAPAGM G ACT2
PAGE D PAGE^%QUAPAGM G ACT2
REPER D REPER^%QUAPAGM G ACT2
 
PFEN S FEN("X")=0,FEN("Y")=3,FEN("L")=80,FEN("H")=19
 S FEN("B")=QU,FEN("A")=$$LISTIND^%QSGEST6(QU)
 S FEN("ATT")=1,FEN("AFF")="REAFI^%QSVAR"
 S FEN("C",1,"T")=$$^%QZCHW("date"),FEN("C",1,"L")=8,FEN("C",1,"C")="DATE.CREATION"
 S FEN("C",2,"T")=$$^%QZCHW("heure"),FEN("C",2,"L")=5,FEN("C",2,"C")="HEURE.CREATION"
 S FEN("C",3,"T")=$$^%QZCHW("auteur"),FEN("C",3,"L")=6,FEN("C",3,"C")="AUTEUR"
 S FEN("C",4,"T")=$$^%QZCHW("site"),FEN("C",4,"L")=5,FEN("C",4,"C")="SITE"
 S FEN("C",5,"T")=$$^%QZCHW("commentaire"),FEN("C",5,"L")=32,FEN("C",5,"C")="COMMENTAIRE"
 S FEN("ECRAN")="CADR^%QSVAR",FEN("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM("FEN")
 Q
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("VARIABLES ACTIVES EN "_$S(TYP="AVANT":"PROLOGUE",1:"EPILOGUE"))) Q
CADLL S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I
 D CARSP^%VVIDEO(40,0,3,$S(IBMPC&MODTM:38,1:40),1)
 S DX=41,DY=1 X XY W $J("",$S(IBMPC&MODTM:35,1:38))
 S DX=60-($L(LCOUR)\2),DY=1 X XY D REV^%VVIDEO W LCOUR D NORM^%VVIDEO Q

