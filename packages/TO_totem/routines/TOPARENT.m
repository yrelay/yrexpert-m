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

;TOPARENT^INT^1^59547,74874^0
TOPARENT ;
 
 I '($D(^TOZE($I,"SIMUL"))) S ^TOZE($I,"SIMUL")=0
 I ^TOZE($I,"SIMUL")=1 Q
DEBU S EXLF="" F OPER="/","\","*" F II=1:1 D LOCA S POS=$F(EXP,OPER,II) D:POS=0 OPERS Q:POS=0  S POS=POS-1 D LEFT,RIGHT
FIN D FINITION K ^LOCA($I),BS,DEBU,DR,END,EX2,EXL,EXLF,EXR,GA,I,II,J,IPO,IX,OPD,OPR,^OPREC($I),OPT,^PARTI($I),PF,PFC,PFE,^PFPO($I),^PO($I),POC,^POPF($I),POS,POSI,POU,PP,PPREC,PPT,PXE,^SIGNE($I),Z1 Q
LEFT S EXL=$E(EXP,1,POS-1) I $E(EXL,POS-1)=")" G AP
 I $D(^OPREC($I,$N(^OPREC($I,-(POS))))) S PPREC=-($N(^OPREC($I,-(POS)))),EXL=$E(EXL,1,PPREC)_"("_$E(EXL,PPREC+1,$L(EXL))_OPER,EXLF=EXLF_EXL
 E  S EXLF=EXLF_"("_EXL_OPER
 Q
AP S POU="(",PFE=")",PXE=EXL D DETPAR S POC=$N(^PFPO($I,$L(EXL),-1)),EXLF=EXLF_$E(EXL,1,POC)_"("_$E(EXL,POC+1,$L(EXL))_OPER
 Q
RIGHT S EXR=$E(EXP,POS+1,$L(EXP)) I $E(EXR,1)="(" S POU="(",PFE=")",PXE=EXR D DETPAR S PFC=$N(^POPF($I,1,-1)),EXR=$E(EXR,1,PFC)_")"_$E(EXR,PFC+1,$L(EXR))
 E  S EXR=$S($N(^T($I,POS))=-1:EXR_")",1:$E(EXP,POS+1,$N(^T($I,POS))-1)_")"_$E(EXP,$N(^T($I,POS)),$L(EXP)))
 S EXP=EXR Q
OPERS S EXP=EXLF_EXP,EXLF="" Q
 Q
LOCA K ^SIGNE($I),^T($I),^LOCA($I),^OPREC($I) S BS=0,IX=1 F I="+","*","-","/","\" S POSI=1 F Z1=0:0 S POSI=$F(EXP,I,POSI) Q:POSI=0  S ^LOCA($I,IX)=POSI-1,^T($I,^LOCA($I,IX))=IX,^OPREC($I,-(^LOCA($I,IX)))=IX,^SIGNE($I,POSI-1)=I,IX=IX+1
 Q
TEST W !,"Expression a tester : " R EXP Q:EXP=""  D DEBU^TOPARENT W !,"Resultat : EXP = ",EXP G TEST
FINITION S EX2=EXP D LOCA,GETPAR,RECONS,^TOOTPARE Q
GETPAR K ^PARTI($I) S ^T($I,0)=0,^T($I,300)=300,DEBU=$N(^T($I,-1)),END=$N(^T($I,DEBU)) F I=1:1 Q:END=-1  S ^PARTI($I,I)=$E(EXP,DEBU+1,END-1),DEBU=END,END=$N(^T($I,END))
 Q
NET S I=-1,I=$N(^PARTI($I,I)) Q:I=-1  S J=$N(^PARTI($I,I)) Q:J=-1  F II=0:0 S DR=^PARTI($I,I),GA=^PARTI($I,J) S:($E(DR,1,2)="((")&($E(GA,$L(GA)-1,$L(GA))="))") ^PARTI($I,I)=$E(DR,2,$L(DR)),^PARTI($I,J)=$E(GA,1,$L(GA)-1) S I=J,J=$N(^PARTI($I,J)) Q:J=-1
RECONS S I=-1,J=-1,EXP="" F UU=0:0 S I=$N(^PARTI($I,I)) Q:I=-1  S OPD=^PARTI($I,I),J=$N(^SIGNE($I,J)) Q:J=-1  S OPT=^SIGNE($I,J),EXP=EXP_OPD_OPT
 S:I'=-1 OPD=^PARTI($I,I),EXP=EXP_OPD Q
DETPAR K ^PO($I),PF,^POPF($I),^PFPO($I) S PPT=0 F PP=0:0 S PPT=$F(PXE,POU,PPT) Q:PPT=0  S ^PO($I,1-PPT)=1
 S PPT="" F PP=0:0 S IPO=$O(^PO($I,PPT)) Q:IPO=""  S IPF=$F(PXE,PFE,-(IPO)) Q:IPF=0  S ^POPF($I,-(IPO),IPF-1)=1,^PFPO($I,IPF-1,-(IPO))=1,PXE=$E(PXE,1,IPF-2)_"^"_$E(PXE,IPF,$L(PXE)) K ^PO($I,IPO)
 Q

