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

;%QS0SEL1^INT^1^59547,73880^0
%QS0SEL1() 
 Q $$SEL("","")
 
 
 
 
 
SEL(LBASE,TITRE) 
 
 
 
 
 
 
 N TEMP,LLISTE,LISTE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SEL") K @(TEMP)
 S LLISTE=$$CONCAS^%QZCHAD(TEMP,"LLISTE")
 I LBASE="" S LLISTE=$$LISTIND^%QSGEST6("L0")
 I LBASE'="" D LILIS(LBASE,LLISTE)
 S LISTE=$$CHOIX(LLISTE,TITRE)
 K @(TEMP)
 Q LISTE
 
 
 
 
LILIS(LBASE,LLISTE) 
 N Y,U,I
 
 S Y="" F U=0:0 S Y=$O(@LBASE@(Y)) Q:Y=""  S I="" F U=0:0 S I=$$NXTRAVOI^%QSTRUC8("L0","BASE",Y,1,I) Q:I=""  I $$^%QSCALVA("L0",I,"CARD")+0 S @LLISTE@(I)=""
 Q
 
 
CHOIX(LLISTE,TITRE) 
 
 
 
 
 
 
 
DEB N I,LI,U,X,Y,AD,CT,OK,TEMP,FEN,MEN,LISTE
 S OK=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHOIX")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 K @(TEMP)
 I TITRE="" S TITRE="CHOIX D'UNE LISTE"
 S LISTE="" D CADRE
 D ^%VZEATT,PFEN,AFFICH^%QUAPAGM,MENUI
MENU D ^%VQUIKMN(0,80,23,MEN,.AD,.CT) G FIN:CT="A",FIN:CT="F",FIN:AD="" D @AD G MENU:'(OK)
FIN K @(TEMP) D END^%QUAPAGM
 D CLEPAG^%VVIDEO Q LISTE
 
CADRE D CLEPAG^%VVIDEO S CAG=1 D ^%VZCDB(TITRE,0) Q
REAFI D CADRE
RAFFR D AFFICH^%QUAPAGM Q
PFEN 
 S @FEN@("X")=0,@FEN@("Y")=2,@FEN@("L")=80,@FEN@("H")=20
 S @FEN@("B")="L0",@FEN@("A")=LLISTE
 S @FEN@("ATT")=1,@FEN@("AFF")="CADRE^%QS0SEL1"
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD",@FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=10,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE",@FEN@("C",4,"L")=21,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="CADRE^%QS0SEL1",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 Q
MENUI 
 S I=$P($T(MENUI2),";;",2) F U=1:1 S C=$P(I,",",U) Q:C=""  S @MEN@(U)=$$^%QZCHW($P(C,"|",1))_"^"_$P(C,"|",2)
 Q
MENUI2 ;;SELECTIONNER|MNSEL,LISTER|MNLIS,+|MNPL,-|MNMS,PAGE|MNPG,REPERE|MNRP
MNLIS S R=$$^%QS0L D REAFI:R=2,CADRE:R=1 S OK=0 Q
MNSEL S LISTE=$$UN^%QUAPAGM I LISTE="" S OK=0 Q
 S OK=1 Q
MNMS D MOINS^%QUAPAGM S OK=0 Q
MNPL D PLUS^%QUAPAGM S OK=0 Q
MNPG D PAGE^%QUAPAGM S OK=0 Q
MNRP D REPER^%QUAPAGM S OK=0 Q

