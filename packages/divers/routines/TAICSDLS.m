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

;TAICSDLS^INT^1^59547,74869^0
TAICSDLS ;
 
 
 
 
 N FEN,TEMP,CHOIXSDL,SDL
 D CLEPAG^%VVIDEO
 D ^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(TEMP)
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S CHOIXSDL=$$CONCAS^%QZCHAD(TEMP,"SDL")
 D PFEN
AFF2 K @(CHOIXSDL)
 D REAFF
 D ENS^%QUAPAGM(CHOIXSDL)
 G:'($D(@CHOIXSDL)) ENDACT
 D POCLEPA^%VVIDEO
 G:'($$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez vous la suppression des suivis ?"))) AFF2
 S SDL="" D POCLEPA^%VVIDEO
BSDL S SDL=$O(@CHOIXSDL@(SDL))
 G:SDL="" AFF2
 W "."
 D SX^%QSGESTI("SUIVI.DES.LANCEMENTS",SDL)
 G BSDL
 
ENDACT D END^%QUAPAGM
 K @(TEMP)
 Q
 
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM
 Q
CADL D ^%VZCD(0,39,0,2,0,0,"SUIVI.DES.LANCEMENTS")
 Q
CADLL D CARSP^%VVIDEO(40,0,3,$S(SUB="C-IBM PC":38,1:40),1)
 S LCOUR=WHOIS_" sur "_$I
 S DX=41,DY=1 X XY W $J("",$S(SUB="C-IBM PC":35,1:38))
 S DX=60-($L(LCOUR)\2),DY=1 X XY D REV^%VVIDEO X XY W LCOUR D NORM^%VVIDEO
 Q
 
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q
 
PFEN S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="SUIVI.DES.LANCEMENTS",@FEN@("A")=$$LISTIND^%QSGEST6("SUIVI.DES.LANCEMENTS"),@FEN@("ATT")=1,@FEN@("AFF")="REAFI^TAICSDLS"
 S @FEN@("LR")=13
 D IFEN(FEN) Q
 
IFEN(FEN) 
 S @FEN@("C",1,"T")=$$^%QZCHW("Saisie"),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="DATE.DE.SAISIE"
 S @FEN@("C",2,"T")=$$^%QZCHW("Quantite"),@FEN@("C",2,"L")=10,@FEN@("C",2,"C")="QUANTITE.A.FABRIQUER"
 S @FEN@("C",3,"T")=$$^%QZCHW("Objet TOTEM"),@FEN@("C",3,"L")=20,@FEN@("C",3,"C")="SOURCE"
 S @FEN@("C",4,"T")=$$^%QZCHW("Date recup"),@FEN@("C",4,"L")=12,@FEN@("C",4,"C")="DATE.RECUPERATION.TOTEM"
 S @FEN@("ECRAN")="CADR^TAICSDLS",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 Q
 ;

