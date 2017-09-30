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

;%PSDKBR^INT^1^59547,73874^0
%PSDKBR ;;04:22 PM  4 May 1992;
 
 
 
 N PRED,DOM
LEC D CLEPAG^%VVIDEO
 S DX=10,DY=8 X XY W "domaine" S DX=30 X XY R DOM
 I DOM="?" S DOM=$$CHOIX^%PSSADO2 D CLEPAG^%VVIDEO
 Q:DOM=""
 S DX=10,DY=10 X XY W "predicat" S DX=30 X XY R PRED
 I PRED="?" S PRED=$$CHOIX^%PSPRSA
 Q:PRED=""
 I '($$EXIPRED^%PSPRGES(PRED)) D ^%VZEAVT("Predicat inconnu") G LEC
 D SAIS(DOM,PRED)
 Q
 
SAIS(DOM,PRED) 
 N GL,LIS,TEMP,I,IOPE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S @TEMP@("DO")=DOM
 S GL=$$CONCAS^%QZCHAD(TEMP,"GL")
 S GLOTAB="^[QUI]RQSGLO(""GPS"",""RED"","""_DOM_""","""_PRED_""")"
 I '($D(@GLOTAB)) D INITB(DOM,PRED) G AFF
 I '($$COHER(DOM,PRED)) D INITB(DOM,PRED) G AFF
AFF S @GL@("X")=0,@GL@("Y")=3,@GL@("L")=79,@GL@("H")=12,@GL@("TI")="Operateurs reducteurs de "_PRED
 S @GL@("LI",1,"L")=20,@GL@("LI",1,"U")="OK^xquol"
 F IOPE=1:1:30 S @GL@("LI",IOPE+1,"T")="ope"_IOPE,@GL@("LI",IOPE+1,"L")=16,@GL@("LI",IOPE+1,"U")="OK^%PSDKBR"
 S @GL@("FEN",1,"D")=1,@GL@("FEN",1,"F")=1,@GL@("FEN",1,"L")=22
 S @GL@("FEN",2,"D")=2,@GL@("FEN",2,"F")=31,@GL@("FEN",2,"L")=54
 S @GL@("A")=GLOTAB
 S @GL@("CHI",1)=""
 D CLEPAG^%VVIDEO,^%QUBKV(GL,0)
 K @(TEMP)
 Q
OK(NR) N TEMP,DOM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T"),DOM=@TEMP@("DO")
 I Y1="?" S Y1=$$CHOIXDO^%PSSAOP2(DOM) D CLEPAG^%VVIDEO S REAF=1
 I Y1="" S OK=1 Q
 I '($$EXISTEO^%PSOPGES(DOM,Y1)) D ^%VZEAVT("operateur inconnu") S OK=0 Q
 S OK=1 I $L(Y1)>15 S REAF=1
 Q
 
 
 
COHER(DO,PRED) 
 N GLOTAB,GLOD
 S GLOTAB="^[QUI]RQSGLO(""GPS"",""RED"","""_DO_""","""_PRED_""")"
 S GLOD="^[QUI]RQSGLO(""PRED"","""_PRED_""")"
 Q:'($D(@GLOTAB)) 1
 I $ZP(@GLOTAB@(""))'=$ZP(@GLOD@("")) Q 0
 S C="" F %C=1:1 S C=$O(@GLOD@(C)) Q:C=""  I $P(@GLOTAB@(%C),"^")'=@GLOD@(C) G NOCOHER
 Q 1
NOCOHER Q 0
 
 
INITB(DO,PRED) 
 N GLOTAB,GLOD,C,%C
 S GLOTAB="^[QUI]RQSGLO(""GPS"",""RED"","""_DO_""","""_PRED_""")"
 S GLOD="^[QUI]RQSGLO(""PRED"","""_PRED_""")"
 S C="" F %C=1:1 S C=$O(@GLOD@(C)) Q:C=""  S @GLOTAB@(%C)=@GLOD@(C)_"^^^^^"
 Q
 ;
 ;

