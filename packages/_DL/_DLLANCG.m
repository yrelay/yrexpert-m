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

;%DLLANCG^INT^1^59547,73868^0
DLLANCG ;
 
 
 
 
 
 
 N ADR,CTR,FEN,LISTE,MENG,MENU,R,REP,SAUV,TEMP,TITRE
 S TITRE=$$^%QZCHW("Gestion des listes de commandes")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENG=$$CONCAS^%QZCHAD(TEMP,"MENG")
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S @MENU="21^5^79"
 S @MENU@(1)=$$^%QZCHW("Gestion")_"^"_"GEST"
 S @MENU@(1,"COM")=$$^%QZCHW("Creation, modification et suppression de listes")
 S @MENU@(2)=$$^%QZCHW("Realisation.delai")_"^"_"IRD"
 S @MENU@(2,"COM")=$$^%QZCHW("Calcul et affichage de IRD (Indice de Realisation des Delais)")
 S @MENU@(3)=$$^%QZCHW("MIX")_"^"_"MIX"
 S @MENU@(3,"COM")=$$^%QZCHW("Visualisation du MIX")
 S @MENU@(4)=$$^%QZCHW("Flux")_"^"_"FLU"
 S @MENU@(4,"COM")=$$^%QZCHW("Visualisation du flux sur le carnet")
 
 S REP=$$LAN^%DLCON2
DEB D TIT,INIT(TEMP)
 D AFFICH^%QUAPAGM
ACT 
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 D ^%VQUIKMN(10,79,22,MENU,.ADR,.CTR) I CTR'="" G FIN
 I ADR'="" G @ADR
 D ^%VSQUEAK G ACT
 
GEST 
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 S R=$$REP^%QS0EDM(MENG,$$RLAN^%DLCON2,"CADR^%DLLANCG")
 G DEB
 
IRD 
 S SAUV=^Z($J)
 D ^%DLAFIRD
 S ^Z($J)=SAUV
 D CADR G ACT
 
MIX 
 D ^%DLAFMIX
 D CADR G ACT
 
FLU 
 D ^%DLFLUX
 D CADR G ACT
 
FIN K @(TEMP)
 D END^%QUAPAGM
 Q
 
INIT(TEMP) 
 D MSG^%VZEATT($$^%QZCHW("Initialisations"))
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN") K @(FEN)
 S LISTE=$$CONCAS^%QZCHAD(TEMP,"LISTE") K @(LISTE)
 D ^%QSGES13("L0","BASE",REP,1,LISTE)
 S @FEN@("X")=0,@FEN@("Y")=2,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="L0",@FEN@("A")=LISTE,@FEN@("ATT")=1,@FEN@("AFF")="TIT^%DLLANCG"
 S @FEN@("LR")=13
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=5,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Source"),@FEN@("C",2,"L")=13,@FEN@("C",2,"C")="SOURCE"
 S @FEN@("C",3,"L")=20,@FEN@("C",3,"C")="AUTRE"
 S @FEN@("C",4,"T")=$$^%QZCHW("Statut.lancement"),@FEN@("C",4,"L")=11
 S @FEN@("C",4,"C")="STATUT",@FEN@("C",4,"FCT")="$$STAT^%DLLANCG"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="CADR^%DLLANCG",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 Q
 
TIT 
 D CLEPAG^%VVIDEO,^%VZCDB(TITRE,0)
 Q
 
CADR D TIT,AFFICH^%QUAPAGM Q
 
STAT(VT1,V,C) 
 N ADR,LAN
 
 S ADR=$$ADRLIS^%QSGEST7(V) I (ADR=0)!(ADR="") Q ""
 
 S LAN=$O(@ADR@("")) I LAN="" Q ""
 Q $$^%QSCALVA($$LAN^%DLCON2,LAN,"STATUT")

