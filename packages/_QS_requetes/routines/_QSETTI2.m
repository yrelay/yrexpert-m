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

;%QSETTI2^INT^1^59547,73881^0
QSETTI2 ;
 
 
 
 
 
IMPR(S) 
 D COL
 I IMPR="G" D INIT^%PBPZPR(IMP,"HP-KYO")
 D ENTET,CORPS
 K:DATE @(TEMPO)
 I IMPR="G" D END^%PBPZPR(IMP,"HP-KYO")
 Q
 
COL 
 N TI,IND,IND2
 K ^COL($J)
 I S=0 S LIM=22
 I '(DATE) S GL="^[QUI]ETAT("""_ETAT_""","""_NL_""",""AFF"")"
 I DATE S GL="^TEMPORAI("_$J_","""_NROUT_""",""AFF"")"
 S NCOL=0,IND=""
 F %I=0:1 S IND=$O(@GL@(IND)) Q:IND=""  S IND2="" F %I2=0:0 S IND2=$O(@GL@(IND,IND2)) Q:IND2=""  I '($D(^COL($J,IND2))) S ^COL($J,IND2)="",NCOL=NCOL+1
 S L=$S(RM=132:131,IMPR="G":78,1:80)\(NCOL+1),L1=L-1
 
 I IMPR'="G" S %CH3=$TR($J("",L*(NCOL+1))," ","-")
 
 I IMPR="G" S %CH3=(L*(NCOL+1))*254E-3
 S TI=$S(TIT(2)="":TAB(2),1:TIT(2))
 S %CH4=$$GETLBLAN^%VTLBLAN($TR($$^%QZCHEV(TI,L1-1,"P"),"~","^")),%CH4=$J("",(L1-2)-$L(%CH4))_%CH4 I IMPR'="G" S %CH4="!"_%CH4_" !"
 S TI=$S(TIT(1)="":TAB(1),1:TIT(1))
 I IMPR'="G" S %CH2="!"_$J("",L1-1)_"!"
 I IMPR="G" S %CH2=""
 S IND="",%CH5=$TR($$^%QZCHEV(TI,L1-1,"P"),"~","^")
 I IMPR'="G" S %CH5="!"_%CH5_"!"
 F %I=1:1 S IND=$O(^COL($J,IND)) Q:IND=""  D COL2
 Q
COL2 S II=$E(IND,1,L1),BL=(L1-$L(II))\2 I BL>1 S:(BL#2)=1 BL=BL+5E-1
 S IBL=$J("",BL)_II
 I IMPR'="G" S %CH4=%CH4_IBL_$J("",L1-$L(IBL))_"!",%CH5=%CH5_$J("",L1)_"!",%CH2=%CH2_$J("",L1)_"!" Q
 S %CH4(%I)=IBL
 Q
 
ENTET 
 S PAGE=PAGE+1
 I S=1 U IMP W #
 D:S=0 CLEPAG^%VVIDEO
 I IMPR="G" U IMP D PLACER^%PBPZPR(IMP,"HP-KYO",1,0,0,"")
 U IMP W $$^%QZCHW("Le")," ",%DAT," ",$$^%QZCHW("a")," ",HEURE,?$S(RM=80:23,1:35),$$^%QZCHW("Etat")," : ",ETAT,?$S(RM=80:68,1:110),$$^%QZCHW("Page")," : ",PAGE,!,!
 I IMPR'="G" W ?$S(RM=80:20,1:30),TITRE,!
 I IMPR="G" S DX=((96-$L(TITRE))-(($L(TITRE)/10)*2))/2 D GRAS^%QSETIM2(TITRE,DX*21E-2,(3*254E-2)/6)
 U IMP W !,?$S(RM=80:5,1:15),COM1,?$S(RM=80:40,1:70),COM2,!,?$S(RM=80:5,1:15),COM3,?$S(RM=80:40,1:70),COM4,!,!
 I IMPR'="G" W %CH3,!,%CH4,!,%CH5,!,%CH3,! S NBRL=11 Q
 
 S DY=(7*254E-2)/6
 D LIGNE^%PBPZPR(IMP,0,DY,%CH3,1E-2)
 D GRIS^%PBPZPR(0,DY,L*254E-3,(3*254E-2)/6,1)
 S DY=(9*254E-2)/6
 D PLACER^%PBPZPR(IMP,"HP-KYO",9,0,DY,%CH4)
 D PLACER^%PBPZPR(IMP,"HP-KYO",1,0,DY-(254E-2/6),"")
 F %I=1:1 Q:'($D(%CH4(%I)))  U IMP W ?%I*L,%CH4(%I)
 U IMP W !
 D PLACER^%PBPZPR(IMP,"HP-KYO",9,0,(9*254E-2)/6,"")
 U IMP W %CH5,!
 D PLACER^%PBPZPR(IMP,"HP-KYO",1,0,(9*254E-2)/6,"")
 D LIGNE^%PBPZPR(IMP,0,(10*254E-2)/6,%CH3,1E-2)
 S NBRL=11 Q
 
CORPS 
 S NO="",STOP=0
 I '(DATE) S GL="^[QUI]ETAT("""_ETAT_""","""_NL_""",""TOT"","""_TABS(1)_""")"
 I DATE S GL="^TEMPORAI("_$J_","""_NROUT_""",""TOT"","""_TABS(1)_""")"
 F %I=0:0 S NO=$O(@GL@(NO)) Q:(NO="")!(STOP=1)  D ECR
 D FIN2(0),AFTOT
 Q
 
ECR 
 I NBRL>LIM D FIN2(1)
 U IMP W %CH2,! D FIN(%CH2)
 S NOM=$E(NO,1,L1-1)
 S BL=((L1-1)-$L(NOM))\2 I BL>1 S:(BL#2)=1 BL=BL+5E-1
 I IMPR'="G" W "!"
 U IMP W ?BL+1,NOM I IMPR'="G" W ?L1,"!"
 S %CH="!"_$J("",BL)_NOM,%CH=%CH_$J("",L1-$L(%CH))_"!"
 S LL=L,ICOL=""
 F %I2=0:0 S ICOL=$O(^COL($J,ICOL)) Q:ICOL=""  D IMPTOT
 U IMP W ! D FIN(%CH)
 U IMP W %CH2,! D FIN(%CH2)
 I IMPR'="G" W %CH3,!
 I IMPR="G" D LIGNE^%PBPZPR(IMP,0,(NBRL*254E-2)/6,%CH3,1E-2)
 S NBRL=NBRL+1 D AFFP(%CH3)
 U 0 R *STOP:0 I STOP=1 D POCLEPA^%VVIDEO S INT=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous interrompre l'impression"),"N") D POCLEPA^%VVIDEO U IMP Q:(INT=-1)!(INT=1)  S STOP=0 Q
 U IMP Q
 
FIN(CH) 
 N CP
 S CP=1
 S NBRL=NBRL+1 D AFFP(CH)
 I NBRL'>LIM Q
 G FIN3
 
FIN2(CP) 
FIN3 I IMPR'="G" D:CP=1 ENTET Q
 
 
 D LIGNEV^%PBPZPR(IMP,0,(7*254E-2)/6,((NBRL-8)*254E-2)/6,1E-2)
 D TRAIT^%PBPZPR(IMP,"HP-KYO",1E-2,(L*254E-3)-5E-1,(8*254E-2)/6,(L*254E-3)-5E-1,(NBRL*254E-2)/6)
 F %I=2:1:NCOL+1 D TRAIT^%PBPZPR(IMP,"HP-KYO",1E-2,((L*%I)*254E-3)-5E-1,(8*254E-2)/6,((L*%I)*254E-3)-5E-1,(NBRL*254E-2)/6)
 D:CP=1 ENTET
 Q
 
IMPTOT 
 G:DATE DAT
 I '($D(^[QUI]ETAT(ETAT,NL,"TOT",TABS(1),NO,ICOL))) S %CH=%CH_$J("",L1)_"!" G FTOT
 S CLE=$E(^[QUI]ETAT(ETAT,NL,"TOT",TABS(1),NO,ICOL),1,L1) G AFFEC
DAT I '($D(^TEMPORAI($J,NROUT,"TOT",TABS(1),NO,ICOL))) S %CH=%CH_$J("",L1)_"!" G FTOT
 S CLE=$E(^TEMPORAI($J,NROUT,"TOT",TABS(1),NO,ICOL),1,L1)
AFFEC S BL=(L1-$L(CLE))\2 I BL>1 S:(BL#2)=1 BL=BL+5E-1
 S IBL=$J("",BL)_CLE,%CH=%CH_IBL_$J("",L1-$L(IBL))_"!"
 U IMP W ?LL+BL,CLE
FTOT I IMPR'="G" U IMP W ?LL+L1,"!"
 S LL=LL+L Q
 
AFFP(C) 
 Q:S=1
 S ZLG=ZLG+1 I ZLG>LIM S ZLG=7,EGAP=EGAP+1
 S ^AFF($J,EGAP,ZLG)=C
 Q
 
AFTOT 
 U IMP W ! D FIN("")
 S %CH=" "_$$^%QZCHW("TOTAL")_" de "_$TR(TABS(1),"~","^")_"  =  "
 S CLE="^[QUI]ETAT("""_ETAT_""","""_NL_""",""SOM"","""_TABS(1)_""")"
 S CLE=$S($D(@CLE):@CLE,1:"")
 I IMPR'="G" S %CH=%CH_CLE W ?5,%CH,! G FAFT
 
 S DY=((NBRL+1)*254E-2)/6,%I=$L(%CH)+5
 D PLACER^%PBPZPR(IMP,"HP-KYO",9,5E-1,DY,%CH)
 S DY=DY-(254E-2/6)
 D HACHUREF^%PBPZPR(IMP,"HP-KYO","",%I*21E-2,DY,($L(CLE)+2)*21E-2,8E-1)
 D PLACER^%PBPZPR(IMP,"HP-KYO",9,(%I+1)*21E-2,DY+4E-1,CLE)
 D PLACER^%PBPZPR(IMP,"HP-KYO",1,0,DY,"")
 
FAFT S NBRL=NBRL+1 D AFFP(%CH)
 Q

