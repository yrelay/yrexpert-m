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

;%PBMHCOU^INT^1^59547,73873^0
PTCOURB ;
 
 
 
 
 
 Q:'($D(@GLOBAL@("NBCOL")))
 Q:@GLOBAL@("NBCOL")=0
 S NBT=6,LX=3900,XX=100,YY=350,MAXX=4096,MAXY=3119,LY=MAXY,TICK=25,DLIG=100,DEPLIG=100,DCX=LX\(@GLOBAL@("NBCOL")-1),LX=LX-DCX,DCY=LY
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR"
 D TEXT,HIST,LOGO,COPY
 K DCX,DCY,I,LX,LY,MAXX,MAXY,NBT,NOLIG,RED,TICK,XX,YY
 Q
 
HIST 
 S LY=LY-(2*YY),RED=LY/@GLOBAL@("HAUTEUR-MAX")
 S %FONC="SEGMENT",%9X1=XX,(%9Y1,%9Y2)=YY,%9X2=((@GLOBAL@("NBCOL")-1)*DCX)+XX D ^%PBPZ
 S %FONC="SEGMENT"
 S %9Y1=YY-TICK,%9Y2=YY F I=0:1:@GLOBAL@("NBCOL")-1 S (%9X1,%9X2)=(I*DCX)+XX D ^%PBPZ
 S %9LXY="",I=-1,II=1,%FONC="TAILLE",%9T=6 D ^%PBPZ
B1 S I=$N(@GLOBAL@("COL",I)) G:I=-1 F1
 D COLON S II=II+1 G B1
F1 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ S %FONC="LIGBRI" D ^%PBPZ
 S %FONC="CRAYON",%9TC="PLUME",%9CL="ROUGE" D ^%PBPZ S I=-1,II=1
B2 S I=$N(@GLOBAL@("COL",I)) G:I=-1 F2 D DRAPEAU S II=II+1 G B2
F2 Q
COPY S %TYPLOGO=1,%9X=100,%9Y=2880,%Z=5E-1,%COUL=1,%LIBEL=1,%9T=6,%INCLIN=1 D ^%PBMLOM Q
LOGO Q:'($D(^LOGO(WHOIS)))  S %Z=5E-1,%9X=100,%9Y=100 D ^%PBLOGO Q
TEXT S (I,NOLIG)=0
BTEX S I=I+1 G:'($D(@GLOBAL@("TEXT",I))) FTEX
 S NOLIG=NOLIG+1,%9Y=MAXY-(DLIG*I),%9X=6*DEPLIG
 I $D(@GLOBAL@("TEXT",I,"TYPE-CRAYON"))&$D(@GLOBAL@("TEXT",I,"COULEUR")) S %FONC="CRAYON",%9TC=@GLOBAL@("TEXT",I,"TYPE-CRAYON"),%9CL=@GLOBAL@("TEXT",I,"COULEUR") D ^%PBPZ
 I ('($D(@GLOBAL@("TEXT",I,"TYPE-CRAYON"))))!('($D(@GLOBAL@("TEXT",I,"COULEUR")))) S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 I $D(@GLOBAL@("TEXT",I,"TAILLE")) S %FONC="TAILLE",%9T=@GLOBAL@("TEXT",I,"TAILLE") D ^%PBPZ
 S %FONC="TEXT",%9STR=@GLOBAL@("TEXT",I) D ^%PBPZ I $D(@GLOBAL@("TEXT",I,"TAILLE")) S %FONC="TAILLE",%9T=@GLOBAL@("TEXT",I,"TAILLE") D ^%PBPZ
 G BTEX
FTEX S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ S %FONC="SEGMENT",%9X1=0,%9X2=%LIMXCM/635E-5,LY=LY-((NOLIG+1)*DLIG),(%9Y1,%9Y2)=LY D ^%PBPZ Q
 
COLON S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="SEGMENT",%9X1=(DCX*(II-1))+XX,%9Y1=YY,%9X2=(DCX*(II-1))+XX,%9Y2=(@GLOBAL@("COL",I)*RED)+YY D ^%PBPZ S %9LXY=%9LXY_$S(%9LXY="":"",1:",")_$J(%9X2,1,4)_","_$J(%9Y2,1,4)
 S %9X=((DCX*(II-1))+XX)-TICK,%9Y=YY-(3*TICK),%FONC="TEXT",%9STR=@GLOBAL@("COL",I,"TEXT") D ^%PBPZ Q
DRAPEAU S %FONC="TAILLE",%9T=4 D ^%PBPZ
 
 S %9X=(DCX*(II-1))+XX,%9Y=((@GLOBAL@("COL",I)*RED)+YY)+(2*TICK)
 S %FONC="TEXT",%9STR=@GLOBAL@("COL",I) D ^%PBPZ
 Q

