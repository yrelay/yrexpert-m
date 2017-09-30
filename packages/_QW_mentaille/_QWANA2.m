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

;%QWANA2^INT^1^59547,73886^0
QWANA2 ;
 
 
 
OPER 
 I VALC="" Q 1
 F I=0:0 Q:$E(VALC)'=" "  S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S PCAR=$E(VALC)
 I ($L(EXP)+1)>MAXM S CODERR=KTL Q 0
 I PCAR=")" G PARFER
 I PCAR=";" G PTVIR
 G SOPE2
PARFER I '($D(@PTVAT@(PARLVL))) S CODERR=KUP Q 0
 
 I '($D(@PTVAT@(PARLVL,"PV",0))) S CODERR=KSE Q 0
 K @PTVAT@(PARLVL) S PARLVL=PARLVL-1
 S PCR=PCR+1 D AFFBLD(PCR)
 S VALC=$E(VALC,2,$L(VALC))
 F I=0:0 Q:$E(VALC)'=" "  S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S PCAR=$E(VALC)
 I PCAR'="^" S EXP=EXP_")" G OPER
 
 
 I @PTVAT@(PARLVL,"CH")=0 Q 0
 S PCR=PCR+1 D AFFBLD(PCR)
 S VALC=$E(VALC,2,$L(VALC))
 F I=0:0 Q:$E(VALC)'=" "  S VALC=$E(VALC,2,$L(VALC)),PCR=PCR+1
 S PCAR=$E(VALC)
 S MOT=$$LIREATT^%QWANA3
 
 I $$LEX^%QWANA3(ROUTAFF,.MOT)=0 Q 0
 I ($L(EXP)+$L(MOT))>MAXM S CODERR=KTL Q 0
 S EXP=EXP_","_""""_MOT_"""",ICOUR=ICOUR+1
 S @GCOMP@("A",MOT)=""
 S FINAFF=(PCR+$L(MOT))+1 F PCR=PCR:1:FINAFF D AFFBLD(PCR)
 S PCAR=$E(VALC)
 S @PTVAT@(PARLVL,"CH")=0
 I PCAR'="(" S EXP=EXP_")" G OPER
 
 S EXP=EXP_","
 S PCAR=$E(VALC),VALC=$E(VALC,2,$L(VALC))
 S PARLVL=PARLVL+1,@PTVAT@(PARLVL,"PV",0)=""
 G EXPRES^%QWANA1
 
 
PTVIR I '($D(@PTVAT@(PARLVL,"PV",1))) S CODERR=KTP Q 0
 S:@PTVAT@(PARLVL,"PV",1)'="N" EXP=EXP_","
 F PARA=1:1 Q:'($D(@PTVAT@(PARLVL,"PV",PARA)))  S @PTVAT@(PARLVL,"PV",PARA-1)=@PTVAT@(PARLVL,"PV",PARA)
 K @PTVAT@(PARLVL,"PV",PARA)
 S VALC=$E(VALC,2,$L(VALC))
 S PCR=PCR+1 D AFFBLD(PCR)
 G EXPRES^%QWANA1
 
SOPE2 I "+-*/_#"[PCAR S EXP=EXP_PCAR,PCR=PCR+1 D AFFBLD(PCR) S VALC=$E(VALC,2,$L(VALC)) G EXPRES^%QWANA1
 I TYPANA="EXPSIMP" S CODERR=KUO Q 0
 I "><=["[PCAR S EXP=EXP_PCAR,PCR=PCR+1,COMPVU=COMPVU+1,VALC=$E(VALC,2,$L(VALC)) D AFFBLD(PCR) G EXPRES^%QWANA1
 I PCAR'="'" G SOPER
 I ($L(EXP)+2)>MAXM S CODERR=KTL Q 0
 S PCR=PCR+1 D AFFBLD(PCR)
 S VALC=$E(VALC,2,$L(VALC)),PCAR=$E(VALC)
 I "><="[PCAR S EXP=EXP_"'"_PCAR,PCR=PCR+1,COMPVU=COMPVU+1,VALC=$E(VALC,2,$L(VALC)) D AFFBLD(PCR) G EXPRES^%QWANA1
 S CODERR=KUO Q 0
SOPER S CODERR=KUO
 I PCAR="E" S VALC=$E(VALC,2,$L(VALC)) Q:VALC="" 0 S PCAR=$E(VALC) Q:PCAR'="T" 0 S MOT="ET"
 I PCAR="O" S VALC=$E(VALC,2,$L(VALC)) Q:VALC="" 0 S PCAR=$E(VALC) Q:PCAR'="U" 0 S MOT="OU"
 I COMPVU'=1 S CODERR=KUE Q 0
 S COMPVU=0
 S EXP=$S(MOT="OU":EXP_"!",1:EXP_"&")
 S FINAFF=PCR+$L(MOT) F PCR=PCR:1:FINAFF D AFFBLD(PCR)
 G EXPRES^%QWANA1
SOPER2 S CODERR=KUO Q 0
 
 
 
 
AFFBLD(P) 
 N LI,C,PAFF
 Q:'(TRACEANA)
 S C=$E(CHAINE,P,P),PAFF=(SYNTX+P)-1
 S LI=PAFF\LRG,DX=PAFF-(LI*LRG),DY=SYNTY+LI X XY
 D:SUB'="C-IBM PC" BLD^%VVIDEO D:SUB="C-IBM PC" UDL^%VVIDEO X XY W C D NORM^%VVIDEO
 Q

