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

;LKTXAVRR^INT^1^59547,74868^0
LKTXAVRQ(PAR,TABATT,D,F) 
 
 
 
 
 
 
 
 
 
 
 
 N I,J,K,L,ER,INDEX,NIV,INC,TAB,CLE,DEST,NPAR,TEMP,S,PCLE,P,VAL,PAR1
 N TRANS,ATT,ATT1,ATTN,TOTER,STO
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S TRANS=$$EX^LKZ(TEMP)_",""TRANS"")"
 S PAR1=$$EX^LKZ(TEMP)_",""PAR"")"
 S ATT=$$CONCAS^LKZ(TEMP,"ATT")
 D ^LKTXTN(@TABATT,ATT)
 S STO=@PAR@("STO")
 S ATT1=$O(@ATT@(0,0,"")),ATTN=$ZP(@ATT@(0,0,"")),TOTER=0
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 S INDEX=$O(@DATAS@(D))
 F I=1:1 Q:(INDEX=F)!(INDEX="")  D TI S INDEX=$O(@DATAS@(INDEX))
 S ER=$$FIN^LKZPAR(TEMP)
 Q ER
TI N PARAM S PARAM=$O(@DATAS@(INDEX,""))
 F J=1:1 Q:PARAM=""  D TJ S PARAM=$O(@DATAS@(INDEX,PARAM))
 Q
TJ N ORDRE S ORDRE=$O(@DATAS@(INDEX,PARAM,""))
 F K=1:1 Q:ORDRE=""  D T S ORDRE=$O(@DATAS@(INDEX,PARAM,ORDRE))
 Q
T S ER=$$EDGE^LKZPAR(TEMP,PARAM,PARAM)
 S ER=$$INC^LKZPAR(TEMP)
 S NIV=$$NIV^LKZPAR(TEMP),INC=$$I^LKZPAR(TEMP)
 S ER=$$STO^LKZPAR(TEMP,PARAM,ORDRE,@DATAS@(INDEX,PARAM,ORDRE))
 I PARAM=ATTN S ER=$$STO I ER=1 S TOTER=TOTER+1,DX=10,DY=11 X XY W TOTER
 Q
STO() N ARC,ER,GLO,II,PARA,AVEX,VAL
 S ER=$$LOA^LKZPAR(TEMP,"ARC",1,.ARC)
 Q:$$IR^%QSGEST5("P0",ARC)=0 1
 S ER=$$LOA^LKZPAR(TEMP,"AVIS.EXPEDITION",1,.AVEX)
 Q:AVEX="" 1
 I $$IR^%QSGEST5("EXPEDITION",AVEX)=1 D SUPS^%QSGEST3("EXPEDITION",AVEX,"P0",ARC)
 D ADDS^%QSGEST3("EXPEDITION",AVEX,"P0",ARC)
 S PARA=$O(@ATT@(0,0,""))
 F II=1:1 Q:PARA=""  D ST1 S PARA=$O(@ATT@(0,0,PARA))
 D PA^%QSGESTI("EXPEDITION",AVEX,"DATE.RECUPERATION.AVEX",$$TEMPSNO^%QMDATE(DD),1)
 D PA^%QSGESTI("EXPEDITION",AVEX,"NOM",AVEX,1)
 S (DX,DY)=10 X XY W II," ",INDEX,"  ",AVEX," ARC ",ARC
 Q 0
ST1 S ER=$$LOA^LKZPAR(TEMP,PARA,1,.VAL)
 D:(ER=0)&(PARA'="ARC") PA^%QSGESTI("EXPEDITION",AVEX,PARA,VAL,1)
 Q
TEST D ^LKTXAVRQ("","")
 Q

