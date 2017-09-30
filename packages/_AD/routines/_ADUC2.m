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

;%ADUC2^INT^1^59547,73865^0
ADUC2 ;
 
 
 
 
LIST0 
 S REFUSE=0
 I RESUL(IC)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Champ obligatoire")) Q
 I RESUL(IC)="?" G HELPL
 I '($$IR^%QSGE5("L0",RESUL(IC))) D ^%VZEAVT($$^%QZCHW("liste inconnue")) S REFUSE=1 Q
 Q
HELPL 
 N TEMP,GLO,NL,ETU,COL,CARD,FEN
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HELP") K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 
 D ^%VZEATT
 D POCLEPA^%VVIDEO
 S @FEN@("X")=0,@FEN@("Y")=0,@FEN@("L")=80,@FEN@("H")=22
 S @FEN@("B")="L0",@FEN@("A")=$$LISTIND^%QSGEST6("L0"),@FEN@("ATT")=1,@FEN@("AFF")="REAFI^%ADUC2"
 S @FEN@("LR")=13
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=15,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE"
 S @FEN@("C",4,"L")=16,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 D REAFI
 S IND=$$UN^%QUAPAGM
 D END^%QUAPAGM
 K @(TEMP)
 N VAR F I=1:1 Q:'($D(RESUL(I)))  S VAR(I)=RESUL(I)
 K RESUL
 S SCR="ADMN",RESUL(1)=VAR(1),RESUL(2)=$P(^[QUI]MN(RESUL(1)),"^",1) D ^%VAFIGRI,^%VAFISCR
 K RESUL F I=1:1 Q:'($D(VAR(I)))  S RESUL(I)=VAR(I)
 S SCR="ADMNO" D ^%VAFIGRI,^%VAFISCR
 D REAF(IND)
 G LIST0
REAF(VAL) 
 S TAB(IC)=$J(" ",$L(RESUL(IC))) D ^%VAFFICH
 S TAB(IC)=VAL D ^%VAFFICH S RESUL(IC)=VAL Q
 
REAFI D CLEPAG^%VVIDEO,AFFICH^%QUAPAGM Q
 
 
TRT 
 S RESUSE=0
 I RESUL(IC)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Champ obligatoire")) Q
 I RESUL(IC)="?" G SUIT1
 I '($D(^[QUI]TTL(RESUL(IC)))) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Traitement inconnu")) Q
 Q
SUIT1 N TEMPO,VALLEG,TRT
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S VALLEG=""
 F I=1:1 S VALLEG=$O(^[QUI]TTL(VALLEG)) Q:VALLEG=""  Q:VALLEG="z"  S @TEMPO@(VALLEG)=""
 D CHOIX(TEMPO)
 I TRT="" S REFUSE=1
 D REAF(TRT)
 K @(TEMPO)
 Q
CHOIX(GLO) 
 D INIT^%QUCHOIP(GLO,"",1,48,11,28,8),AFF^%QUCHOIP
 S TRT=$$UN^%QUCHOIP
 D END^%QUCHOIP,CLFEN^%VVIDEO(48,11,8,28)
 Q
CHOIX(VAL) 
 S TAB(IC)=VAL D ^%VAFFICH S RESUL(IC)=VAL Q
 
SMN 
 S REFUSE=0
 I RESUL(IC)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Champ obligatoire")) Q
 D LONG^%ADUC1(10)
 Q
 
LIB 
 S REFUSE=0
 I RESUL(IC)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Champ obligatoire")) Q
 D LONG^%ADUC1(60)
 Q

