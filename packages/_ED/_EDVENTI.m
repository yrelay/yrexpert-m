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

;%EDVENTI^INT^1^59547,73869^0
EDVENTIL ;
 K TJOUR D CLEPAG^%VVIDEO W !,"Vous editez LE JOURNAL DE VENTILATIONS DE QUEL MOIS ?? " R PCH S SAMOIS=PCH D TESTDAT G:REFUS EDVENTIL
 W !,!," POUR QUELLE RUBRIQUE ? " R RUB S JD="" D TESTDAY G:REFUS EDVENTIL
ED1 D CLEPAG^%VVIDEO W !,!,!,!,!," Un instant de patience ; impression en cours..." S IMPR=0 O IMPR U IMPR S IOP=IMPR D ^%IS
INIT D GETJOUR S $ZE="",LA="",PAGE=0,LI=0,LITOT=0,MONTHT=0,MONTVA=0,TOTHT=0,TOTAL=0,TAUTVA=186E-3,INILI=0,RESLI=0,REF="",TOTVA=0,TVA=0,HT=0,TTC=0,MTOT=0,MTOTHT=0,MTOTVA=0
 K VALCLE S (TBRUTHT,TNETHT,TMONTVA,TTOTAL,TOTEXO,TOTESCO)=0,NOMTAB="^[QUI]JV",ADR="TRAIT^%EDVENTI" D CADRE S VALCLE(1)=RUB,VALCLE(2)="2"_PCHD_PCHG D ^%VKMULG
 G FIN
TRAIT 
 S RUB=B1,NUPI=B2,DP=B3,COTVA=B4,DF=B5,SOC=B6,CH=^[QUI]JV(RUB,NUPI,DP,COTVA,DF,SOC),NATUR=$P(CH,"^",1),REFTP=$P(CH,"^",2),TTC=$P(CH,"^",3),HT=$P(CH,"^",4),TVA=$P(CH,"^",5)
 S NTVA=TVA,%LIB=NTVA D ^%TLBLANK S NTVA=%LIB,TVA=NTVA,NHT=HT,%LIB=NHT D ^%TLBLANK S NHT=%LIB,HT=NHT,NTTC=TTC,%LIB=NTTC D ^%TLBLANK S NTTC=%LIB,TTC=NTTC
 S TOTAL=TOTAL+TTC,TOTHT=TOTHT+HT,TOTVA=TOTVA+TVA
ECRI S LINATUR=$E(NATUR,1,18),LIREFTP=$E(REFTP,1,17) W !,"| ",DF,?10,"| ",NUPI,?19,"| ",LINATUR,?40,"|"
 S %LIB=NTTC D ^%TLBLANK S NTTC=%LIB,LITTC=$J(NTTC,10,2),%LIB=NHT D ^%TLBLANK S NHT=%LIB,LIHT=$J(NHT,10,2),%LIB=NTVA D ^%TLBLANK S NTVA=%LIB,LITVA=$J(NTVA,10,2)
 W LITTC,?52,"|",COTVA,?54,"| ",LIHT,?66,"|",LITVA,?79,"| ",LIREFTP,?97,"|",DP,?106,"| "
WRI 
 I LI>35 D BASPA,CADRE
ECR 
 D WLIGNE Q
 
WLIGNE 
 S LI=LI+1 Q
FIN D BASPA
 W *23,*13 S $ZE="" C:IMPR'=0 IMPR D CURRENT^%IS W *23,*13 Q
CADRE 
 W # F I=1:1:2 W !
 W *27,*85,?20,"JOURNAL DES VENTILATIONS :  ** ",RUB,"  **  du mois  ",SAMOIS,"   - page -",PAGE+1,!,! S PAGE=PAGE+1
 W !,"|" F I=1:1:106 W "-"
 W !,"|","Date Fact",?10,"|No Piece |",?19,"        Nature     |",?40,"   T.T.C.  |",?52,"C",?54,"|   H.T.    |",?66,"   T.V.A.   |",?80," Titre Paiement  ",?96,"|Dat.Paye|"
 W !,"|" F I=1:1:105 W "-"
 W "|" Q
BASPA 
 S TOTLI=36,RESLI=TOTLI-LI F I=1:1:RESLI W !,"|",?106,"|"
 W *27,*85,*23,*13
TOT W !,"|" F I=1:1:105 W "-"
 W "|" S %LIB=TOTAL D ^%TLBLANK S TOTAL=%LIB,MTOT=$J(TOTAL,10,2),%LIB=TOTHT D ^%TLBLANK S TOTHT=%LIB,MTOTHT=$J(TOTHT,10,2),%LIB=TOTVA D ^%TLBLANK S TOTVA=%LIB,MTOTVA=$J(TOTVA,10,2) W !,?40,"|",MTOT,?52,"|",?55,MTOTHT,?66,"|",MTOTVA,?79,"|"
 W ! F I=1:1:40 W ?40,"-"
 W *27,*85,*13
 W "|" S LI=0 H 2 Q
TEST Q:DATFACT=LA
 I (DATFACT'=LA)&(LA'="") D BASPA,CADRE S LA=DATFACT G FT
 I (DATFACT'=LA)&(LA="") D CADRE S LA=DATFACT G FT
FT Q
TESTDAT S REFUS=0,PCHG=$P(PCH,"/",1),PCHD=$P(PCH,"/",2) F PCH1="PCHG","PCHD" G:@PCH1="" REFUS S %PCH=@PCH1 D ^%QZNBN1 I '(ISNUM) S REFUS=1 G END
REFUS I PCH1="PCHG" S REFUS=1 G END
 S PCHG=$S($L(PCHG)<2:"0"_PCHG,1:PCHG) I PCHD="" S PCHD=$P(%DAT,"/",3)
 S PCHF=PCHG+1 S:$L(PCHF)<2 PCHF="0"_PCHF G END
END Q
TESTDAY S:JD="" JD=0 S REFUS=0,%PCH=$P(JD,"/",1) D ^%QZNBN1 I '(ISNUM) S REFUS=1 G END
 I JD>31 S REFUS=1 G END
 I $L(JD)<2 S JD="0"_JD
 G END
GETJOUR F TT=JD:1:31 S JO=$S($L(TT)=1:"0",1:"")_TT_"/"_PCHG_"/"_PCHD,TJOUR(JO)=1
 Q

