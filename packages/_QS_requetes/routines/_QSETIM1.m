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

;%QSETIM1^INT^1^59547,73881^0
QSETIM1 ;
 
 
 
 
 
 
 
 
 
 
 
 
CHTOT 
 N BB
 S DATE=0
 F J=1:1:CPT I $$TYPE^%QSGESPE(TAB(J)_"/"_REP)="DATE" S DATE=1 Q
 Q:'(DATE)
 D ^%VZEATT
 S TEMPO=$$CONCAS^%QZCHAD("^TEMPORAI",$J_","_NROUT) K @(TEMPO)
 S ATR=""
 F %I=0:0 S ATR=$O(^[QUI]ETAT(ETAT,NL,"TOT",ATR)) Q:ATR=""  D ADR^%QCAGTW("^[QUI]ETAT("""_ETAT_""","""_NL_""",""TOT"","""_ATR_"""","TOTAL^%QSETIM1")
 D ADR^%QCAGTW("^[QUI]ETAT("""_ETAT_""","""_NL_""",""AFF""","TRANS^%QSETIM1")
 Q
 
TOTAL 
 D ^%QCAGLCN(%T,"TB")
 S BB=BORNE+1,V=$P(TEMPO,")",1)_",""TOT"","_""""_ATR_""""
 F J=5:1:BB Q:'($D(TB(J)))  S V=V_","_""""_$$AFFI^%QMDAUC(BASE,TAB(J-4),TB(J))_""""
 S V=V_")",@V=$S($D(@V):@V,1:0)+@%T
 Q
 
TRANS 
 D GET(%T,"TB")
 S V=$P(TEMPO,")",1)_",""AFF"""
 F J=4:1:BB Q:'($D(TB(J)))  S V=V_","_""""_TB(J)_""""
 S V=V_")",@V=@%T Q
GET(CT,TB1) 
 D ^%QCAGLCN(CT,TB1)
 F II=4:1 Q:'($D(@TB1@(II+1)))  S @TB1@(II)=$$AFFI^%QMDAUC(BASE,TAB(II-3),@TB1@(II))
 Q
 
 
TITRE(RE) 
 N X
 S %TIT=""
 F J=1:1:CPT S TI=$S(TIT(J)="":TAB(J),1:TIT(J)),V=$TR($$^%QZCHEV(TI,LARG(J)-1,"P"),"~","^"),V=V_$J("",LARG(J)-$L(V)) S:IMPR'="G" %TIT=%TIT_V D:IMPR="G" TIT1
 
 F J=1:1:CPT2 S TI=$S(TIT(J+CPT)="":TABS(J),1:TIT(J+CPT)),V=$TR($$^%QZCHEV(TI,LARG(J+CPT)-1,"P"),"~","^"),V=V_$J("",LARG(J+CPT)-$L(V)) S:IMPR'="G" %TIT=%TIT_V D:IMPR="G" TIT2
 Q
 
TIT1 
 S X=0
 F I=1:1:J-1 S X=X+LARG(I)
 S %TIT=%TIT_"W ?"_((X+1)+((X\10)*2))_","""_$$GETLBLAN^%VTLBLAN(V)_""" "
 Q
TIT2 
 S X=0
 F I=1:1:(CPT+J)-1 S X=X+LARG(I)
 S %TIT=%TIT_"W ?"_((X+1)+((X\10)*2))_","""_$$GETLBLAN^%VTLBLAN(V)_""" "
 Q
 
EDIT 
 Q:'($D(^AFF($J)))
 N ADR,CTR,GAPBN,MEN,NGAP,CX
 S CX=$S(RM=80:30,1:50)
 S GAPBN=$S($D(^AFF($J,EGAP)):EGAP,1:EGAP-1),EGAP=GAPBN
 S MEN(1)="+"_"^PLUS",MEN(1,"EQU")="=",MEN(2)="-"_"^MOIN",MEN(3)="page"_"^PAGE"
 D CLEPAG^%VVIDEO I RM=80 D ^%VZCDB(TITRE,0)
 I RM=132 D G132^%VZCDB(TITRE,0)
 S DX=0,DY=4 X XY W %TIT D AFF1
SUIT S DX=CX,DY=2 X XY W $$^%QZCHW("Page")_" "_EGAP_"/"_GAPBN,$J("",10)
ACT D POCLEPA^%VVIDEO,^%VQUIKMN(CX,79,23,"MEN",.ADR,.CTR) Q:(CTR="A")!(CTR="F")  G:ADR'="" @ADR G ACT
PAGE 
 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("Page")_" : ")
 G:CTRLA!CTRLF SUIT G:Y1="" SUIT G:'($$ADR^%QZNBN1(Y1)) SUIT
 S NGAP=Y1 D AFF G SUIT
MOIN 
 S NGAP=EGAP-1 D AFF G SUIT
PLUS 
 S NGAP=EGAP+1 D AFF G SUIT
AFF 
 I '($D(^AFF($J,NGAP))) D ^%VSQUEAK Q
 S EGAP=NGAP,DX=0,DY=6 D CLEBAS^%VVIDEO
AFF1 S DY=""
 F %I=1:1 S DY=$O(^AFF($J,EGAP,DY)) Q:DY=""  S DX=0 X XY W $E(^AFF($J,EGAP,DY),1,RM-1)
 Q

