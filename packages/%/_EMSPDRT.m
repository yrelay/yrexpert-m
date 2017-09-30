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

;%EMSPDRT^INT^1^59547,73869^0
EMSPDRT ;
 
 
 
 
 
 
 
 
INIT(GLO,NUM) 
 
 
 
 
 
 N CLE
 S @GLO@(NUM)="DROITE"
 
 F CLE="D1X","D1Y","D2X","D2Y","P1X","P1Y","P2X","P2Y" S @GLO@(NUM,CLE)=""
 
 Q
 
 
COOR(GLO,NUM) 
 
 
 
 
 N RESUL,PATOUCH,DEJALU,AFRESU,SCR,ABENDSCR,NBR,CLE
 S NBR=1
 F CLE="P1X","P1Y","P2X","P2Y" S RESUL(NBR)=@GLO@(NUM,CLE),NBR=NBR+1
 
 D CLEPAG^%VVIDEO
 D AFF1^%VACTGRQ("EMDROIT",.RESUL,.ABENDSCR)
 Q:ABENDSCR="A"
 
 S NBR=1
 F CLE="P1X","P1Y","P2X","P2Y" S:RESUL(NBR)'="" @GLO@(NUM,CLE)=RESUL(NBR) S NBR=NBR+1
 D PRESUI(GLO,NUM)
 Q
 
 
DEF(GLO,NUM,MODE,GLS,CPT,DERX,DERY) 
 
 
 
 
 
 
 
 
 
 
 
 N P1X,P1Y,P2X,P2Y,D1X,D1Y,D2X,D2Y,CH,CA,CLE,%C
 S CLE=""
 F %C=0:0 S CLE=$O(@GLO@(NUM,CLE)) Q:CLE=""  S @CLE=@GLO@(NUM,CLE)
 
 D AFF(GLO,NUM,DERX,DERY,.D1X,.D1Y,.P1X,.P1Y)
 G H2
 
 
 D HELP("1er point")
P1 D POSIT^%VZAMIRE("NOLIB",0,.CH,.D1X,.D1Y,.CA)
 I (CA=1)!(CA=6) G STOP
 
 I CA'=13 G P1
 S DX=D1X,DY=D1Y X XY W "."
 
 D REEL("Abscisse du 1er point",.P1X)
 I P1X="" G STOP
 D REEL("Ordonnee du 1er point",.P1Y)
 I P1Y="" G STOP
 
H2 
 D HELP("2eme point")
 I D2X="" S D2X=D1X
 I D2Y="" S D2Y=D1Y
P2 D POSIT^%VZAMIRE("NOLIB",0,.CH,.D2X,.D2Y,.CA)
 I (CA=1)!(CA=6) G STOP
 
 I CA'=13 G P2
 S DX=D2X,DY=D2Y X XY W "."
 
 D REEL("Abscisse du 2eme point",.P2X)
 I P2X="" G STOP
 D REEL("Ordonnee du 2eme point",.P2Y)
 I P2Y="" G STOP
 
 F CLE="D1X","D1Y","D2X","D2Y","P1X","P1Y","P2X","P2Y" S @GLO@(NUM,CLE)=@CLE
 S CPT=CPT+1
 S DERX=D2X,DERY=D2Y
 I MODE=0,((P2X-@GLS@("P2X"))=0)&((P2Y-@GLS@("P2Y"))=0) K @(GLS)
 
 
 
 Q
 
STOP 
 K @GLO@(NUM)
 Q
 
 
HELP(MSG) 
 D POCLEPA^%VVIDEO
 S DX=3 X XY D BLD^%VVIDEO W $$^%QZCHW(MSG)
 S DX=$X D NORM^%VVIDEO
 X XY W "  " D XY^%VZCFLE
 S DX=DX+10 X XY
 W $$^%QZCHW("CTRLA arret definition, [RETURN] position du point")
 Q
 
REEL(MSG,VAL) 
 N CTR,Y1
 D POCLEPA^%VVIDEO,REV^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW(MSG)_$S(VAL="":"",1:" ["_VAL_"]")_" : ","",DX,RM-4,DY+1,DY-1,"","$$NUM^%EMSPARC",.CTR,.Y1)
 D NORM^%VVIDEO
 I Y1="" S Y1=VAL
 I CTR'="" S Y1=""
 S VAL=Y1
 Q
 
AFF(GLO,NUM,DERX,DERY,D1X,D1Y,P1X,P1Y) 
 N PRE
 S PRE=$ZP(@GLO@(NUM))
 S D1X=$S(PRE="":DERX,1:@GLO@(PRE,"D2X"))
 S D1Y=$S(PRE="":DERY,1:@GLO@(PRE,"D2Y"))
 S P1X=$S(PRE="":0,1:@GLO@(PRE,"P2X"))
 S P1Y=$S(PRE="":0,1:@GLO@(PRE,"P2Y"))
 D MSG^%VZEATT($$^%QZCHW("1er point , abscisse")_" = "_P1X_" , "_$$^%QZCHW("ordonnee")_" = "_P1Y) H 3
 S DX=D1X,DY=D1Y X XY W "."
 Q
 
PRESUI(GLO,NUM) 
 
 N PRE,SUIV
 S PRE=$ZP(@GLO@(NUM)) I PRE="" G SUI
 S @GLO@(PRE,"P2X")=@GLO@(NUM,"P1X")
 S @GLO@(PRE,"P2Y")=@GLO@(NUM,"P1Y")
 
SUI S SUI=$O(@GLO@(NUM)) Q:SUI=""
 S @GLO@(SUI,"P1X")=@GLO@(NUM,"P2X")
 S @GLO@(SUI,"P1Y")=@GLO@(NUM,"P2Y")
 
 Q

