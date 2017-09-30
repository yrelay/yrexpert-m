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

;%QSETIM3^INT^1^59547,73881^0
QSETIM3 ;
 
 
 
 
 
 
 
 
IMPR(S) 
 S PREM=1,DER=0
 D TITRE^%QSETIM1(0)
 I IMPR="G" D INIT^%PBPZPR(IMP,"HP-KYO")
 D ENTET,CORPS
 K:DATE @(TEMPO)
 I IMPR="G" D END^%PBPZPR(IMP,"HP-KYO")
 Q
 
ENTET 
 G ENTET^%QSETIM2
 
CORPS 
 F J=1:1:CPT+CPT2 S BT(J+3)=""
 S %CH2="",L2=0
 F J=1:1:CPT S %CH2=%CH2_$J("",LARG(J)),L2=L2+LARG(J)
 I '(DATE) D ADR^%QCAGTW("^[QUI]ETAT("""_ETAT_""","""_NL_""",""AFF""","ECR^%QSETIM3")
 I DATE D ADR^%QCAGTW("^TEMPORAI("_$J_","""_NROUT_""",""AFF""","ECR^%QSETIM3")
 Q:STOP=1
 F J=1:1:CPT+CPT2 S TB(J+3)=""
 S DER=1 D IMPTOT
 D AFTOT
 Q
 
ECR 
 D:NBRL>LIM ENTET
 S %CH="",LL=0
 D GET(%T,"TB"),IMPTOT
 S LL=0,PREC=0 F J=4:1:BORNE D IP
 
 I PREC D AFFP(%CH) S NBRL=NBRL+1
 S DEBP=0 S:PREM PREM=0 K BT S TP=%T
 U 0 R *STOP:0 I STOP=1 D POCLEPA^%VVIDEO S INT=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous interrompre l'impression"),"N") D POCLEPA^%VVIDEO U IMP Q:(INT=-1)!(INT=1)  S STOP=0 Q
 U IMP Q
 
IMPTOT 
 Q:PREM
 D GET(TP,"BT")
 I CPT2=0 U IMP W:PREC ! Q
 I TOT=0 U IMP W:PREC ! Q
 F J=4:1:BORNE Q:TB(J)'=BT(J)  S LL=LL+LARG(J-3)
 I J=BORNE Q:TB(J)=BT(J)
 U IMP W !
 I IMPR="G" D PLACER^%PBPZPR(IMP,"HP-KYO",9,0,(NBRL*254E-2)/6,"")
 F H=BORNE:-1:J D ITOT
 I IMPR="G" D PLACER^%PBPZPR(IMP,"HP-KYO",1,0,(NBRL*254E-2)/6,"")
 S JJ=J Q:DER  Q:J'=4
 I ZLG'=6 D ENTET
 Q
 
ITOT I IMPR="G" G IT2
 S L3=L2,%CH3=%CH2
 F JJ=1:1:CPT2 S L1=LARG(JJ+CPT),T=TOT(JJ),BL=$S(T="O":$TR($J("",L1-1)," ","-"),1:$J("",L1-1)) W:T="O" ?L3,BL S L3=L3+L1,%CH3=%CH3_BL_" "
 W ! D AFFP(%CH3) S NBRL=NBRL+1 D:NBRL>LIM ENTET
 Q
IT2 S L3=L2,%CH3=%CH2
 F JJ=1:1:CPT2 D TOT
 U IMP W ! D AFFP(%CH3) S NBRL=NBRL+1 I NBRL>LIM G CHP
 U IMP W ! D AFFP(" ") S NBRL=NBRL+1 I NBRL'>LIM Q
 Q
CHP 
 D ENTET
 D PLACER^%PBPZPR(IMP,"HP-KYO",9,0,(NBRL*254E-2)/6,"")
 Q
 
TOT 
 S L1=LARG(JJ+CPT)
 I '(DATE) S V="^[QUI]ETAT("""_ETAT_""","""_NL_""",""TOT"","""_TABS(JJ)_""""
 I DATE S V=$P(TEMPO,")",1)_",""TOT"","""_TABS(JJ)_""""
 F %J=4:1:H S V=V_","_""""_$$ZSUBST^%QZCHSUB(BT(%J),"""","""""")_""""
 S V=V_")"
 S CLE=$S($D(@V):@V,1:"") I CLE="" G FTOT
 S CLE=$E(CLE,1,L1-1)
 D STG^%QSETIM2(L3,CLE)
FTOT S %CH3=%CH3_CLE_$J("",L1-$L(CLE))
 S L3=L3+L1 Q
 
AFFP(C) 
 Q:S=1
 S ^AFF($J,EGAP,ZLG)=C
 S ZLG=ZLG+1 I ZLG>LIM S ZLG=6,EGAP=EGAP+1
 Q
 
IP 
 S L1=LARG(J-3)
 G:DEBP ECIP
 G:PREC ECIP
 I TB(J)=BT(J) S %CH=%CH_$J("",L1),LL=LL+L1 Q
ECIP I INT(J-3)="" S VALP=$E(TB(J),1,L1-1) G FIP
 I TB(J)="?" S VALP="?" G FIP
 S VALP=$E("["_(TB(J)-INT(J-3))_","_TB(J)_"]",1,L1-1)
FIP S %CH=%CH_VALP_$J("",L1-$L(VALP)) U IMP W ?LL,VALP
 S LL=LL+L1,PREC=1 Q
 
GET(CT,TB1) 
 D ^%QCAGLCN(CT,TB1)
 I '(DATE) F II=4:1 Q:'($D(@TB1@(II+1)))  S @TB1@(II)=$$AFFI^%QMDAUC(BASE,TAB(II-3),@TB1@(II))
 Q
 
AFTOT 
 
 I TOT=0 Q
 U IMP W ! D AFFP(" ") S NBRL=NBRL+1 D:NBRL>LIM ENTET
 I IMPR="G" G AFT2
 S L3=L2,%CH3=%CH2
 F JJ=1:1:CPT2 S L1=LARG(JJ+CPT),T=TOT(JJ),BL=$S(T="O":$TR($J("",L1-1)," ","-"),1:$J("",L1-1)) W:T="O" ?L3,BL S L3=L3+L1,%CH3=%CH3_BL_" "
 W ! D AFFP(%CH3) S NBRL=NBRL+1 D:NBRL>LIM ENTET
AFT2 S %CH3=$$^%QZCHW("TOTAUX")
 I IMPR'="G" W %CH3 G ITO
 S DY=(NBRL*254E-2)/6
 D GRISF^%PBPZPR(0,DY-5E-1,2,8E-1,9)
 D PLACER^%PBPZPR(IMP,"HP-KYO",9,0,DY,"")
 U IMP W ?2,%CH3
ITO S %CH3=%CH3_$J("",L2-$L(%CH3)),L3=$L(%CH3)
 F JJ=1:1:CPT2 D SOM
 I IMPR="G" D PLACER^%PBPZPR(IMP,"HP-KYO",1,0,DY,"")
 U IMP W ! D AFFP(%CH3)
 Q
SOM 
 S L1=LARG(JJ+CPT)
 S V="^[QUI]ETAT("""_ETAT_""","""_NL_""",""SOM"","""_TABS(JJ)_""")"
 S CLE=$S($D(@V):@V,1:"") I CLE="" G FSOM
 S CLE=$E(CLE,1,L1-1)
 I IMPR'="G" W ?L3,CLE G FSOM
 D HACHUREF^%PBPZPR(IMP,"HP-KYO","",(L3*254E-3)-71E-2,(((NBRL+1)*254E-2)/6)-4E-1,($L(CLE)+2)*21E-2,5E-1)
 U IMP W ?(L3+1)+((L3\10)*2),CLE
FSOM S %CH3=%CH3_CLE_$J("",L1-$L(CLE))
 S L3=L3+L1 Q

