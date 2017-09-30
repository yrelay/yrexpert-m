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

;%QUARBRE^INT^1^59547,73884^0
QUARBRE(ARBRE,SOL,GLCH,ORI,TITRE,ROU) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N PFMAX
 
 D CONSARB
 I '($D(^ARBTHEO($J))) Q
 
 G ^%QUARBED
 
CONSARB 
 N CAR,COMP,CYCLE,DEJAVU,GLORI,INF1,INF2,IPI,LAT,NIV,OCOMP,OLAT,PILE,PROF,PROFMX,RAC,REF,RRE,TEMP,TREF,XETOILE,MESS,WW,BLD
 D POCLEPA^%VVIDEO
 S MESS=$$^%QZCHW("Construction de l'arbre")_"..." D ^%VZETOI
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S DEJAVU=$$CONCAS^%QZCHAD(TEMP,"DEJAVU")
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S GLORI=$$CONCAS^%QZCHAD(TEMP,"ORIGINES")
 K ^COMPNOM($J),^ARBTHEO($J)
 S CYCLE=0,PROFMX=40
 S NIV=-1,PFMAX=0
 I ORI'="" S @GLORI@(ORI)=""
 
 I ORI="" D CONS
 
 
 I SOL="" G GRAPH
 
 S RAC=""
BSOL 
 S RAC=$O(@SOL@(RAC)) I RAC="" G GRAPH
 S NIV=NIV+1
 S INF2=$S(($D(@ARBRE@(RAC))#10)=1:@ARBRE@(RAC),1:"")
 S ^ARBTHEO($J,NIV)="^"_RAC_"^"_INF2_"^"_"^"_$S(GLCH="":0,$D(@GLCH@(RAC)):1,1:0)
 S ^COMPNOM($J,RAC)=1,@DEJAVU@(RAC)=1,@DEJAVU@("DOUBLE",RAC)=1
 G BSOL
 
GRAPH 
 S RAC=""
BCOR 
 S RAC=$O(@GLORI@(RAC)) I RAC="" G END
 S NIV=NIV+1
 S (CAR,INF1)="",IPI=1,LAT=1
 S BLD=$S(GLCH="":0,$D(@GLCH@(RAC)):1,1:0)
 K @(PILE)
 
 S INF2=$S(($D(@ARBRE@(RAC))#10)=1:@ARBRE@(RAC),1:"")
 S ^ARBTHEO($J,NIV)=INF1_"^"_RAC_"^"_INF2_"^"_CAR_"^"_BLD
 S ^COMPNOM($J,RAC)=1,@DEJAVU@(RAC)=1,@DEJAVU@("DOUBLE",RAC)=1
 S @PILE@(0)=RAC_"^^1^"_BLD
 S COMP=""
GET 
 S COMP=$O(@ARBRE@(RAC,COMP)) G:COMP="" SUIT
 S INF1=@ARBRE@(RAC,COMP)
 S INF2=$S(($D(@ARBRE@(COMP))#10)=1:@ARBRE@(COMP),1:"")
 I IPI>PROFMX G SUIT
 S BLD=BLD&$S(GLCH="":0,1:$D(@GLCH@(RAC,COMP)))
 S @PILE@(IPI)=COMP_"^"_NIV_","_LAT_"^"_INF1_"^"_BLD
 I $D(@DEJAVU@(COMP)) S CYCLE=1 G DEJAV
 S REF=NIV_","_LAT,CAR=""
 I $D(@DEJAVU@("DOUBLE",COMP)) S CAR="*"
 D GREF
 S NIV=NIV_","_LAT,IPI=IPI+1,LAT=1,RAC=COMP,OCOMP=COMP,COMP=""
 G GET
 
SUIT S IPI=IPI-1 G:('($D(@PILE@(IPI))))!(IPI=0) FIN
 K @DEJAVU@(OCOMP)
 S RAC=$P(@PILE@(IPI-1),"^",1),COMP=$P(@PILE@(IPI),"^",1),OCOMP=RAC
 S NIV=$P(@PILE@(IPI),"^",2),BLD=$P(@PILE@(IPI-1),"^",4)
 F WW=1:1 S LAT=$P(NIV,",",WW) Q:LAT=""  S OLAT=LAT
 S NIV=$E(NIV,1,($L(NIV)-$L(OLAT))-1),LAT=OLAT+1
 G GET
 
DEJAV S REF=NIV_","_LAT,CAR="!" D GREF
 G:('($D(@PILE@(IPI))))!(IPI=0) FIN
 S RAC=$P(@PILE@(IPI-1),"^",1),COMP=$P(@PILE@(IPI),"^",1)
 S BLD=$P(@PILE@(IPI-1),"^",4)
 S NIV=NIV_","_LAT
 F WW=1:1 S LAT=$P(NIV,",",WW) Q:LAT=""  S OLAT=LAT
 S NIV=$E(NIV,1,($L(NIV)-$L(OLAT))-1),LAT=OLAT+1
 G GET
 
GREF 
 D TOP^%VZETOI
 S TREF="^ARBTHEO($J",PROF=0
 F WW=1:1 S RRE=$P(REF,",",WW) Q:RRE=""  S PROF=PROF+1,TREF=TREF_","_RRE
 S PFMAX=$S(PROF>PFMAX:PROF,1:PFMAX),TREF=TREF_")"
 
 I PROF>(PROFMX+1) G GR2
 S @TREF=INF1_"^"_COMP_"^"_INF2_"^"_CAR_"^"
 
 
 
 S @TREF=@TREF_BLD
GR2 S ^COMPNOM($J,COMP)=$S($D(^COMPNOM($J,COMP)):^COMPNOM($J,COMP),1:0)+INF1
 S @DEJAVU@(COMP)=1,@DEJAVU@("DOUBLE",COMP)=1 Q
 
FIN G BCOR
 
END 
 K @(TEMP)
 D FIN^%VZETOI
 Q
 
CONS 
 N ORI,PERE,FILS
 S ORI=""
BCO S ORI=$O(@ARBRE@(ORI)) I ORI="" Q
 
 
 I SOL'="",$D(@SOL@(ORI)) G BCO
 S @GLORI@(ORI)=""
 
 S PERE=""
COP S PERE=$O(@ARBRE@(PERE)) I PERE="" G BCO
 I ORI=PERE G COP
 S FILS=""
COF S FILS=$O(@ARBRE@(PERE,FILS)) I FILS="" G COP
 I FILS=ORI K @GLORI@(ORI) G BCO
 G COF
 
TEST N GLO,GLO1,GLO2,ORI
 D POCLEPA^%VVIDEO R GLO Q:GLO=""
 D POCLEPA^%VVIDEO R GLO1 Q:GLO1=""
 D POCLEPA^%VVIDEO R GLO2 Q:GLO2=""
 D POCLEPA^%VVIDEO R ORI
 D QUARBRE(GLO,GLO1,GLO2,ORI,"Test de QUARBRE","AFFCO^%QUARBRE(1)")
 Q
 
AFFCO(B,P,F,CONT) 
 D POCLEPA^%VVIDEO
 W "pere = ",P,"  .  fils = ",F,"    --> ",$P($P(CONT,">",1),"<",2),"    --> ",$P($P(CONT,")",1),"(",2)
 R *X Q

