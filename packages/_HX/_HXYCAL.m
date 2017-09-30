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

;%HXYCAL^INT^1^59547,73870^0
HXYCAL(L,T,R,N,P,HISTO,BI,BS,BO,ABC,OPTH,FTOT,FREG,FCOL,AR) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N BORNE,ADLIST,CARDNOCU,INDIV,VALINT,VALTOT,VALREG,IND,MOY,SOMCOL,STOT
 N REP,REPR,I,II,M,Z,BASE,FIRST,TEMP,GLO1,GLO2,TOTAL,MAX
 K @(HISTO)
 D INIT^%HXYCALB,PARC^%HXYCALB
 G:ABC=1 ABC
 S VALREG=""
 F I=1:1 S VALREG=$O(@GLO1@(VALREG)) Q:VALREG=""  D:FIRST&N COLVID D COL I (I#10)=0 W "."
 G FIN
ABC D TRANS^%HXYCALB
 
 S VALTOT=""
 F I=1:1 S VALTOT=$ZP(@GLO2@(VALTOT)) Q:VALTOT=""  S VALREG="" F II=1:1 S VALREG=$O(@GLO2@(VALTOT,VALREG)) Q:VALREG=""  D:FIRST&N COLVID D COL I (I#10)=0 W "."
 
FIN I OPTH=0 S TOTAL=TOTAL/$$CARD^%QSGEST7(L)
 S @HISTO=IND,@HISTO@(0)=CARDNOCU,@HISTO@(0,"TOT")=0
 S @HISTO@("MAX")=MAX,@HISTO@("TOTAL")=TOTAL
 S @HISTO@("DATE")=$$DATE^%QMDATE
 K @(TEMP) Q
 
 
 
COLVID 
 S BORNE=VALREG-P
 F Z=BASE:P:BORNE D COLVD
 Q
COLVD S IND=IND+1,@HISTO@(IND)=0
 S @HISTO@(IND,"TOT")=0,@HISTO@(IND,"TEXT")=Z,@HISTO@(IND,"IND")=0
 I FCOL'="" S (@HISTO@(IND,"FCOL"),SOMCOL)=$$FCOL^%HXYISTO(FCOL,REP,T,IND) S:SOMCOL>MAX MAX=SOMCOL
 Q
 
COL 
 S IND=IND+1
 I ABC=0 S VALINT=$P(@GLO1@(VALREG),"^",2),SOMCOL=$P(@GLO1@(VALREG),"^") F M=1:1 Q:'($D(@GLO1@(VALREG,M)))  S VV=$P(@GLO1@(VALREG,M),"^"),@HISTO@(IND,"IND",VV)=$$VAL^%HXYISTO(FTOT,REP,VV,T)_"^"_$P(@GLO1@(VALREG,M),"^",2)
 I ABC=1 S VALINT=$P(@GLO2@(VALTOT,VALREG),"^"),SOMCOL=VALTOT F M=1:1 Q:'($D(@GLO2@(VALTOT,VALREG,M)))  S VV=$P(@GLO2@(VALTOT,VALREG,M),"^"),@HISTO@(IND,"IND",VV)=$$VAL^%HXYISTO(FTOT,REP,VV,T)_"^"_$P(@GLO2@(VALTOT,VALREG,M),"^",2)
 S MOY=$S(ABC:SOMCOL,1:SOMCOL/(M-1))
 S @HISTO@(IND,"TEXT")=VALINT
 
 S STOT=$S(ABC:$P(@GLO2@(VALTOT,VALREG),"^",2),1:SOMCOL)
 S @HISTO@(IND,"TOT")=STOT
 S TOTAL=TOTAL+STOT
 
 I OPTH=1 S:SOMCOL>MAX MAX=SOMCOL S @HISTO@(IND)=SOMCOL
 I OPTH=0 S:MOY>MAX MAX=MOY S @HISTO@(IND)=MOY
 
 
 S @HISTO@(IND,"IND")=M-1
 
 I FCOL'="" S (@HISTO@(IND,"FCOL"),SOMCOL)=$$FCOL^%HXYISTO(FCOL,REP,T,IND) S:SOMCOL>MAX MAX=SOMCOL
 I N&(ABC=0) S BASE=VALREG+P,FIRST=1
 Q

