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

;%DLFDESG^INT^1^59547,73867^0
DLFDESG(IMP,ETU) 
 
 
 
 
 
 
 
 
 
 
 
 N C,%9EPA,EX,EY,%FONC,%9LXY,MAX,MY,NF,%N,OX,OY,P,%P,PPXX,PPYY,RPPXX,RPPYY,%9STR,TYPE,%9X,%9X1,%9X2,%9Y,%9Y1,%9Y2,%DESSIN,%9O,%9T,GLO
 S %DESSIN=1
 S TYPE=$F($T(TERM),%TERM)'=0
 S %9O="HORIZONTALE"
 C %PORT O %PORT
 S EX=50,EY=130,MY=2800
 S %FONC="INIT" D ^%PBPZ
 S %FONC="INIT.DESSIN" D ^%PBPZ
 S %FONC="CLEAR" D ^%PBPZ S %FONC="CADRE" D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 I IMP=0 D ENTET
 I IMP=1 D TETE^%DLEVAL2(1)
 
 S GLO=$$CONCAS^%QZCHAD("^[QUI]DLFLUX",%FLU)
 S DX=""
 F %N=0:0 S DX=$O(@GLO@("POINTS",DX)) Q:DX=""  S DY="" F %N=0:0 S DY=$O(@GLO@("POINTS",DX,DY)) Q:DY=""  D T2
 S DX=""
 F %N=0:0 S DX=$O(@GLO@("TEXTE",DX)) Q:DX=""  S DY="" F %N=0:0 S DY=$O(@GLO@("TEXTE",DX,DY)) Q:DY=""  S %9X=DX*EX,%9Y=MY-(DY*EY),%FONC="MOUV" D ^%PBPZ S %9STR=@GLO@("TEXTE",DX,DY),%FONC="TEXT" D ^%PBPZ
 S MAX=0,NF=""
 F %N=0:0 S NF=$O(LFLUX(NF)) Q:NF=""  S %9X=@GLO@("POSQUA",NF),%9Y=MY-(EY*$P(%9X,"^",2)),%9X=EX*$P(%9X,"^",1),%FONC="MOUV" D ^%PBPZ S %9STR=LFLUX(NF),%FONC="TEXT" D ^%PBPZ S:%9STR>MAX MAX=%9STR
 S NF="" F %N=0:0 S NF=$O(@GLO@("FLUX",NF)) Q:NF=""  D T3
 
FIN I %PORT'=0 S %FONC="CLEAR" D ^%PBPZ S %FONC="PRINTER" D ^%PBPZ C %PORT
 D ^%PBPZALF
 D ^%VZEAVT("") Q
 
T3 S %FONC="EPAISSEUR",%9EPA=$S(MAX=0:5E-2,1:(LFLUX(NF)/MAX)*4E-1) D:TYPE ^%PBPZ
 S OX="",OY="",P=""
 F %P=0:0 S P=$O(@GLO@("FLUX",NF,P)) Q:P=""  S DX="" F %P=0:0 S DX=$O(@GLO@("FLUX",NF,P,DX)) Q:DX=""  S DY="" F %P=0:0 S DY=$O(@GLO@("FLUX",NF,P,DX,DY)) Q:DY=""  D T S OX=DX,OY=DY
 Q:('(TYPE))&(%9EPA>1E-1)
 S P=$ZP(@GLO@("FLUX",NF,"")),DX=$ZP(@GLO@("FLUX",NF,P,"")),DY=$ZP(@GLO@("FLUX",NF,P,DX,""))
 S PPXX=$O(@GLO@("FLUX",NF,P-1,"")),PPYY=$O(@GLO@("FLUX",NF,P-1,PPXX,""))
 S C=@GLO@("FLUX",NF,P-1,PPXX,PPYY),%FONC="LIGBRI",RPPXX=PPXX*EX,RPPYY=MY-(PPYY*EY) G @("T3"_C)
T3120 G:DY>PPYY T3B G T3H
T3109 G:PPXX'=DX T3D G T3H
T3106 G:PPXX'=DX T3G G T3H
T3108 G:PPXX'=DX T3D G T3B
T3107 G:PPXX'=DX T3G G T3B
T3113 G:DX>PPXX T3D G T3G
T3H S %9LXY=RPPXX_","_((EY+RPPYY)-(EX\2))_","_((EX\2)+RPPXX)_","_(EY+RPPYY)_","_(EX+RPPXX)_","_((EY+RPPYY)-(EX\2)) D ^%PBPZ Q
T3B S %9LXY=RPPXX_","_(RPPYY+(EX\2))_","_((EX\2)+RPPXX)_","_RPPYY_","_(EX+RPPXX)_","_(RPPYY+(EX\2)) D ^%PBPZ Q
T3D S %9LXY=((EX\2)+RPPXX)_","_(((EY\2)+RPPYY)-(EX\2))_","_(EX+RPPXX)_","_((EY\2)+RPPYY)_","_((EX\2)+RPPXX)_","_(((EY\2)+RPPYY)+(EX\2)) D ^%PBPZ Q
T3G S %9LXY=((EX\2)+RPPXX)_","_(((EY\2)+RPPYY)-(EX\2))_","_RPPXX_","_((EY\2)+RPPYY)_","_((EX\2)+RPPXX)_","_(((EY\2)+RPPYY)+(EX\2)) D ^%PBPZ Q
T2 S %9X=DX*EX,%9Y=MY-(DY*EY),%FONC="LIGBRI",%9LXY=%9X_","_%9Y_","_(EX+%9X)_","_%9Y_","_(EX+%9X)_","_(EY+%9Y)_","_%9X_","_(EY+%9Y)_","_%9X_","_%9Y D ^%PBPZ Q
T S C=@GLO@("FLUX",NF,P,DX,DY) Q:C=""
 S %9X=DX*EX,%9Y=MY-(DY*EY),%FONC="LIGBRI" G @C
120 S %9LXY=((EX\2)+%9X)_","_(EY+%9Y)_","_((EX\2)+%9X)_","_%9Y D ^%PBPZ Q:TYPE
 Q:OY=""
 G:OY>DY HAUT G BAS
109 S %9LXY=((EX\2)+%9X)_","_(EY+%9Y)_","_((EX\2)+%9X)_","_((EY\2)+%9Y)_","_(EX+%9X)_","_((EY\2)+%9Y) D ^%PBPZ Q
106 S %9LXY=((EX\2)+%9X)_","_(EY+%9Y)_","_((EX\2)+%9X)_","_((EY\2)+%9Y)_","_%9X_","_((EY\2)+%9Y) D ^%PBPZ Q
108 S %9LXY=((EX\2)+%9X)_","_%9Y_","_((EX\2)+%9X)_","_((EY\2)+%9Y)_","_(EX+%9X)_","_((EY\2)+%9Y) D ^%PBPZ Q
107 S %9LXY=((EX\2)+%9X)_","_%9Y_","_((EX\2)+%9X)_","_((EY\2)+%9Y)_","_%9X_","_((EY\2)+%9Y) D ^%PBPZ Q
113 S %9LXY=%9X_","_((EY\2)+%9Y)_","_(EX+%9X)_","_((EY\2)+%9Y) D ^%PBPZ Q:TYPE
 Q:OX=""
 G:OX>DX GAUC G DROI
 
BAS S %FONC="LIGBRI",%9LXY=(((EX/2)+%9X)-((%9EPA*150)/2))_","_(EY+%9Y)_","_((EX/2)+%9X)_","_((EY/2)+%9Y)_","_(((EX/2)+%9X)+((%9EPA*150)/2))_","_(EY+%9Y) D ^%PBPZ Q
 
HAUT S %FONC="LIGBRI",%9LXY=(((EX/2)+%9X)-((%9EPA*150)/2))_","_%9Y_","_((EX/2)+%9X)_","_((EY/2)+%9Y)_","_(((EX/2)+%9X)+((%9EPA*150)/2))_","_%9Y D ^%PBPZ Q
 
DROI S %FONC="LIGBRI",%9LXY=%9X_","_(((EY/2)+%9Y)+((%9EPA*150)/2))_","_((EX/2)+%9X)_","_((EY/2)+%9Y)_","_%9X_","_(((EY/2)+%9Y)-((%9EPA*150)/2)) D ^%PBPZ Q
 
GAUC S %FONC="LIGBRI",%9LXY=(EX+%9X)_","_(((EY/2)+%9Y)+((%9EPA*150)/2))_","_((EX/2)+%9X)_","_((EY/2)+%9Y)_","_(EX+%9X)_","_(((EY/2)+%9Y)-((%9EPA*150)/2)) D ^%PBPZ Q
 
TERM ;;KYOCERA F-1010,KYO
 
ENTET 
 N %DESSIN S %DESSIN=0
 
 S %9X=EX,%9Y=3010 D CONV
 S %FONC="TEXT",%9STR="Le "_$$DATE^%QMDATE_" a "_$$HEURE^%QMDATE D ^%PBPZ
 S %9X=EX,%9Y=2920 D CONV
 S %FONC="TEXT",%9STR="Flux "_%FLU_" du "_DAT1_" a "_HEUR1_" au "_DAT2_" a "_HEUR2 D ^%PBPZ
 S %9X=EX,%9Y=2830 D CONV
 S %FONC="TEXT",%9STR=MESSAGE D ^%PBPZ
 S %FONC="SEGMENT",%9X1=0,%9Y1=MY,%9X2=4090,%9Y2=MY D ^%PBPZ
 Q
 
CONV 
 S %FONC="CONVERSION.X" D ^%PBPZ
 S %FONC="CONVERSION.Y" D ^%PBPZ
 S %FONC="MOUV" D ^%PBPZ
 Q

