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

;%QMDAGES^INT^1^59547,73877^0
QMDAGES ;
 
 
 
 
 
 N A,ABENDSCR,ADR,AFRESU,ATR,CTR,FEN,GLO,LCOUR,MEN,PATOUCH,R,RESUL,SCR,TEMP,TEMP1,Y1
 S TEMP=$$TEMP^%INCOIN("TEMP1",$P($ZPOS,"^",2)),MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN"),GLO=$$CONCAS^%QZCHAD(TEMP,"GLOBAL")
 I '($D(^RQSGLU("QMDA"))) D ^%QMDAINI
 
 K @(TEMP)
 S @MEN="21^10^79"
 S @MEN@(1)=$$^%QZCHW("Entree")_"^ENTREE",@MEN@(1,"COM")=$$^%QZCHW("Entrer dans la fenetre")
 S @MEN@(2)=$$^%QZCHW("Creation")_"^CREAT",@MEN@(2,"COM")=$$^%QZCHW("Creer un attribut")
 S @MEN@(3)=$$^%QZCHW("Modification")_"^MODIF",@MEN@(3,"COM")=$$^%QZCHW("Modifier un attribut")
 S @MEN@(4)=$$^%QZCHW("Suppression")_"^SUPPR",@MEN@(4,"COM")=$$^%QZCHW("Supprimer un attribut")
 S @MEN@(5)=$$^%QZCHW("Impression")_"^IMPRIM",@MEN@(5,"COM")=$$^%QZCHW("Imprimer les attributs")
 S @MEN@(6)=$$^%QZCHW("Formats")_"^"_"EDIT",@MEN@(6,"COM")=$$^%QZCHW("Editer les formats")
 S @MEN@(7)="+^PLUS",@MEN@(7,"EQU")="=",@MEN@(7,"COM")=$$^%QZCHW("Avancer d'une page")
 S @MEN@(8)="-^MOINS",@MEN@(8,"EQU")="_",@MEN@(8,"COM")=$$^%QZCHW("Reculer d'une page")
 S @MEN@(9)=$$^%QZCHW("Page")_"^PAGE",@MEN@(9,"COM")=$$^%QZCHW("Changer de page")
 D INIT,PFEN
AFF2 D REAFF
ACT2 S DX=0,DY=22 D CLEBAS^%VVIDEO
ACTS D ^%VQUIKMN(0,80,22,MEN,.ADR,.CTR) G:CTR="R" AFF2
 G:(CTR="A")!(CTR="F") END
 G:ADR'="" @ADR G ACTS
END D END^%QUAPAGM K @(TEMP) Q
 
ENTREE D GO^%QUAPAGM G ACT2
PLUS D PLUS^%QUAPAGM G ACT2
MOINS D MOINS^%QUAPAGM G ACT2
PAGE D PAGE^%QUAPAGM G ACT2
CREAT D CREA^%QMDAGE2,KILLREM^%QMDAUC G AFF2
MODIF S R=$$MOD^%QMDAGE2 D KILLREM^%QMDAUC G AFF2:R=2,ACT2:1
SUPPR S R=$$SUP^%QMDAGE2 D KILLREM^%QMDAUC G AFF2:R=2,ACT2:1
IMPRIM D IMPR^%QMDAGE2 G ACT2
EDIT D IMPF^%QMDAGE2 G ACT2
 
 
 
INIT 
 N %I,G,I
 K @(GLO)
 S G=$$LISTIND^%QSGEST6("ATTRIBUT"),I=""
 F %I=0:0 S I=$O(@G@(I)) Q:I=""  I $$AT^%QMDAGE2(I,"TYPE")="DATE" S @GLO@(I)=""
 Q
 
PFEN 
 S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="ATTRIBUT",@FEN@("A")=GLO,@FEN@("ATT")=1,@FEN@("AFF")="REAFI^%QMDAGES"
 S @FEN@("C",1,"T")=$$^%QZCHW("Attribut"),@FEN@("C",1,"L")=10,@FEN@("C",1,"C")="ATTRIBUT"
 S @FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=20,@FEN@("C",2,"C")="REPERTOIRE"
 S @FEN@("C",3,"T")=$$^%QZCHW("Libelle format"),@FEN@("C",3,"L")=30,@FEN@("C",3,"C")="LIBELLE.FORMAT"
 S @FEN@("ECRAN")="REAFF^%QMDAGES",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN) Q
 
 
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM
 Q
REAFI D CADL,CADLL Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("ATTRIBUTS DE TYPE DATE")) Q
CADLL D CARSP^%VVIDEO(40,0,3,$S(IBMPC&MODTM:38,1:40),1)
 S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I,DX=41,DY=1
 X XY W $J("",$S(IBMPC&MODTM:35,1:38))
 S DX=60-($L(LCOUR)\2),DY=1 X XY D REV^%VVIDEO
 X XY W LCOUR D NORM^%VVIDEO Q

