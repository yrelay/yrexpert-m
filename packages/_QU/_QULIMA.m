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

;%QULIMA^INT^1^59547,73885^0
ZPILFEN ;
 
CREER(FEN,XG,YG,HA,LA,LE,SC,TITRE,GLOBAL) 
 N I
 S I=$ZP(^ZPILF($J,FEN,""))+1,^ZPILF($J,FEN)=I
 S ^ZPILF($J,FEN,I,"XCOIN")=XG
 S ^ZPILF($J,FEN,I,"YCOIN")=XG
 S ^ZPILF($J,FEN,I,"XCOIN")=XG
 S ^ZPILF($J,FEN,I,"XCOIN")=XG
 S ^ZPILF($J,FEN,I,"XCOIN")=XG
 S ^ZPILF($J,FEN,I,"XCOIN")=XG
 S ^ZPILF($J,FEN,I,"XCOIN")=XG
 D KL
 F I="XG","YH","HA","LA","LE","SC" S ^ZPILF($J,FEN,I)=@I
 S ^ZPILF($J,FEN,"P")=0
 Q
 
CLEAR(FEN) G CL
 
 
 
 
 
 
 
ADD(FEN,TEXT) G AD
 
 
 
 
 
 
 
 
 
 
KILL(FEN) G KL
 
 
 
 
 
 
 
 
REAF(FEN) G RE
 
 
 
 
 
 
 
 
CL D NET K ^ZPILF($J,FEN,"TEXT") S ^ZPILF($J,FEN,"P")=0 Q
NET Q:^ZPILF($J,FEN,"P")=0
 O $I D CLFEN^%VVIDEO(^ZPILF($J,FEN,"XG"),^ZPILF($J,FEN,"YH"),^ZPILF($J,FEN,"HA"),^ZPILF($J,FEN,"LA")) Q
AD S:'($D(^ZPILF($J,FEN,"P"))) ^ZPILF($J,FEN,"P")=0
 N P S P=^ZPILF($J,FEN,"P")+1
 S:'($D(^ZPILF($J,FEN,"HA"))) ^ZPILF($J,FEN,"HA")=0
 I P'>^ZPILF($J,FEN,"HA") D PL(P,TEXT),AFF(P) Q
 S:'($D(^ZPILF($J,FEN,"SC"))) ^ZPILF($J,FEN,"SC")=0
 I '(^ZPILF($J,FEN,"SC")) D CL G AD
 D DECAL S P=^ZPILF($J,FEN,"HA") D PL(P,TEXT),RE2 Q
PL(P,TEXT) S ^ZPILF($J,FEN,"TEXT",P)=TEXT,^ZPILF($J,FEN,"P")=P Q
DECAL N P
 F P=1:1:^ZPILF($J,FEN,"P")-1 S ^ZPILF($J,FEN,"TEXT",P)=^ZPILF($J,FEN,"TEXT",P+1)
 K ^ZPILF($J,FEN,"TEXT",P+1) S ^ZPILF($J,FEN,"P")=P Q
RE D NET
RE2 D CUROF^%VVIDEO
 N P F P=1:1:^ZPILF($J,FEN,"P") D AFF(P)
 D CURON^%VVIDEO Q
KL K ^ZPILF($J,FEN) Q
AFF(P) N DX,DY,L,TEXT
 S TEXT=^ZPILF($J,FEN,"TEXT",P)
 S DX=^ZPILF($J,FEN,"XG")
 S DY=(^ZPILF($J,FEN,"YH")+P)-1
 S L=^ZPILF($J,FEN,"LA")
 X XY W $E(TEXT,1,L),$J("",L-$L(TEXT))
 Q

