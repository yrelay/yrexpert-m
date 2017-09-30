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

;%ANA^INT^1^59547,73866^0
%ANA ;
 
 
 
 
INIT 
 K ^[QUI]ANSA S ^[QUI]ANSA=0 Q
 
 
INIDON L ^[QUI]ANSA
 S ^[QUI]ANSA=$ZP(^[QUI]ANSA(""))+0
 L
 Q
 
EXIFILS(N,F) 
 I '($D(^[QUI]ANSA(N,F))) Q 0
 Q 1
 
NEWQUI(QUI) Q $$NEW
 
NEW() 
 
 
 N VALANSA
 
 L +^[QUI]RQSGLO
 I '($D(^[QUI]RQSGLO("ANSA"))) S VALANSA=$ZP(^[QUI]ANSA("")),^[QUI]RQSGLO("ANSA")=$S(VALANSA="":0,VALANSA="z":0,1:VALANSA)
 S (^[QUI]RQSGLO("ANSA"),VALANSA)=^[QUI]RQSGLO("ANSA")+1
 L -^[QUI]RQSGLO
 
 Q VALANSA
 
 
SET(N,A,V) S ^[QUI]ANSA(N,A)=V Q
 
R1 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 
R2 
KILL(T) D KILLB(T) Q
 
KILLB(T) N VU D KILLB1(T,.VU) Q
 
KILLB1(T,VU) 
 Q:(T=0)!(T="")
 Q:$D(VU(T))
 S VU(T)=""
 N I F I=1:1 Q:'($D(^[QUI]ANSA(T,I)))  D KILLB1(^[QUI]ANSA(T,I),.VU)
 K ^[QUI]ANSA(T) Q
 
 
RECOP(A) Q:A=0 0
 I $D(^TABIDENT(WHOIS,"ORDINATEUR")) G:^TABIDENT(WHOIS,"ORDINATEUR")="PDP" RECOPB
SRECOP N I,%I,N S N=$$NEW
 S I=-1 F %I=0:0 S I=$N(^[QUI]ANSA(A,I)) Q:I=-1  D RA:I?.N,RV:I'?.N
 Q N
RA S ^[QUI]ANSA(N,I)=$$RECOP(^[QUI]ANSA(A,I)) Q
RV S ^[QUI]ANSA(N,I)=^[QUI]ANSA(A,I) Q
 
RECOPB 
 N I,N,NP,F,TEMPO
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 I $D(^[QUI]ANSA) S ^[QUI]ANSA=^[QUI]ANSA+1 G RECOPS
 S ^[QUI]ANSA=1
RECOPS S NP=^[QUI]ANSA,@TEMPO@(NP,A)=""
BOUCP S N=$O(@TEMPO@(""))
 G:N="" BOUCF
 S A=$O(@TEMPO@(N,""))
 K @TEMPO@(N,A)
 S I=-1
BOUCAT S I=$N(^[QUI]ANSA(A,I))
 G:I=-1 BOUCP
 I (I?.N)&(^[QUI]ANSA(A,I)'=0) S ^[QUI]ANSA=$$^%QCAZG("^[QUI]ANSA")+1,F=^[QUI]ANSA,^[QUI]ANSA(N,I)=F,@TEMPO@(F,^[QUI]ANSA(A,I))="" G BOUCAT
 S ^[QUI]ANSA(N,I)=^[QUI]ANSA(A,I) G BOUCAT
BOUCF K @(TEMPO) Q NP
 
 
COPY(QUI1,ND1,QUI2) 
 I ND1=0 Q 0
 N TEMP,I,NOR1,NDF1,NDF2,ND2B,ND2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPY")
 K @(TEMP)
 D INITFI^%QCASTA(TEMP)
 S (ND2B,ND2,^[QUI2]ANSA)=$$NEWQUI(QUI2)
 D PUSH^%QCASTA(TEMP,ND1_"/"_ND2)
 
COPYN G:$$PILEVIDE^%QCASTA(TEMP) COPYF
 S ND1=$$POP^%QCASTA(TEMP)
 S ND2=$P(ND1,"/",2)
 S ND1=$P(ND1,"/",1)
 
 S NOR1=$O(^[QUI1]ANSA(ND1,""))
 
COPYO G:NOR1="" COPYM
 
 S NDF1=^[QUI1]ANSA(ND1,NOR1)
 
 I (NOR1'?.N)!(NDF1=0) S ^[QUI2]ANSA(ND2,NOR1)=NDF1,NOR1=$O(^[QUI1]ANSA(ND1,NOR1)) G COPYO
 
 
 S (NDF2,^[QUI2]ANSA)=$$NEWQUI(QUI2)
 D PUSH^%QCASTA(TEMP,NDF1_"/"_NDF2)
 
 S ^[QUI2]ANSA(ND2,NOR1)=NDF2
 
 S NOR1=$O(^[QUI1]ANSA(ND1,NOR1))
 G COPYO
COPYM G COPYN
 
COPYF S ND2=ND2B
 K @(TEMP)
 Q ND2
PRINT(T) 
 D P(T,0) Q
P(T,I) Q:T=0  W !
 N J,%J S J=-1 F %J=0:0 S J=$N(^[QUI]ANSA(T,J)) Q:J=-1  W:J'?.N !,$J("",I),J," --> ",^[QUI]ANSA(T,J)
 F J=1:1 Q:'($D(^[QUI]ANSA(T,J)))  D P(^[QUI]ANSA(T,J),I+4)
 Q
 
FULL(T) 
 W !,T
 D F(T,0)
 Q
F(T,I) N J
 W !,$J("",I+2)," type : ",$S($D(^[QUI]ANSA(T,"TYPE")):^[QUI]ANSA(T,"TYPE"),1:"")
 W !,$J("",I+2)," texte: ",$S($D(^[QUI]ANSA(T,"TEXTE")):^[QUI]ANSA(T,"TEXTE"),1:"")
 F J=1:1 Q:'($D(^[QUI]ANSA(T,J)))  W !,$J("",I+2),J," -> ",^[QUI]ANSA(T,J) I ^[QUI]ANSA(T,J)'=0 D F(^[QUI]ANSA(T,J),I+3)
 I $D(^[QUI]ANSA(T,"CONDITION")) W !,$J("",I+2),"CND -> ",^[QUI]ANSA(T,"CONDITION") I ^[QUI]ANSA(T,"CONDITION")'=0 D F(^[QUI]ANSA(T,"CONDITION"),I+3)
 Q

