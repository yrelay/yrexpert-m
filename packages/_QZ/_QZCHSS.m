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

;%QZCHSS^INT^1^59547,73887^0
QZCHSS ;
 
 
 
 
 
 
 
 
 
 
REF(VAL) 
 N REF,A
 S A=$E(VAL,1)
 S REF=$A(A)
 F I=2:1:$L(VAL) S A=$E(VAL,I),REF=REF_","_$A(A)
 
 Q REF
DEC(STO,LVAL) 
 N I,VAL,REF
 S VAL=$O(@LVAL@(""))
 F I=0:0 Q:VAL=""  D DEC1 S VAL=$O(@LVAL@(VAL))
 Q
DEC1 S REF=$$REF(VAL)
 S @("@STO@("_REF_")=VAL")
 Q
 
 
 
 
 
 
 
 
 
CHLI(LI,LTRANS,TAB,MODIF) 
 N C,I,IC,MOT,REF,RATE,ICD,LI1
 S IC=1
 S C=$E(LI,IC)
 S LI1=""
 S MODIF=0
 
 F I=0:0 Q:C=""  D CHLI1 S IC=IC+1,C=$E(LI,IC)
 Q LI1
CHLI1 S REF=$A(C)
 S RATE=0,ICD=IC
 
 F I=0:0 Q:$$CHLI2
 
 
 I RATE=1 S:ICD'=IC IC=IC-1 S LI1=LI1_$E(LI,ICD,IC) Q
 
 S @("MOT=@TAB@("_REF_")")
 
 
 I LTRANS="" Q
 S LI1=LI1_@LTRANS@(MOT)
 S MODIF=1
 Q
CHLI2() 
 I C="" S RATE=1 Q 1
 I @("'$D(@TAB@("_REF_"))")  S RATE=1 Q 1
 I @("$D(@TAB@("_REF_"))#10=1")  S RATE=0 Q 1
 
 S IC=IC+1,C=$E(LI,IC),REF=REF_","_$A(C)
 
 Q 0
TEST1 S T="TUTU" K @(T)
 D ^%QCAGLTX("DEB^%QZCHSS",T)
 D DEC("STO1",T)
 S LI="WWWWWW ABCD AB ABC XY1ZXYZ8""""888""8ACUCABUV"
 
 W !,LI
 D BLD^%VVIDEO
 S DY=$Y,DX=0 X XY
 S LI1=$$CHLI(LI,T,"STO1",.MODIF)
 D NORM^%VVIDEO
 W !,LI1
 Q
DEB ;;|"ABCD"|MOT1|
 ;;|"ABUV"|MOT2|
 ;;|"XYZ"|MOT3|
 ;;|"""0"|QUOTE0.|
 ;;|"""8"|QUOTE8.|
 ;;

