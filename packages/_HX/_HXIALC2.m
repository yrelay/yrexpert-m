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

;%HXIALC2^INT^1^59547,73869^0
HXIALC2(L,T,ECL,N,P,GL1,GL2,FT,FE,ABC,OPTH,ATE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 K @($E(GL2,1,$L(GL2)-10)_")")
 D INIT^%HXYCALB
 S INDCOCOU=0,LIM=@GL1,REPE=$P(ATE,"^",2) S:REPE="" REPE=REP
 
 
 
 
 
 F Z=1:1:LIM S INDCOCOU=INDCOCOU+1 D CALHIS1 K @(GLO1),@(GLO2) I (Z#10)=0 W "."
 Q
 
CALHIS1 
 S INDIVIDU=""
 F I=1:1 S INDIVIDU=$O(@GL1@(INDCOCOU,"IND",INDIVIDU)) Q:INDIVIDU=""  D CALC I (I#10)=0 W "."
 S (BASE,FIRST,IND,MAX,TOTAL)=0,VALECL=""
 G:ABC=1 ABC
 F LL=1:1 S VALECL=$O(@GLO1@(VALECL)) Q:VALECL=""  D:FIRST&N COLVID D COL I (LL#10)=0 W "."
 G FIN
ABC D TRANS^%HXYCALB
 S VALTOT=""
 F I=1:1 S VALTOT=$ZP(@GLO2@(VALTOT)) Q:VALTOT=""  S VALECL="" F II=1:1 S VALECL=$ZP(@GLO2@(VALTOT,VALECL)) Q:VALECL=""  D:FIRST&N COLVID D COL I (I#10)=0 W "."
 
FIN I (OPTH=0)&(@GL1@(INDCOCOU,"IND")'=0) S TOTAL=TOTAL/@GL1@(INDCOCOU,"IND")
 S @GL2=IND
 S @GL2@(0)=CARDNOCU,@GL2@(0,"TOT")=0
 S @GL2@("MAX")=MAX,@GL2@("TOTAL")=TOTAL Q
 
 
 
COLVID S BORNE=VALECL-P
 F ZZ=BASE:P:BORNE S IND=IND+1,@GL2@(IND)=0,@GL2@(IND,"TEXT")=ZZ,@GL2@(IND,"IND")=0,@GL2@(IND,"TOT")=0
 Q
 
COL 
 S IND=IND+1
 I ABC=0 S VALINT=$P(@GLO1@(VALECL),"^",2),SOMCOL=$P(@GLO1@(VALECL),"^") F M=1:1 Q:'($D(@GLO1@(VALECL,M)))  S INDIVIDU=$P(@GLO1@(VALECL,M),"^") D AFFECOL
 I ABC=1 S VALINT=$P(@GLO2@(VALTOT,VALECL),"^"),SOMCOL=VALTOT F M=1:1 Q:'($D(@GLO2@(VALTOT,VALECL,M)))  S INDIVIDU=$P(@GLO2@(VALTOT,VALECL,M),"^") D AFFECOL
 S MOY=$S(ABC:SOMCOL,1:SOMCOL/(M-1))
 
 S @GL2@(IND,"TEXT")=VALINT
 
 S STOT=$S(ABC:$P(@GLO2@(VALTOT,VALECL),"^",2),1:SOMCOL)
 S @GL2@(IND,"TOT")=STOT
 S TOTAL=TOTAL+STOT
 
 I OPTH=1 S:SOMCOL>MAX MAX=SOMCOL S @GL2@(IND)=SOMCOL
 I OPTH=0 S:MOY>MAX MAX=MOY S @GL2@(IND)=MOY
 
 S @GL2@(IND,"IND")=M-1
 I N&(ABC=0) S BASE=VALECL+P,FIRST=1
 Q
AFFECOL 
 S SAVTOT=VALTOT,@(FT)
 S @GL2@(IND,"IND",INDIVIDU)=VALTOT_"^"_$P($S(ABC=0:@GLO1@(VALECL,M),1:@GLO2@(SAVTOT,VALECL,M)),"^",2)
 S VALTOT=SAVTOT
 Q
 
CALC 
 S @(FT),@(FE)
 I (VALECL="")!(VALTOT="") G NOCUMUL
 
 
CUMUL 
 
 
 S VALINT=VALECL
 I N S VALINT=(VALINT\P)*P
 
 
 S VALECL=$$AFFI^%QMDAUC(REPE,ECL,VALECL)
 
 S VALINT=$$INTF^%QMDAUC(REPE,ECL,VALECL)
 Q:VALINT=""
 S @GLO1@(VALINT)=($S($D(@GLO1@(VALINT)):$P(@GLO1@(VALINT),"^"),1:0)+VALTOT)_"^"_VALECL
 S @GLO1@(VALINT,$ZP(@GLO1@(VALINT,""))+1)=INDIVIDU_"^"_VALECL
 Q
 
NOCUMUL 
 
 S CARDNOCU=CARDNOCU+1,@GL2@(0,INDIVIDU)=""
 Q

