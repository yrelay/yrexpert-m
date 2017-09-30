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

;%QSGEST3^INT^1^59547,73881^0
%QSGEST3 ;
ADD(R1,I1,NO1,L1,R2,I2,NO2) G SADD
ADDS(R1,I1,L1,R2,I2) N NO1,NO2 G SADD
SUP(R1,I1,NO1,L1,R2,I2,NO2) G SSUP
SUPS(R1,I1,L1,R2,I2) N NO1,NO2 G SSUP
ADDO(R1,I1,NO1,L1,R2,I2) G ADDN
OSUPS(R1,I1,NO1,L1,R2,I2) G OSUP
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SADD Q:(I1="")!(I2="")
 N A12,A21,N1,N2,OK,V1,V2 S OK=0 D CAL Q:'(OK)
 D PA^%QSGESTI(R1,I1,A12,V1,NO1),PA^%QSGESTI(R2,I2,A21,V2,NO2)
 D CREERL^%QSGES20(R1,I1,NO1,L1,R2,I2)
 Q
 
SSUP Q:(I1="")!(I2="")
 N A12,A21,N1,N2,OK,V1,V2 S OK=0 D CAL Q:'(OK)
 D PS^%QSGESTI(R1,I1,A12,V1,NO1),PS^%QSGESTI(R2,I2,A21,V2,NO2)
 D SUPPL^%QSGES20(R1,I1,NO1,L1,R2,I2)
 Q
 
CAL N T1,T2
 
 S A12=L1
 S T1=$$TYPE^%QSGEST9(R1,A12)
 S A21=$$LIENI^%QSGEL2(R1,R2,L1,T1)
 Q:(A12="")!(A21="")
 
 
 Q:'($D(^[QUI]RQSNCLES(R1)))  Q:'($D(^[QUI]RQSNCLES(R2)))
 Q:'($D(^[QUI]RQSLIEN(R1,A12)))  Q:'($D(^[QUI]RQSLIEN(R2,A21)))
 S N1=^[QUI]RQSNCLES(R1),N2=^[QUI]RQSNCLES(R2)
 S T2=$$TYPE^%QSGEST9(R2,A21)
 S V1=$S(T1=2:$P(I2,",",N2),1:I2),V2=$S(T2=2:$P(I1,",",N1),1:I1)
 S NO1=$S(T1=2:V1,1:I2),NO2=$S(T2=2:V2,1:I1),OK=1
 Q
 
ADDN 
 Q:(I1="")!(I2="")
 N T1,L2,INV
 S T1=$$TYPE^%QSGEST9(R1,L1)
 S L2=$$LIENI^%QSGEL2(R1,R2,L1,T1)
 Q:(T1=0)!(L2="")
 S INV=I1_","_I2
 D PA^%QSGESTI(R1,I1,L1,I2,NO1),PA^%QSGESTI(R2,INV,L2,I1,1)
 D CREERL^%QSGES20(R1,I1,NO1,L1,R2,INV)
 Q
 
OSUP 
 Q:(I1="")!(I2="")
 N T1,L2,INV
 S T1=$$TYPE^%QSGEST9(R1,L1)
 S L2=$$LIENI^%QSGEL2(R1,R2,L1,T1)
 Q:(T1=0)!(L2="")
 S INV=I1_","_I2
 D PS^%QSGESTI(R1,I1,L1,I2,NO1),PS^%QSGESTI(R2,INV,L2,I1,1)
 D SUPPL^%QSGES20(R1,I1,NO1,L1,R2,INV)
 Q
 
CAL1(R1,I1,L1,R2,I2,NO1,NO2,OK) N A12,A21,N1,N2,V1,V2 S OK=0 D CAL Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CAL2(R1,I1,L1,R2,I2,V1,V2,NO1,NO2,OK) 
 N T1,A12,A21,N1,N2,L2
 S (V1,V2,NO1,NO2)="",OK=0
 S T1=$$TYPE^%QSGEST9(R1,L1)
 I (T1'=1)&(T1'=2) S OK=0 D CAL Q
 I T1=2 D CAL3(R1,I1,L1,R2,I2,.V1,.V2,.NO1,.NO2,.OK) Q
 S L2=$$LIENI^%QSGEL2(R1,R2,L1,T1)
 I T1=1 D CAL3(R2,I2,L2,R1,I1,.V2,.V1,.NO2,.NO1,.OK) Q
 Q
 
 
CAL3(R1,I1,L1,R2,I2,V1,V2,NO1,NO2,OK) 
 N %O
 S V1=$$NOMEX^%QSGES10(R2,I2),OK=1
 I V1="" S OK=0 Q
 S NO1="" F %O=0:0 S NO1=$O(^[QUI]QUERYV(R1,I1,L1,NO1)) Q:NO1=""  Q:^[QUI]QUERYV(R1,I1,L1,NO1)=V1
 I NO1="" S OK=0
 S NO2=1
 S V2=I1
 Q

