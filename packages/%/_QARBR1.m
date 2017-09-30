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

;%QARBR1^INT^1^59547,73875^0
%QARBR1(FONC,VAL1,VAL2,VAL3,ADR1,ADR2) ;;05:10 PM  18 Jul 1991;
 
 I FONC="INIT" D INIT(VAL1,VAL2,VAL3) Q
 I FONC="OKPLACE" D OKPLAC(VAL1,.R1,.R2),AFF^%TLIACTS(ADR1,R1),AFF^%TLIACTS(ADR2,R2) Q
 I FONC="PLACER" D PLACER(VAL1) Q
 Q
 
INIT(PAR1,PAR2,CASE) 
 N TEMP,CASE,CARAC
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S CARAC=$$CONCAS^%QZCHAD(TEMP,"CARAC")
 K @(TEMP)
 S @CARAC@("NBCOL")=PAR1,@CARAC@("NBLIG")=PAR2
 S @CARAC@("NBCASE")=NBCOL*NBLIG
 S @TCASE@(CASE)=""
 Q
 
 
OKPLAC(CASE1,CASE2,CHEM) 
 N TEMP,CASE,CARAC,NBCOL,NBLIG,NBCASE,I,IK1,IK2,NXT,NXL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S CARAC=$$CONCAS^%QZCHAD(TEMP,"CARAC")
 F I="NBCOL","NBLIG","NBCASE" S @(I_"=@CARAC@(I)")
 S CHEM=CASE1_","
 D COORD(CASE1,.IK1,.IK2)
 I IK1<NBLIG S NXL=CASE1+NBCOL I $$CASEL(NXL) G OKPL
 I IK2<NBCOL S NXL=CASE1+1 I $$CASEL(NXL) G OKPL
 I IK2>1 S NXL=CASE1-1 I $$CASEL(NXL) G OKPL
 I IK1>1 S NXL=CASE1-NBCOL I $$CASEL(NXL) G OKPL
 S CASE2=0 Q
OKPL S CASE2=NXT Q
 
 
 
 
 
CASEL(CC) 
 N OLDCHEM,I,J
 I $D(@TCASE@(CC)),@TCASE@(CC)'=CASE1 Q 0
 S OLDCHEM=CHEM
 S CHEM=CHEM_CC_","
 D COORD(CC,.I,.J)
 
 I I<NBLIG S NXT=CC+NBCOL I '($D(@TCASE@(NXT))) G OKCASEL
 I J<NBCOL S NXT=CC+1 I '($D(@TCASE@(NXT))) G OKCASEL
 I J>1 S NXT=CC-1 I '($D(@TCASE@(NXT))) G OKCASEL
 I I>1 S NXT=CC-NBCOL I '($D(@TCASE@(NXT))) G OKCASEL
 
 I (I<NBLIG)&(J<NBCOL) S NXT=(CC+NBCOL)+1 I '($F(CHEM,","_NXT_",")),$$CASEL(NXT) Q 1
 I (I<NBLIG)&(J>1) S NXT=(CC+NBCOL)-1 I '($F(CHEM,","_NXT_",")),$$CASEL(CC,NXT) Q 1
 I (I>1)&(J<NBCOL) S NXT=(CC-NBCOL)+1 I '($F(CHEM,","_NXT_",")),$$CASEL(CC,NXT) Q 1
 I (I>1)&(J>1) S NXT=(CC-NBCOL)-1 I '($F(CHEM,","_NXT_",")),$$CASEL(CC,NXT) Q 1
 S CHEM=OLDCHEM
 Q 0
OKCASEL S CHEM=CHEM_NXT
 Q 1
 
 
COORD(CA,I,J) 
 S J=((CA-1)#NBCOL)+1,I=((CA-1)\NBCOL)+1 Q
 
 
 
PLACER(CHM) 
 N TEMP,CASE,DEP,L
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),TCASE=$$CONCAS^%QZCHAD(TEMP,"C")
 S DEP=$P(CHM,",")
 F L=2:1:$L(CHM,",") S @TCASE@($P(CHM,",",L))=DEP
 Q

