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

;%QWANA11^INT^1^59547,73886^0
QWANA11 ;
 
 
 
 
ATT 
 S MOT=$$LIREATT^%QWANA3 G:TYPANA="META" SATTM
 
 I $$LEX^%QWANA3(ROUTAFF,.MOT)=0 Q 0
 S FINAFF=PCR+$L(MOT) F PCR=PCR:1:FINAFF D BLD(PCR)
 F I=0:0 Q:$E(VALC)'=" "  S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S PCAR=$E(VALC)
 G:PCAR="(" SATT1 G:PCAR="^" SATT2
 
 S @PTVAT@(PARLVL,"CH")=0
 S VALAC="$$A1^%QWSTOL("_""""_MOT_""""_")"
 I ($L(EXP)+$L(VALAC))>MAXM S CODERR=KTL Q 0
 S EXP=EXP_VALAC,ICOUR=ICOUR+1,@GCOMP@("A",MOT)=""
 G OPER^%QWANA2
SATT1 
 S PCR=PCR+1 D BLD(PCR)
 S VALAC="$$C^%QWSTOL("_""""_MOT_""""_","
 I ($L(EXP)+$L(VALAC))>MAXM S CODERR=KTL Q 0
 S EXP=EXP_VALAC,ICOUR=ICOUR+1,@GCOMP@("A",MOT)=""
 S VALC=$E(VALC,2,$L(VALC)),PCAR=$E(VALC)
 S @PTVAT@(PARLVL,"CH")=1
 S @PTVAT@(PARLVL,"EC")=1
 S PARLVL=PARLVL+1,@PTVAT@(PARLVL,"PV",0)=""
 S @PTVAT@(PARLVL,"CH")=1
 S @PTVAT@(PARLVL,"PV")=0
 G EXPRES^%QWANA1
SATT2 
 I @PTVAT@(PARLVL,"CH")=0 Q 0
 S VALAC="$$B1^%QWSTOL("_""""_MOT_""""_","
 I ($L(EXP)+$L(VALAC))>MAXM S CODERR=KTL Q 0
 S EXP=EXP_VALAC,ICOUR=ICOUR+1,@GCOMP@("A",MOT)=""
 S GCOUR=$$CONCAS^%QZCHAD(GCOMP,"A,"_MOT)
 S FINAFF=PCR+$L(MOT) F PCR=PCR:1:FINAFF D BLD(PCR)
 S VALC=$E(VALC,2,$L(VALC)),PCAR=$E(VALC)
 S MOT=$$LIREATT^%QWANA3
 
 I $$LEX^%QWANA3(ROUTAFF,.MOT)=0 Q 0
 S VALAC=""""_MOT_""""
 I ($L(EXP)+$L(VALAC))>MAXM S CODERR=KTL Q 0
 S EXP=EXP_VALAC,ICOUR=ICOUR+1,@GCOUR@(MOT)=""
 S FINAFF=(PCR+$L(MOT))+1 F PCR=PCR:1:FINAFF D BLD(PCR)
 S PCAR=$E(VALC)
 S @PTVAT@(PARLVL,"CH")=0
 I PCAR'="(" S EXP=EXP_")" G OPER^%QWANA2
 S EXP=EXP_","
 S PCAR=$E(VALC),VALC=$E(VALC,2,$L(VALC))
 S PARLVL=PARLVL+1,@PTVAT@(PARLVL,"PV",0)=""
 S @PTVAT@(PARLVL,"EC",0)=""
 G EXPRES^%QWANA1
SATTM 
 I '($$EXIMOT^%QWMCU(MOT)) S CODERR=KAU Q 0
 S VALAC=$$TRADUC^%QWMCU(MOT)
 I ($L(EXP)+$L(VALAC))>MAXM S CODERR=KTL Q 0
 S EXP=EXP_VALAC,ICOUR=ICOUR+1,@GCOMP@("A",VALAC)=""
 S FINAFF=PCR+$L(MOT) F PCR=PCR:1:FINAFF D BLD(PCR)
 G OPER^%QWANA2
 
 
ATTL 
 S VALC=$E(VALC,2,$L(VALC)),PCAR=$E(VALC)
 I ($A(PCAR)<$A("A"))!($A(PCAR)>$A("Z")) Q 0
 S MOT=$$LIREATT^%QWANA3
 
 I $$LEX^%QWANA3(ROUTAFF,.MOT)=0 Q 0
 S EXP=EXP_MOT,ICOUR=ICOUR+1,@GCOMP@("A",MOT)=""
 S FINAFF=PCR+$L(MOT) F PCR=PCR:1:FINAFF D BLD(PCR)
 G OPER^%QWANA2
 
 
 
BLD(P) 
 N LI,C,PAFF
 Q:'(TRACEANA)
 S C=$E(CHAINE,P,P),PAFF=(SYNTX+P)-1
 S LI=PAFF\LRG,DX=PAFF-(LI*LRG),DY=SYNTY+LI X XY D:SUB'="C-IBM PC" BLD^%VVIDEO D:SUB="C-IBM PC" UDL^%VVIDEO X XY W C D NORM^%VVIDEO
 Q

