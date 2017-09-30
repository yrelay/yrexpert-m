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

;%PBMPLAN^INT^1^59547,73873^0
PTPLANNI ;
 
 
 
 
 
 
 
 
 
 U 0 D ^%PBIZINI S NBL=^PAGE($J,"NBLIGNES"),NBU=^PAGE($J,"NBUNITES"),NBT=$ZP(^PAGE($J,"TEXTE","")),UNI=^PAGE($J,"UNITE")
 S NBD=7,MAXY2=MAXY-((NBT+2)*100),NBP=^PAGE($J,"NBPAGES"),STX=200,DISTY=(MAXY2-(2*STX))\NBL,HY=MAXY2-STX,BY=STX,GX=STX,D1X=MAXX-STX,EX=(MAXX-(2*STX))\NBU,TX=40
L1 D POCLEPA^%VVIDEO W NBP," pages, laquelle voulez-vous ? : " S DX=$X,DY=$Y D ^%VLEC G:(CTRLA=1)!(Y1="") FIN I Y1'?.N D ^%VSQUEAK G L1
 I Y1>NBP D ^%VSQUEAK G L1
 S P=Y1 D POCLEPA^%VVIDEO,TP G L1
FIN K BID,BY,%9CL,%COUL,DISTY,D1X,EX,%FONC,GX,HY,%INCLIN,INT,L,%L,%LIBEL,%9LXY,MAXX,MAXY,MAXY2,NBD,NBL,NBP,NBT,NBU,P,%P,STOP,STX,%9TC,%TYPLOGO,TX,UNI,%9X,%9Y,Y1,%Z Q
TP S %FONC="INIT" D ^%PBPZ
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S %FONC="CLEAR" D ^%PBPZ S %FONC="CADRE" D ^%PBPZ
 F I=1:1 Q:'($D(^PAGE($J,"TEXTE",I)))  S %9X=GX,%9Y=MAXY-(I*100),%FONC="MOUV" D ^%PBPZ S %9STR=^PAGE($J,"TEXTE",I),%FONC="TEXT" D ^%PBPZ
 S %9Y=MAXY-(I*100),%FONC="MOUV" D ^%PBPZ
 S %9STR="Page "_P_"/"_NBP,%FONC="TEXT" D ^%PBPZ
 S %TYPLOGO=1,%COUL=1,%9X=3500,%9Y=2800,%Z=5E-1,%LIBEL=1,%INCLIN=1 D ^%PBMLOM
 S %9LXY=0_","_MAXY2_","_MAXX_","_MAXY2,%FONC="LIGBRI" D ^%PBPZ S %9LXY=GX_","_HY_","_GX_","_BY_","_D1X_","_BY,%FONC="LIGBRI" D ^%PBPZ
 S %FONC="LIGBRI" F I=0:1:NBL S %9LXY=(GX-TX)_","_(HY-(I*DISTY))_","_(GX+TX)_","_(HY-(I*DISTY)) D ^%PBPZ
 S %FONC="LIGBRI" F I=0:1:NBU S %9LXY=(GX+(EX*I))_","_(BY-TX)_","_(GX+(EX*I))_","_(BY+TX) D ^%PBPZ
 S L=-1 F %L=0:0 S L=$N(^PAGE($J,P,L)) Q:L=-1  D TPL
 S %FONC="TAILLE",%9MOD=5E-1 D ^%PBPZ
 S INT=NBU\(NBD-1) F I=0:1:NBD-1 D DATE
 S %FONC="TAILLE",%9MOD=2 D ^%PBPZ
 D ^%PBPZALF,POCLEPA^%VVIDEO W "Impression page : ",P," terminee [RETURN]" R *BID
 S STOP=BID=1 Q
DATE S %9X=GX+((I*INT)*EX),%9Y=BY-(2*TX),%FONC="MOUV" D ^%PBPZ
 S %9X=$$ADDAT^%QMDATE(%DAT1,%HEU1,$$MULTH^%QMDATE(((P-1)*NBU)+(INT*I),UNI)),%9STR=$P(%9X,",",1),%FONC="TEXT" D ^%PBPZ
 S %9STR=$P(%9X,",",2),%9X=GX+((I*INT)*EX),%9Y=BY-(3*TX),%FONC="MOUV" D ^%PBPZ
 S %FONC="TEXT" D ^%PBPZ
 Q
TPL S INTER=0,INT=0,%9X=GX+TX,%9Y=(HY-(L*DISTY))+(55E-2*DISTY),%FONC="MOUV" D ^%PBPZ S %9STR=^PAGE($J,P,L,"TEXTE"),%FONC="TEXT" D ^%PBPZ F I=0:1:NBU+1 D TU
 Q
TU G @("T"_$D(^PAGE($J,P,L,I)))
T1 S:'(INTER) INTER=1,DEBUT=I,INT=0 S INT=INT+1 Q
T0 I INTER D RECT S INTER=0
 Q
RECT S %9X1=(EX*DEBUT)+GX,%9X2=(INT*EX)+%9X1,%9Y1=HY-(L*DISTY),%9Y2=(DISTY\2)+%9Y1,%FONC="RECT" D ^%PBPZ Q

