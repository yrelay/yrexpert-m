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

;%QZCHMES^INT^1^59547,73887^0
QZCHMES ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LIGN(REGLE,LFEN,STU) 
 N NSTU,LSTU,LREGLE,I,C,IC,MOT,LMOT,F
 S F=STU'=""
 
 S NSTU=1
 S:F @STU@(NSTU)=""
 S LSTU=0
 S IC=1
 S C=$E(REGLE,IC)
 
 F I=0:0 Q:C=""  D LIGN1
 Q NSTU
LIGN1 
 F I=0:0 Q:C=""  Q:" !#&()*+,-/:;<=>[\]^{|}~"'[C  D SEP
 
 I C="" Q
 
 
 S LMOT=0,MOT=""
 F I=0:0 Q:C=""  Q:" !#&()*+,-/:;<=>[\]^{|}~"[C  D MOT
 
 S:F @STU@(NSTU)=@STU@(NSTU)_MOT
 S LSTU=LSTU+LMOT
 Q
SEP 
 I (LSTU+1)>LFEN S NSTU=NSTU+1 S:F @STU@(NSTU)="" S LSTU=0
 
 S:F @STU@(NSTU)=@STU@(NSTU)_C
 S LSTU=LSTU+1
 
 S IC=IC+1
 S C=$E(REGLE,IC)
 Q
MOT 
 I ((LSTU+LMOT)+1)>LFEN D MOT1
 S MOT=MOT_C
 S LMOT=LMOT+1
 
 S IC=IC+1
 S C=$E(REGLE,IC)
 Q
 
MOT1 
 I LSTU=0 S:F @STU@(NSTU)=MOT S MOT="",LMOT=0
 
 S NSTU=NSTU+1
 S:F @STU@(NSTU)=""
 S LSTU=0
 Q
 
 
 
 
 
 
 
 
 
SUB(L,PARAM) 
 N I,P,L1
 I PARAM="" Q L
 S P=$F(L,"@",0),L1=$P(L,"@",1)
 
 F I=0:0 Q:P=0  S L1=$$SUB1(L,P,L1),P=$F(L,"@",P)
 Q L1
SUB1(L,P,L1) 
 N C,I,J,MOT,L3,L2,A
 S L2=$E(L,P,9999)
 S I=1
 S C=$E(L2,I),MOT=""
 F J=0:0 Q:C=""  Q:" @!#&()*+,-/:;<=>[\]^{|}~"[C  S MOT=MOT_C,I=I+1,C=$E(L2,I)
 I MOT'="" S MOT=$S(($D(@PARAM@(MOT))#10)=1:@PARAM@(MOT),1:MOT)
 S A=$E(L2,I,999)
 I A["@" S A=$P(A,"@",1)
 Q L1_MOT_A
 
TEST1 S L="TATAT TUTUT @TITI,@TOTOT YUYU@TRTR"
 S PARAM="PARAM1"
 S @PARAM@("TITI")="TITI1"
 S @PARAM@("TOTOT")="REPTOTO"
 W !,L,!,$$SUB(L,PARAM)
 Q
TEST S REGLE="QUEL EST DONC LE BRICK QUE JE VOIS AU BOUT DU WARF"
 S REGLE="QUEL EST DONC LE TRESTRESTRSEGROSBRICK QUE JE VOIS AU BOUT DU WARF"
 K STO
 S LFEN=8
 W $$LIGN(REGLE,LFEN,.STO)
 Q

