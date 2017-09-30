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

;TODUPSF^INT^1^59547,74872^0
TODUPSF ;
 
 
 
 
 D CADRE
QUES S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=20,DY=10 X XY W 1," ",$$^%QZCHW("duplication totale"),!,?20,2," ",$$^%QZCHW("duplication selective")
 D POCLEPA^%VVIDEO W $$^%QZCHW("votre choix")," : " S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN G:(Y1'=1)&(Y1'=2) QUES
 S CHX=Y1
 K ^TACOMPIL($I) G:CHX=2 CH2
 F UU=1:1:17 S ^TACOMPIL($I,UU)=1
 G Q2
CH2 S DX=0,DY=6 D CLEBAS^%VVIDEO W !
 F UU=0:1 S BAT=$T(1+UU) Q:BAT=""  S BAT=$P($P(BAT,";;",2),"/",1) W ?((UU#2)*40)+10,$S((UU+1)<10:" ",1:""),UU+1," ",BAT I ((UU+1)#2)=0 W !
Q5 K ^TACOMPIL($I) D POCLEPA^%VVIDEO W $$^%QZCHW("votre choix")," : " S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) QUES
 F UU=1:1 S VV=$P(Y1,",",UU) Q:VV=""  G:$T(@VV)="" Q5 S ^TACOMPIL($I,VV)=1
Q2 S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("vous voulez dupliquer le SF de quel article")," : " S DX=10,DY=12 X XY W "- " S DX=$X D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") QUES
 S PCH=Y1 D REC G:REF=1 Q2
 S DX=10,DY=12 X XY W "- ",PCHCOMP
 S OART=PCHCOMP
Q3 S DX=0,DY=13 D CLEBAS^%VVIDEO S DX=0,DY=14 X XY W $$^%QZCHW("nom du nouvel article")," : " S DX=10,DY=16 X XY W "- "
 S DX=$X D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") Q2
 S PCH=Y1 D REC G:REF=1 Q3
 S DX=10,DY=16 X XY W "- ",PCHCOMP S ART=PCHCOMP
Q4 S DX=0,DY=6 D CLEBAS^%VVIDEO W "   ",$$^%QZCHW("pendant la duplication, s'il existe du Savoir-Faire concernant"),!,?40-($L(ART)\2),ART,!,$$^%QZCHW("le uupprime-t-on (O/N/(A)bandon)")," ? "
 R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("O"))&((REP'=$$^%QZCHW("N"))&(REP'="A")) Q4
 I REP="A" S DX=0,DY=6 D CLEBAS^%VVIDEO G Q3
 S %DEL=REP K ^COMPILVU($I),^TABVU($I)
 S DX=0,DY=6 D CLEBAS^%VVIDEO
 
 S NU=-1
LNU S NU=$N(^TACOMPIL($I,NU)) G:NU=-1 END
 S BAT=$P($T(@NU),";;",2),CPT=$P(BAT,"/",3),TB=$P(BAT,"/",1),BAT=$P(BAT,"/",2)
 G:CPT="" LNU2
 I '($D(^[QUI]CPTEUR("NUPAIMP",OART))) G:CPT=2 LNU1 G LNU2
 I '($D(^[QUI]CPTEUR("NUPAIMP",ART))) S ^[QUI]CPTEUR("NUPAIMP",ART)=^[QUI]CPTEUR("NUPAIMP",OART) G:CPT=2 LNU1 G LNU2
 I ^[QUI]CPTEUR("NUPAIMP",OART)>^[QUI]CPTEUR("NUPAIMP",ART) S ^[QUI]CPTEUR("NUPAIMP",ART)=^[QUI]CPTEUR("NUPAIMP",OART)
 G:CPT=1 LNU2
LNU1 I '($D(^[QUI]CPTEUR("NUPAMAT",OART))) G LNU2
 I '($D(^[QUI]CPTEUR("NUPAMAT",ART))) S ^[QUI]CPTEUR("NUPAMAT",ART)=^[QUI]CPTEUR("NUPAMAT",OART) G LNU2
 I ^[QUI]CPTEUR("NUPAMAT",OART)>^[QUI]CPTEUR("NUPAMAT",ART) S ^[QUI]CPTEUR("NUPAMAT",ART)=^[QUI]CPTEUR("NUPAMAT",OART)
LNU2 G:NU=18 TRIP
 F UU=1:1 S TBT=$P(BAT,",",UU) Q:TBT=""  Q:$D(^TABVU($I,TBT))  S ^TABVU($I,TBT)=1 K:%DEL=1 @("^[QUI]"_TBT_"("""_ART_""")") S ADR="TRAIT^TODUPSF",NOMTAB="^[QUI]"_TBT_"("""_OART_"""" D ^%VTENR
 G LNU
 
TRAIT S:$E(TBT,1,2)'="FL" ^COMPILVU($I,TB)=1 W "-" S RS=@NOM,P1=$P(NOM,OART,1),P2=$P(NOM,OART,2),NNOM=P1_ART_P2,@NNOM=RS
FIN Q
 
END D CLEPAG^%VVIDEO,CADRE S DX=0,DY=6 X XY W $$^%QZCHW("duplication de")," ",OART,!,$$^%QZCHW("en")," ",ART,!,!,?30,$$^%QZCHW("a ete duplique")," : ",!,!
 I '($D(^COMPILVU($I))) W $$^%QZCHW("Aucun Savoir-Faire")," !" G FINI
 S VV=-1 F UU=1:1 S VV=$N(^COMPILVU($I,VV)) Q:VV=-1  W ?(((UU-1)#2)*40)+10,VV I (UU#2)=0 W !
FINI D POCLEPA^%VVIDEO W "[RETURN] " R *RET:60 Q
TRIP S VOART="VALI"_OART_"/",VART="VALI"_ART_"/",OB=VOART,TBT="^[QUI]IMPTRIP"
TRIP1 F W1=1:1 S OB=$N(@TBT@(OB)) Q:OB=-1  Q:$E(OB,1,$L(VOART))'=VOART  S NVA=VART_$P(OB,"/",2,500),P=-1 F W2=1:1 S P=$N(@TBT@(OB,P)) Q:P=-1  S NU=-1 F W3=1:1 S NU=$N(@TBT@(OB,P,NU)) Q:NU=-1  D TTRIP
 G:TBT["FLTRIP" LNU S OB=VOART,TBT="^[QUI]FLTRIP" G TRIP1
TTRIP S ^COMPILVU($I,TB)=1,@TBT@(NVA,P,NU)=@TBT@(OB,P,NU) Q
REC S REF=0 D ^%LXABR I CONCUR=0 S M1=$$^%QZCHW("inconnu"),REF=1 G REC1
 I CONCUR>1 S M1=$$^%QZCHW("ambigu"),REF=1 G REC1
 I $D(^[QUI]TOSYNONY(PCHCOMP)) S M1=$$^%QZCHW("synonyme de")_" "_$N(^[QUI]TOSYNONY(PCHCOMP,-1)),REF=2 G REC1
REC1 I REF=0 G FIN
 D POCLEPA^%VVIDEO W $$^%QZCHW("(L)exique,(B) consultation breve") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("L"))&(REP'=$$^%QZCHW("B")) FIN G @REP
L D ^%LXAJMOD,CLEPAG^%VVIDEO,CADRE G FIN
B D ^%LXCONS,CLEPAG^%VVIDEO,CADRE G FIN
 
CADRE D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("duplication du Savoir-Faire"))
 G FIN
 
1 ;;Explicites/EXPLICI
2 ;;Implicites/IMPLICI,FLIMPLI,ESSABAC,FLABAC/1
3 ;;Composants/NOMENC,FLNOM
4 ;;Phases/PHASE,FLPHAS
5 ;;Temps et couts/FORMULE,FLFORM,AUTREFO,FLAUTRFO
6 ;;Consignes/OUTCONS,FLCONS
7 ;;Dimentions a l'outils/DIMOUT,FLDIM
8 ;;Choix matiere/MATIERE,FLMAT
9 ;;Selection matiere/SELMAT,FLSELM
10 ;;Selection machine/MACSEL,FLSELC
11 ;;Description matiere/MATSTOCK/1
12 ;;Explicites matiere/EXPMAT
13 ;;Implicites matiere/IMPMAT,FLIMPLI,ESSABAC,FLABAC/1
14 ;;Description machine/DESMACH
15 ;;Explicites machine/EXPMACH
16 ;;Implicites machine/IMPMAC,FLIMPLI,ESSABAC,FLABAC/2
17 ;;Controle evaluation/TOCTREV,FLCTREV

