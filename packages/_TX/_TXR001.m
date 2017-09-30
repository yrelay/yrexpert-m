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

;%TXR001^INT^1^59547,74033^0
%TXR001 ;;02:48 PM  4 Sep 1996
 
 
 
 
 
 N GL,CLE,NC,RAG,INDIV,TEMP,GCLE,NAIS,PREN,NOM,NUM
 S TEMP=$$CONCAS^%QZCHAD("^TEMPORAIRE",$J_","_$P($ZPOS,"^",2)) K @(TEMP)
 S GCLE=$$CONCAS^%QZCHAD(TEMP,"CLE")
 S RAG="PATIENT"
 S GL="^RAG("""")"
BIMPR ;; cao debug ^%Q
 S GL=$$^%Q($Q(@GL))
 Q:GL=""
 K CLE D ^%QCAGLCM(GL,.CLE,.NC)
 
 I NC=4 D NORM,CLE4,STOCK G BIMPR
 
 
 S @GCLE@(NC,GL)=""
 
 I NC=5 D NORM,CLE51,STOCK
 G BIMPR
NORM 
 S NOM=CLE(1),PREN=CLE(2),NAIS=CLE(3),DOS=CLE(4)
 S INDIV=DOS I INDIV["/" S INDIV=$TR(INDIV,"/",".")
 D POCLEPA^%VVIDEO S DX=0,DY=23 W INDIV
 S SYN2=NOM_" "_PREN_" "_NAIS
 D:SYN2'="" INS^%QAX("CONSULTATION",INDIV,SYN2)
 D PA^%QSGESTI(RAG,INDIV,"NOM",INDIV,1)
 D PA^%QSGESTI(RAG,INDIV,"NOM.FAMILLE",NOM,1)
 D PA^%QSGESTI(RAG,INDIV,"PRENOM",PREN,1)
 D PA^%QSGESTI(RAG,INDIV,"DATE.NAISSANCE",NAIS,1)
 S VAL2=@GL,VAL2=$$ADR^%QZCHNET(VAL2)
 Q
CLE51 S NBC=$L(VAL2,"^") F K=1:2:NBC S NUM=$P(VAL2,"^",K) Q:NUM=""  D @NUM
 ;; cao debug ^%Q
 S SGL=GL,GL=$$^%Q($Q(@GL)) K CLE D ^%QCAGLCM(GL,.CLE,.NC) G:(NC=5)&(CLE(5)'=1) CLE51
 S GL=SGL Q
CLE4 S K=0 F NUM=3:1:20 D @NUM S K=K+1 S:NUM=4 NUM=6
 Q
3 S SEXE=$P(VAL2,"^",K+1) Q
4 S FILLE=$P(VAL2,"^",K+1) Q
7 S NSS=$P(VAL2,"^",K+1) Q
8 S SITUAT=$P(VAL2,"^",K+1) Q
9 S MUTU=$P(VAL2,"^",K+1) Q
10 S ADRES=$P(VAL2,"^",K+1) Q
11 S CODE=$P(VAL2,"^",K+1) Q
12 S VILLE=$P(VAL2,"^",K+1) Q
13 S PAYS=$P(VAL2,"^",K+1) Q
14 S TELE=$P(VAL2,"^",K+1) Q
15 S PROF=$P(VAL2,"^",K+1) Q
16 S PROFC=$P(VAL2,"^",K+1) Q
17 S NUMCH=$P(VAL2,"^",K+1) Q
18 S DANG=$P(VAL2,"^",K+1) Q
19 S ENVOY=$P(VAL2,"^",K+1) Q
20 S LIEU=$P(VAL2,"^",K+1) Q
STOCK D PA^%QSGESTI(RAG,INDIV,"SEXE",SEXE,1)
 D PA^%QSGESTI(RAG,INDIV,"NOM.JEUNE.FILLE",FILLE,1)
 D PA^%QSGESTI(RAG,INDIV,"NUMERO.SECU",NSS,1)
 D PA^%QSGESTI(RAG,INDIV,"SITUATION.FAMILLE",SITUAT,1)
 D PA^%QSGESTI(RAG,INDIV,"MUTUELLE",MUTU,1)
 D PA^%QSGESTI(RAG,INDIV,"ADRESSE",ADRES,1)
 D PA^%QSGESTI(RAG,INDIV,"CODE.POSTAL",CODE,1)
 D PA^%QSGESTI(RAG,INDIV,"VILLE",VILLE,1)
 D PA^%QSGESTI(RAG,INDIV,"PAYS",PAYS,1)
 D PA^%QSGESTI(RAG,INDIV,"NUMERO.TELEPHONE",TELE,1)
 D PA^%QSGESTI(RAG,INDIV,"PROFESSION",PROF,1)
 D PA^%QSGESTI(RAG,INDIV,"PROFESSION.CONJOINT",PROFC,1)
 D PA^%QSGESTI(RAG,INDIV,"NUMERO.CHAMBRE",NUMCH,1)
 D PA^%QSGESTI(RAG,INDIV,"PERSONNE.A.PREVENIR",DANG,1)
 D PA^%QSGESTI(RAG,INDIV,"ENVOYE.PAR",ENVOY,1)
 D PA^%QSGESTI(RAG,INDIV,"LIEU.CONSULTATION",LIEU,1)
 I INDIV["." S INDIV=$TR(INDIV,".","/")
 Q
 
 
 
 N ADR,ADR2,RAG,IND,INDIV,VAL,NOM,PREM,NAIS,NUM,DIFF,PERE,NOML,ADR3
 S ADR="^[""BB""]REPRAG",ADR2="^[""BB""]VALRAG",RAG="PATIENT"
 D CLEPAG^%VVIDEO
 S DX=5,DY=5 X XY D BLD^%VVIDEO,REV^%VVIDEO W "Chargement du repertoire PATIENT en cours ..." D NORM^%VVIDEO
 D DEB^%VTEMPS($P($ZPOS,"^",2)),BLD^%VVIDEO S IND="" F I=1:1 S IND=$O(@ADR@(IND)) Q:IND=""  Q:IND="z"  D POCLEPA^%VVIDEO S DX=1,DY=23 X XY W IND D TRAIT1,TRAIT2
 D AFF^%VTEMPS($P($ZPOS,"^",2)),NORM^%VVIDEO Q
TRAIT1 
 S VAL=@ADR@(IND),VAL=$$ADR^%QZCHNET(VAL),VAL=$P($P(VAL,"(",2),")",1)
 S NOM=$P($P(VAL,",",1),"""",2)
 S PREN=$P($P(VAL,",",2),"""",2)
 S NAIS=$P($P(VAL,",",3),"""",2)
 S NUM=$P(VAL,",",4) I NUM["""" S NUM=$P(NUM,"""",2)
 S INDIV=NUM I INDIV["/" S INDIV=$TR(INDIV,"/",".")
 Q:INDIV=""
 S SYN2=NOM_" "_PREN_" "_NAIS
 D:SYN2'="" INS^%QAX("CONSULTATION",INDIV,SYN2)
 D PA^%QSGESTI(RAG,INDIV,"NOM",INDIV,1)
 D PA^%QSGESTI(RAG,INDIV,"NOM.FAMILLE",NOM,1)
 D PA^%QSGESTI(RAG,INDIV,"PRENOM",PREN,1)
 D PA^%QSGESTI(RAG,INDIV,"DATE.NAISSANCE",NAIS,1)
 Q
TRAIT2 
 Q:INDIV=""
 S VAL2=@ADR2@(IND),VAL2=$$ADR^%QZCHNET(VAL2)
 S SEXE=$P(VAL2,"^",1)
 S FILLE=$P(VAL2,"^",2)
 S NSS=$P(VAL2,"^",3)
 S SITUAT=$P(VAL2,"^",4)
 S MUTU=$P(VAL2,"^",5)
 S ADRES=$P(VAL2,"^",6)
 S CODE=$P(VAL2,"^",7)
 S VILLE=$P(VAL2,"^",8)
 S PAYS=$P(VAL2,"^",9)
 S TELE=$P(VAL2,"^",10)
 S PROF=$P(VAL2,"^",11)
 S PROFC=$P(VAL2,"^",12)
 S NUMCH=$P(VAL2,"^",13)
 S DANG=$P(VAL2,"^",14)
 S ENVOY=$P(VAL2,"^",15)
 S LIEU=$P(VAL2,"^",16)

