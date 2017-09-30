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

;%QULIMO8^INT^1^59547,73885^0
QULIMO8 ;
 
4 
 
 I '($D(@BUFFER)) G ERR^%QULIMO
 
 S SP1CX=P1C
 S ADR=$$CARD^%QCALIST(BUFFER)
 
 F I=$ZP(@LI@("")):-1:P1C D RECOP^%QULIMO2(I,I+ADR)
 
 
 I $D(@LI@(P1C)) F I=1:1:ADR D COPIE^%QULIMO2(BUFFER,I,LI,(P1C+I)-1,"","")
 
 D CONS1^%QULIMO3(0,LI,NL,"GLO",DH,P11,P11L,.CARD)
 D A18^%QULIMO4
 
 S I=$O(@BUFFER@(""))
B4 I I="" G C5
 S P1C=(SP1CX+I)-1
 D COPIE^%QULIMO2(BUFFER,I,LI,P1C,"",CP)
 S Y1=@LI@(P1C)
 S UCONT=$$CONCAT^%QZCHAD("^%QULIMOC",P1C_","""_$$ZSUBST^%QZCHSUB(LI,"""","""""")_""","_XG_","_YH_","_DH_","_DV_","_(DY-1)_",""GLO"","_PAG)
 D POS^%QULIMO2,SAUV^%QULIMO2,@COA,CHARG^%QULIMO2
 G:OK C4 G C6
C4 S ADR=$$B1^%QULIMO4
 I ADR="LL^%QULIMO" D LL^%QULIMO4(GLO1,PAG,NL,P1,.P1L,.YC,.P1C),LP^%QULIMO4
 I ADR="ERR" D ^%VSQUEAK
 S I=$O(@BUFFER@(I))
 G B4
C5 D CONS1^%QULIMO3(0,LI,NL,"GLO",DH,P11,P11L,.CARD)
 D A18^%QULIMO4 G LP^%QULIMO
 
 
C6 S ADR=$$CARD^%QCALIST(BUFFER)
 F J=SP1CX+ADR:1:$ZP(@LI@("")) D RECOP^%QULIMO2(J,J-(ADR-I))
 D CONS1^%QULIMO3(0,LI,NL,"GLO",DH,P11,P11L,.CARD)
 D A18^%QULIMO4
 S YG=Y1 D MOD^%QULIMO2 G:OK C4 G 7^%QULIMO
 
 D REAFF^%QULIMO3(P1C,1,LI,XG,YC-1,DH,(DV-(YC-YH))+1)
 S UCONT=$$CONCAT^%QZCHAD("^%QULIMOC",P1C_","""_$$ZSUBST^%QZCHSUB(LI,"""","""""")_""","_XG_","_YH_","_DH_","_DV_","_(DY-1)_",""GLO"","_PAG)
 D POS^%QULIMO2,SAUV^%QULIMO2,@COA,CHARG^%QULIMO2
 G:OK F4 S YG=Y1 D MOD^%QULIMO2 G:OK F4 G 7^%QULIMO
F4 D CONS1^%QULIMO3(0,LI,NL,"GLO",DH,P11,P11L,.CARD) G B^%QULIMO
 ;

