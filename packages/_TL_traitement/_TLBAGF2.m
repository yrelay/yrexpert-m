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
;! HL002 ! HL     ! 01/11/17 ! %GTM-E-FALLINTOFLST, Fall-through to a label with formallist is not allowed !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TLBAGF2^INT^1^59547,74028^0
TLBAGF2 ;
 
CHOIX(FEN,NOMBRE,POSPRE) 
 N ORD,CAR,CHOISI,ARRET,GLOBAL,POSITION,MD,DX,DY,NPAGE
 N PRELIG,HA,LIGNE,CTRL,LONG,TROUVE,FLECHE,OLDPOS,OLDPRE,NBTPG
 S GLOBAL=$$GLOB^%TLBAGF1(FEN)
 S HA=^ZPILF($J,FEN,ORD,"HAUTEUR"),ARRET=0
 S PRELIG=^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")
 S OLDPRE=PRELIG,CHOISI=""
 F %A=0:0 Q:$D(@GLOBAL@(PRELIG))  D DEPLACER^%TLBAGF1(FEN,"-") S PRELIG=^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE") I (PRELIG=1)&('($D(@GLOBAL@(PRELIG)))) S ARRET=1 Q
 I ARRET=1 G FINCHOIX
 S NBTPG=$ZP(@GLOBAL@(""))\(HA-2)
 I (NBTPG*(HA-2))'=$ZP(@GLOBAL@("")) S NBTPG=NBTPG+1
 
 I NOMBRE'=0 D CUROF^%VVIDEO
 S OLDPOS=0,POSITION=1,ARRET=0
 I (POSPRE'<PRELIG)&(POSPRE'>(((PRELIG-1)+HA)-2)) S POSITION=(POSPRE-PRELIG)+1
 D HELP,AFPAGE
BCLCH 
 I ARRET G FINCHOIX
 I NOMBRE=0 G DEPCUR
 I (OLDPRE=PRELIG)&(OLDPOS=POSITION) G LECAR
 I ('($D(@GLOBAL@((PRELIG-1)+OLDPOS))))!(OLDPOS=0) G AFFNVL
 S MD=0
 I ((PRELIG-1)+OLDPOS)=^ZPILF($J,FEN,ORD,"LIGNE.POINTEE") S MD=1
 D AFF^%TLBAGF1(@GLOBAL@((PRELIG-1)+OLDPOS),OLDPOS,MD)
AFFNVL 
 S MD=2
 I ((PRELIG-1)+POSITION)=^ZPILF($J,FEN,ORD,"LIGNE.POINTEE") S MD=3
 D AFF^%TLBAGF1(@GLOBAL@((PRELIG-1)+POSITION),POSITION,MD)
 G LECAR
 
DEPCUR 
 S DX=^ZPILF($J,FEN,ORD,"XCOIN")+2
 S DY=^ZPILF($J,FEN,ORD,"YCOIN")+POSITION X XY
LECAR 
 S OLDPOS=POSITION,OLDPRE=PRELIG
 ;HL002 D ^%VZATOU(.CAR,.FLECHE,"",0)
 D VVZATOU^%VZATOU(.CAR,.FLECHE,"",0)
BAS 
 I FLECHE'="B" G HAUT
 I (PRELIG+POSITION)>$ZP(@GLOBAL@("")) D ^%VSQUEAK G FBAS
 I POSITION<(HA-2) S POSITION=POSITION+1 G FBAS
 S PRELIG=PRELIG+1
 I '(^ZPILF($J,FEN,ORD,"SCROLL")) S PRELIG=(PRELIG+POSITION)-1,POSITION=1 D NET^%TLBAGF1
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=PRELIG
 D RE2^%TLBAGF1(""),AFPAGE
FBAS G BCLCH
HAUT 
 I FLECHE'="H" G CTRLAF
 I ((PRELIG+POSITION)-2)<1 D ^%VSQUEAK G FHAUT
 I POSITION>1 S POSITION=POSITION-1 G FHAUT
 S PRELIG=PRELIG-1
 I '(^ZPILF($J,FEN,ORD,"SCROLL")) S PRELIG=(PRELIG-(HA-2))+1,POSITION=HA-2 D NET^%TLBAGF1
 I PRELIG<1 S PRELIG=1
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=PRELIG
 D RE2^%TLBAGF1(""),AFPAGE
FHAUT G BCLCH
CTRLAF 
 I (CAR'=1)&(CAR'=6) G CTRLJ
 S ARRET=1
 G BCLCH
CTRLJ 
 I CAR'=10 G CTRLM
 D POCLEPA^%VVIDEO W $$^%QZCHW("impression en cours")
 D ^%VPRINT(GLOBAL),POCLEPA^%VVIDEO
 G BCLCH
CTRLM 
 I (CAR'=13)!(NOMBRE=0) G CTRLR
 S CHOISI=(PRELIG-1)+POSITION
 S ARRET=1
 G BCLCH
CTRLR 
 I CAR'=18 G PLUSMOINS
 D REAF^%TLBAGF1(FEN,0)
 D HELP,AFPAGE
 I NOMBRE'=0 D CUROF^%VVIDEO
 G BCLCH
PLUSMOINS 
 I (($C(CAR)'="+")&($C(CAR)'="-"))&($C(CAR)'="=") G INTER
 S CAR=$C(CAR) I CAR="=" S CAR="+"
 D DEPLACER^%TLBAGF1(FEN,CAR)
 S PRELIG=^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")
 D AFPAGE
 I CAR="+",((PRELIG+POSITION)-1)>$ZP(@GLOBAL@("")) S POSITION=($ZP(@GLOBAL@(""))-PRELIG)+1
 G BCLCH
INTER 
 I $C(CAR)'="?" G PAGE
 D POCLEPA^%VVIDEO
 D LIRE1^%VREAD($$^%QZCHW("texte a chercher")_" : ","",$X,$Y,.CTRL,.LIGNE)
 I (CTRL'="")!(LIGNE="") G FINTER
 S LONG=$L(LIGNE),TROUVE=0
 S IND=(PRELIG-1)+POSITION
BCLRPL 
 S IND=IND+1
 I @GLOBAL@(IND)[LIGNE S TROUVE=1
 I ('(TROUVE))&(IND<$ZP(@GLOBAL@(""))) G BCLRPL
FRECPL 
 I TROUVE G FRECMN
 S IND=(PRELIG-1)+POSITION
BCLRMN 
 S IND=IND-1 I IND=0 G FRECMN
 I @GLOBAL@(IND)[LIGNE S TROUVE=1
 I ('(TROUVE))&(IND>1) G BCLRMN
FRECMN 
 I '(TROUVE) D ^%VSQUEAK G FINTER
 I (IND'<PRELIG)&(IND'>(((PRELIG-1)+HA)-2)) S POSITION=IND-(PRELIG-1) G FINTER
 S PRELIG=IND,^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=PRELIG,POSITION=1
 D RE2^%TLBAGF1(""),AFPAGE
FINTER 
 D POCLEPA^%VVIDEO
 G BCLCH
PAGE 
 I $C(CAR)'="P" G AUTRES
BCLPG D POCLEPA^%VVIDEO
 D LIRE1^%VREAD($$^%QZCHW("page")_" : ","",$X,$Y,.CTRL,.NPAGE)
 I (NPAGE="")!(CTRL'="") G FINPG
 I (NPAGE<1)!(NPAGE>NBTPG) D ^%VSQUEAK G BCLPG
 S PRELIG=((NPAGE-1)*(HA-2))+1,POSITION=1
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=PRELIG
 D RE2^%TLBAGF1(""),AFPAGE
FINPG 
 D POCLEPA^%VVIDEO
 G BCLCH
AUTRES 
 D ^%VSQUEAK
 G BCLCH
FINCHOIX 
 D CAD^%TLBAGF1
 I NOMBRE'=0 D CURON^%VVIDEO
 Q CHOISI
 
CLEAR(FEN) 
 N ORD,GLOBAL
 S ORD=^ZPILF($J,FEN)
 S GLOBAL=^ZPILF($J,FEN,ORD,"GLOBAL")
 I GLOBAL="" S GLOBAL="^ZPILF($J,FEN,ORD,""TEXTE"")" K @(GLOBAL)
 S ^ZPILF($J,FEN,ORD,"PREMIERE.LIGNE")=$ZP(@GLOBAL@(""))+1
AFFR 
 D NET^%TLBAGF1
 Q
HELP 
 N DX,DY
 S DX=^ZPILF($J,FEN,ORD,"XCOIN")+2
 S DY=(^ZPILF($J,FEN,ORD,"YCOIN")+HA)-1 X XY
 W $$^%QZCHW("(+),(-),(?),(P)age,(CTRL J),("),$$L24^%QSLIB2,")" W:NOMBRE=1 ",[RETURN]"
 Q
AFPAGE 
 N NUMPG,DX,DY
 S NUMPG=PRELIG\(HA-2)
 I (NUMPG*(HA-2))'=PRELIG S NUMPG=NUMPG+1
 S DX=(^ZPILF($J,FEN,ORD,"XCOIN")+^ZPILF($J,FEN,ORD,"LARGEUR"))-15
 S DY=^ZPILF($J,FEN,ORD,"YCOIN")
 X XY W " ",$$^%QZCHW("page")," : ",NUMPG,"/",NBTPG," "
 Q

