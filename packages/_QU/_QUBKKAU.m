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

;%QUBKKAU^INT^1^59547,73884^0
%QUBKKAU ;;10:06 AM  3 Mar 1992;
 
 
 
 
 
 
 
 
 
CASCADE(NAT,COLO) 
 N FILE,IFIL,TYPE,NUM,FE,%FE,VAL,CO,%CO
 S FILE=$$TEMP^%SGUTIL
 S MOD("C")=0,MOD("CFC")=0,MOD("F")=0
 S @FILE=1
 S @FILE@(@FILE,"T")=NAT,@FILE@(@FILE,"I")=COLO
 S IFIL=""
BCL S IFIL=$O(@FILE@(IFIL)) I IFIL="" K @(FILE) Q
 
 
 S TYPE=@FILE@(IFIL,"T"),NUM=@FILE@(IFIL,"I")
 
 
 
 S FE="" F %FE=0:0 S FE=$O(@KEMPLOI@(TYPE,NUM,"F",FE)) Q:FE=""  S VAL=$$EVALCOND(FE) I VAL'=@TEMP@("VALCOND",LIGTB1,FE) S (MOD("F"),MOD("CFC"))=1 D:VAL LOADCFC(FE) D:'(VAL) KILLCFC(FE) S @TEMP@("VALCOND",LIGTB1,FE)=VAL
 
 
 S CO="" F %CO=0:0 S CO=$O(@KEMPLOI@(TYPE,NUM,"C",CO)) Q:CO=""  I $$EVALCEL(CO) S MOD("C")=1
 
 S CO="" F %CO=0:0 S CO=$O(@KEMPLOI@(TYPE,NUM,"CFC",CO)) Q:CO=""  I $$EVALCEL2(CO) S MOD("CFC")=1
 
 G BCL
 
 
 
EVALCOND(FEN) 
 N RES
 S $ZT="ERREVAL"
 S @("RES="_@CONDIT@("COND",FEN))
 S $ZT="" Q RES
ERREVAL S $ZT="" Q 0
 
 
 
EVALCEL(CEL) 
 N RES,ECRAS,ATTCR
 Q:'($D(@FORM@(CEL)))
 S ECRAS=@FORM@(CEL,"ECRAS")
 S $ZT="ERRCEL"
 S @("RES="_@FORM@(CEL))
 S $ZT=""
 S:$$NUM^%QZNBN(RES) RES=$P((RES*1000)+$S(RES<0:-5E-1,1:5E-1),".")/1000
 G:'($D(C(CEL))) AFFCEL G:C(CEL)=RES NAFFCEL
 I (C(CEL)="")!(ECRAS="T") G AFFCEL
 G:ECRAS="J" NAFFCEL
 I $D(@NOECRAS@(CEL)) G NAFFCEL
 S ATTCR=$P(@GLODEF@("C",CEL),"^",2)
 I $$CONFIRM^%PKUTIL(4,18,60,$$^%QZCHW("Ecraser la valeur actuelle de l'attribut")_" "_ATTCR_" ("_C(CEL)_") "_$$^%QZCHW("avec la valeur calculee")_" ("_RES_") ?")=1 G AFFCEL
 S @NOECRAS@(CEL)=1
 Q 0
AFFCEL S C(CEL)=RES,@FILE=@FILE+1,@FILE@(@FILE,"T")="C",@FILE@(@FILE,"I")=CEL Q 1
NAFFCEL Q 0
 
ERRCEL S $ZT="" Q 0
 Q:'($D(C(CEL))) 0 Q:C(CEL)="" 0
 K C(CEL) S @FILE=@FILE+1,@FILE@(@FILE,"T")="C",@FILE@(@FILE,"I")=CEL
 Q 1
 
 
EVALCEL2(CEL) 
 N RES
 Q:'($D(@FORM2@(CEL)))
 S $ZT="ERRCEL2"
 S @("RES="_@FORM2@(CEL))
 S $ZT=""
 S:$$NUM^%QZNBN(RES) RES=$P((RES*1000)+$S(RES<0:-5E-1,1:5E-1),".")/1000
 I '($D(CFC(CEL))) S CFC(CEL)=RES,@FILE=@FILE+1,@FILE@(@FILE,"T")="CFC",@FILE@(@FILE,"I")=CEL Q 1
 I CFC(CEL)'=RES S CFC(CEL)=RES,@FILE=@FILE+1,@FILE@(@FILE,"T")="CFC",@FILE@(@FILE,"I")=CEL Q 1
 Q 0
ERRCEL2 S $ZT="" Q 0
 Q:'($D(CFC(CEL))) 0 Q:CFC(CEL)="" 0
 K CFC(CEL) S @FILE=@FILE+1,@FILE@(@FILE,"T")="CFC",@FILE@(@FILE,"I")=CEL
 Q 1
 
 
LOADCFC(FE) 
 N CO,VAL
 F CO=@CONDIT@("DEF","FEN",FE,"D"):1:@CONDIT@("DEF","FEN",FE,"F") D VALCFC
 Q
 
VALCFC N DUR
 S VAL=$$^%QSCALIN(REP,IND,$P(@GLODEF@("CC",CO),"^",3),$P(@GLODEF@("CC",CO),"^",4)),@FILE=@FILE+1,@FILE@(@FILE,"T")="CFC",@FILE@(@FILE,"I")=CO
 I VAL'="" S CFC(CO)=VAL Q
 S DUR=$$DUR S:DUR'="" CFC(CO)=DUR Q
 Q
 
DUR() N C,CFC,RES Q:'($D(@FORM2@(CO))) ""
 S $ZT="ERRDUR^%QUBKKAU",@("RES="_@FORM2@(CO)),$ZT="" Q RES
ERRDUR S $ZT="" Q ""
 
KILLCFC(FE) 
 N CO
 F CO=@CONDIT@("DEF","FEN",FE,"D"):1:@CONDIT@("DEF","FEN",FE,"F") K CFC(CO) S @FILE=@FILE+1,@FILE@(@FILE,"T")="CFC",@FILE@(@FILE,"I")=CO
 Q
 ;

