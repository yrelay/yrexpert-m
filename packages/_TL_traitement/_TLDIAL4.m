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

;%TLDIAL4^INT^1^59547,74028^0
TLDIAL4 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AIDE2(ICI,NBRE,INTERNE,TRES) 
 G VERS1
 
VERS1 
 N TRT
 D INIT^%QUCHOIP("^[QUI]TTL",1,"",0,3,80,19),AFF^%QUCHOIP
 I NBRE'=1 D ^%QUCHOYP(TRES) G FINCHX
 S TRT=$$UN^%QUCHOIP
 S:TRT'="" @TRES@(TRT)=""
FINCHX D END^%QUCHOIP
 Q
 
VERS2 
 N LAR,ITRT,TR,TEMP
 I INTERNE&$D(LISTOK),LISTOK=1 G NOTCAL
 D ^%VZEATT
 S LAR=$S(IBMPC:1,1:79)
 S TITRE=" Traitement                Commentaire                     Date.Modif AnalyseOK"
 K ^[QUI]QX($J)
 D CONSTAB(1) S RESINI=$$INI^%QUCHOI4(1,"",0,4,LAR,17,TITRE,1,0),LISTOK=1
NOTCAL D AFF^%QUCHOI4(1)
 I NBRE'=1 G CHXMUL
 S TR=$$UN^%QUCHOI4(1)
 I TR="" S @TRES="" Q
 S TR=^[QUI]QX($J,1,"R",TR)
 S @TRES@(^[QUI]QX($J,1,"T",TR,1))=""
 Q
CHXMUL 
 D ^%QUCHOYP(TRES)
 Q
CONSTAB(P) 
 N TTT,ITTT
 S ^[QUI]QX($J,P,"LC",1)=24
 S ^[QUI]QX($J,P,"LC",2)=34
 S ^[QUI]QX($J,P,"LC",3)=10
 S ^[QUI]QX($J,P,"LC",4)=5
 S TTT=""
 F ITTT=1:1 S TTT=$O(^[QUI]TTL(TTT)) Q:(TTT="")!(TTT="z")  D CONSLIG
 Q
CONSLIG 
 S ^[QUI]QX($J,P,"T",ITTT,1)=TTT
 S ^[QUI]QX($J,P,"T",ITTT,2)=$S($D(^[QUI]TTL(TTT,1,1)):^[QUI]TTL(TTT,1,1),1:"")
 S ^[QUI]QX($J,P,"T",ITTT,3)=$S($D(^[QUI]TTL(TTT,"DATE.DERNIERE.MODIFICATION")):^[QUI]TTL(TTT,"DATE.DERNIERE.MODIFICATION"),1:"")
 S ^[QUI]QX($J,P,"T",ITTT,4)=$S($D(^[QUI]TTL(TTT,"ANALYSE.CORRECTE")):^[QUI]TTL(TTT,"ANALYSE.CORRECTE"),1:0)
 Q
 
VERS3 
 
 N FEN
 S FEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LISTE") K @(FEN)
 S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="TRAITEMENT",@FEN@("A")=$$LISTIND^%QSGEST6("TRAITEMENT")
 S @FEN@("ATT")=1
 S @FEN@("C",1,"T")=$$^%QZCHW("Commentaire"),@FEN@("C",1,"L")=30,@FEN@("C",1,"C")="ENTETE",@FEN@("C",1,"I")=1
 S @FEN@("C",2,"T")=$$^%QZCHW("Date.modif"),@FEN@("C",2,"L")=10,@FEN@("C",2,"C")="DATE.DERNIERE.MODIFICATION"
 S @FEN@("C",3,"T")=$$^%QZCHW("Regles"),@FEN@("C",3,"L")=6,@FEN@("C",3,"C")="NOMBRE.DE.REGLES"
 S @FEN@("C",4,"T")=$$^%QZCHW("Analyse.correcte"),@FEN@("C",4,"L")=10,@FEN@("C",4,"C")="ANALYSE.CORRECTE"
 S @FEN@("PADLINE")="POCLEPA^%VVIDEO"
 S:ICI="TLDIALO" @FEN@("AFF")="REAFI^%QS0DP"
 S:ICI="TLMENUG" @FEN@("AFF")="REAFI^%TLMENUG"
 D INIT^%QUAPAGM(FEN),AFFICH^%QUAPAGM
 S TRT=$$UN^%QUAPAGM
 D END^%QUAPAGM
 Q
 ;

