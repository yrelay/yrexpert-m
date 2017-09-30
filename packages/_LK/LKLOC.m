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

;LKLOC^INT^1^59547,74867^0
LKLOC(D,F,INDEX) 
 
 
 
 
 
 
 
 N I,ER,BLK,TEMP1,PILE
 S TEMP1=$$CONCAS^%QZCHAD("^TEMPORAI",$J_","_$P($ZPOS,"^",2))
 S PILE=$$CONCAS^%QZCHAD(TEMP1,"PILE")
 K @(TEMP1)
 D INITFI^%QCASTA(PILE)
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 Q:ER ER
 S ER=$$INIT^LKEX(@PAR@("LKEX"))
 Q:ER ER
 S MODE=$$^%QCAZG($$CONCAS^%QZCHAD(PAR,"MODE"))
 S BLK=$O(@DATAS@(1,D))
 F I=1:1 Q:(BLK=F)!(BLK="")  D T(@DATAS@(1,BLK),$$NEXT(BLK)) S BLK=$O(@DATAS@(1,BLK)) I (BLK#10)=0 W !,BLK
 D CURON^%VVIDEO
 S ER=$$FIN^LKZPAR(TEMP)
 S ER=$$FIN^LKEX
 K @(TEMP1)
 Q ER
T(X,Y) N NIV,I
 S ER=$$EDGE^LKZPAR(TEMP,X,Y)
 S ER=$$INC^LKZPAR(TEMP)
 S NIV=$$NIV^LKZPAR(TEMP)
 W !,NIV,"  ",X
 I NIV=0 Q
 I NIV=1 D PUSH^%QCASTA(PILE,X) Q
 I NIV=2 D T2 Q
 Q
T2 N I,DATADES,INDEX1,NDUP,DATADES1
 S INDEX1=1
 S NDUP=$$INDICE^%QCASTA(PILE)
 S DATADES(0,"TEMPS.EXECUTION.POINCONNAGE",0)=DATADES(0,"TEMPS.EXECUTION.POINCONNAGE",0)/NDUP
 S DATADES(0,"TEMPS.MANUTENTION.POINCONNAGE",0)=DATADES(0,"TEMPS.MANUTENTION.POINCONNAGE",0)/NDUP
 S ER=$$EX^LKEX($$NIV^LKZPAR(TEMP),$$I^LKZPAR(TEMP),X,"DATADES",.INDEX1,MODE)
 F I=1:1 Q:$$PILEVIDE^%QCASTA(PILE)  D T3
 Q
T3 N X
 S X=$$POP^%QCASTA(PILE)
 S INDEX=$ZP(@DATAD@(""))+1
 S ER=$$EX^LKEX(1,1,X,"DATADES1",.INDEX,MODE)
 D COPY("DATADES1",DATAD)
 D COPY("DATADES",DATAD)
 S INDEX=$ZP(@DATAD@(""))+1
 Q
COPY(S,D) 
 N I,J,K,BLK,PARAM,ORDRE
 S BLK=$O(@S@(""))
 F I=0:0 Q:BLK=""  D CO1 S BLK=$O(@S@(BLK))
 Q
CO1 S PARAM=$O(@S@(BLK,""))
 F J=0:0 Q:PARAM=""  D CO2 S PARAM=$O(@S@(BLK,PARAM))
 Q
CO2 S ORDRE=$O(@S@(BLK,PARAM,""))
 F K=0:0 Q:ORDRE=""  D CO3 S ORDRE=$O(@S@(BLK,PARAM,ORDRE))
 Q
CO3 S @D@($ZP(@D@(""))+1,PARAM,ORDRE)=@S@(BLK,PARAM,ORDRE)
 W !,BLK,"  ",PARAM,"  ",@S@(BLK,PARAM,ORDRE)
 Q
 
NEXT(B) N V S V=$O(@DATAS@(1,B)) Q:V="" ""
 S V=@DATAS@(1,V) Q V
 
 
TEST K ^[QUI]LK("CIAT.AMADA","A2","D")
 S ER=$$^LKLO("CIAT.AMADA","A1","D","CIAT.AMADA","A2","D","LOCAMA","AMA^LKTXCPP2","","","")
 Q

