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

;%QMNF6^INT^1^59547,73879^0
QMNF6(GLO,RAC,PROFMX,%VELO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,DEJAVU,PILC,INF1,INF2,CAR
 N ARB,COMP,OCOMP,NIV,LAT,OLAT,IPI,REF,RRE,TREF,WW,PFMAX
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S DEJAVU=$$CONCAS^%QZCHAD(TEMP,"DEJAVU")
 S PILC=$$CONCAS^%QZCHAD(TEMP,"PILC")
 K ^COMPNOM($J),^ARBTHEO($J)
 S %VELO=0,RAC=RAC,ARB="^ARBTHEO($J"
 S INF1="",CAR=""
 
 
 S INF2=$S($D(@GLO@(RAC,"%@RACINE")):@GLO@(RAC,"%@RACINE"),1:"")
 
 S ^ARBTHEO($J,0)=INF1_"^"_RAC_"^"_INF2_"^"_CAR,^COMPNOM($J,RAC)=1
 S IPI=1,COMP="",NIV="0",LAT=1,%PFMAX=0,@PILC@(0)=RAC_"^^1",@DEJAVU@(RAC)=1,@DEJAVU@("DOUBLE",RAC)=1
GET 
 S COMP=$O(@GLO@(RAC,COMP)) G:COMP="%@RACINE" GET G:COMP="" SUIT S INF1=@GLO@(RAC,COMP),INF2=$S($D(@GLO@(RAC,COMP,"FILS")):@GLO@(RAC,COMP,"FILS"),1:"")
 
 I IPI>PROFMX G SUIT
 S @PILC@(IPI)=COMP_"^"_NIV_","_LAT_"^"_INF1
 I $D(@DEJAVU@(COMP)) S %VELO=1 G DEJAV
 S REF=NIV_","_LAT,CAR=""
 I $D(@DEJAVU@("DOUBLE",COMP)) S CAR="*"
 D GREF
 S NIV=NIV_","_LAT,IPI=IPI+1,LAT=1,RAC=COMP,OCOMP=COMP,COMP="" G GET
SUIT S IPI=IPI-1 G:('($D(@PILC@(IPI))))!(IPI=0) FIN
 K @DEJAVU@(OCOMP) S RAC=$P(@PILC@(IPI-1),"^",1),COMP=$P(@PILC@(IPI),"^",1),OCOMP=RAC,NIV=$P(@PILC@(IPI),"^",2)
 F WW=1:1 S LAT=$P(NIV,",",WW) Q:LAT=""  S OLAT=LAT
 S NIV=$E(NIV,1,($L(NIV)-$L(OLAT))-1),LAT=OLAT+1 G GET
 
DEJAV S REF=NIV_","_LAT,CAR="!" D GREF
 G:('($D(@PILC@(IPI))))!(IPI=0) FIN
 S RAC=$P(@PILC@(IPI-1),"^",1),COMP=$P(@PILC@(IPI),"^",1)
 S NIV=NIV_","_LAT
 F WW=1:1 S LAT=$P(NIV,",",WW) Q:LAT=""  S OLAT=LAT
 S NIV=$E(NIV,1,($L(NIV)-$L(OLAT))-1),LAT=OLAT+1
 G GET
 
GREF S TREF=ARB,PFMAX=0
 F WW=1:1 S RRE=$P(REF,",",WW) G:RRE="" END S PFMAX=PFMAX+1,TREF=TREF_","_RRE
END S %PFMAX=$S(PFMAX>%PFMAX:PFMAX,1:%PFMAX),TREF=TREF_")"
 
 S:PFMAX'>(PROFMX+1) @TREF=INF1_"^"_COMP_"^"_INF2_"^"_CAR
 S ^COMPNOM($J,COMP)=$S($D(^COMPNOM($J,COMP)):^COMPNOM($J,COMP),1:0)+INF1
 S @DEJAVU@(COMP)=1,@DEJAVU@("DOUBLE",COMP)=1 Q
FIN 
 K @(TEMP)
 Q

