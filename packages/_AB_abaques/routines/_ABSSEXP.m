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

;%ABSSEXP^INT^1^59547,73864^0
%ABSSEXP ;
 
L I EX'["~" S EXT=EX G FIN
 K T,TI,LOCA,PO,PF S IX=1
 F I="'","~","_","#","+","*","-","/","\","[","]","(",")","&","!","<",">","=" S POSI=1 F Z1=0:0 S POSI=$F(EX,I,POSI) Q:POSI=0  S LOCA(IX)=POSI-1,T(LOCA(IX))=I S:I="(" PO(POSI-1)=1 S:I=")" PF(POSI-1)=1 S:I="~" TI(POSI-1)=1 S IX=IX+1
 S IX=-1 F %U=1:1 S IX=$N(PF(IX)) Q:IX=-1  S PO=$ZP(PO(IX)),CC=$E(EX,PO-1) I "+-*#\/_"'[CC K PF(IX),PO(PO),T(IX),T(PO)
 S VP=$L(EX)+1,IX=-1,NU=1 F %U=1:1 S IX=$N(TI(IX)) Q:IX=-1  S CC=$E(EX,IX+1),IY=$O(T(IX)) S:IY="" IY=VP,VP=VP+1 I CC'="(" S LOC(IX)="(",LOC(IY-1)=")"
 S EXP="" F %U=1:1 Q:$E(EX,%U)=""  S EXP=EXP_$E(EX,%U) I $D(LOC(%U)) S EXP=EXP_LOC(%U) K LOC(%U)
 S IX=-1 F %U=1:1 S IX=$N(LOC(IX)) Q:IX=-1  S EXP=EXP_")"
 S EX=EXP D FFF S T1="^[QUI]INDEFIND("""_ARTI_""","_FFF_")",IY=$ZP(@T1@("")),IY=IY+20,IX=1,EXP(IY)=EX,IY=IY+1,EXPC=-1 K DEP
LEXP K T1,LOC,PO,PF,VP S EXPC=$N(EXP(EXPC)) G:EXPC=-1 FEXP S EXP=EXP(EXPC),NU=0 G:EXP'["~" FEXP
 K T,LOCA S IX=1 F I="'","~","_","#","+","*","-","/","\","[","]","(",")","&","!","<",">","=" S POSI=1 F Z1=0:0 S POSI=$F(EXP,I,POSI) Q:POSI=0  S LOCA(IX)=POSI-1,T(LOCA(IX))=I,IX=IX+1
 F %U=1:1 S CC=$E(EXP,%U) Q:CC=""  D:(CC="(")!(CC=")") T0
 S VP=""
LVP S VP=$ZP(VP(VP)) G:VP="" LEXP S PO=""
LPO S PO=$O(VP(VP,PO)) G LVP:PO="" S SSC=$E(EXP,PO-1) G:SSC="" PF I "~"'[SSC S PF=$O(PF(PO)) K PO(PO),PF(PF) G LPO
PF S PF=$O(PF(PO)) G LVP:PF="" S LOC(IX)=$E(EXP,PO+1,PF-1),T1(IX)=LOC(IX),PO1=PO-1,EXP=$E(EXP,1,PO1-3)_".""_"_$E(EXP,PO,PF)_")"_$E(EXP,PF+1,999),EXP(IY)=EXP,PO3=PO1-3,PC=$ZP(T(PO3))
LPC S PC=$ZP(T(PC)) I PC="" S PC=0 G PC
PC S DEP(IY)=$E(EXP,PC+1,PO3)_".""_"_$E(EXP,PO,PF)_")",IY=IY+1,IX=IX+1
 G LEXP
T0 S NU=$S(CC="(":NU+1,1:NU-1),TF=$S(CC="(":"PO",1:"PF"),@TF@(%U)=1 I CC="(" S VP(NU,%U)=1
 Q
FEXP S EXT=EXP,IX=-1 F %U=1:1 S IX=$N(DEP(IX)) Q:IX=-1  S @("^[QUI]INDEFIND("""_ARTI_""","_FFF_",IX)")=DEP(IX)
FIN K IX,TF,IY,EXP,EXPC,T,LOCA,I,POSI,%U,CC,VP,PO,PF,SSC,DEP Q
FFF S FFF="" F FF=2:1:NCLE S FFF=FFF_""""_@("WB"_FF)_""","
 S FFF=$E(FFF,1,$L(FFF)-1) Q
TEST X ^TOT S ARTI="TOTO",NCLE=2,WB2=1 K ^INDEFIND(ARTI) W !,"EX : " R EX Q:EX=""  D ^%ABSSEXP S NU=-1 W ! F %U=1:1 S NU=$N(^INDEFIND(ARTI,1,NU)) Q:NU=-1  W !,?10,^INDEFIND(ARTI,1,NU)
 W ! G TEST

