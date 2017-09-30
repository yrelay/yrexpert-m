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

;%PSPRSAC^INT^1^59547,73874^0
%PSPRSAC ;;09:14 AM  17 Jun 1992;
 
 
 
 N PRED,DOM
LEC D CLEPAG^%VVIDEO
 S DX=10,DY=10 X XY W "predicat" S DX=30 X XY R PRED
 I PRED="?" S PRED=$$CHOIX^%PSPRSA
 Q:PRED=""
 I '($$EXIPRED^%PSPRGES(PRED)) D ^%VZEAVT("Predicat inconnu") G LEC
 D SAIS(PRED)
 Q
 
SAIS(PRED) 
 N GL,LIS,TEMP,I,IOPE,GLOD,GLOTAB,C,%C,RESSAI
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S GL=$$CONCAS^%QZCHAD(TEMP,"GL")
 S GLOTAB=$$CONCAS^%QZCHAD(TEMP,"GL2")
 S GLOD="^[QUI]RQSGLO(""PRED"","""_PRED_""")"
 S C="" F %C=1:1 S C=$O(@GLOD@(C)) Q:C=""  S @GLOTAB@(%C)=@GLOD@(C)_"^"_$S($E(@GLOD@(C)=":"):"-",$D(@GLOD@(C,"COEF")):@GLOD@(C,"COEF"),1:1)
 S @GL@("X")=0,@GL@("Y")=3,@GL@("L")=79,@GL@("H")=12,@GL@("TI")="Coefficients d'evaluation de "_PRED
 S @GL@("LI",1,"L")=60
 S @GL@("LI",2,"L")=12
 S @GL@("FEN",1,"D")=1,@GL@("FEN",1,"F")=2,@GL@("FEN",1,"L")=74
 S @GL@("A")=GLOTAB
 S @GL@("CHI",1)=""
 D CLEPAG^%VVIDEO
 S RESSAI=$$^%QUBKV(GL,0) G:RESSAI=0 SAISFIN
 S C="" F %C=1:1 S C=$O(@GLOTAB@(C)) Q:C=""  S @GLOD@(C,"COEF")=$P(@GLOTAB@(C),"^",2)
SAISFIN K @(TEMP)
 Q
 ;

