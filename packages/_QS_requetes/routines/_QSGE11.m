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

;%QSGE11^INT^1^59547,73881^0
QSGE11 ;
 
 
 
 
 
 
 
 
 
 
 
 
ZERO(LISTE) 
 N ADR,ADRT
 S ADR=$$ADRLIS^%QSGEST7(LISTE)
 S ADRT=$$ADRLT^%QSGEST7(LISTE)
 K:ADR'="" @(ADR)
 K:ADRT'="" @(ADRT)
 D PA^%QSGESTI("L0",LISTE,"CARD",0,1)
 Q
 
 
 
 
 
 
 
UNION(A,B,C) 
 N CARD,A1,B1,C1
 S A1=$$ADRLIS^%QSGEST7(A)
 S B1=$$ADRLIS^%QSGEST7(B)
 S C1=$$ADRLIS^%QSGEST7(C)
 I ((A1="")!(B1=""))!(C1="") Q
 D TRK^%QSGES11(C1)
 D UNION^%QCALIST(A1,B1,C1,.CARD)
 D PA^%QSGESTI("L0",C,"CARD",CARD,1)
 Q
 
 
 
 
COPY(A,B) 
 N CARD,A1,B1,AT,BT,CARD1
 S A1=$$ADRLIS^%QSGEST7(A)
 S B1=$$ADRLIS^%QSGEST7(B)
 I (A1="")!(B1="") Q
 S CARD=0,CARD1=0
 D ZERO(B)
 S AT=$$ADRLT^%QSGEST7(A)
 S BT=$$ADRLT^%QSGEST7(B)
 I (AT'="")&(AT'=0),(BT="")!(BT=0) S BT=$$STOTRI^%QSGES11 D PA^%QSGESTI("L0",B,"TRIEE",BT,1),PA^%QSGESTI("L0",B,"TRIABLE","OUI",1)
 D RECOP^%QCALIST(A1,B1,.CARD)
 I AT'="" D RECOP^%QCALIST(AT,BT,.CARD1)
 D PA^%QSGESTI("L0",B,"CARD",CARD,1)
 Q
 
 
 
 
UNIONS(LL,L) 
 N I,J,ADL,ADLT
 S ADL=$$ADRLIS^%QSGEST7(L)
 S ADLT=$$ADRLT^%QSGEST7(L)
 S J=$O(@LL@(""))
 F I=0:0 Q:J=""  D UNIONS1(@LL@(J),L,ADL,ADLT) S J=$O(@LL@(J))
 Q
UNIONS1(L1,L,ADL,ADLT) 
 N I,J,ADRLT,IND,ADRL
 S ADRLT=$$ADRLT^%QSGEST7(L1)
 I (ADRLT="")!(ADRLT=0) D UNINT
 S IND=$$FUTURI(L)
 S J=""
 F I=0:0 S J=$O(@ADRLT@(J)) Q:J=""  D UNIT
 Q
 
UNIT S O=@ADRLT@(J)
UNIT1 I $D(@ADL@(O)) Q
 S @ADL@(O)=IND
 S @ADLT@(IND)=O
 S IND=IND+1
 Q
UNINT S ADRL=$$ADRLIS^%QSGEST7(L1)
 
 I (ADRL=0)!(ADRL="") Q
 S O=""
 F I=0:0 S O=$O(@ADRL@(O)) Q:O=""  D UNIT1
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ISPART(LLISTEN,LISTIND,LOC,MORE,ABS,MODE) 
 N LLISTE,TEMP,ADR,I,MSG,LISTE,A
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ISPART") K @(TEMP)
 S LLISTE=$$CONCAS^%QZCHAD(TEMP,"LLISTE")
 S A=$$^%QZCHW("impossible de retrouver les individus de la liste")
 D INSEP(A,LLISTEN,LLISTE,.MSG)
 I MSG'="" K @(TEMP) Q MSG
 S LISTE=$$ADRLIS^%QSGEST7(LISTIND)
 I (LISTE="")!(LISTE=0) S MSG=A_" "_LISTIND K @(TEMP) Q MSG
 S MSG=$$ISPART^%QCALIST(LLISTE,LISTE,LOC,MORE,ABS,MODE)
 S MSG=$S(MSG=1:"",1:LLISTEN_" "_$$^%QZCHW("n'est pas une partition de")_" "_LISTIND)
 K @(TEMP)
 Q MSG
INSEP(A,INSEPK,INSEP,MSG) 
 N ADRK,L1,I
 S MSG="" I INSEPK="" Q
 S ADRK=$$ADRLIS^%QSGEST7(INSEPK)
 I (ADRK="")!(ADRK=0) S MSG=A_" "_INSEPK Q
 S L1=""
 F I=0:0 S L1=$O(@ADRK@(L1)) Q:L1=""  Q:MSG'=""  D INSEP1
 Q
INSEP1 
 S ADRK1=$$ADRLIS^%QSGEST7(L1)
 I (ADRK1="")!(ADRK1=0) S MSG=A_" "_L1 Q
 S @INSEP@(L1)=ADRK1
 Q
 
 
 
 
 
 
OBJET(L,INDICE) 
 N ADRLT
 S ADRLT=$$ADRLT^%QSGEST7(L)
 I ((ADRLT="")!(ADRLT=0))!(INDICE="") Q ""
 I $D(@ADRLT@(INDICE)) Q @ADRLT@(INDICE)
 Q ""
 
 
 
 
 
INDICE(L,OBJ) 
 N ADR
 S ADR=$$ADRLIS^%QSGEST7(L)
 I ((ADR="")!(ADR=0))!(OBJ="") Q ""
 I $D(@ADR@(OBJ)) Q @ADR@(OBJ)
 Q ""
 
 
 
 
 
 
FUTURI(L,OBJ) 
 N ADR
 S ADR=$$ADRLT^%QSGEST7(L)
 I ((ADR="")!(ADR=0))!(OBJ="") Q ""
 Q $ZP(@ADR@(""))+1
 
 
 
 
 
 
TRIGLO(L,GLO) 
 N %I,%J,ADR,ADRT,IND,I,CRI,CR2
 S ADR=$$ADRLIS^%QSGEST7(L) Q:ADR=""
 S ADRT=$$ADRLT^%QSGEST7(L),CRI="",I=0
 D MSG^%VZEATT($$^%QZCHW("Tri en cours")),TRK^%QSGES11(L)
 
 F %I=0:0 S CRI=$O(@GLO@(CRI)) Q:CRI=""  S CR2="" F %J=0:0 S CR2=$O(@GLO@(CRI,CR2)) Q:CR2=""  S IND=@GLO@(CRI,CR2),I=I+1,@ADRT@(I)=IND,@ADR@(IND)=I
 
 D PA^%QSGESTI("L0",L,"TRIABLE","OUI",1),PA^%QSGESTI("L0",L,"TRIEE",ADRT,1)
 
 Q

