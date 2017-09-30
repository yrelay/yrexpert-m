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

;LKZPAR^INT^1^59547,74868^0
LKZPAR ;
 
 
 
 
 
 
 
 
INIT(TEMP,TXT) 
 N TEMP1,PAR1
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 K @(TEMP1)
 S @PAR1@("NIV")=0
 D ^LKTXT(TXT,PAR1)
 Q 0
 
FIN(TEMP) 
 N TEMP1
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 K @(TEMP1)
 Q 0
 
EDGE(TEMP,X,Y) 
 N TEMP1,PAR1,I,NIV,A,J,X1,Y1
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 S NIV=@PAR1@("NIV")
 S X1=$$S1^%QZCHAD(X),Y1=$$S1^%QZCHAD(Y)
 S A="I=$$"_@PAR1@("EDGE")_"("_@PAR1@("NIV")_","_X1_","_Y1_")"
 S @(A)
 I $$^%QCAZG($$CONCAS^%QZCHAD(PAR1,"LAST"))'="" D LAST1
 I I["PB" Q 1
 I (NIV+I)<0 Q 1
 I I=0 Q 0
 I I>0 K @PAR1@("INC",NIV+I),@PAR1@("STO",NIV+I)
 S @PAR1@("NIV")=NIV+I
 Q 0
LAST1 S A="J=$$"_@PAR1@("LAST")_"("_@PAR1@("NIV")_","_X1_","_Y1_")"
 S @(A)
 S @PAR1@("LAST",NIV+I)=J Q
 
EDGF(TEMP) 
 N TEMP1,PAR1,I,NIV,A,J,LAST
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 S NIV=@PAR1@("NIV")
 S I=$$^%QCAZG($$CONCAS^%QZCHAD(PAR1,"LAST,"_@PAR1@("NIV")))+0
 I (NIV+I)<0 Q 1
 I I=0 Q 0
 S @PAR1@("NIV")=NIV+I
 Q 0
 
INC(TEMP) 
 N TEMP1,PAR1,I,NIV
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 Q:@PAR1@("MODE")["NOINC" 0
 S @PAR1@("INC",@PAR1@("NIV"))=$$NB^LKZ("@PAR1@(""INC"",@PAR1@(""NIV""))")+1
 Q 0
 
STO(TEMP,PARAM,ORDRE,VAL) 
 N TEMP1,PAR1,I,NIV
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 Q:@PAR1@("MODE")["NOSTO" 0
 S @PAR1@("STO",@PAR1@("NIV"),$$I(TEMP),PARAM,ORDRE)=VAL
 Q 0
 
LOA(TEMP,PARAM,ORDRE,VAL) 
 N TEMP1,PAR1,I,NIV
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 Q:@PAR1@("MODE")["NOSTO" 1
 S VAL=@PAR1@("STO",@PAR1@("NIV"),$$I(TEMP),PARAM,ORDRE)
 Q 0
 
LOAMV(TEMP,PARAM,VAL) 
 N TEMP1,PAR1,I,NIV,ORDRE,J
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 Q:@PAR1@("MODE")["NOSTO" 1
 S NIV=@PAR1@("NIV")
 S I=$$I(TEMP)
 S ORDRE=""
 F J=0:0 S ORDRE=$O(@PAR1@("STO",NIV,I,PARAM,ORDRE)) Q:ORDRE=""  S VAL(ORDRE)=@PAR1@("STO",NIV,I,PARAM,ORDRE)
 Q 0
 
NIV(TEMP) 
 N TEMP1,PAR1
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 S PAR1=@PAR1@("NIV") Q PAR1
 
I(TEMP) 
 N TEMP1,PAR1,I,NIV
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 Q $$NB^LKZ("@PAR1@(""INC"",@PAR1@(""NIV""))")
 
LAST(TEMP) 
 N TEMP1,PAR1,I,NIV
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$EX^LKZ(TEMP1)_",""PAR"")"
 Q $$^%QCAZG($$CONCAS^%QZCHAD(PAR1,"LAST,"_@PAR1@("NIV")))+0
 
TAB(TEMP) 
 N TEMP1,PAR1,I,NIV
 S TEMP1=$$EX^LKZ(TEMP)_",""LKZPAR"")"
 S PAR1=$$CONCAS^LKZ(TEMP1,"PAR,STO")
 Q PAR1
 
TEST S T="^TEMPORAI($J)"
 S A=$$INIT("^TEMPORAI($J)","NIV^LKLPAR")
 F X="A1","A2","C1+2","C2","B1-1","A3-1","A4-1","FIN" D TR1
 S X=$O(TT(""))
 F I=1:0 Q:X=""  D TR S X=$O(TT(X))
 S X=$ZP(TT(""))
 W !,"NIV ",$$NIV(T),?20,"I ",$$I(T),?40," X ",X
 S A=$$FIN(T)
 Q
TR W !,"NIV ",$$NIV(T),?20,"I ",$$I(T)
 W !,"EDGE ",$$EDGE(T,X,$O(TT(X))),?20,"INC ",$$INC(T),?40," X ",X,?60,"LAST ",$$LAST(T)
 S ER=$$STO(T,X,0,X)
 Q
TR1 S TT(X)=""
 Q

