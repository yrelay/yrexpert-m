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

;%PBMHCAM^INT^1^59547,73873^0
PTCAME ;
 
 
 
 
 
 Q:'($D(@GLOBAL@("NBCOL")))
 Q:@GLOBAL@("NBCOL")=0
 S MAXX=4096,MAXY=3119,DLIG=100,DEPLIG=100,HBAS=200,EXT=400,LY=MAXY,DANG=15,TICK=50,DECAL=100,DCX=100,DCY=HBAS+100,LX=MAXX-(2*DCX),VX=LX/@GLOBAL@("NBCOL")
 D TEXT S %FONC="TAILLE",%9T=3 D ^%PBPZ,CAME,AXE
 
 D LOGO,COPY
 K ANGM,DEPLIG,DLIG,EXT,HBAS,I,II,MAXX,MAXY,NOLIG,PMAX,RAY,SOM,X,XX,Y,YY
 Q
 
AXE 
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="SEGMENT",%9X1=DCX,(%9Y1,%9Y2)=DCY,%9X2=DCX+LX D ^%PBPZ
 F I=1:1:@GLOBAL@("NBCOL")+1 S (%9X1,%9X2)=((I-1)*VX)+DCX,%9Y1=DCY-(TICK\2),%9Y2=DCY,%FONC="SEGMENT" D ^%PBPZ
 S I=-1,II=1,%FONC="CRAYON",%9TC="PLUME",%9CL="NOIR" D ^%PBPZ
BAX S I=$N(@GLOBAL@("COL",I)) G:I=-1 FAX
 S %9X=((II-1)*VX)+DCX,%9Y=DCY+(TICK/2)
 S %FONC="TEXT",%9STR=@GLOBAL@("COL",I,"TEXT") D ^%PBPZ S II=II+1
 
 S %9X=((II-2)*VX)+DCX,%9Y=DCY-(TICK*2)
 S %FONC="TEXT",%9STR=$S(SOM'=0:$J(@GLOBAL@("COL",I,"POURCENTAGE")*100,1,2),1:0) D ^%PBPZ
 G BAX
FAX Q
 
CAME S I=-1,SOM=0
BSOM S I=$N(@GLOBAL@("COL",I)) G:I=-1 FSOM S SOM=SOM+@GLOBAL@("COL",I) G BSOM
FSOM S I=-1,PMAX=0 G:SOM=0 FPOU
BPOU S I=$N(@GLOBAL@("COL",I)) G:I=-1 FPOU
 S @GLOBAL@("COL",I,"POURCENTAGE")=@GLOBAL@("COL",I)/SOM S:PMAX<@GLOBAL@("COL",I,"POURCENTAGE") PMAX=@GLOBAL@("COL",I,"POURCENTAGE") G BPOU
FPOU S I=-1,%9AD=0,%9X=MAXX\2,ESP=(MAXY-HBAS)-((NOLIG+1)*DLIG),%9Y=(ESP\2)+HBAS,RAY=(ESP\2)-EXT,%FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
BQUA S I=$N(@GLOBAL@("COL",I)) G:I=-1 FQUA D TQUA G BQUA
FQUA S I=-1,%9AD=0,%FONC="CRAYON",%9TC="PLUME",%9CL="NOIR" D ^%PBPZ
QB S I=$N(@GLOBAL@("COL",I)) G:I=-1 FQU D TNOM G QB
FQU Q
 
TNOM Q:SOM=0
 S %9AF=(360*@GLOBAL@("COL",I,"POURCENTAGE"))+%9AD,ANGM=(%9AF+%9AD)\2
 I @GLOBAL@("COL",I,"POURCENTAGE")=PMAX S XX=%9X,YY=%9Y,%9X=(^COS($O(^COS(ANGM#360)))*DECAL)+%9X,%9Y=(^SIN($O(^SIN(ANGM#360)))*DECAL)+%9Y,%FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ
 G:(%9AF-%9AD)'>DANG FQUA2 S X=%9X,Y=%9Y,%9X=((^COS($O(^COS(ANGM#360)))*RAY)\2)+%9X,%9Y=(((^SIN($O(^SIN(ANGM#360)))*RAY)\2)+%9Y)+27
 S %FONC="TEXT",%9STR=$J(@GLOBAL@("COL",I,"POURCENTAGE")*100,1,2)_"%" D ^%PBPZ S %9HOR=^COS($O(^COS(%9AD#360))),%9VER=^SIN($O(^SIN(%9AD#360))),%FONC="DIMP" D ^%PBPZ
 S %9X=((RAY+(2*TICK))*%9HOR)+X,%9Y=((RAY+(TICK*2))*%9VER)+Y
 S %FONC="TEXT",%9STR=@GLOBAL@("COL",I,"TEXT") D ^%PBPZ S %FONC="DIMP" K %9HOR,%9VER D ^%PBPZ S %9X=X,%9Y=Y
 I @GLOBAL@("COL",I,"POURCENTAGE")=PMAX S %9X=XX,%9Y=YY,%FONC="CRAYON",%9TC="PLUME",%9CL="NOIR" D ^%PBPZ
FQUA2 S %9AD=%9AF Q
 
TQUA Q:SOM=0
 S %9AF=(360*@GLOBAL@("COL",I,"POURCENTAGE"))+%9AD,ANGM=(%9AD+%9AF)\2
 I @GLOBAL@("COL",I,"POURCENTAGE")=PMAX S XX=%9X,YY=%9Y,%9X=(^COS($O(^COS(ANGM#360)))*DECAL)+%9X,%9Y=(^SIN($O(^SIN(ANGM#360)))*DECAL)+%9Y,%FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ
 S %9R=RAY,%FONC="QUARTIER" D ^%PBPZ I @GLOBAL@("COL",I,"POURCENTAGE")=PMAX S %9X=XX,%9Y=YY,%FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %9AD=%9AF Q
 
COPY 
 S %TYPLOGO=1,%COUL=1,%Z=5E-1,%9X=100,%9Y=2880,%9T=6,%LIBEL=1,%INCLIN=1 D ^%PBMLOM Q
 
LOGO Q
 
TEXT S (I,NOLIG)=0
BTEX S I=I+1 G:'($D(@GLOBAL@("TEXT",I))) FTEX
 S NOLIG=NOLIG+1,%9Y=MAXY-(DLIG*I),%9X=6*DEPLIG
 
 
 
 
 I $D(@GLOBAL@("TEXT",I,"TYPE-CRAYON"))&$D(@GLOBAL@("TEXT",I,"COULEUR")) S %FONC="CRAYON",%9TC=@GLOBAL@("TEXT",I,"TYPE-CRAYON"),%9CL=@GLOBAL@("TEXT",I,"COULEUR") D ^%PBPZ
 I ('($D(@GLOBAL@("TEXT",I,"TYPE-CRAYON"))))!('($D(@GLOBAL@("TEXT",I,"COULEUR")))) S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 
 
 
 S %FONC="TEXT",%9STR=@GLOBAL@("TEXT",I) D ^%PBPZ I $D(@GLOBAL@("TEXT",I,"TAILLE")) S %FONC="TAILLE",%9T=@GLOBAL@("TEXT",I,"TAILLE") D ^%PBPZ
 G BTEX
FTEX S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 
 S %FONC="SEGMENT",%9X1=0,%9X2=%LIMXCM/635E-5,LY=LY-((NOLIG+1)*DLIG),(%9Y1,%9Y2)=LY D ^%PBPZ Q
 S (%9Y1,%9Y2)=HBAS,%FONC="SEGMENT" D ^%PBPZ Q
 
DEPL 
 S %FONC="CONVERSION.X" D ^%PBPZ
 S %FONC="CONVERSION.Y" D ^%PBPZ
 S %FONC="MOUV" D ^%PBPZ
 Q

