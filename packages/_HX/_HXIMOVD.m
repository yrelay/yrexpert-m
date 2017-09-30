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

;%HXIMOVD^INT^1^59547,73869^0
HXIMOVD(X,Y,C,L,EX,EY,GL,NC,NL) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N CH,I,LIN,COL,LARGE,HAUT,PRECOL,PRECOL2,PRECLIN,PRECLIN2,FLAG,CENTRAGE
 S FLAG=0
 S LARGE=(C*EX)-12
 S HAUT=L*EY
 S PRECOL=NC,PRECLIN=NL
 D PROMPT
 F I=1:1 Q:FLAG=1  D ZFLECHE^%VZATOU Q:(X1=1)!(X1=6)  D BASSE:%F="B",HAUTE:%F="H",DROITE:%F="D",GAUCHE:%F="G",VALID:X1=13
 I FLAG=0 D CLRPROMP Q 0
 Q 1
 
PROMPT 
 D CLRPROMP
 S CH=$S($D(@GL@(PRECOL,PRECLIN)):@GL@(PRECOL,PRECLIN),1:"")
 S CENTRAGE=(LARGE-$L(CH))\2
 W $J(" ",CENTRAGE)
 X XY D REV^%VVIDEO,BLD^%VVIDEO
 W $E(CH,1,LARGE)
 D NORM^%VVIDEO
 S DX=X+(EX*(PRECOL-1)),DY=Y+(EY*(PRECLIN-1))
 X XY
 Q
CLRPROMP S DX=X+15
 S DY=HAUT+Y
 X XY W $J(" ",LARGE-6)
 S DX=X+15,DY=HAUT+Y
 X XY
 Q
HAUTE 
 I PRECLIN=1 D ^%VSQUEAK Q
 S PRECLIN2=PRECLIN
 S PRECLIN=PRECLIN-1
 G PROMPT
BASSE 
 I PRECLIN=L D ^%VSQUEAK Q
 S PRECLIN2=PRECLIN
 S PRECLIN=PRECLIN+1
 G PROMPT
DROITE 
 I PRECOL=C D ^%VSQUEAK Q
 S PRECOL2=PRECOL
 S PRECOL=PRECOL+1
 D REAFF
 G PROMPT
GAUCHE 
 I PRECOL=1 D ^%VSQUEAK Q
 S PRECOL2=PRECOL
 S PRECOL=PRECOL-1
 D REAFF
 G PROMPT
VALID 
 S NC=PRECOL
 S NL=PRECLIN
 S FLAG=1
 Q
REAFF 
 Q:HIS=2
 S INDCOCOU=(PRECOL+NOCOL(HIS))-1,HIS=2
 D PTENTR^%HXITOD2(2,0,OPTH2,TYP) S HIS=1
 Q
 
TEST N CL,LIN,COL
 K CL
 S CL="5^5"
 F LIN=1:1:5 F COL=1:1:5 S CL(COL,LIN)=$$LINA(0,80)
 D ^%HXICOL(5,5,10,60,9,2,"CL"),CARSP^%VVIDEO(4,4,8,60,"BLD")
 S XER=$$^%HXIMOVD(5,5,5,5,11,1,"CL",.NC,.NL) Q
RNZE(PLANCHER,PLAFOND) 
 N ALPHA
 S ALPHA=$R(1000)/1000 Q ((PLAFOND*ALPHA)+((1-ALPHA)*PLANCHER))\1
LINA(PLAN,PLAF) 
 N CH,LONG
 S LONG=$$RNZE(PLAN,PLAF),CH="" F I=1:1:LONG S CH=$C($$RNZE(64,90))_CH
 Q CH

