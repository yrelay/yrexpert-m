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

;%SDOGRIL^INT^1^59547,73889^0
SDOGRIL(OBJ,VERS,%PORT,%TERM,PAS,EF) 
 
 
 
 
DEB N XO,YO
 D INIT^%SDOAFFI
 S XO=PTEC("XO"),YO=PTEC("YO"),PAS=PAS*188E-1
 
 
 S HMIN=((YMIN-YO)\PAS)*PAS
 
 S HMAX=((YMAX-YO)\PAS)*PAS
 
 S VMIN=((XMIN-XO)\PAS)*PAS
 
 S VMAX=((XMAX-XO)\PAS)*PAS
 
 D ^%PBPZGRA,EFF^%PBP5EC(0)
 S %FONC="PRENDRE" D ^%PBPZ
 F II=HMIN:PAS:HMAX D DROITE^%PBMFN(XMIN-XO,II,XMAX-XO,II,EF,"P",0)
 
 F II=VMIN:PAS:VMAX D DROITE^%PBMFN(II,YMIN-YO,II,YMAX-YO,EF,"P",0)
 Q
 
SELEC(XM,YM,XP,YP,MSG) 
 G SEL0
 
SEL(XM,YM) 
 N XP,YP,MSG S MSG=$$^%QZCHW("Selectionnez avec la mire")
SEL0 
 N R,MAT
 D EFFBAS^%SDUMEN,AFFI^%SDUMEN(0,0,$$^%QZCHW(MSG))
 D ^%PBPZGRA
SEL1 S (XM,YM,XP,YP)=""
 S R=$$LOC^%PBMFN(.XP,.YP)
 I R=0 G FIN
 S XM=XP,YM=YP
 S MAT=$$ADR^%SDOMAT
SEL2 I $D(@MAT@(XM,YM)) G GET
 I $D(@MAT@(XM)) S YM=$ZP(@MAT@(XM,YM)) S:YM="" YM=@MAT@("HMIN") G GET
 S XM=$ZP(@MAT@(XM)) G SEL2
 
GET 
 
 I @MAT@(XM,YM)=0 G SEL1
FIN D EFFBAS^%SDUMEN
 Q
 
TEST D CLEPAG^%VVIDEO
 W !,"Largeur des cases " R PAS S PAS=PAS+0
 Q:PAS=0
 D SDOGRIL("X","1",0,"PT-100G",PAS,0)
 R *R
 D ^%PBPZCLR,^%PBPZALF
 G TEST

