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

;%TLBAGF1^INT^1^59547,74028^0
TLBAGF1 ;
 
CREER(FEN,XG,YH,HA,LA,LE,SC,GLOBAL,CADRE,TITRE,REPETER) 
 N ORD
 S LA=$S(LA<80:LA,MODTM:79,1:80)
 S ORD=$$^%QCAZG("^ZPILF($J,FEN)")+1,^ZPILF($J,FEN)=ORD
 S ^ZPILF($J,FEN,ORD,"XCOIN")=XG
 S ^ZPILF($J,FEN,ORD,"YCOIN")=YH
 S ^ZPILF($J,FEN,ORD,"HAUTEUR")=HA
 S ^ZPILF($J,FEN,ORD,"LARGEUR")=LA
 S ^ZPILF($J,FEN,ORD,"LARGEUR.ECRAN")=LE
 S ^ZPILF($J,FEN,ORD,"SCROLL")=SC
 S ^ZPILF($J,FEN,ORD,"GLOBAL")=GLOBAL
 S ^ZPILF($J,FEN,ORD,"CADRE")=CADRE
 S ^ZPILF($J,FEN,ORD,"TITRE")=TITRE
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=1
 S ^ZPILF($J,FEN,ORD,"LIGNE.POINTEE")=0
 S ^ZPILF($J,FEN,ORD,"REPETER")=$S($D(REPETER):REPETER,1:0)
 Q
 
ADD(FEN,TEXT) 
 D ADD2(FEN,TEXT,1) Q
 
ADD2(FEN,TEXT,AFF) 
 N ORD,POS,GLOBAL,PRELIG,HA,PASGLO,I
 S ORD=^ZPILF($J,FEN),PASGLO=0
 S GLOBAL=^ZPILF($J,FEN,ORD,"GLOBAL")
 I GLOBAL="" S PASGLO=1,GLOBAL="^ZPILF($J,FEN,ORD,""TEXTE"")"
 S POS=$ZP(@GLOBAL@(""))+1,@GLOBAL@(POS)=TEXT
 S PRELIG=^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")
 S HA=$$HAUT(FEN)
 
 I POS'>(((PRELIG-1)+HA)-2) D:AFF=1 AFF(TEXT,POS-(PRELIG-1),0) Q
 
 I PASGLO G ZPILGLO
 S PRELIG=(POS-(HA-2))+1
 I '(^ZPILF($J,FEN,ORD,"SCROLL")) S PRELIG=POS D:AFF=1 NET
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=PRELIG
 G AFFT
ZPILGLO 
 
 I '(^ZPILF($J,FEN,ORD,"SCROLL")) K @(GLOBAL) S @GLOBAL@(1)=TEXT D:AFF=1 NET G AFFT
 
 F I=2:1:POS S @GLOBAL@(I-1)=@GLOBAL@(I)
 K @GLOBAL@(POS)
AFFT 
 D:AFF=1 RE2("")
 Q
 
TUER(FEN) 
 N ORD
 S ORD=^ZPILF($J,FEN)
 K ^ZPILF($J,FEN,ORD)
 S ORD=ORD-1,^ZPILF($J,FEN)=ORD
 I ORD=0 K ^ZPILF($J,FEN) Q
 Q
 
REAF(FEN,LIGNE) 
 D REAF2(FEN,LIGNE,"")
 Q
 
REAF2(FEN,LIGNE,DER) 
 N ORD,DERLIG,GLOBAL
 S ORD=^ZPILF($J,FEN),GLOBAL=$$GLOB(FEN)
 S DERLIG=$ZP(@GLOBAL@(""))
 I DER="" S DER=$ZP(@GLOBAL@(""))
 I DER>DERLIG S DER=DERLIG
 I DER<LIGNE S DER=DERLIG
 I LIGNE=0 G AFFR
 I LIGNE>DERLIG S LIGNE=DERLIG
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=LIGNE
AFFR 
 D NET,CAD,RE2(DER)
 Q
RE2(DER) 
 N PRELIG,NBLIG,GLOBAL,P,LIGPOI,LIGNE,MD
 S GLOBAL=$$GLOB(FEN),NBLIG=$$HAUT(FEN)-2
 I DER="" S DER=$ZP(@GLOBAL@(""))
 S PRELIG=^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")
 D CUROF^%VVIDEO
 S P=1,LIGPOI=^ZPILF($J,FEN,ORD,"LIGNE.POINTEE")
BCL G:P>NBLIG FRE2
 G:P>DER FRE2
 S MD=0
 I '($D(@GLOBAL@((PRELIG+P)-1))#10) S LIGNE="" G AFFI
 S LIGNE=@GLOBAL@((PRELIG+P)-1)
 I ((PRELIG+P)-1)=LIGPOI S MD=1
AFFI D AFF(LIGNE,P,MD)
 S P=P+1
 G BCL
FRE2 D CURON^%VVIDEO
 Q
 
NET 
 D CLFEN^%VVIDEO(^ZPILF($J,FEN,ORD,"XCOIN")+1,^ZPILF($J,FEN,ORD,"YCOIN")+1,$$HAUT(FEN)-2,^ZPILF($J,FEN,ORD,"LARGEUR")-2)
 Q
 
AFF(TEXT,P,CTR) N DX,DY,LA
 N Y,TXT
 S TXT=TEXT
 S DX=^ZPILF($J,FEN,ORD,"XCOIN")+2
 S DY=^ZPILF($J,FEN,ORD,"YCOIN")+P
 S LA=^ZPILF($J,FEN,ORD,"LARGEUR")
 X XY
 I (CTR=1)!(CTR=3) D REV^%VVIDEO
 X XY
 I (CTR=2)!(CTR=3) D BLD^%VVIDEO
 S TEXT=$E(TEXT,1,LA-4)
 X XY W TEXT,$J("",(LA-4)-$L(TEXT))
 I CTR'=0 X XY D NORM^%VVIDEO
 I (CTR=0)!(^ZPILF($J,FEN,ORD,"REPETER")=0) X XY Q
 S Y(1)=$E($E(TXT,1,LA-4)_$J("",LA),1,LA-4)
 S Y(2)=$E($E(TXT,LA-3,(2*LA)-8)_$J("",LA),1,LA-4)
 S Y(3)=$E($E(TXT,(2*LA)-7,(3*LA)-12)_$J("",LA),1,LA-4)
 D REV^%VVIDEO
 S DY=^ZPILF($J,FEN,ORD,"YCOIN")+^ZPILF($J,FEN,ORD,"HAUTEUR")
 X XY W Y(1) S DY=DY+1 X XY W Y(2) S DY=DY+1 X XY W Y(3)
 D NORM^%VVIDEO
 S DY=^ZPILF($J,FEN,ORD,"YCOIN")+P
 X XY
 Q
CAD 
 N XG,YH,HA,LA,TITRE,DX,DY
 I '(^ZPILF($J,FEN,ORD,"CADRE")) Q
 S XG=^ZPILF($J,FEN,ORD,"XCOIN")
 S YH=^ZPILF($J,FEN,ORD,"YCOIN")
 S HA=$$HAUT(FEN)
 S LA=^ZPILF($J,FEN,ORD,"LARGEUR")
 S TITRE=^ZPILF($J,FEN,ORD,"TITRE")
 D CARSP^%VVIDEO(XG,YH,HA,LA,1)
 I TITRE="" Q
 S TITRE=" "_$E(TITRE,1,LA-4)_" "
 S DX=(XG+1)+(((LA-2)-$L(TITRE))\2),DY=YH X XY W TITRE
 Q
 
POINTER(FEN,LIGNE) 
 N ORD,PRELIG,HA,GLOBAL,LIGPOI
 S GLOBAL=$$GLOB(FEN)
 I (LIGNE'=0)&(LIGNE>$ZP(@GLOBAL@(""))) Q
 
 S LIGPOI=^ZPILF($J,FEN,ORD,"LIGNE.POINTEE")
 I LIGNE=LIGPOI Q
 
 S PRELIG=^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")
 S HA=$$HAUT(FEN)
 
 I (((LIGPOI'=0)&(LIGPOI'<PRELIG))&(LIGPOI'>(((PRELIG-1)+HA)-2)))&$D(@GLOBAL@(LIGPOI)) D AFF(@GLOBAL@(LIGPOI),LIGPOI-(PRELIG-1),0)
 
 S ^ZPILF($J,FEN,ORD,"LIGNE.POINTEE")=LIGNE
 I LIGNE=0 Q
 I (LIGNE'<PRELIG)&(LIGNE'>(((PRELIG-1)+HA)-2)) D AFF(@GLOBAL@(LIGNE),LIGNE-(PRELIG-1),1) Q
 S PRELIG=(LIGNE-(HA-2))+1 I PRELIG<1 S PRELIG=1
 I '(^ZPILF($J,FEN,ORD,"SCROLL")) S PRELIG=LIGNE D NET
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=PRELIG
 D RE2("")
 Q
 
DEPLACER(FEN,SENS) 
 N ORD,PRELIG,HA,DERLIG,GLOBAL
 S GLOBAL=$$GLOB(FEN)
 S PRELIG=^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")
 S HA=$$HAUT(FEN)
 S DERLIG=$ZP(@GLOBAL@(""))
 
PLUS I SENS="-" G MOINS
 I ((PRELIG+HA)-2)>DERLIG D ^%VSQUEAK Q
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=(PRELIG+HA)-2
 G READEP
 
MOINS I PRELIG=1 D ^%VSQUEAK Q
 S PRELIG=PRELIG-(HA-2)
 I PRELIG<1 S PRELIG=1
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=PRELIG
READEP 
 D RE2("")
 Q
 
GLOB(FEN) 
 N GLOB,DJ
 S ORD=^ZPILF($J,FEN),DJ=$S($$ADR^%QZNBN1($J):$J,1:""""_$J_"""")
 S GLOB=^ZPILF($J,FEN,ORD,"GLOBAL")
 I GLOB="" S GLOB=$$CONCAT^%QZCHAD("^ZPILF",DJ_","""_FEN_""","_ORD_",""TEXTE""")
 Q GLOB
 
HAUT(FEN) 
 Q ^ZPILF($J,FEN,ORD,"HAUTEUR")

