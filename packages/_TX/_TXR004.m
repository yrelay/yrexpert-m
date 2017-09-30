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

;%TXR004^INT^1^59547,74033^0
%TXR004 ;
 
 
 
 
 N ADR,RAG,REPFI,DOS,I
 N DATE,CYCLE,DUREE,TABAC,ALCOOL,JUMEAUX,LUX,MALFORM,RH,RUBEOLE,TOXO
 N DIAB,HTA,PHLEBITE,ALLERGIE,NEPHROP,ALLERGIE,URINAIRE,CARDIOP
 S ADR="^[""BB""]RMGG",RAG="PATIENT",REPFI="RMGG"
 D CLEPAG^%VVIDEO
 D BLD^%VVIDEO,REV^%VVIDEO S DX=5,DY=5 X XY W "Chargement de RMGG en cours ..."
 D NORM^%VVIDEO,DEB^%VTEMPS($P($ZPOS,"^",2))
 S DOS="" F I=1:1 S DOS=$O(@ADR@(DOS)) Q:DOS=""  Q:DOS="z"  D POCLEPA^%VVIDEO W DOS D TRAIT
 D AFF^%VTEMPS($P($ZPOS,"^",2)),NORM^%VVIDEO Q
 
TRAIT 
 
 
 
 
 I DOS["/" S DOS=$TR(DOS,"/",".")
 I '($$IR^%QSGEST5(RAG,DOS)) S:DOS["." DOS=$TR(DOS,".","/") Q
 
 
 S INDIV=DOS
 D ADDO^%QSGEST3(RAG,INDIV,"RMGG","RMGG",REPFI,"RMGG")
 I DOS["." S DOS=$TR(DOS,".","/")
 S VAL=@ADR@(DOS),VAL=$$ADR^%QZCHNET(VAL)
 I DOS["/" S DOS=$TR(DOS,"/",".")
 S DATE=$P(VAL,"^",1),DATE=$$ADR^%QZCHNET(DATE)
 S CYCLE=$P(VAL,"^",2),CYCLE=$$ADR^%QZCHNET(CYCLE)
 S DUREE=$P(VAL,"^",3),DUREE=$$ADR^%QZCHNET(DUREE)
 S TABAC=$P(VAL,"^",4),TABAC=$$ADR^%QZCHNET(TABAC)
 S ALCOOL=$P(VAL,"^",5),ALCOOL=$$ADR^%QZCHNET(ALCOLL)
 S JUMEAUX=$P(VAL,"^",6),JUMEAUX=$$ADR^%QZCHNET(JUMEAUX)
 S LUX=$P(VAL,"^",7),LUX=$$ADR^%QZCHNET(LUX)
 S MALFORM=$P(VAL,"^",8),MALFORM=$$ADR^%QZCHNET(MALFORM)
 S RH=$P(VAL,"^",9),RH=$$ADR^%QZCHNET(RH)
 S RUBEOLE=$P(VAL,"^",10),RUBEOLE=$$ADR^%QZCHNET(RUBEOLE)
 S TOXO=$P(VAL,"^",11),TOXO=$$ADR^%QZCHNET(TOXO)
 S DIAB=$P(VAL,"^",12),DIAB=$$ADR^%QZCHNET(DIAB)
 S HTA=$P(VAL,"^",13),HTA=$$ADR^%QZCHNET(HTA)
 S PHLEBITE=$P(VAL,"^",14),PHLEBITE=$$ADR^%QZCHNET(PHLEBITE)
 S NEPHROP=$P(VAL,"^",15),NEPHROP=$$ADR^%QZCHNET(NEPHROP)
 S ALLERGIE=$P(VAL,"^",16),ALLERGIE=$$ADR^%QZCHNET(ALLERGIE)
 S URINAIRE=$P(VAL,"^",17),URINAIRE=$$ADR^%QZCHNET(URINAIRE)
 S CARDIOP=$P(VAL,"^",18),CARDIOP=$$ADR^%QZCHNET(CARDIOP)
 S INDF=INDIV_","_"RMGG"
 F B=1:1:4 F BB=1:1:8 S ATT=$P(VAL,"^",18+BB),ATT=$$ADR^%QZCHNET(ATT) D AFFEC(BB,ATT)
 D PA^%QSGESTI(REPFI,INDF,"DATE.PR",DATE,1)
 D PA^%QSGESTI(REPFI,INDF,"CYCLE",CYCLE,1)
 D PA^%QSGESTI(REPFI,INDF,"DUREE",DUREE,1)
 D PA^%QSGESTI(REPFI,INDF,"TABAC",TABAC,1)
 D PA^%QSGESTI(REPFI,INDF,"ALCOOL",ALCOOL,1)
 D PA^%QSGESTI(REPFI,INDF,"JUMEAUX",JUMEAUX,1)
 D PA^%QSGESTI(REPFI,INDF,"LUX",LUX,1)
 D PA^%QSGESTI(REPFI,INDF,"RH",RH,1)
 D PA^%QSGESTI(REPFI,INDF,"RUBEOLE",RUBEOLE,1)
 D PA^%QSGESTI(REPFI,INDF,"TOXO",TOXO,1)
 D PA^%QSGESTI(REPFI,INDF,"DIAB",DIAB,1)
 D PA^%QSGESTI(REPFI,INDF,"HTA",HTA,1)
 D PA^%QSGESTI(REPFI,INDF,"PHLEBITE",PHLEBITE,1)
 D PA^%QSGESTI(REPFI,INDF,"NEPHROP",NEPHROP,1)
 D PA^%QSGESTI(REPFI,INDF,"NOM","RMGG",1)
AFFEC(BB,ATT) 
 Q:ATT=""
 D:BB=1 PA^%QSGESTI(REPFI,INDF,"Ac/Av",ATT,B)
 D:BB=2 PA^%QSGESTI(REPFI,INDF,"DATE",ATT,B)
 D:BB=3 PA^%QSGESTI(REPFI,INDF,"LIEU",ATT,B)
 D:BB=4 PA^%QSGESTI(REPFI,INDF,"TERME",ATT,B)
 D:BB=5 PA^%QSGESTI(REPFI,INDF,"GROSSESSE",ATT,B)
 D:BB=6 PA^%QSGESTI(REPFI,INDF,"ACCOUCHEMENT",ATT,B)
 D:BB=7 PA^%QSGESTI(REPFI,INDF,"ENFANT",ATT,B)
 D:BB=8 PA^%QSGESTI(REPFI,INDF,"SUITES",ATT,B)
 Q

