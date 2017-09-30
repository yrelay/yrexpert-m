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

;%QMDRUTP^INT^1^59547,73877^0
%QMDRUTP ;;03:28 PM  28 Apr 1993; 27 Apr 93 11:49 AM ; 03 May 93  5:48 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PERIODE(REGI,DATP1,DATE) 
 N DDEP,HDEP,DP,HP,DATL
 
 
 Q:'($$GET(REGI,DATP1,.DDEP,.HDEP)) 0
 S DATL=$$JOUR(DDEP,HDEP)
 
 Q:'($$GET(REGI,DATE,.DP,.HP)) 0
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL))) D MKTAB(REGI,DATL)
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL,"P",DP,HP))) Q 0
 S PERIODE=$P(^[QUI]RQSDON("QMDR",REGI,DATL,"P",DP,HP),"^")
 Q PERIODE
 
 
 
 
 
PERUP(REGI,DATL,DATE) 
 N D,H
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL))) D MKTAB(REGI,DATL)
 S D=$P(DATE,","),H=$P(DATE,",",2)
 I $D(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,H)) G PERDW3
 I $D(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,H)) G PERDW2
 S H=$ZP(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,H)) G:H'="" PERDW2
 S D=$ZP(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D)) Q:D="" 0 S H=""
 S H=$ZP(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,H)) G PERDW2
 
 
 
 
PERDOWN(REGI,DATL,DATE) 
 N D,H
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL))) D MKTAB(REGI,DATL)
 S D=$P(DATE,","),H=$P(DATE,",",2)
 I $D(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,H)) G PERDW2
 I $D(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,H)) G PERDW3
 S H=$O(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,H)) G:H'="" PERDW3
 S D=$O(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D)) Q:D="" 0 S H=""
 S H=$O(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,H)) G PERDW3
PERDW2 Q $P(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,H),"^")
PERDW3 Q $P(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,H),"^")
 
 
 
DERPERI(REGI,DATL,DATE) 
 N D,H
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL))) D MKTAB(REGI,DATL)
 S D=$P(DATE,","),H=$P(DATE,",",2)
 I $D(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D)) G:$D(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,H)) LP2 S H=$ZP(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,H)) G:H'="" LP2
 S D=$ZP(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D)) Q:D="" 0
 S H=$ZP(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,""))
LP2 Q $P(^[QUI]RQSDON("QMDR",REGI,DATL,"PF",D,H),"^")
 
 
PREMPERI(REGI,DATL,DATE) 
 N D,H
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL))) D MKTAB(REGI,DATL)
 S D=$P(DATE,","),H=$P(DATE,",",2)
 I $D(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D)) G:$D(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,H)) PP2 S H=$O(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,H)) G:H'="" PP2
 S D=$O(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D)) Q:D="" 0
 S H=$O(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,""))
PP2 Q $P(^[QUI]RQSDON("QMDR",REGI,DATL,"P",D,H),"^")
 
 
 
 
DATEDEB(REGI,DATL,PERIO) 
 N D,L,DDEP,HDEP
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL))) D MKTAB(REGI,DATL)
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL,"D",PERIO))) Q 0
 S D=^[QUI]RQSDON("QMDR",REGI,DATL,"D",PERIO)
 Q $$JOUR($P(D,"^"),$P(D,"^",2))
 
 
DATEFIN(REGI,DATL,PERIO) 
 N D,L,DDEP,HDEP,EQUIPE,NXH,HFI
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL))) D MKTAB(REGI,DATL)
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL,"D",PERIO))) Q 0
 S D=^[QUI]RQSDON("QMDR",REGI,DATL,"D",PERIO)
 Q $$JOUR($P(D,"^",4),$P(D,"^",5))
 
 
 
MKTAB(REGI,DATL) 
 N DD,HD,TAB,D,H,I,EQP,NXEQP
 S TAB="^[QUI]RQSDON(""QMDR"","""_REGI_""")"
 K @TAB@(DATL,"P"),@TAB@(DATL,"D"),@TAB@(DATL,"PF")
 S D=$P(DATL,",")+0,I=1,EQP=""
MNXD S D=$O(^[QUI]PLPLACAL(REGI,D))
 G:D="" FMM2
 S HD=$O(^[QUI]PLPLACAL(REGI,D,""))
 S HF=$O(^[QUI]PLPLACAL(REGI,D,HD,""))
 S EQP=^[QUI]PLPLACAL(REGI,D,HD,HF)
 S H=HD
MNDD S H=$O(^[QUI]PLPLACAL(REGI,D,H))
 
 I H="" D ECR2 G MNXD
 S HF2=$O(^[QUI]PLPLACAL(REGI,D,H,""))
 S NXEQP=^[QUI]PLPLACAL(REGI,D,H,HF2)
 
 I NXEQP'=EQP D ECR2 S HD=H,EQP=NXEQP
 S HF=HF2
 G MNDD
ECR2 S DF=$S(HF<HD:D+1,1:D)
 S @TAB@(DATL,"P",D,HD)=I_"^"_EQP
 S @TAB@(DATL,"D",I)=D_"^"_HD_"^"_EQP_"^"_DF_"^"_HF
 S @TAB@(DATL,"PF",DF,HF)=I_"^"_EQP
 S I=I+1
 Q
 
FMM2 Q
 
 
 
GET(REGI,DAT,D,H) 
 N HF,H2,EQP,EQPP
 S D=$P(DAT,",")+0,H=$P(DAT,",",2)+0
 I $D(^[QUI]PLPLACAL(REGI,D,H)) S HF=$O(^[QUI]PLPLACAL(REGI,D,H,"")),EQP=^[QUI]PLPLACAL(REGI,D,H,HF) G UP
 I $D(^[QUI]PLPLACAL(REGI,D)) S H=$ZP(^[QUI]PLPLACAL(REGI,D,H)) I H'="" S HF=$O(^[QUI]PLPLACAL(REGI,D,H,"")),EQP=^[QUI]PLPLACAL(REGI,D,H,HF) G UP
 S D=$ZP(^[QUI]PLPLACAL(REGI,D)) Q:D="" 0
 S H=$ZP(^[QUI]PLPLACAL(REGI,D,"")),HF=$O(^[QUI]PLPLACAL(REGI,D,H,"")),EQP=^[QUI]PLPLACAL(REGI,D,H,HF)
UP S H2=$ZP(^[QUI]PLPLACAL(REGI,D,H)) Q:H2="" 1
 S HF=$O(^[QUI]PLPLACAL(REGI,D,H2,"")),EQPP=^[QUI]PLPLACAL(REGI,D,H2,HF)
 Q:EQPP'=EQP 1
 S H=H2 G UP
 
JOUR(D,H) 
 Q $E("00000",1,5-$L(D))_D_","_$E("00000",1,5-$L(H))_H
 
 
GETEQUIP(REGI,DATP1,PERIO) 
 N D,L,DATL,DDEP,HDEP
 Q:'($$GET(REGI,DATP1,.DDEP,.HDEP)) 0
 S DATL=$$JOUR(DDEP,HDEP)
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL))) D MKTAB(REGI,DATL)
 I '($D(^[QUI]RQSDON("QMDR",REGI,DATL,"D",PERIO))) Q 0
 S D=^[QUI]RQSDON("QMDR",REGI,DATL,"D",PERIO)
 Q $P(D,"^",3)

