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

;%QSGGRAP^INT^1^59547,73882^0
QSGGRAP ;
 
 
 
 
 
INITIAL 
 N PROT,I,%I
 K ^LTREQU($J) S PROT=0,I=""
 F %I=0:0 S I=$O(^[QUI]QUERY2("L0","SOURCE",I)) Q:I=""  S ^LTREQU($J,I)=""
 S ^LTREQU($J,"REQUETES")=""
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 I UC="VAX" S FEN="FEN1"
 E  S FEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"FEN")
 S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=79,@FEN@("H")=19
 S @FEN@("LR")=12
 S @FEN@("B")="L0",@FEN@("A")=$$LISTIND^%QSGEST6("L0"),@FEN@("ATT")=1,@FEN@("AFF")="REAFF^%QSGGRAP"
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD",@FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=9,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE",@FEN@("C",4,"L")=23,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="CADG^%QSGGRAP",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 Q
 
CADG D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,0,0,"REPRESENTATION GRAPHIQUE: "_DESSIN) Q
REAFF D CADG,AFFICH^%QUAPAGM Q
ENDACT D:'(INI) END^%QUAPAGM K @(TEMP) Q
 
 
 
 
 
 
GRAPH(DESSIN) 
 N REP,UC,FEN,LISTE,FEN1,AF,INI,RESUL
 D CADG
 S DX=0,DY=23 X XY
 S REP=$$MES^%VZEOUI($$^%QZCHW("Necessite 1 ecran / 1 imprimante graphique. Continuons nous ?"),"N") Q:(REP=-1)!(REP=0)
 D ^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 D INITIAL
 S INI=0
BGRA D CADG,AFFICH^%QUAPAGM
BGRA2 S LISTE=$$UN^%QUAPAGM
 G:LISTE="" ENDACT
 D SAIS^%QS0G(LISTE,.RESUL) G:'($D(RESUL)) BGRA
 D GRAPH^%QS0G(DESSIN)
 G BGRA
 
 
 
HISTCRE 
 N ADR,CTR,FEN,UC,TEMP,TITI,R,FEN1,TITI1,AFF,INI
 D CADCH
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S INI=1,AFF=1
 I UC="VAX" S TITI="TITI1"
 E  S TITI=$$CONCAS^%QZCHAD(TEMP,"TITI")
 D TITI^%QS0DPG
BMEN1 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,79,22,TITI,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") ENDACT
 I ADR="" D ^%VSQUEAK G BMEN1
 D INITIAL
 S INI=0
 D CADCH,AFFICH^%QUAPAGM
 G @("C"_ADR)
 
BHICR I AFF D CADCH
 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,79,22,TITI,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") ENDACT
 I ADR="" D ^%VSQUEAK G BHICR
 I AFF D AFFICH^%QUAPAGM
 S AFF=0
 G @("C"_ADR)
CGRAPH1 S R=$$^%QS0G3,AFF=1 G BHICR
CGRAPH2 S R=$$^%QS0G5,AFF=1 G BHICR
CGRAPH3 S R=$$^%QS0G4,AFF=1 G BHICR
 
CADCH D CLEPAG^%VVIDEO,^%VZCD(0,79,0,2,0,0,$$^%QZCHW("CREATION D'UN HISTOGRAMME")) Q
 
 
 
HISTMOD 
 N ADR,CTR,FEN,MENUH,HIS,FEN1,TEMPO,TEMP,X,ZZ,%T,ENS,INI,AFFI
 S (AFFI,INI)=1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 D MENUH
GRAPHI D CHOIX(.HIS,.CTR)
 G:(CTR="A")!(CTR="F") FINMH
 K %T,ADR,CTR,ENS
 D VISU^%HXIHIT2($$ADRHIS^%HXIHITU,HIS) G GRAPHI
 
FINMH D:INI'=1 FINLH K @(TEMP)
 Q
 
FINLH D CLEPAG^%VVIDEO,END^%QUCHOI4(ZZ)
 K ^[QUI]QX($J)
 Q
 
MENUH 
 S TEMPO=$$CONCAS^%QZCHAD(TEMP,"HISTO")
 S MENUH=$$CONCAS^%QZCHAD(TEMPO,"MENUH")
 K @(TEMPO)
 S @MENUH="21^10^79"
 S @MENUH@(1)=$$^%QZCHW("Consulter/Modifier")_"^VISUH",@MENUH@(1,"COM")=$$^%QZCHW("Visualisation d'un histogramme existant")
 S @MENUH@(2)=$$^%QZCHW("Supprimer")_"^SUPPH",@MENUH@(2,"COM")=$$^%QZCHW("Suppression d'un histogramme")
 Q
 
INIHIS D ^%VZEATT
 I INI=2 D END^%QUCHOI4(ZZ) K ^[QUI]QX($J),ZZ
 S INI=0
 S ZZ=1,%T=10,%T(1)=12,%T(2)=12,%T(3)=11,%T(4)=11,%T(5)=11,%T(6)=11,%T(7)=2,%T(8)=2,%T(9)=2,%T(10)=2
 D CONSTAB^%QS0DPG(ZZ,"%T")
 S X=$$INI^%QUCHOI4(1,"",0,2,LAR,19,"",ZZ,0)
 Q
 
CHOIX(HIS,CTR) 
 N LAR
 S LAR=$S(SUB="C-IBM PC":77,1:79)
 D CLEPAG^%VVIDEO,^%VZCD(0,79,0,2,0,0,$$^%QZCHW("C\M\S D'UN HISTOGRAMME"))
ACTH S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,79,22,MENUH,.ADR,.CTR)
 Q:(CTR="F")!(CTR="A")
 I ADR="" D ^%VSQUEAK G ACTH
 D:INI'=0 INIHIS
 I AFFI D CLEPAG^%VVIDEO,TIT^%QS0DPG,AFF^%QUCHOI4(ZZ)
 S AFFI=0
 G @ADR
VISUH 
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH
 S X=^[QUI]QX($J,ZZ,"R",X)
 S HIS=^[QUI]QX($J,ZZ,"T",X,1)
 S AFFI=1
 Q
SUPPH 
 S ENS=$$CONCAS^%QZCHAD(TEMPO,"ENS") K @(ENS)
 D ^%QUCHOYP(ENS) G:'($D(@ENS)) ACTH
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de ces histogrammes ? "))'=1 G ACTH
 S HIS=""
 F %T=1:1 S HIS=$O(@ENS@(HIS)) Q:HIS=""  D SUP^%HXIHITU(^[QUI]QX($J,ZZ,"T",^[QUI]QX($J,ZZ,"R",HIS),1))
 S INI=2
 D INIHIS,CLEPAG^%VVIDEO,TIT^%QS0DPG,AFF^%QUCHOI4(ZZ)
 S AFFI=0
 G ACTH

