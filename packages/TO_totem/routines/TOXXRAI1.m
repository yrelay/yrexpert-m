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

;TOXXRAI1^INT^1^59547,74877^0
TOXXRAI1 ;
 N %ADRGO
 F %ADRGO="SYST","ABAQ","EXP","IMP","IMPE","TBSUIT","PHA","OUT","FOR","AFF","REP","IMPMOD" G:%ADRGO=ADR @%ADRGO
 
SYST S SUI=$$^%QZCHW("Fin"),LIB=$S($D(^[QUI]FULL(ART,AVER)):$$^%QZCHW("Parametre implicite"),1:"") D IMPE
 S NU(1)="",NU=1,COND=$P(RS,"(",2,999),RS="",PX=$L(COND," "),DY=14,DX=5 F %U=1:1:PX S PY=$P(COND," ",%U) S:($L(NU(NU))+$L(PY))>70 NU=NU+1,NU(NU)="" S NU(NU)=NU(NU)_PY_" "
 S NU=-1 F %U=1:1 S NU=$N(NU(NU)) Q:NU=-1  X XY W NU(NU) S DY=DY+1
 K NU G FIN
 
ABAQ S SUI=$$^%QZCHW("Fin")_","_$$^%QZCHW("Premisses")_","_$$^%QZCHW("Resultantes"),LIB=$$^%QZCHW("Parametre implicite")_" ("_$$^%QZCHW("Abaque")_")" D IMPE
 S COND="",AB=$P(RS,"^",3),DX=5,DY=14 F %U=1:1:3 X XY W $P(AB,"#",%U) S:%U<3 COND=COND_""""_$P(AB,"#",%U)_"""," S DY=DY+1
 S COND=$E(COND,1,$L(COND)-1),DY=DY+1,ACT=$P(RS,"^",2) X XY W "Page ",($P(ACT,"/",1)\3)+1,"  ",$$^%QZCHW("Colonne")," ",$S($P(ACT,"/",2)=10:1,$P(RS,"/",2)=33:2,1:3) G FIN
 
EXP S SUI=$$^%QZCHW("Fin"),LIB=$$^%QZCHW("Parametre explicite") G IMPE
 
IMPMOD S SUI=$$^%QZCHW("Fin"),LIB=$$^%QZCHW("Parametre implicite modifie ou importe") G IMPE
 
IMP ;;2,1,18
 D REP S LIB=$$^%QZCHW("Parametre implicite"),SUI=$$^%QZCHW("Fin")_","_$$^%QZCHW("Action")_","_$$^%QZCHW("Condition")
 
IMPE S TB=$S(OBJ="ART":"^[QUI]TVPAR(NUFA,TWREF)",1:"^[QUI]PARMAT(NUFA,TWREF)"),VAL=AVER_" = "_$S($D(@TB@(AVER)):@TB@(AVER),1:"???")_"  "_$S($D(^[QUI]UNITE(ART,AVER)):^[QUI]UNITE(ART,AVER),1:"")
 D AFF,TBSUIT G FIN
 
TBSUIT K TBSUIT S TBSUIT="" F %U=1:1 Q:$P(SUI,",",%U)=""  S TBSUIT($L(TBSUIT)+3)=$P(SUI,",",%U),TBSUIT=TBSUIT_"   "_$P(SUI,",",%U)
 K SUI S TBSUIT="" Q
 
PHA ;;1,9,17/18/19/20/21/22/23/24/25
 D REP S LIB=$$^%QZCHW("Phase de fabrication"),SUI="" F IT="Fin","Action","Condition","Temps et couts","Consignes" S SUI=SUI_$S(SUI="":"",1:",")_$$^%QZCHW(IT)
 S PH=$S($D(^[QUI]PHAS(NUFA,TWREF,AVER)):^[QUI]PHAS(NUFA,TWREF,AVER),1:""),VAL=$S(PH="":AVER,1:$E(AVER_"   "_$P(PH,"/",1),1,70))
 D AFF,TBSUIT G FIN
 
OUT ;;1,1,17
 D REP S LIB=$$^%QZCHW("Consignes de fabrication"),SUI="" F IT="Fin","Action","Condition" S SUI=SUI_$S(SUI="":"",1:",")_$$^%QZCHW(IT)
 S PH=$P(AVER,"/",2),VAL=PH_"  "_$S($D(^[QUI]PHAS(NUFA,TWREF,PH)):$P(^[QUI]PHAS(NUFA,TWREF,PH),"/",1),1:"")_"  "_$P(AVER,"/",1)
 D AFF,TBSUIT G FIN
 
FOR ;;1,2,17/19
 D REP S LIB=$$^%QZCHW("Chiffrage de phases de fabrication"),SUI="" F IT="Fin","Action","Condition" S SUI=SUI_$S(SUI="":"",1:",")_$$^%QZCHW(IT)
 K UT F %U=1,2 S UT(%U)=$S($P(RSF,"^",ACT(%U)+1)="":$$^%QZCHW("TEMPS"),1:$P(RSF,"^",ACT(%U)+1))
 F %U=1,2 S UT(%U*10)=$S(UT(%U)=$$^%QZCHW("TEMPS"):"^[QUI]DUREE",1:"^[QUI]COUT")
 S UT("P")=$J($P(@UT(10)@(NUFA,TWREF,AVER),"^",1),1,2),UT("U")=$J($P(@UT(20)@(NUFA,TWREF,AVER),"^",2),1,2)
 S VAL=$E($P(AVER,"/",2)_"   "_$P(AVER,"/",1),1,55)_"  "_UT("P")_" - "_UT("U")
 D AFF,TBSUIT G FIN
 
AFF D CUROF^%VVIDEO S DX=2 F DY=12:1:19 X XY W $J("",46)
 S VAL(1)=$P(VAL,"=",1),VAL(2)=$P(VAL,"=",2,500),DX=2,DY=7 X XY W $J("",46) X XY W LIB S DY=9 X XY W $J("",46) X XY W $E(VAL,1,46) D CURON^%VVIDEO Q
 
REP S ADR=$P($T(@ADR),";;",2),NOMTAB=$P(RS,"(",1) D ^%VTNAMFU S TAB=$S(%NFU="":NOMTAB,1:%NFU),RSF=@(TAB_"("_$P(RS,"(",2,500)),COND=$P(ADR,",",1),ACT=$P(ADR,",",2),%V=$P(ADR,",",3)
 F %U=1:1:ACT S ACT(%U)=$P(%V,"/",%U)
FIN Q

