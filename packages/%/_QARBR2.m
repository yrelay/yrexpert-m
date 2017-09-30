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

;%QARBR2^INT^1^59547,73875^0
%QARBR2(FONC,VAL1,VAL2,VAL3,ADR1,ADR2) ;;05:01 PM  18 Jul 1991;
 
 I FONC="INIT" D INIT(VAL1,VAL2,VAL3) Q
 I FONC="OKPLACE" D OKPLAC(VAL1,.R1,.R2),AFF^%TLIACTS(ADR1,R1),AFF^%TLIACTS(ADR2,R2) Q
 I FONC="PLACER" D PLACER(VAL1) Q
 Q
 
INIT(PAR1,PAR2,CASE) 
 N TEMP,TCASE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S NBCOL=PAR1,NBLIG=PAR2,NBCASE=NBCOL*NBLIG
 S @TCASE@(CASE)=""
 Q
 
 
OKPLAC(CASE1,CASE2,CHEM) 
 N IK1,IK2,NXT,PIL,IPIL,VU
 N TEMP,TCASE S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T")
 S TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S PIL=$$CONCAS^%QZCHAD(TEMP,"P") K @(PIL)
 S VU=$$CONCAS^%QZCHAD(TEMP,"V") K @(VU)
 S CHEM=CASE1_","
 D COORD(CASE1,.IK1,.IK2)
 S SENS=0,IPIL=0
 I IK1<NBLIG S NXL=CASE1+NBCOL D EMPIL
 I IK2<NBCOL S NXL=CASE1+1 D EMPIL
 I IK2>1 S NXL=CASE1-1 D EMPIL
 I IK1>1 S NXL=CASE1-NBCOL D EMPIL
 S ICOU=""
BCL S ICOU=$O(@PIL@(ICOU)) G:ICOU="" ECHEC
 S CC=@PIL@(ICOU),CHEM=@PIL@(ICOU,"C")_CC_",",ISENS=@PIL@(ICOU,"S")
 D COORD(CC,.I,.J)
 
 I I<NBLIG S NXT=CC+NBCOL I $$OKIND(NXT) G OK
 I J<NBCOL S NXT=CC+1 I $$OKIND(NXT) G OK
 I J>1 S NXT=CC-1 I $$OKIND(NXT) G OK
 I I>1 S NXT=CC-NBCOL I $$OKIND(NXT) G OK
 
 I (I<NBLIG)&(J<NBCOL) S NXL=(CC+NBCOL)+1 I '($F(CHEM,","_NXL_",")) S SENS=3 D EMPIL
 I (I<NBLIG)&(J>1) S NXL=(CC+NBCOL)-1 I '($F(CHEM,","_NXL_",")) S SENS=1 D EMPIL
 I (I>1)&(J<NBCOL) S NXL=(CC-NBCOL)+1 I '($F(CHEM,","_NXL_",")) S SENS=9 D EMPIL
 I (I>1)&(J>1) S NXL=(CC-NBCOL)-1 I '($F(CHEM,","_NXL_",")) S SENS=7 D EMPIL
 G BCL
 
ECHEC K @(PIL) S CASE2=0 Q
OK K @(PIL) S CASE2=NXT,CHEM=CHEM_NXT Q
 
EMPIL 
 I $D(@TCASE@(NXL)),@TCASE@(NXL)'=CASE1 Q
 Q:$D(@VU@(NXL))
 S IPIL=IPIL+1,@PIL@(IPIL)=NXL,@PIL@(IPIL,"C")=CHEM,@PIL@(IPIL,"S")=SENS,@VU@(NXL)=""
 Q
OKIND(NXT) 
 Q:NXT<1 0 Q:NXT>NBCASE 0 Q '($D(@TCASE@(NXT)))
 
COORD(CA,I,J) 
 S J=((CA-1)#NBCOL)+1,I=((CA-1)\NBCOL)+1 Q
 
 
 
PLACER(CHM) 
 N DEP,L
 N TEMP,TCASE S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T")
 S TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S DEP=$P(CHM,",")
 F L=2:1:$L(CHM,",") S @TCASE@($P(CHM,",",L))=DEP
 Q

