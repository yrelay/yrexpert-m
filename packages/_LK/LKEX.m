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

;LKEX^INT^1^59547,74867^0
LKEX ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INIT(PROT,EXT) 
 N I,TEMP,PAR,ER
 S TEMP="^TEMPORAI($J,""LKEX"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 K @(TEMP)
 F I="PROT" S @PAR@(I)=@I
 I PROT'="" D ^LKTXTN(PROT,PAR)
 I EXT'="" D ADR^%QCAGLC($E(EXT,1,$L(EXT)-1),$E(PAR,1,$L(PAR)-1))
 Q 0
 
FIN() N TEMP S TEMP="^TEMPORAI($J,""LKEX"")" K @(TEMP) Q 0
 
EX(NIV,INC,X,Y,IND,MODE,LOCAL) 
 N I,PAR,PROT,PARAM,TEMP,ORDRE,ER,FLAG,VAL,PNOM
 S TEMP="^TEMPORAI($J,""LKEX"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 F I="PROT" S @I=@PAR@(I)
 S ORDRE=1,FLAG=1
 I MODE["PV" Q $$PV
 I (MODE["LIEN")!(MODE["ATT") Q $$ATT^LKEXATT(MODE,X)
 Q $$V
 
PV() S (FLAG,FLAG1,FLAG2)=0
 S ER=$$TR("*",X,.PNOM,"PT",.FLAG)
 I PNOM="" Q 0
 
 I $D(@EXTERNE@("MARQUE")),PNOM=@EXTERNE@("MARQUE") S @Y@(IND,"%MARQUE",ORDRE)="***MARQUE***",IND=IND+1
 S:FLAG ER=$$TR("*",X,.VAL,"T",.FLAG1)
 S:FLAG&FLAG1 ER=$$TR(PNOM,VAL,.VAL,"T",.FLAG2)
 S:FLAG&FLAG1 @Y@(IND,PNOM,ORDRE)=VAL,IND=IND+1
 I $D(DEBUG),DEBUG=1 W !,"IND ",IND," PNOM ",PNOM," X ",@Y@(IND-1,PNOM,ORDRE)," FLAG ",FLAG&FLAG1
 Q 0
 
V() S PARAM=$O(@PAR@(NIV,INC,""))
 F I=0:0 Q:PARAM=""  D T S PARAM=$O(@PAR@(NIV,INC,PARAM)),IND=IND+1
 S INC="*"
 S PARAM=$O(@PAR@(NIV,"*",""))
 F I=0:0 Q:PARAM=""  D T S PARAM=$O(@PAR@(NIV,"*",PARAM)),IND=IND+1
 Q 0
T N I,OR,VAL
 S ER=$$TR(PARAM,X,.VAL,"T",.FLAG)
 I '(FLAG) Q
 I ($D(VAL)#10)=1,VAL'="" S @Y@(IND,PARAM,ORDRE)=VAL
 S OR=$O(VAL(""))
 F I=0:0 Q:OR=""  S @Y@(IND,PARAM,OR)=VAL(OR),OR=$O(VAL(OR))
 I $D(DEBUG),DEBUG=1 W !,"IND ",IND," PARAM ",PARAM," X ",@Y@(IND,PARAM,ORDRE)," FLAG ",FLAG
 Q
 
TR(P,V,V1,M,F) I $D(@PAR@(NIV,INC,P,M))<9 S F=0 Q 0
 N ITR,TR,J,ER,FLAG,OR S ITR=$O(@PAR@(NIV,INC,P,M,"")),FLAG=1
 F J=1:1 Q:(ITR="")!(FLAG=0)  S @($$CONCAT^%QZCHAD("ER=$$"_@PAR@(NIV,INC,P,M,ITR),".V")),ITR=$O(@PAR@(NIV,INC,P,M,ITR))
 I FLAG=0 S F=0 Q ER
 I J>1 S F=1,V1=V,OR=$O(V("")) F J=0:0 Q:OR=""  S V1(OR)=V(OR),OR=$O(V(OR))
 Q ER
 
 
 
EXT(X) S X=$E(X,@PAR@(NIV,INC,P,"D"),@PAR@(NIV,INC,P,"F")) Q 0
 
EXTP(X) S X=$E(X,@PAR@(NIV,INC,P,"PD"),@PAR@(NIV,INC,P,"PF")) Q 0
 
NUM(X) S X=X+0 Q 0
 
NUM2(X) I X'="" S X=X+0
 Q 0
 
EPACK(X) Q $$^LKPACK($L(X),X,.X)
 
ALPHA(X) N I
 F I=$L(X):-1:0 Q:$E(X,I)'=" "
 S X=$E(X,1,I) F I=1:1:$L(X) Q:$E(X,I)'=" "
 S X=$E(X,I,$L(X))
 Q 0
 
TEST W !,"INIT ",$$INIT("TOTO^LKEX") S INDEX=1
 W !,"EX ",$$EX(0,0,"T1  TOTO 1234.00","^TOTO($J)",.INDEX)
 W !,"FIN ",$$FIN,"  INDEX ",INDEX
TOTO ;;|0,0,"PARAM1","D"|1|
 ;;|0,0,"PARAM1","F"|2|
 ;;|0,0,"PARAM1","T",1|EXT|
 ;;|0,0,"PARAM2","D"|5|
 ;;|0,0,"PARAM2","F"|8|
 ;;|0,0,"PARAM2","T",1|EXT|
 ;;|0,0,"PARAM3","D"|10|
 ;;|0,0,"PARAM3","F"|16|
 ;;|0,0,"PARAM3","T",1|EXT|
 ;;|0,0,"PARAM3","T",2|NUM|
 ;;

