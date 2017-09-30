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

;TOGSQUEL^INT^1^59547,74872^0
TOGSQUEL ;
 
 S NOK=0 F %CC=1:1:$L(XDP) S I=$E(XDP,%CC) D TESTAB
 D L
END K VPOL S IKS=$N(T(-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(T(IK)) Q:IKS=-1  I IKS'=(IK+1) S (%PCH,PCH)=$E(XDP,IK+1,IKS-1),PCH=$TR(PCH,"{","("),PCH=$TR(PCH,"}",")"),VPOL(VI)=PCH D @ADRF S VI=VI+1
 G FIN
L K T,LOCA S IX=1 F I="=","'","#","+","*","-","/","\",">","<",">","<","[","]","&","!","(",")","[","]" S POSI=1 F Z1=0:0 S POSI=$F(XDP,I,POSI) Q:POSI=0  S LOCA(IX)=POSI-1,T(LOCA(IX))=I,IX=IX+1
 G FIN
TESTAB S C1=$E(XDP,%CC-1),C1=$A(C1) G:(I'="(")&(I'=")") FIN I I=")" S NOK=NOK-1,C2="}" D:NOK'<0 CHPAR S:NOK<0 NOK=0 G FIN
 I (C1'<48)&(C1'>57) S C2="{" D CHPAR S NOK=NOK+1 G FIN
 I (C1'<65)&(C1'>90) S C2="{" D CHPAR S NOK=NOK+1 G FIN
 I (C1'<97)&(C1'>122) S C2="{" D CHPAR S NOK=NOK+1 G FIN
 G FIN
CHPAR S XDP=$E(XDP,1,%CC-1)_C2_$E(XDP,%CC+1,$L(XDP)) G FIN
RECONS S ITS=$N(T(-1)),IE=1,EX="" F WW=0:0 S IT=ITS,ITS=$N(T(IT)),EX=EX_T(IT) Q:ITS=-1  S:ITS'=(IT+1) EX=EX_VPOL(IE),IE=IE+1
 S LEX=$L(EX),EX=$E(EX,2,LEX-1)
FIN Q
 
TEST S ADRF="ADR" W !,$$^%QZCHW("A tester : ") R XDP Q:XDP=""
 S XDP="("_XDP_")" D ^TOGSQUEL,RECONS^TOGSQUEL W !,?10,EX G TEST
ADR W !,VPOL(VI) Q

