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

;%QUECP1^INT^1^59547,73885^0
QUECP1(CL) 
 
 
 
 
 
 
 
 N TEMP,CURCP1,CHAMPS,CURCP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S CURCP1=$$CONCAS^%QZCHAD(TEMP,"CURCP1")
 S CHAMPS=$$CH^%QUECZ1(CL)
 S CURCP=$$CURCP^%QUECZ1(CL)
 
 D CONST(CL,CURCP1,CHAMPS)
 K @(CURCP)
 D CURCP(CURCP1,CURCP)
 K @(TEMP)
 Q
 
 
CONST(CL,CURCP1,CHAMPS) 
 N CH,I,TYPE,VAL,VAL1
 S VAL="VAL1"
 S CH=$O(@CHAMPS@(""))
 F I=0:0 Q:CH=""  D CONST1 S CH=$O(@CHAMPS@(CH))
 Q
CONST1 D CHCO^%QUECZ1(CL,CH,.TYPE,VAL)
 S @CURCP1@("A",@VAL@("XG"),@VAL@("YH"))=CH
 S @CURCP1@("B",@VAL@("YH"),@VAL@("XG"))=CH
 S @CURCP1@("C",CH,"XG")=@VAL@("XG")
 S @CURCP1@("C",CH,"YH")=@VAL@("YH")
 Q
 
 
 
 
 
 
 
 
SUIVY(CURCP1,CH) 
 N XG,YH,I,XG1,YH1,CH1
 S XG=@CURCP1@("C",CH,"XG")
 S YH=@CURCP1@("C",CH,"YH")
 
 S XG1=XG
 S YH1=$O(@CURCP1@("A",XG1,YH))
 I YH1'="" S XG=@CURCP1@("A",XG1,YH1) Q XG
 
 S XG1=$O(@CURCP1@("A",XG1))
 
 I XG1'="" S YH1=$O(@CURCP1@("A",XG1,"")),XG=@CURCP1@("A",XG1,YH1) Q XG
 
 S XG1=$O(@CURCP1@("A",XG1))
 S YH1=$O(@CURCP1@("A",XG1,""))
 S XG=@CURCP1@("A",XG1,YH1) Q XG
 
 
 
 
 
 
 
PRECY(CURCP1,CH) 
 N XG,YH,I,XG1,YH1,CH1
 S XG=@CURCP1@("C",CH,"XG")
 S YH=@CURCP1@("C",CH,"YH")
 
 S XG1=XG
 S YH1=$ZP(@CURCP1@("A",XG1,YH))
 I YH1'="" S XG=@CURCP1@("A",XG1,YH1) Q XG
 
 S XG1=$ZP(@CURCP1@("A",XG1))
 
 I XG1'="" S YH1=$ZP(@CURCP1@("A",XG1,"")),XG=@CURCP1@("A",XG1,YH1) Q XG
 
 S XG1=$ZP(@CURCP1@("A",XG1))
 S YH1=$ZP(@CURCP1@("A",XG1,""))
 S XG=@CURCP1@("A",XG1,YH1) Q XG
 
 
 
 
 
 
 
SUIVX(CURCP1,CH) 
 N XG,YH,I,XG1,YH1,CH1
 S XG=@CURCP1@("C",CH,"XG")
 S YH=@CURCP1@("C",CH,"YH")
 
 S YH1=YH
 S XG1=$O(@CURCP1@("B",YH1,XG))
 I XG1'="" S XG=@CURCP1@("A",XG1,YH1) Q XG
 
 S YH1=$O(@CURCP1@("B",YH1))
 
 I YH1'="" S XG1=$O(@CURCP1@("B",YH1,"")),XG=@CURCP1@("A",XG1,YH1) Q XG
 
 S YH1=$O(@CURCP1@("B",YH1))
 S XG1=$O(@CURCP1@("B",YH1,""))
 S XG=@CURCP1@("A",XG1,YH1) Q XG
 
 
 
 
 
 
 
PRECX(CURCP1,CH) 
 N XG,YH,I,XG1,YH1,CH1
 S XG=@CURCP1@("C",CH,"XG")
 S YH=@CURCP1@("C",CH,"YH")
 
 S YH1=YH
 S XG1=$ZP(@CURCP1@("B",YH1,XG))
 I XG1'="" S XG=@CURCP1@("A",XG1,YH1) Q XG
 
 S YH1=$ZP(@CURCP1@("B",YH1))
 
 I YH1'="" S XG1=$ZP(@CURCP1@("B",YH1,"")),XG=@CURCP1@("A",XG1,YH1) Q XG
 
 S YH1=$ZP(@CURCP1@("B",YH1))
 S XG1=$ZP(@CURCP1@("B",YH1,""))
 S XG=@CURCP1@("A",XG1,YH1) Q XG
 
 
CURCP(CURCP1,CURCP) 
 N CH,I,CH1
 S CH=$O(@CURCP1@("C",""))
 F I=0:0 Q:CH=""  D CURCP1 S CH=$O(@CURCP1@("C",CH))
 Q
CURCP1 
 S @CURCP@(CH,"H")=$$PRECY(CURCP1,CH)
 S @CURCP@(CH,"B")=$$SUIVY(CURCP1,CH)
 S @CURCP@(CH,"G")=$$PRECX(CURCP1,CH)
 S @CURCP@(CH,"D")=$$SUIVX(CURCP1,CH)
 Q
 
TEST S CURCP1="CURCP2",CURCP="CURCP0"
 K @(CURCP),@(CURCP1)
 S @CURCP1@("C","CH11","XG")=1
 S @CURCP1@("C","CH11","YH")=2
 S @CURCP1@("C","CH12","XG")=4
 S @CURCP1@("C","CH12","YH")=2
 S @CURCP1@("C","CH21","XG")=1
 S @CURCP1@("C","CH21","YH")=5
 S @CURCP1@("C","CH22","XG")=4
 S @CURCP1@("C","CH22","YH")=6
 S @CURCP1@("C","CH31","XG")=3
 S @CURCP1@("C","CH31","YH")=4
 S @CURCP1@("C","CH32","XG")=3
 S @CURCP1@("C","CH32","YH")=8
 N CH,I,TYPE,VAL,VAL1
 S VAL="VAL1"
 S CH=$O(@CURCP1@("C",""))
 F I=0:0 Q:CH=""  D XCONST1 S CH=$O(@CURCP1@("C",CH))
 D CURCP(CURCP1,CURCP)
 Q
XCONST1 
 S @VAL@("XG")=@CURCP1@("C",CH,"XG")
 S @VAL@("YH")=@CURCP1@("C",CH,"YH")
 S @CURCP1@("A",@VAL@("XG"),@VAL@("YH"))=CH
 S @CURCP1@("B",@VAL@("YH"),@VAL@("XG"))=CH
 Q

