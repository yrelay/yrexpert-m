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

;%QSCANON^INT^1^59547,73880^0
QSCANON ;
 
 
 
 
 
 
 
 
REQ2(A,IND) 
 N RES,R,T,NA,LASTAT,ILASTAT,TEMPO,POS,SA,GFOCA,IFC,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TEMPO=$$CONCAS^%QZCHAD(TEMP,"TEMPO")
 D INIT^%ANGEPIL S RES="",POS=1
 S GFOCA=$$ADR^%QSDAACT K @(GFOCA) S @GFOCA=0
 K ^TATINDB($J) S ^TATINDB($J)=0,^TATINDM($J)=0,LASTAT=""
 S IND=0,R="" D EMPIL^%ANGEPIL("REQ2R^%QSCANON") G R2C
REQ2R S IND=$$ZSUBST^%QZCHSUB(IND,"""","") D EPIL^%ANGEPIL K @(TEMPO)
 Q:POS=0 ""
 Q RES
R2C S T=$$RED^%ANA(A,"TYPE")
 G:T="FONCTION" FON
 G:T="COMPARATEUR.BINAIRE" CB
 G:T="COMPARATEUR.TERNAIRE" CT
 G:T="ATTRIBUT" AT
 G:T="IDF" ID
 G:T="OPERATEUR" OPB
 G:T="CHAINE" CH
 G:T="NOMBRE" NB
 G:T="NOM" NO
 D ^%VSQUEAK,POCLEPA^%VVIDEO W "QSCANON ... type de noeud inconnu : ",T
 S POS=0,RES="" G RET^%ANGEPIL
 
FON I $$RED^%ANA(A,"TEXTE")'="$PARAM" S POS=0,RES="" G RET^%ANGEPIL
 S A=$$RED^%ANA(A,1) D EMPIL^%ANGEPIL("FON1^%QSCANON") G R2C
FON1 I (POS=0)!(RES="""""") S POS=0 G RET^%ANGEPIL
 S RES=@TEMPOPAR@(RES)
 
 
 I (RES+0)'=RES S RES=""""_RES_""""
 G RET^%ANGEPIL
 
 G:$$ADR^%QZNBN1(RES) RET^%ANGEPIL
 S RES=""""_RES_"""" G RET^%ANGEPIL
 
NO S RES=$$RED^%ANA(A,"TEXTE") G RET^%ANGEPIL
 
CB K @(TEMPO) S @TEMPO@(1)="E1",@TEMPO@(2)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1) D EMPIL^%ANGEPIL("CB1^%QSCANON") G R2C
CB1 G:POS=0 DEPIL^%ANGEPIL
 S E1=RES,A=$$RED^%ANA(SA,2) D EMPIL^%ANGEPIL("CB2^%QSCANON") G R2C
CB2 G:POS=0 DEPIL^%ANGEPIL
 S RES="("_E1_$$RED^%ANA(SA,"TEXTE")_RES_")"
 S @GFOCA=@GFOCA+1,IFC=@GFOCA,@GFOCA@(IFC)=RES
 G DEPIL^%ANGEPIL
CT 
 K @(TEMPO)
 S @TEMPO@(1)="D",@TEMPO@(2)="ED1",@TEMPO@(3)="ED2",@TEMPO@(4)="EG",@TEMPO@(5)="G",@TEMPO@(6)="O",@TEMPO@(7)="ATTER",@TEMPO@(8)="IATTER",@TEMPO@(9)="SA",@TEMPO@(10)="N",@TEMPO@(11)="OPL"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,O=$$RED^%ANA(A,"TEXTE"),N=$E(O,1,1),G=$E(O,2,2),D=$E(O,3,3)
 I N'="'" S G=N,D=G,OPL="&",G=$S(G="[":"'<",G="]":">"),D=$S(D="[":"<",D="]":"'>")
 I N="'" S OPL="!",G=$S(G="[":"<",G="]":"'>"),D=$S(D="[":"'<",D="]":">")
 S A=$$RED^%ANA(A,1) D EMPIL^%ANGEPIL("CT1^%QSCANON") G R2C
CT1 G:POS=0 DEPIL^%ANGEPIL
 S EG=RES,ATTER=LASTAT,IATTER=ILASTAT
 S A=$$RED^%ANA(SA,2) D EMPIL^%ANGEPIL("CT2^%QSCANON") G R2C
CT2 G:POS=0 DEPIL^%ANGEPIL S ED1=RES
 G:ATTER="" SCT
 S ^TATINDB($J)=^TATINDB($J)+1,^TATINDB($J,ATTER)=^TATINDB($J,ATTER)+1
 S ^TATINDB($J,ATTER,IATTER,^TATINDB($J,ATTER))=""
SCT S A=$$RED^%ANA(SA,3) D EMPIL^%ANGEPIL("CT3^%QSCANON") G R2C
CT3 G:POS=0 DEPIL^%ANGEPIL S ED2=RES
 S LASTAT="",ILASTAT=0,RES="(("_EG_G_ED1_")"_OPL_"("_EG_D_ED2_"))"
 S @GFOCA=@GFOCA+1,IFC=@GFOCA,@GFOCA@(IFC)=RES
 G DEPIL^%ANGEPIL
 
AT K @(TEMPO) S @TEMPO@(1)="AT",@TEMPO@(2)="SA" D EMPV^%ANGEPIL(TEMPO)
 S ^TATINDB($J)=^TATINDB($J)+1
 S SA=A,A=$$RED^%ANA(A,2),IND=0
 G:A=0 AT3
 D EMPIL^%ANGEPIL("AT2^%QSCANON") G R2C
AT2 I (POS=0)!(RES="""""") S POS=0 G DEPIL^%ANGEPIL
 S IND=RES
AT3 S:IND=0 ^TATINDM($J)=1
 S A=$$RED^%ANA(SA,1) D EMPIL^%ANGEPIL("AT4^%QSCANON") G R2C
AT4 G:POS=0 DEPIL^%ANGEPIL S AT=RES,LASTAT=AT,ILASTAT=IND
 S:'($D(^TATINDB($J,AT))) ^TATINDB($J,AT)=0
 S ^TATINDB($J,AT)=^TATINDB($J,AT)+1
 S ^TATINDB($J,AT,IND,^TATINDB($J,AT))=""
 G DEPIL^%ANGEPIL
 
ID S RES=$$RED^%ANA(A,"TEXTE") G RET^%ANGEPIL
 
OPB K @(TEMPO) S @TEMPO@(1)="E1",@TEMPO@(2)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED^%ANA(A,1) D EMPIL^%ANGEPIL("OPB1^%QSCANON") G R2C
OPB1 G:POS=0 DEPIL^%ANGEPIL S E1=RES,A=$$RED^%ANA(SA,2)
 D EMPIL^%ANGEPIL("OPB2^%QSCANON") G R2C
OPB2 G:POS=0 DEPIL^%ANGEPIL
 S RES="("_E1_$$RED^%ANA(SA,"TEXTE")_RES_")"
 G DEPIL^%ANGEPIL
 
CH S RES=""""_$$ZSUBST^%QZCHSUB($$RED^%ANA(A,"TEXTE"),"""","""""")_"""" G RET^%ANGEPIL
 
NB 
 S RES=$$RED^%ANA(A,"TEXTE")
 I (RES+0)'=RES S RES=""""_RES_""""
 G RET^%ANGEPIL
 
 
 
 
REQ3(A,IND) 
 N RESS,D,ED1,ED2,EG,G,O,R,T,NA,LASTAT,ILASTAT,ATTER,IATTER,N,OPL
 N RES,POS,TEMPO,SA,GFOCA,IFC,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TEMPO=$$CONCAS^%QZCHAD(TEMP,"TEMPO"),RES="",POS=1
 S GFOCA=$$ADR^%QSDAACT
 K @(GFOCA) S @GFOCA=0
 K ^TATINDB($J) S ^TATINDB($J)=0,LASTAT="",ILASTAT=0
 S IND=0,R="",O=$$RED^%ANA(A,"TEXTE"),N=$E(O,1,1),G=$E(O,2,2),D=$E(O,3,3)
 I N'="'" S D=G,G=N,OPL="&",G=$S(G="[":"'<",G="]":">"),D=$S(D="[":"<",D="]":"'>")
 I N="'" S OPL="!",G=$S(G="[":"<",G="]":"'>"),D=$S(D="[":"'<",D="]":">")
 D INIT^%ANGEPIL,EMPIL^%ANGEPIL("REQ31^%QSCANON")
 S SA=A,A=$$RED^%ANA(A,1) G R2C
REQ31 G:POS=0 FINREQ3 S EG=RES
 S ATTER=LASTAT,IATTER=ILASTAT
 S A=$$RED^%ANA(SA,2) D EMPIL^%ANGEPIL("REQ32^%QSCANON") G R2C
REQ32 G:POS=0 FINREQ3 S ED1=RES
 G:ATTER="" SREQ3
 S ^TATINDB($J)=^TATINDB($J)+1,^TATINDB($J,ATTER)=^TATINDB($J,ATTER)+1
 S ^TATINDB($J,ATTER,IATTER,^TATINDB($J,ATTER))=""
SREQ3 S A=$$RED^%ANA(SA,3) D EMPIL^%ANGEPIL("REQ33^%QSCANON") G R2C
REQ33 G:POS=0 FINREQ3 S ED2=RES,IND=$$ZSUBST^%QZCHSUB(IND,"""","")
 S RES="(("_EG_G_ED1_")"_OPL_"("_EG_D_ED2_"))"
 S @GFOCA=@GFOCA+1,IFC=@GFOCA,@GFOCA@(IFC)=RES
FINREQ3 K @(TEMPO) D EPIL^%ANGEPIL
 S:POS=0 RES=""
 Q RES

