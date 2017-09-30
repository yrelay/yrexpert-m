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

;%ACHIIMP^INT^1^59547,73864^0
ACHIIMP ;
 
 
 
 
INIT() 
 N %FONC,%9X1,%9X2,%9Y1,%9Y2,%9EPA,%9T,%9O
 S %PORT=^TABIDENT(WHOIS,"TABTRA") I %PORT="" Q 0
 S %TERM=^TABIDENT(WHOIS,"TYPTAB") I %TERM="" Q 0
 O %PORT U %PORT
 
 N NBL,NBH,LG,HH
 S NBL=79\(LC-1),LG=(LC-1)*NBL
 S NBH=20\(HC-1),HH=(HC-1)*NBH
 S LH=LG+1,LV=HH+1
 S DXG=79-LH,DYH=1
 
 S %FONC="INIT" D ^%PBPZ
 S %9O="HORIZONTALE"
 S %FONC="CLEAR" D ^%PBPZ
 S %FONC="LANDSCAPE" D ^%PBPZ
 S %9X=2,%9Y=25E-1,%FONC="MOUV" D ^%PBPZ
 S %9EPA=5E-2,%FONC="EPAISSEUR" D ^%PBPZ
 
 S %9X1=(2+(DXG*3E-1))+15E-2,%9Y1=34E-1
 S %9X2=LG*3E-1,%9Y2=HH*6E-1,%FONC="CADRE" D ^%PBPZ
 
 
 S %9X1=2,%9Y1=0,%9X2=24,%9Y2=23E-1,%FONC="CADRE" D ^%PBPZ
 S %9X1=2,%9Y1=0,%9X2=24,%9Y2=23E-1,%FONC="HACHURER" D ^%PBPZ
 
 S %9T=30,%FONC="TAILLE" D ^%PBPZ
 S %9X=25E-1,%9Y=6E-1,%FONC="MOUV" D ^%PBPZ
 S %9STR="SECTEUR : "_SECT,%FONC="TEXT" D ^%PBPZ
 
 S %9T=17,%FONC="TAILLE" D ^%PBPZ
 S %9X=25E-1,%9Y=13E-1,%FONC="MOUV" D ^%PBPZ
 S %9STR="Projection : "_ATT,%FONC="TEXT" D ^%PBPZ
 S %9X=25E-1,%9Y=2,%FONC="MOUV" D ^%PBPZ
 S %9STR="Repertoire du secteur : "_REPP,%FONC="TEXT" D ^%PBPZ
 S %9X=15,%9Y=2,%FONC="MOUV" D ^%PBPZ
 S %9STR="Repertoire des modules : "_REPF,%FONC="TEXT" D ^%PBPZ
 S %9X=201E-1,%9Y=7E-1,%FONC="MOUV" D ^%PBPZ
 S %9STR="Le : "_$$DATE^%QMDATE_" a "_$$HEURE^%QMDATE,%FONC="TEXT" D ^%PBPZ
 S %9EPA=1E-2,%FONC="EPAISSEUR" D ^%PBPZ
 Q 1
 
AFF(N,C,OX,OY) 
 
 N %9X,%9Y,%FONC,%9O,X,Y,SX,SY
 S X=OX,Y=OY,%9O="HORIZONTALE"
 I C="l" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V3 S %9X=SX,%9Y=SY D H3
 I C="t" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V1 S %9X=SX,%9Y=SY D H3
 I C="q" D CENTRE(X,Y,.%9X,.%9Y),H1
 I C="x" D CENTRE(X,Y,.%9X,.%9Y),V1
 I C="m" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V2 S %9X=SX,%9Y=SY D H3
 I C="v" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V2 S %9X=SX,%9Y=SY D H1
 I C="j" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V2 S %9X=SX,%9Y=SY D H2
 I C="w" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V3 S %9X=SX,%9Y=SY D H1
 I C="u" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V1 S %9X=SX,%9Y=SY D H2
 I C="k" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V3 S %9X=SX,%9Y=SY D H2
 I C="n" D CENTRE(X,Y,.%9X,.%9Y) S SX=%9X,SY=%9Y D V1 S %9X=SX,%9Y=SY D H1
 S X=OX,Y=OY
 I TH=1 S DYH=Y,DXG=X+1,LH=LC-2 F I=DXG:1:(DXG+LH)-1 D CENTRE(I,Y,.%9X,.%9Y),H1
 S X=OX,Y=OY
 I TV=1 S DYH=Y+1,DXG=X,LV=HC-2 F I=DYH:1:(LV+DYH)-1 D CENTRE(X,I,.%9X,.%9Y),V1
 
 I N="" Q
 I '($D(@STO@("SEL",N*1))) Q
 N Y1,L,YF
 S Y1=$S(TH=0:OY,1:OY+1),DX=$S(TV=0:OX,1:OX+1),L=LC-$S(DX=OX:1,1:2)
 I C="j" S %9X1=2+((OX+1)*3E-1),%9Y1=25E-1+(Y1*6E-1),%9X2=(LC-2)*3E-1,%9Y2=6E-1,%FONC="HACHURER.FORT" D ^%PBPZ S DX=OX,Y1=OY+1
 S YF=(Y1+HC)-$S(Y1=OY:2,1:3)
 F DY=Y1:1:YF S %9X1=2+(DX*3E-1),%9Y1=25E-1+(DY*6E-1),%9X2=L*3E-1,%9Y2=6E-1,%FONC="HACHURER.FORT" D ^%PBPZ
 Q
 
CENTRE(X,Y,%9X,%9Y) 
 S %9X=(2+(X*3E-1))+15E-2,%9Y=(25E-1+(Y*6E-1))+30E-2
 S %FONC="MOUV" D ^%PBPZ
 Q
V1 
 N %9X1,%9Y1,%9X2,%9Y2,%FONC
 S (%9X1,%9X2)=%9X
 S %9Y1=%9Y-30E-2
 S %9Y2=%9Y+30E-2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
V2 
 N %9X1,%9Y1,%9X2,%9Y2,%FONC
 S (%9X1,%9X2)=%9X
 S %9Y1=%9Y
 S %9Y2=%9Y-30E-2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
V3 
 N %9X1,%9Y1,%9X2,%9Y2,%FONC
 S (%9X1,%9X2)=%9X
 S %9Y1=%9Y
 S %9Y2=%9Y+30E-2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
H1 
 N %9X1,%9Y1,%9X2,%9Y2,%FONC
 S (%9Y1,%9Y2)=%9Y
 S %9X1=%9X-15E-2
 S %9X2=%9X+15E-2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
H2 
 N %9X1,%9Y1,%9X2,%9Y2,%FONC
 S (%9Y1,%9Y2)=%9Y
 S %9X1=%9X-15E-2
 S %9X2=%9X
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
H3 
 N %9X1,%9Y1,%9X2,%9Y2,%FONC
 S (%9Y1,%9Y2)=%9Y
 S %9X1=%9X
 S %9X2=%9X+15E-2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
TV 
 N %9X1,%9Y1,%9X2,%9Y2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
TH 
 N %9X1,%9Y1,%9X2,%9Y2
 S %FONC="SEGMENT.TEXTE" D ^%PBPZ
 Q
 
ATT(A,ATR,DX,DY,NBR) 
 N %9X1,%9Y1,%9X2,%9Y2,%FONC,%9STR,%9O
 S %9O="HORIZONTALE"
 
 I ATR="" S %9STR=$TR($J("",NBR-$L(A))," ",0)_A G AI
 
 I $D(@STO@("CAR",A,ATR)) S %9STR=@STO@("CAR",A,ATR)
 E  S %9STR=$$^%QSCALIN(REPFI,SECT_","_$S($D(@STO@("CAR",A,"NOM")):@STO@("CAR",A,"NOM"),1:A),$P(ATR," (",1),$P($P(ATR,"(",2),")",1))
 S %9STR=$E(%9STR,1,NBR)
AI S %9X=2+(DX*3E-1),%9Y=(25E-1+(DY*6E-1))+30E-2,%FONC="MOUV" D ^%PBPZ
 S %FONC="TEXT" D ^%PBPZ
 Q
 
OUV(STO,IMP) 
 N %I,TEMP,%9O
 S %9O="HORIZONTALE"
 S TEMP=$$CONCAS^%QZCHAD(STO,"OUV")
 S DY=""
LPOUV S DY=$O(@TEMP@(DY))
 G:DY="" FOUV
 S DX=""
LPOUV2 S DX=$O(@TEMP@(DY,DX))
 G:DX="" LPOUV
 S %9X1=2+(DX*3E-1),%9Y1=25E-1+(DY*6E-1),%9X2=3E-1,%9Y2=6E-1,%FONC="HACHURER.FORT" D ^%PBPZ
 G LPOUV2
FOUV 
 Q

