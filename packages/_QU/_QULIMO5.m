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

;%QULIMO5^INT^1^59547,73885^0
QULIMO5 ;
 
 
M 
 X XY
 
 I $D(@LI@(P1C)) D ^%VSQUEAK G L00^%QULIMO
 W I S YG=$S($D(@LI@(P1C)):I_$P(@LI@(P1C),2,999),1:I),DX=DX+1 X XY
 S UCONT=$$CONCAT^%QZCHAD("^%QULIMOC",P1C_","""_$$ZSUBST^%QZCHSUB(LI,"""","""""")_""","_XG_","_YH_","_DH_","_DV_","_(DY-1)_",""GLO"","_PAG)
 S CTRLA=0,PCX=DX-1,PCY=DY
 
 D GET^%VREAD("",1,YG,PCX-1,(PCX+DH)-3,DY+$S($D(@LI@(P1C)):@LI@(P1C),1:1),DY-1,0,"TAB",UCONT,.CTR,.Y1)
 I (CTR="A")!(Y1="") D REAFF^%QULIMO3(P1C,1,LI,XG,YC-1,DH,DV-(YC-YH)) G L00^%QULIMO
 S PAGE=1 D POS^%QULIMO2,SAUV^%QULIMO2,@COA,CHARG^%QULIMO2
 G:OK FM S YG=Y1 D 91^%QULIMO G:OK FM
 I PAGE=1 D REAFF^%QULIMO3(P1C,1,LI,XG,YC-1,DH,DV-(YC-YH)) G L00^%QULIMO
 D REAFF^%QULIMO3($$R^%QULIMO3(GLO1,PAG,1),$$L^%QULIMO3(GLO1,PAG,1),LI,XG,YH,DH,((PCY-1)-YH)+2)
 G L00^%QULIMO
FM 
 S @LI@(P1C)=Y1,@LI@(P1C,"NL")=$$LIGN^%QULIMO6($$SUB^%QULIMO6(Y1,PARAM),DH-3,"")
 D CONS1^%QULIMO3(0,LI,NL,GLO1,DH,P11,P11L,.CARD)
 D REAFF^%QULIMO3(P1C,1,LI,XG,YC-1,DH,$$MIN(@LI@(P1C,"NL")+2,DV-(YC-YH)))
 G B^%QULIMO4
 
12 
 G:'($D(@LI@(P1C))) ERR^%QULIMO
 S FI=$ZP(@LI@("")) F I=FI:-1:P1C D RECOP^%QULIMO2(I,I+1)
 K @LI@(P1C) D EFF^%QULIMO2
 D REAFF^%QULIMO3(P1C+1,1,LI,XG,YC,DH,DV-(YC-YH))
 D POS^%QULIMO2
 S CTRLA=0,PCX=DX,PCY=DY,YG=""
 
 S UCONT=$$CONCAT^%QZCHAD("^%QULIMOC",P1C_","""_$$ZSUBST^%QZCHSUB(LI,"""","""""")_""","_XG_","_YH_","_DH_","_DV_","_(DY-1)_",""GLO"","_PAG)
 D GET^%VREAD("",0,"",PCX-1,(PCX+DH)-3,DY+1,DY-1,0,"TAB",UCONT,.CTR,.Y1)
 S @LI@(P1C)=Y1,@LI@(P1C,"NL")=$$LIGN^%QULIMO6($$SUB^%QULIMO6(Y1,PARAM),DH-3,"")
 G:(Y1="")!(CTR="A") 7^%QULIMO
 S PAGE=1 D POS^%QULIMO2,SAUV^%QULIMO2,@COA,CHARG^%QULIMO2 G:OK F12
 S YG=Y1 D 91^%QULIMO G:OK F12 I PAGE=1 G 7^%QULIMO
 D REAFF^%QULIMO3($$R^%QULIMO3(GLO1,PAG,1),$$L^%QULIMO3(GLO1,PAG,1),LI,XG,YH,DH,((PCY-1)-YH)+2)
 G 7^%QULIMO
F12 S @LI@(P1C)=Y1,@LI@(P1C,"NL")=$$LIGN^%QULIMO6($$SUB^%QULIMO6(Y1,PARAM),DH-3,"")
 D REAFF^%QULIMO3(P1C,1,LI,XG,YC-1,DH,DV-(YC-YH))
 D CONS1^%QULIMO3(0,LI,NL,"GLO",DH,P11,P11L,.CARD) G B^%QULIMO4
 
 
MIN(A,B) Q:A<B A Q B

