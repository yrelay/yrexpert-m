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

;%TXR010^INT^1^59547,74033^0
%TXR010 ;;02:50 PM  4 Sep 1996
 
 
 
 
 N GL,CLE,NC,RAG,INDIV,TEMP,GCLE,INCON,PAT,NOM,PREN,NUM,NAIS,DOS,K
 S TEMP=$$CONCAS^%QZCHAD("^TEMPORAIRE",$J_","_$P($ZPOS,"^",2)) K @(TEMP)
 S INCON=$$CONCAS^%QZCHAD(TEMP,"INCONNU")
 S GCLE=$$CONCAS^%QZCHAD(TEMP,"CLE")
 S CLE5=$$CONCAS^%QZCHAD(TEMP,"5CLE")
 S RMG="RMG",PAT="PATIENT"
 S GL="^RMG("""")"
 D DEB^%VTEMPS($P($ZPOS,"^",2))
BIMPR ;; cao debug ^%Q
 S GL=$$^%Q($Q(@GL))
 I GL="" D AFF^%VTEMPS($P($ZPOS,"^",2)) Q
 K CLE
 D ^%QCAGLCM(GL,.CLE,.NC)
 
 I NC=4 D NORM,CLE4,STOCK G BIMPR
 
 
 S @GCLE@(NC,GL)=""
 
 I NC=5 D NORM,CLE51,STOCK S @CLE5@(DOS)=NOM
 G BIMPR
NORM 
 S NOM=CLE(1),PREN=CLE(2),NAIS=CLE(3),DOS=CLE(4)
 I '($$IR^%QSGEST5("PATIENT",DOS)) S @INCON@(DOS)="" W !,DOS,?20,"Inconnu" Q
 S INDIV=DOS_",RMG" I INDIV["/" S INDIV=$TR(INDIV,"/",".")
 W !,INDIV
 D PA^%QSGESTI(PAT,DOS,"NOM",DOS,1)
 D PA^%QSGESTI(PAT,DOS,"NOM.FAMILLE",NOM,1)
 D PA^%QSGESTI(PAT,DOS,"PRENOM",PREN,1)
 D PA^%QSGESTI(PAT,DOS,"DATE.NAISSANCE",NAIS,1)
 S VAL2=@GL,VAL2=$$ADR^%QZCHNET(VAL2)
 Q
CLE51 Q:$D(@INCON@(DOS))
 S NBC=$L(VAL2,"^") F K=1:2:NBC S NUM=$P(VAL2,"^",K) Q:NUM=""  D @NUM
 ;; cao debug ^%Q
 S SGL=GL,GL=$$^%Q($Q(@GL)) K CLE D ^%QCAGLCM(GL,.CLE,.NC)
 I NC'=5 S GL=SGL Q
 G:(NC=5)&(CLE(5)'=1) CLE51
 S GL=SGL Q
CLE4 Q:$D(@INCON@(DOS))
 S K=0 F NUM=3:1:17 D @NUM S K=K+1 S:NUM=4 NUM=6
 Q
3 S SEXE=$P(VAL2,"^",K+1) Q
4 S FILLE=$P(VAL2,"^",K+1) Q
7 S NSS=$P(VAL2,"^",K+1) Q
8 S GRSAN=$P(VAL2,"^",K+1) Q
9 S RHES=$P(VAL2,"^",K+1) Q
10 S TAILLE=$P(VAL2,"^",K+1) Q
11 S POIDS=$P(VAL2,"^",K+1) Q
12 S ANTMED1=$P(VAL2,"^",K+1) Q
13 S ANTMED2=$P(VAL2,"^",K+1) Q
14 S ANTCHI1=$P(VAL2,"^",K+1) Q
15 S ANTCHI2=$P(VAL2,"^",K+1) Q
16 S ANTOBS1=$P(VAL2,"^",K+1) Q
17 S ANTOBS2=$P(VAL2,"^",K+1) Q
 
STOCK 
 Q:$D(@INCON@(DOS))
 D PA^%QSGESTI(PAT,DOS,"SEXE",SEXE,1)
 D PA^%QSGESTI(PAT,DOS,"NOM.JEUNE.FILLE",FILLE,1)
 D PA^%QSGESTI(PAT,DOS,"NUMERO.SECU",NSS,1)
 D PA^%QSGESTI(RMG,INDIV,"NOM",RMG,1)
 D ADDO^%QSGEST3(PAT,DOS,RMG,RMG,RMG,RMG)
 D PA^%QSGESTI(RMG,INDIV,"GROUPE.SANGUIN",GRSAN,1)
 D PA^%QSGESTI(RMG,INDIV,"RHESUS",RHES,1)
 D PA^%QSGESTI(RMG,INDIV,"TAILLE",TAILLE,1)
 D PA^%QSGESTI(RMG,INDIV,"POIDS",POIDS,1)
 D PA^%QSGESTI(RMG,INDIV,"ATCD.MEDICAL",ANTMED1,1)
 D PA^%QSGESTI(RMG,INDIV,"ATCD.MEDICAL",ANTMED2,2)
 D PA^%QSGESTI(RMG,INDIV,"ATCD.CHIRURGICAL",ANTCHI1,1)
 D PA^%QSGESTI(RMG,INDIV,"ATCD.CHIRURGICAL",ANTCHI2,2)
 D PA^%QSGESTI(RMG,INDIV,"ATCD.OBSTETRICAL",ANTOBS1,1)
 D PA^%QSGESTI(RMG,INDIV,"ATCD.OBSTETRICAL",ANTOBS2,2)
 I INDIV["." S INDIV=$TR(INDIV,".","/")
 Q
 
CORR 
 N GL,IND,%I
 S GL=$$LISTIND^%QSGEST6("RMG"),IND=""
 F %I=1:1 S IND=$O(@GL@(IND)) Q:IND=""  D TRAIT
 Q
TRAIT 
 I $L(IND,",")=1 D SX^%QSGESTI("RMG",IND) B  Q
 D PA^%QSGESTI("RMG",IND,"NOM","RMG",1) Q

