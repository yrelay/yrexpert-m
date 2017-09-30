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

;LKEX2^INT^1^59547,74867^0
LKEX2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EX(NIV,INC,X,Y,IND,MODE,NUM,LOCAL) 
 N I,PAR,PROT,PARAM,TEMP,ORDRE,ER,FLAG,VAL,PNOM
 S TEMP="^TEMPORAI($J,""LKEX"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 F I="PROT" S @I=@PAR@(I)
 S FLAG=1
 
 
 Q $$V
 
 
V() 
 S PARAM=""
 F I=0:0 S PARAM=$O(@PAR@(NIV,INC,PARAM)) Q:PARAM=""  S ORDRE="" D T
 S INC="*"
 S PARAM=""
 F I=0:0 S PARAM=$O(@PAR@(NIV,INC,PARAM)) Q:PARAM=""  S ORDRE="" D T
 Q 0
T 
 S ORDRE=$O(@PAR@(NIV,INC,PARAM,ORDRE))
 I ORDRE="" Q
 
 I PARAM["%",NUM'=1 Q
 
 I $D(@PAR@(NIV,INC,PARAM,ORDRE,"E")),@PAR@(NIV,INC,PARAM,ORDRE,"E")'=NUM G T
 N I,OR,VAL
 S ER=$$TR(PARAM,ORDRE,X,.VAL,"T",.FLAG)
 I '(FLAG) Q
 I ($D(VAL)#10)=1,VAL'="" S @Y@(IND,PARAM,ORDRE)=VAL
 S OR=""
 F I=0:0 S OR=$O(VAL(OR)) Q:OR=""  S @Y@(IND,PARAM,OR)=VAL(OR)
 S IND=IND+1
 G T
 
 
TR(P,ORD,V,V1,M,F) 
 I $D(@PAR@(NIV,INC,P,ORD,M))<9 S F=0 Q 0
 N ITR,TR,J,ER,FLAG,OR
 S ITR="",FLAG=1
 F J=1:1 S ITR=$O(@PAR@(NIV,INC,P,ORD,M,ITR)) Q:(ITR="")!(FLAG=0)  S @($$CONCAT^%QZCHAD("ER=$$"_@PAR@(NIV,INC,P,ORD,M,ITR),".V"))
 I FLAG=0 S F=0 Q ER
 I J>1 S F=1,V1=V,OR="" F J=0:0 S OR=$O(V(OR)) Q:OR=""  S V1(OR)=V(OR)
 Q ER

