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

;%QWINISP^INT^1^59547,73886^0
QWINISP(NOMETUDE) 
 
 
 
 
 N AD,CTR,PR,ZZ,I,MENU
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MNINISP") K @(MENU)
 D MENU(MENU)
 S ZZ=$ZP(^QX($J,""))+1,PR=1
 D INIT^%QWSTOL
 D CALCUL
DEB2 D CLEPAG^%VVIDEO,TITRE,AFF^%QUCHOI4(ZZ)
 I PR=0 S I=$$UN^%QUCHOI4(ZZ)
 D ^%VQUIKMN(0,80,22,MENU,.AD,.CTR)
 I AD'="" G @AD
 G FIN
 
 
LOAD D LIST,CALCUL G DEB2
 
MODIF D ^%QWINMO1,CALCUL G DEB2
 
REGRET D DIA^%QWRG G DEB2
FIN D END^%QUCHOI4(ZZ) K ^[QUI]QX($J,ZZ)
 K @(MENU)
 Q
 
 
CALCUL 
 N %I,%LIG,%R,I,R,RI,X
 K ^[QUI]QX($J,ZZ),^QX($J,ZZ)
 S ^[QUI]QX($J,ZZ,"LC",1)=60
 S %LIG=1
 S R=""
 F %R=0:0 S R=$O(@WWSTOCK@(R)) Q:R=""  S RI=$$NOMLOG^%QSF(R),I="" F %I=0:0 S I=$O(@WWSTOCK@(R,I)) Q:I=""  S ^[QUI]QX($J,ZZ,"T",%LIG,1)=$E(RI_"                                           ",1,30)_I,%LIG=%LIG+1,PR=0
 S X=$$INI^%QUCHOI4(1,"",0,4,79,17,$J("",5)_$$^%QZCHW("Repertoire")_$J("",20)_$$^%QZCHW("Individu")_$J("",35),ZZ,0)
 Q
 
TITRE 
 S DX=2,DY=0 X XY D REV^%VVIDEO X XY W $$^%QZCHW("Etude") D NORM^%VVIDEO
 S DX=2,DY=1 X XY W NOMETUDE D NORM^%VVIDEO
 D CARSP^%VVIDEO(18,0,3,58,0)
 S DX=20,DY=1 X XY W $$^%QZCHW("I N I T I A L I S A T I O N   D E   L ' E S P A C E")
 Q
 
MENU(MEN) 
 S @MEN="21^5^79"
 S @MEN@(1)=$$^%QZCHW("Chargement")_"^LOAD"
 S @MEN@(1,"COM")=$$^%QZCHW("Chargement de listes d'individus depuis DKBMS")
 S @MEN@(2)=$$^%QZCHW("Modification")_"^MODIF"
 S @MEN@(2,"COM")=$$^%QZCHW("Ajout d'individus et modification de l'espace de travail")
 S @MEN@(3)=$$^%QZCHW("Regret")_"^REGRET"
 S @MEN@(3,"COM")=$$^%QZCHW("Attributs dont le systeme aimerait connaitre la valeur")
 S @MEN@(4)=$$^%QZCHW("Fin")_"^FIN"
 S @MEN@(4,"COM")=$$^%QZCHW("Fin de l'initialisation (espace pret pour l'execution)")
 Q
 
 
 
LIST 
 N LIST,ADR,REP,IND,%I,VAF,BASE,TEMP,LLI,LISTE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LOADL") K @(TEMP)
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LLI=$$CONCAS^%QZCHAD(TEMP,"LLI")
 S LISTE=$$CONCAS^%QZCHAD(TEMP,"LISTE")
 
 D INIT(FEN),AFFICH^%QUAPAGM
 
 D ENS^%QUAPAGM(LLI)
 I '($D(@LLI)) G FLO
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 D MSG^%VZEATT($$^%QZCHW("Chargement des individus des listes choisies"))
 S LIST=""
NXTLIS S LIST=$O(@LLI@(LIST))
 I LIST="" G FLO
 S ADR=$$ADRLIS^%QSGEST7(LIST) G:ADR="" NXTLIS
 S BASE=$$BASE^%QSGEST7(LIST) G:BASE="" NXTLIS
 S IND="" F %I=1:1 S IND=$O(@ADR@(IND)) Q:IND=""  D AJOUTER^%QWSTOI("INIT",BASE,IND)
 G NXTLIS
FLO 
 D END^%QUAPAGM
 K @(TEMP) Q
 
INIT(FEN) 
 
 D ^%QSGES13("L0","TYPE.OBJET","INDIVIDU",1,LISTE)
 
 S @FEN@("X")=0,@FEN@("Y")=4,@FEN@("L")=79,@FEN@("H")=17
 S @FEN@("B")="L0",@FEN@("A")=LISTE
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%QS0DP"
 S @FEN@("LR")=13
 
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=15,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE"
 S @FEN@("C",4,"L")=16,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 D INIT^%QUAPAGM(FEN)
 Q

