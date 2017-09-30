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

;%HXICAL^INT^1^59547,73869^0
HXICAL(L,T,R,FTOT,FREG,N,P,HISTO,AR,ABC,OPTH) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N BORNE,ADLIST,CARDNOCU,INDIV,VALINT,VALTOT,VALREG,IND,SOMCOL,MOY
 N I,II,M,REPR,REP,Z,BASE,FIRST,TEMP,GLO1,GLO2,TOTAL,MAX,RES,STOT
 K @(HISTO)
 D INIT^%HXYCALB
 F I=1:1 S INDIV=$O(@ADLIST@(INDIV)) Q:INDIV=""  D CALC I (I#10)=0 W "."
 G:ABC=1 ABC
 S VALREG=""
 F I=1:1 S VALREG=$O(@GLO1@(VALREG)) Q:VALREG=""  D:FIRST&N COLVID D COL I (I#10)=0 W "."
 G FIN
ABC D TRANS^%HXYCALB
 S VALTOT=""
 F I=1:1 S VALTOT=$ZP(@GLO2@(VALTOT)) Q:VALTOT=""  S VALREG="" F II=1:1 S VALREG=$O(@GLO2@(VALTOT,VALREG)) Q:VALREG=""  D:FIRST&N COLVID D COL I (I#10)=0 W "."
 
FIN I OPTH=0 S TOTAL=TOTAL/$$CARD^%QSGEST7(L)
 S @HISTO=IND
 S @HISTO@(0)=CARDNOCU,@HISTO@(0,"TOT")=0
 S @HISTO@("MAX")=MAX,@HISTO@("TOTAL")=TOTAL
 S @HISTO@("DATE")=$$DATE^%QMDATE
 K @(TEMP) Q
 
 
 
COLVID 
 S BORNE=VALREG-P
 F Z=BASE:P:BORNE S IND=IND+1,@HISTO@(IND)=0,@HISTO@(IND,"TEXT")=Z,@HISTO@(IND,"IND")=0,@HISTO@(IND,"TOT")=0
 Q
 
COL 
 S IND=IND+1
 I ABC=0 S VALINT=$P(@GLO1@(VALREG),"^",2),SOMCOL=$P(@GLO1@(VALREG),"^") F M=1:1 Q:'($D(@GLO1@(VALREG,M)))  S INDIV=$P(@GLO1@(VALREG,M),"^") D AFFECOL
 I ABC=1 S VALINT=$P(@GLO2@(VALTOT,VALREG),"^"),SOMCOL=VALTOT F M=1:1 Q:'($D(@GLO2@(VALTOT,VALREG,M)))  S INDIV=$P(@GLO2@(VALTOT,VALREG,M),"^") D AFFECOL
 S MOY=$S(ABC:SOMCOL,1:SOMCOL/(M-1))
 
 S @HISTO@(IND,"TEXT")=VALINT
 
 S STOT=$S(ABC:$P(@GLO2@(VALTOT,VALREG),"^",2),1:SOMCOL)
 S @HISTO@(IND,"TOT")=STOT
 S TOTAL=TOTAL+STOT
 
 I OPTH=1 S:SOMCOL>MAX MAX=SOMCOL S @HISTO@(IND)=SOMCOL
 I OPTH=0 S:MOY>MAX MAX=MOY S @HISTO@(IND)=MOY
 
 
 S @HISTO@(IND,"IND")=M-1
 
 I N&(ABC=0) S BASE=VALREG+P,FIRST=1
 Q
 
AFFECOL 
 S SAVTOT=VALTOT,@(FTOT)
 S @HISTO@(IND,"IND",INDIV)=VALTOT_"^"_$S(ABC=0:$P(@GLO1@(VALREG,M),"^",2),1:$P(@GLO2@(SAVTOT,VALREG,M),"^",2))
 S VALTOT=SAVTOT Q
 
CALC 
 S @(FTOT),@(FREG)
 I (VALREG="")!(VALTOT="") G NOCUMUL
 
 
CUMUL 
 
 
 S VALINT=VALREG
 I N S VALINT=(VALINT\P)*P
 
 
 S VALREG=$$AFFI^%QMDAUC(REPR,R,VALREG)
 
 S VALINT=$$INTF^%QMDAUC(REPR,R,VALREG)
 Q:VALINT=""
 S @GLO1@(VALINT)=($S($D(@GLO1@(VALINT)):$P(@GLO1@(VALINT),"^"),1:0)+VALTOT)_"^"_VALREG
 S @GLO1@(VALINT,$ZP(@GLO1@(VALINT,""))+1)=INDIV_"^"_VALREG
 Q
 
NOCUMUL 
 
 S CARDNOCU=CARDNOCU+1
 S @HISTO@(0,INDIV)=""
 Q

