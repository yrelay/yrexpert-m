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

;%TLIFEN^INT^1^59547,74029^0
TLIFEN ;
 
 
 
 
INIT 
 D CREER^%QUPILF("ACT",2,HH+1,HACT-3,MG-4,80,0)
 D CREER^%QUPILF("ATT",2,HH+9,(HACT*2)-3,MD-4,80,0)
 D CREER^%QUPILF("LOG",MD+2,HH+8,(HACT*2)-3,(MG-MD)-4,80,0)
 
 Q
 
END D KILL^%QUPILF("ATT")
 D KILL^%QUPILF("ACT")
 D KILL^%QUPILF("LOG")
 
 D CLEPAG^%VVIDEO,80^%VVIDEO Q
 
REAF N LLIB D CLEPAG^%VVIDEO,REV^%VVIDEO
 S DX=0,DY=0 X XY W $$^%QZCHW("Liste : ") S DX=$X,DY=$Y D BLD^%VVIDEO X XY W LISTE D NORM^%VVIDEO,REV^%VVIDEO
 S DX=25,DY=0 X XY W $$^%QZCHW("Traitement : ") S DX=$X,DY=$Y
 D BLD^%VVIDEO X XY W TRT D NORM^%VVIDEO,REV^%VVIDEO
 S DX=60,DY=0 X XY W $$^%QZCHW("Mode : ") S DX=$X,DY=$Y
 D BLD^%VVIDEO X XY W $S(MODEX=1:$$^%QZCHW("Simulation"),MODEX=0:$$^%QZCHW("Reel"))
 D NORM^%VVIDEO,BLD^%VVIDEO S DX=0,DY=1 X XY W CARD," ",$$^%QZCHW(REPL),"(S)"
 D NORM^%VVIDEO,BLD^%VVIDEO
 S DX=40,DY=1 X XY W $$^%QZCHW("Nombre d'individus traites : ") S NX=$X,NY=$Y D NBT^%TLIACT3
 D CARSP^%VVIDEO(0,HH,HACT,MG,1)
 S DX=4,DY=HH X XY W " ",$$^%QZCHW("Traitement")," "
 D:'(FIRST) REAF^%QUPILF("ACT")
 D CARSP^%VVIDEO(0,HH+HACT,2*HACT,MD,1)
 S DX=4,DY=HH+HACT X XY W " ",$$^%QZCHW("Attributs de l'individu et de la liste")," "
 D:'(FIRST) REAF^%QUPILF("ATT")
 D CARSP^%VVIDEO(MD,HH+HACT,2*HACT,MG-MD,1)
 D:'(FIRST) REAF^%QUPILF("LOG")
 S DX=54,DY=HH+HACT X XY W " ",$$^%QZCHW("Messages")," "
 
 Q
ADD(FEN,TEXTE) 
 N I,LTI,LTC
 I MODAF=3 Q
 I (MODAF'=2)&('($D(DEROUL))) D:FEN'="LISTE" ADD^%QUPILF(FEN,TEXTE) D:FEN="LISTE" ADD^%QUPILF("ATT",$S(TEXTE="":"",1:$$BLD^%VVIDEO1_"(L) "_$$NORM^%VVIDEO1_TEXTE)) Q
 I MODAF'=2 D ADD^%TLBAGF1(FEN,TEXTE) Q
 I $D(@GLOETD@("JOURNAL"))#10,@GLOETD@("JOURNAL")=0 Q
 I (FEN="ATT")!(FEN="LISTE") S TEXTE="    "_TEXTE
 S LTI=$L(TEXTE),LTC=LTI
 F I=2:1:NIVEAU Q:(LTC>400)!((LTC-LTI)>100)  S TEXTE=" "_TEXTE,LTC=LTC+1
 D ADD^%TLBAGF1("LOG",TEXTE)
 Q

