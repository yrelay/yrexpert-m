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

;%PBMHETO^INT^1^59547,73873^0
PTETOIL ;
 
 
 
 
 
 Q:'($D(@GLOBAL@("NBCOL")))
 Q:@GLOBAL@("NBCOL")=0
 S MAXX=4096,MAXY=3119,DLIG=100,DEPLIG=100,HBAS=200,SEPA=400,LY=MAXY,TICK=50,DL2=40000,DCX=100,DCY=200,LX=MAXX-(2*DCX),VX=LX/@GLOBAL@("NBCOL")
 D TEXT,ETOIL,AXE,LOGO,COPY
 K ANGL,DANGL,DCX,DCY,DEPLIG,DLIG,DL2,HBAS,I,II,LX,LY,MAXY,NOLIG,RED,TICK,VX,XC,YC Q
 
AXE S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="SEGMENT",%9X1=DCX,(%9Y1,%9Y2)=DCY,%9X2=DCX+LX D ^%PBPZ
 F I=1:1:@GLOBAL@("NBCOL")+1 S (%9X1,%9X2)=((I-1)*VX)+DCX,%9Y1=DCY-(TICK\2),%9Y2=DCY,%FONC="SEGMENT" D ^%PBPZ
 S I=-1,II=1,%FONC="CRAYON",%9TC="PLUME",%9CL="NOIR" D ^%PBPZ
BAX S I=$N(@GLOBAL@("COL",I)) G:I=-1 FAX
 S %9X=((II-1)*VX)+DCX,%9Y=DCY+(TICK/2)
 S %FONC="TEXT",%9STR=@GLOBAL@("COL",I,"TEXT") D ^%PBPZ S II=II+1
 
 S %9X=((II-2)*VX)+DCX,%9Y=DCY-(TICK*2)
 S %FONC="TEXT",%9STR=@GLOBAL@("COL",I) D ^%PBPZ
 G BAX
FAX Q
 
ETOIL S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S DANGL=360/@GLOBAL@("NBCOL"),RAY=(((MAXY-((NOLIG+1)*DLIG))-HBAS)-SEPA)/2,RED=RAY/$S(@GLOBAL@("HAUTEUR-MAX")=0:1,1:@GLOBAL@("HAUTEUR-MAX"))
 S (%9Y1,YC)=(HBAS+(SEPA\2))+RAY,(%9X1,XC)=MAXX\2,ANGL=0,I=-1,%FONC="SEGMENT"
BETO S %FONC="SEGMENT"
 S I=$N(@GLOBAL@("COL",I)) G:I=-1 FETO
 S %9X2=(@GLOBAL@("COL",I)*RED)*^COS($O(^COS(ANGL))),%9X2=$J(%9X2,1,0)+XC,%9Y2=(@GLOBAL@("COL",I)*RED)*^SIN($O(^SIN(ANGL))),%9Y2=$J(%9Y2,1,0)+YC D ^%PBPZ
 S ANGL=ANGL+DANGL G BETO
FETO S I=-1,ANGL=0,(%9X1,%9X)=$J((^COS($O(^COS(ANGL)))*@GLOBAL@("COL",$N(@GLOBAL@("COL",-1))))*RED,1,0)+XC,(%9Y1,%9Y)=$J((^SIN($O(^SIN(ANGL)))*@GLOBAL@("COL",$N(@GLOBAL@("COL",-1))))*RED,1,0)+YC,%FONC="CRAYON",%9TC="PLUME",%9CL="ROUGE" D ^%PBPZ
BET2 S %FONC="SEGMENT"
 S I=$N(@GLOBAL@("COL",I)) G:I=-1 FET2
 S %9X2=$J((^COS($O(^COS(ANGL)))*@GLOBAL@("COL",I))*RED,1,0)+XC,%9Y2=$J((^SIN($O(^SIN(ANGL)))*@GLOBAL@("COL",I))*RED,1,0)+YC D ^%PBPZ S %9X1=%9X2,%9Y1=%9Y2,ANGL=ANGL+DANGL G BET2
FET2 S %9X2=%9X,%9Y2=%9Y D ^%PBPZ
 S %FONC="TAILLE",%9MOD=8/@GLOBAL@("NBCOL") D ^%PBPZ
 S I=-1,ANGL=0,%FONC="CRAYON",%9TC="PLUME",%9CL="NOIR" D ^%PBPZ
BET3 S I=$N(@GLOBAL@("COL",I)) G:I=-1 FET3
 S %9HOR=^COS($O(^COS(ANGL))),%9VER=^SIN($O(^SIN(ANGL))),%9X=$J((((@GLOBAL@("COL",I)*RED)+TICK)*%9HOR)+XC,1,0),%9Y=$J((((@GLOBAL@("COL",I)*RED)+TICK)*%9VER)+YC,1,0),ANGL=ANGL+DANGL
 S %FONC="TEXT",%9STR=@GLOBAL@("COL",I,"TEXT") D:(((%9X-XC)*(%9X-XC))+((%9Y-YC)*(%9Y-YC)))>DL2 ^%PBPZ G BET3
FET3 S %FONC="DIMP",%9HOR=1,%9VER=0 D ^%PBPZ Q
 
COPY S %TYPLOGO=1,%9X=100,%9Y=2880,%Z=5E-1,%COUL=1,%9T=6,%INCLIN=1,%LIBEL=1 D ^%PBMLOM Q
 
LOGO Q:'($D(^LOGO(WHOIS)))  S %Z=5E-1,%9X=100,%9Y=100 D ^%PBLOGO Q
 
TEXT S (I,NOLIG)=0
BTEX S I=I+1 G:'($D(@GLOBAL@("TEXT",I))) FTEX
 S NOLIG=NOLIG+1,%9Y=MAXY-(DLIG*I),%9X=6*DEPLIG
 
 
 I $D(@GLOBAL@("TEXT",I,"TYPE-CRAYON"))&$D(@GLOBAL@("TEXT",I,"COULEUR")) S %FONC="CRAYON",%9TC=@GLOBAL@("TEXT",I,"TYPE-CRAYON"),%9CL=@GLOBAL@("TEXT",I,"COULEUR") D ^%PBPZ
 I ('($D(@GLOBAL@("TEXT",I,"TYPE-CRAYON"))))!('($D(@GLOBAL@("TEXT",I,"COULEUR")))) S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 I $D(@GLOBAL@("TEXT",I,"TAILLE")) S %FONC="TAILLE",%9T=@GLOBAL@("TEXT",I,"TAILLE") D ^%PBPZ
 S %FONC="TEXT",%9STR=@GLOBAL@("TEXT",I) D ^%PBPZ
 I $D(@GLOBAL@("TEXT",I,"TAILLE")) S %FONC="TAILLE",%9T=@GLOBAL@("TEXT",I,"TAILLE") D ^%PBPZ
 G BTEX
FTEX S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="SEGMENT",%9X1=0,%9X2=%LIMXCM/635E-5,LY=LY-((NOLIG+1)*DLIG),(%9Y1,%9Y2)=LY D ^%PBPZ Q

