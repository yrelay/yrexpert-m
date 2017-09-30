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

;%EMSPARC^INT^1^59547,73869^0
EMSPARC ;
 
 
 
 
 
 
 
 
INIT(GLO,NUM) 
 
 
 
 
 
 N CLE
 S @GLO@(NUM)="ARC"
 
 F CLE="D1X","D1Y","D2X","D2Y","P1X","P1Y","P2X","P2Y","C1X","C1Y","ANG","OR" S @GLO@(NUM,CLE)=""
 
 Q
 
 
COOR(GLO,NUM) 
 
 
 
 N RESUL,PATOUCH,DEJALU,AFRESU,SCR,ABENDSCR,NBR,CLE
 S NBR=1
 F CLE="P1X","P1Y","C1X","C1Y","OR","ANG" S RESUL(NBR)=@GLO@(NUM,CLE),NBR=NBR+1
 
 D CLEPAG^%VVIDEO
 D AFF1^%VACTGRQ("EMARC",.RESUL,.ABENDSCR)
 Q:ABENDSCR="A"
 
 S NBR=1
 F CLE="P1X","P1Y","C1X","C1Y","OR","ANG" S:RESUL(NBR)'="" @GLO@(NUM,CLE)=RESUL(NBR) S NBR=NBR+1
 D CALANG(GLO,NUM)
 D PRESUI^%EMSPDRT(GLO,NUM)
 Q
 
 
DEF(GLO,NUM,MODE,GLS,CPT,DERX,DERY) 
 
 
 
 
 
 
 
 
 
 
 
 N %C,P1X,P1Y,C1X,C1Y,D1X,D1Y,D2X,D2Y,OR,ANG,CH,CA,CLE
 S CLE=""
 F %C=0:0 S CLE=$O(@GLO@(NUM,CLE)) Q:CLE=""  S @CLE=@GLO@(NUM,CLE)
 
 D AFF^%EMSPDRT(GLO,NUM,DERX,DERY,.D1X,.D1Y,.P1X,.P1Y)
 G H2
 
 
 D HELP^%EMSPDRT("1er point")
P1 D POSIT^%VZAMIRE("NOLIB",0,.CH,.D1X,.D1Y,.CA)
 I (CA=1)!(CA=6) G STOP
 
 I CA'=13 G P1
 S DX=D1X,DY=D1Y X XY W "."
 
 D REEL("Abscisse du 1er point","NUM",.P1X)
 I P1X="" G STOP
 D REEL("Ordonnee du 1er point","NUM",.P1Y)
 I P1Y="" G STOP
 
H2 
 D HELP^%EMSPDRT("2eme point")
 I D2X="" S D2X=D1X
 I D2Y="" S D2Y=D1Y
P2 D POSIT^%VZAMIRE("NOLIB",0,.CH,.D2X,.D2Y,.CA)
 I (CA=1)!(CA=6) G STOP
 
 I CA'=13 G P2
 S DX=D2X,DY=D2Y X XY W "."
 
 D REEL("Orientation (+ = sens inverse des aiguilles d'une montre)","OR",.OR)
 I OR="" G STOP
 D REEL("Abscisse du centre du cercle","NUM",.C1X)
 I C1X="" G STOP
 D REEL("Ordonnee du centre du cercle","NUM",.C1Y)
 I C1Y="" G STOP
 D REEL("Angle effectif","ANG",.ANG)
 I ANG="" G STOP
 
 F CLE="D1X","D1Y","D2X","D2Y","P1X","P1Y","C1X","C1Y","OR","ANG" S @GLO@(NUM,CLE)=@CLE
 D CALANG(GLO,NUM)
 I MODE=0,((@GLO@(NUM,"P2X")-@GLS@("P2X"))=0)&((@GLO@(NUM,"P2Y")-@GLS@("P2Y"))=0) K @(GLS)
 
 
 
 S CPT=CPT+1
 S DERX=D2X,DERY=D2Y
 Q
 
STOP 
 K @GLO@(NUM)
 Q
 
 
CALANG(GLO,NUM) 
 N ANG,P1X,P1Y,P2X,P2Y,CLE,C1X,C1Y,R,OR,ANGD,ANGA
 F CLE="P1X","P1Y","C1X","C1Y","ANG","OR" S @CLE=@GLO@(NUM,CLE)
 I (P1Y-C1Y)'=0 G CAL
 I C1X<P1X S ANGD=0
 E  S ANGD=180
 G CALE
CAL S ANGD=$S((P1X-C1X)'=0:$$ARCTG^%TLCAMTH((P1Y-C1Y)/(P1X-C1X)),1:90)
 I ANGD<0 S ANGD=ANGD+180
 I P1Y<C1Y S ANGD=ANGD+180
CALE I OR="-" S ANGA=ANGD-ANG
 E  S ANGA=ANGD+ANG
 S R=$$CGR^%EMSPCAL(P1X,P1Y,C1X,C1Y)
 S P2X=C1X+(R*$$COS^%TLCAMTH(ANGA))
 S P2Y=C1Y+(R*$$SIN^%TLCAMTH(ANGA))
 F CLE="P2X","P2Y" S @GLO@(NUM,CLE)=$J(@CLE,1,2)
 Q
 
REEL(MSG,ETI,VAL) 
 
 N CTR,Y1
 D POCLEPA^%VVIDEO,REV^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW(MSG)_$S(VAL="":"",1:" ["_VAL_"]")_" : ","",DX,RM-4,DY+1,DY-1,"","$$"_ETI_"^%EMSPARC",.CTR,.Y1)
 D NORM^%VVIDEO
 I Y1="" S Y1=VAL
 I CTR'="" S Y1=""
 S VAL=Y1
 Q
 
NUM(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 D NORMALIS^%QZNBN1(.YY1)
 I (YY1+0)'=YY1 D NORM^%VVIDEO,^%VZEAVT($$^%QZCHW("La valeur doit etre numerique")),REV^%VVIDEO Q 0
 Q 1
 
OR(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I YY1="=" S YY1="+"
 I (YY1'="+")&(YY1'="-") Q 0
 Q 1
 
ANG(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 Q $$ANG^%QZNBN(YY1)

