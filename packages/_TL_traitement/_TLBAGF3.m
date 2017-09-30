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

;%TLBAGF3^INT^1^59547,74028^0
TLBAGF3 ;
 
ADD(FEN,TEXT,POSITION) 
 N ORD,GLOBAL,HA
 S ORD=^ZPILF($J,FEN)
 I ^ZPILF($J,FEN,ORD,"GLOBAL")'="" Q
 S GLOBAL="^ZPILF($J,FEN,ORD,""TEXTE"")"
 S HA=^ZPILF($J,FEN,ORD,"HAUTEUR")
 I (POSITION<1)!(POSITION>(HA-2)) Q
 S @GLOBAL@(POSITION)=TEXT
 D AFF^%TLBAGF1(TEXT,POSITION,0)
 Q
 
GET(FEN,MESSAGE,POSITION,VAL,CTR) 
 N ORD,GLOBAL,LA,HA,LIMX,LIMY
 S ORD=^ZPILF($J,FEN)
 I ^ZPILF($J,FEN,ORD,"GLOBAL")'="" Q
 S GLOBAL="^ZPILF($J,FEN,ORD,""TEXTE"")"
 S HA=^ZPILF($J,FEN,ORD,"HAUTEUR")
 S LA=^ZPILF($J,FEN,ORD,"LARGEUR")
 I (POSITION<1)!(POSITION>(HA-2)) Q
 D AFF^%TLBAGF1(MESSAGE,POSITION,0)
 S LIMX=(^ZPILF($J,FEN,ORD,"XCOIN")+1)+$L(MESSAGE)
 S LIMY=^ZPILF($J,FEN,ORD,"YCOIN")+POSITION
 I '($D(VAL)) S VAL=""
 D LIRE^%VREAD("",VAL,LIMX,(^ZPILF($J,FEN,ORD,"XCOIN")+LA)-2,LIMY+1,LIMY-1,.CTR,.VAL)
 S @GLOBAL@(POSITION)=MESSAGE_VAL
 Q
 
GET2(FEN,MESSAGE,POSITION,VAL,CTR) 
 
 N ORD,GLOBAL,LA,HA,LIMX,LIMY,POS,PRELIG
 S GLOBAL=$$GLOB^%TLBAGF1(FEN)
 S HA=^ZPILF($J,FEN,ORD,"HAUTEUR")
 S LA=^ZPILF($J,FEN,ORD,"LARGEUR")
 S @GLOBAL@(POSITION)=MESSAGE
 S PRELIG=^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")
 
 I POSITION<((PRELIG+HA)-2) S POS=POSITION-(PRELIG-1) D AFF^%TLBAGF1(MESSAGE,POS,0) G SAIS
 
 S PRELIG=POSITION-(HA-2)
 I '(^ZPILF($J,FEN,ORD,"SCROLL")) S PRELIG=POSITION D NET^%TLBAGF1
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=PRELIG
 D AFF^%TLBAGF1(MESSAGE,1,0)
SAIS S LIMX=(^ZPILF($J,FEN,ORD,"XCOIN")+1)+$L(MESSAGE)
 S LIMY=(^ZPILF($J,FEN,ORD,"YCOIN")+POSITION)-(PRELIG-1)
 I '($D(VAL)) S VAL=""
 D LIRE^%VREAD("",VAL,LIMX,(^ZPILF($J,FEN,ORD,"XCOIN")+LA)-2,LIMY+1,LIMY-1,.CTR,.VAL)
 S @GLOBAL@(POSITION)=MESSAGE_VAL
 Q
 
SUP(FEN,POSITION) 
 N ORD,GLOBAL,LA,HA
 S GLOBAL=$$GLOB^%TLBAGF1(FEN)
 S HA=^ZPILF($J,FEN,ORD,"HAUTEUR")
 S LA=^ZPILF($J,FEN,ORD,"LARGEUR")
 K @GLOBAL@(POSITION)
 I POSITION>HA S POSITION=POSITION#(HA-2)
 D AFF^%TLBAGF1("",POSITION,0)
 Q
 
INIT(FEN) 
 N ORD,GLOBAL
 S GLOBAL=$$GLOB^%TLBAGF1(FEN)
 K @(GLOBAL)
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=1
 Q

