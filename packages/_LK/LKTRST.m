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

;LKTRST^INT^1^59547,74867^0
LKTRST(D,F) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,J,K,L,ER,INDEX,NIV,INC,TAB,CLE,DEST,NPAR,TEMP,S,PCLE,P,VAL,PAR1,TRANS
 S TEMP="^TEMPORAI($J,""LKTRST"")"
 S TRANS=$$EX^LKZ(TEMP)_",""TRANS"")"
 S PAR1=$$EX^LKZ(TEMP)_",""PAR"")"
 S ER=$$INIT^LKTRST(@PAR@("LKTRST"))
 Q:ER ER
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 Q:ER ER
 S INDEX=$O(@DATAS@(D))
 F I=1:1 Q:(INDEX=F)!(INDEX="")  D TI S INDEX=$O(@DATAS@(INDEX))
 S ER=$$FIN^LKZPAR(TEMP)
 S ER=$$FIN^LKTRST
 Q ER
TI N PARAM S PARAM=$O(@DATAS@(INDEX,""))
 F J=1:1 Q:PARAM=""  D TJ S PARAM=$O(@DATAS@(INDEX,PARAM))
 Q
TJ N ORDRE S ORDRE=$O(@DATAS@(INDEX,PARAM,""))
 F K=1:1 Q:ORDRE=""  D T S ORDRE=$O(@DATAS@(INDEX,PARAM,ORDRE))
 Q
T S ER=$$EDGE^LKZPAR(TEMP,PARAM)
 S ER=$$INC^LKZPAR(TEMP)
 S NIV=$$NIV^LKZPAR(TEMP),INC=$$I^LKZPAR(TEMP)
 S ER=$$STO^LKZPAR(TEMP,PARAM,ORDRE,@DATAS@(INDEX,PARAM,ORDRE))
 I $D(@TRANS@(NIV,INC,PARAM))<9 Q
 S TAB=@TRANS@(NIV,INC,PARAM,"TAB")
 S PCLE=$$CONCAT^LKZ(TRANS,$$S^LKZ(NIV_","_INC_","_PARAM_",PARAMETRE"))
 D PCLE
 S NPAR=$$CONCAT^LKZ(TRANS,$$S^LKZ(NIV_","_INC_","_PARAM_",NPAR"))
 S DEST=$$CONCAT^LKZ(DATAD,INDEX)
 S ER=$$TRANSP^LKTRANS(TAB,CLE,DEST,NPAR)
 Q
PCLE S P=$O(@PCLE@("")),CLE=""
 N I F I=1:1 Q:P=""  S:$$LOA^LKZPAR(TEMP,@PCLE@(P),ORDRE,.VAL)=0 CLE=CLE_","_VAL S P=$O(@PCLE@(P))
 S CLE=$E(CLE,2,$L(CLE))
 Q
 
INIT(PROT) 
 N I,TEMP,PAR,ER,TRANS
 S TEMP="^TEMPORAI($J,""LKTRST"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 S TRANS=$$EX^LKZ(TEMP)_",""TRANS"")"
 K @(TEMP)
 F I="PROT" S @PAR@(I)=@I
 D ^LKTXTN(PROT,TRANS)
 Q 0
 
FIN() N TEMP S TEMP="^TEMPORAI($J,""LKTRST"")" K @(TEMP) Q 0
 
TEST S NIV=1,PARAM="TOTO.TITI"
 S S=NIV_","_0_","_PARAM_",PARAMETRE",A=",",B=""","""
 W !,$$S^LKZ(S)
 Q
 ;

