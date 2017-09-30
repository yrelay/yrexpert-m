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

;%TLPRINT^INT^1^59547,74030^0
TLPRINT ;
 
 
 
 
 
 
 
 
 N ADR,CTR,FEN,LCOUR,MENU,TEMP,ENSEM,INI
 S INI=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S ENSEM=$$CONCAS^%QZCHAD(TEMP,"ENSTRT")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"LISTE")
 S @MENU="23^10^79"
 S @MENU@(1)=$$^%QZCHW("Selection")_"^SELEC"
 S @MENU@(1,"COM")=$$^%QZCHW("Impression apres selection des traitements ")
 S @MENU@(2)=$$^%QZCHW("Tous")_"^TOUS"
 S @MENU@(2,"COM")=$$^%QZCHW("Impression de tous les traitements ")
 D CLEPAG^%VVIDEO,REAFI
ACTU S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(20,80,22,MENU,.ADR,.CTR) G:(CTR="A")!(CTR="F") END
 G:ADR'="" @ADR G ACTU
 
END I INI=1 D END^%QUAPAGM
 Q
 
TOUS 
 D IMPRI("^[QUI]TTL")
 G ACTU
 
SELEC 
 I '($D(^[QUI]TTL)) D ^%VZEAVT($$^%QZCHW("Il n'existe plus de traitements")) G END
 D AIDE2^%TLDIAL4("IMPRESSION","N",1,ENSEM)
 D:$D(@ENSEM)>9 IMPRI(ENSEM)
 G ACTU
 S LCOUR="" D:INI=0 PFEN
AFF2 D REAFF
ACT2 D ENS^%QUAPAGM(ENSEM)
 G:'($D(@ENSEM)) ACTU
 D IMPRI(ENSEM)
 G ACTU
 
PFEN 
 S INI=1
 S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="TRAITEMENT",@FEN@("A")=$$LISTIND^%QSGEST6("TRAITEMENT")
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%TLPRINT"
 S @FEN@("ECRAN")="CADR^%TLPRINT",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 S @FEN@("C",1,"T")=$$^%QZCHW("Commentaire"),@FEN@("C",1,"L")=30,@FEN@("C",1,"C")="ENTETE"
 S @FEN@("C",2,"T")=$$^%QZCHW("Date.modif"),@FEN@("C",2,"L")=10,@FEN@("C",2,"C")="DATE.DERNIERE.MODIFICATION"
 S @FEN@("C",3,"T")=$$^%QZCHW("Regles"),@FEN@("C",3,"L")=6,@FEN@("C",3,"C")="NOMBRE.DE.REGLES"
 S @FEN@("C",4,"T")=$$^%QZCHW("Analyse.correcte"),@FEN@("C",4,"L")=10,@FEN@("C",4,"C")="ANALYSE.CORRECTE"
 D INIT^%QUAPAGM(FEN)
 Q
 
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("IMPRESSION DES TRAITEMENTS"))
CADLL S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I
 D CARSP^%VVIDEO(40,0,3,40,1) S DX=41,DY=1 X XY W $J("",38)
 S DX=60-($L(LCOUR)\2),DY=1 D REV^%VVIDEO X XY W LCOUR
 D NORM^%VVIDEO Q
 
 
 
IMPRI(LISTE) D POCLEPA^%VVIDEO
 Q:$$MES^%VZEOUI($$^%QZCHW("Confirmez-vous l'impression ? "),"O")'=1
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours ... ")
 S I=""
 F %I=0:0 S I=$O(@LISTE@(I)) Q:(I="")!(I="z")  D POCLEPA^%VVIDEO W I D IMPR^%TLIMPRI(I)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Impression terminee ... ") H 3
 Q

