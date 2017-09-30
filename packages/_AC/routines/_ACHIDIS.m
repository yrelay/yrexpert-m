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

;%ACHIDIS^INT^1^59547,73864^0
ACHIDIS ;
 
 
 
 
 N ADR,DEFF,DEFP,REPP,REPPI,REPF,REPFI,SECT
 S ADR=$$ADR^%ACHICMS
 
 I ($D(@ADR)#10)'=1 S (DEFF,DEFP)="" G AFF
 S DEFP=$P(@ADR,"^",1),DEFF=$P(@ADR,"^",2)
AFF D TIT^%ACHICMS("Calcul des distances")
PERE 
 S REPP=$$REP^%ACHICMS("secteur",0,8,DEFP)
 I REPP="" Q
 S REPPI=$$NOMINT^%QSF(REPP)
FILS 
 S REPF=$$REP^%ACHICMS("module",0,11,DEFF)
 I REPF="" G PERE
 S REPFI=$$NOMINT^%QSF(REPF)
 
 S @ADR=REPP_"^"_REPF_"^"_$S(($D(@ADR)#10)'=1:"",1:$P(@ADR,"^",3))
 S DEFP=REPP,DEFF=REPF
SECT 
 S SECT=$$SECT^%ACHICMS(0,14,REPP,"REAFF^%ACHIDIS")
 I SECT="" G FILS
 I '($$IR^%QSGE5(REPPI,SECT)) D ^%VZEAVT($$^%QZCHW("Ce secteur n'existe pas")) G SECT
 S DX=9,DY=14 X XY W $$^%QZCHW("Nom du secteur")," : ",SECT
 D CALC($$CONCAS^%QZCHAD(ADR,REPPI),SECT,REPFI)
 G SECT
 
REAFF D TIT^%ACHICMS("Calcul des distances")
 S DX=9,DY=8 X XY W $$^%QZCHW("Nom du repertoire secteur")," : ",REPP
 S DX=9,DY=11 X XY W $$^%QZCHW("Nom du repertoire module"),"  : ",REPF
 Q
 
CALC(GLS,SECT,REPF) 
 N %I,ATD,CENT,D,I,GLO,IND,INDI,HC,LC,NOM,TAB,TEMP,TYP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S CENT=$$CONCAS^%QZCHAD(TEMP,"DIST")
 S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO")
 S TAB=$$CONCAT^%QZCHAD(GLS,""""_SECT_"""")
 S ATD=$$ATDIST
 S LC=@TAB@("POS","LC"),HC=@TAB@("POS","HC")
 S I=""
 F %I=0:0 S I=$O(@TAB@("NUM",I)) Q:I=""  S @GLO@(@TAB@("NUM",I))=I
 
 S IND=""
 F %I=0:0 S IND=$O(@TAB@("PLNUM",IND)) Q:IND=""  S NOM=SECT_","_$$NAME(IND) D PSV^%QSGESTI(REPF,NOM,ATD)
 
 S IND=""
 F %I=0:0 S IND=$O(@TAB@("PLNUM",IND)) Q:IND=""  D DIST
 K @(TEMP)
 
 S @GLS@(SECT,"DISTANCE")=1
 Q
 
DIST 
 S INDI=$$NAME(IND)
 S NOM=SECT_","_INDI
 
 I '($D(@CENT@("COOR",IND))) D CENT(CENT,IND)
 S I=""
D2 S I=$O(@TAB@("PLNUM",I)) I I="" Q
 I I=IND G D2
 
 I '($D(@TAB@("MOD",IND,I))) G D2
 
 I $D(@CENT@("CALC",I,IND)) G D2
 
 I '($D(@CENT@("COOR",I))) D CENT(CENT,I)
 
 S D=$$DIS(IND,I)
 
 D PA^%QSGESTI(REPF,NOM,ATD,D,$$NAME(I)),PA^%QSGESTI(REPF,SECT_","_$$NAME(I),ATD,D,INDI)
 D MSG^%VZEATT("Distance de "_INDI_" a "_$$NAME(I)_" = "_$S(D="":"Indefini",1:D)) H 2
 S @CENT@("CALC",IND,I)=""
 G D2
 
NAME(I) 
 Q $S($D(@GLO@(I)):@GLO@(I),1:I)
 
CENT(GL,I) 
 
 N %X,%Y,N,SC,SX,SY,X,XI,Y,YI,NG,ND,NH,NB,P
 S Y="",(N,SC,SX,SY)=0,P=1
 F %Y=0:0 S Y=$O(@TAB@("COOR",I,Y)) Q:Y=""  S X="" F %X=0:0 S X=$O(@TAB@("COOR",I,Y,X)) Q:X=""  D CAL
 
 S @GL@("NBRE",I)=N
 
 S @GL@("CURS",I)=SC
 S XI=SX\N,YI=SY\N
INT 
 S Y="",N=0
 F %Y=0:0 S Y=$O(@TAB@("COOR",I,Y)) Q:Y=""  S X="" F %X=0:0 S X=$O(@TAB@("COOR",I,Y,X)) Q:X=""  I ((X+LC)>XI)&((X-1)<XI),((Y+HC)>YI)&((Y-1)<YI) S N=1 Q
 I N=1 G FCE
 I P=0 G COR
 
 S (NG,ND,NH,NB,P)=0
 F %Y=0:0 S Y=$O(@TAB@("COOR",I,Y)) Q:Y=""  S X="" F %X=0:0 S X=$O(@TAB@("COOR",I,Y,X)) Q:X=""  D POS
 S Y=""
 F %Y=0:0 S Y=$O(@TAB@("COOR",I,Y)) Q:Y=""  S X="" F %X=0:0 S X=$O(@TAB@("COOR",I,Y,X)) Q:X=""  I ((X+LC)>XI)&((X-1)<XI),((Y+HC)>YI)&((Y-1)<YI) S N=1 Q
COR 
 I ND'<NG S XI=XI+1
 E  S XI=XI-1
 I NB'<NH S YI=YI+1
 E  S YI=YI-1
 G INT
FCE S @GL@("COOR",I)=XI_"^"_YI
 D MSG^%VZEATT("Centre de "_$$NAME(I)_" (DY,DX) = "_YI_" "_XI) H 2 Q
CAL 
 S N=N+1
 
 S SX=(SX+X)+(LC\2),SY=(SY+Y)+(HC\2)
 N IL,IH
 
 I $D(@TAB@("COOR",I,Y,(X+LC)-1)) S IL=LC-1
 E  S IL=LC
 I $D(@TAB@("COOR",I,(Y+HC)-1,X)) S IH=HC-1
 E  S IH=HC
 S SC=SC+(IL*IH)
 Q
POS 
 I X<XI S NG=NG+1
 E  S ND=ND+1
 I Y<YI S NH=NH+1
 E  S NB=NB+1
 Q
 
DIS(A,B) 
 N %Y,%X,X,Y,MIN,DA,DB,DIS
 S MIN=10E10,Y=""
 
 S DA=$$^%QSCALVA(REPFI,SECT_","_$$NAME(A),"SURFACE")
 S DB=$$^%QSCALVA(REPFI,SECT_","_$$NAME(B),"SURFACE")
 I (DA="")!(DB="") Q ""
 F %Y=0:0 S Y=$O(@TAB@("MOD",A,B,Y)) Q:Y=""  S X="" F %X=0:0 S X=$O(@TAB@("MOD",A,B,Y,X)) Q:X=""  S DIS=$$DCO(A,Y,X)+$$DCO(B,Y,X) I DIS<MIN S MIN=DIS
 Q $J(MIN,1,2)+0
DCO(I,Y,X) 
 
 N XC,XI,YC,YI,SURF,SC,D
 S XI=@CENT@("COOR",I),YI=$P(XI,"^",2),XI=$P(XI,"^",1)
 S SURF=$$^%QSCALVA(REPFI,SECT_","_$$NAME(I),"SURFACE")
 S SC=SURF/@CENT@("CURS",I)
 S XC=$$SQR^%TLCAMTH((SC*7)/10),YC=(10/7)*XC
 S D=($$ABS^%TLCAMTH(XI-X)*XC)+($$ABS^%TLCAMTH(YI-Y)*YC)
 Q D
 
ATDIST() Q "DISTANCE"

