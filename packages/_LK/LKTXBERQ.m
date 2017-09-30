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

;LKTXBERQ^INT^1^59547,74868^0
LKTXBERQ(PAR,TABATT,D,F) 
 
 
 
 
 
 
 
 
 
 
 N I,J,K,L,ER,INDEX,NIV,INC,TAB,CLE,DEST,NPAR,TEMP,S,PCLE,P,VAL,PAR1
 N TRANS,ATT,ATT1,ATTN,TOTER,STO,NPARAM
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S TRANS=$$EX^LKZ(TEMP)_",""TRANS"")"
 S PAR1=$$EX^LKZ(TEMP)_",""PAR"")"
 
 
 
 S TOTER=0
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 S ATT=$$TAB^LKZPAR(TEMP)
 S INDEX=$O(@DATAS@(D))
 F I=1:1 Q:(INDEX=F)!(INDEX="")  D TI S INDEX=$O(@DATAS@(INDEX))
 S ER=$$FIN^LKZPAR(TEMP)
 Q ER
TI N PARAM S PARAM=$O(@DATAS@(INDEX,"")),PARAM1=$$PARAM1^LKZ2(DATAS,INDEX,PARAM)
 F J=1:1 Q:PARAM=""  D TJ S PARAM=$O(@DATAS@(INDEX,PARAM)),PARAM1=$$PARAM1^LKZ2(DATAS,INDEX,PARAM)
 Q
TJ N ORDRE S ORDRE=$O(@DATAS@(INDEX,PARAM,""))
 F K=1:1 Q:ORDRE=""  D T S ORDRE=$O(@DATAS@(INDEX,PARAM,ORDRE))
 Q
T S ER=$$EDGE^LKZPAR(TEMP,PARAM,PARAM1)
 S ER=$$INC^LKZPAR(TEMP)
 S NIV=$$NIV^LKZPAR(TEMP),INC=$$I^LKZPAR(TEMP)
 S ER=$$STO^LKZPAR(TEMP,PARAM,ORDRE,@DATAS@(INDEX,PARAM,ORDRE))
 S:$$LAST^LKZPAR(TEMP) ER=$$STO(NIV) I ER=1 S TOTER=TOTER+1,DX=10,DY=11 X XY W TOTER
 S ER=$$EDGF^LKZPAR(TEMP)
 Q
STO(NIV) N IND,ER,II,PARA,VAL,BPERE,NPERE,BFILS,NFILS,NFILSE
 S ER=$$LOA^LKZPAR(TEMP,"NOM",1,.NOM)
 I NIV=2 G STOK
 
 S BPERE=$$RA
 S NPERE=NOM
 S BFILS=$$RG
 S NFILSE=NOM
 S NFILS=$$NOMFILS^%QSGES10(BPERE,NPERE,BFILS,NFILSE)
 D SX^%QSGESTI(BPERE,NPERE)
 D PA^%QSGESTI(BPERE,NPERE,"NOM",NPERE,1)
 D PA^%QSGESTI(BPERE,NPERE,"ENTREPRISE",$$ENT,1)
 D ADDO^%QSGEST3(BPERE,NPERE,1,$$AG,BFILS,NFILSE)
 D STODK(BPERE,NPERE,BFILS,NFILS,NFILSE,ATT,NIV,INC)
 S @LOCAL@("VT","GAMME")=NFILS
 S @LOCAL@("VT","ARTICLE")=NPERE
 Q 0
STOK 
 N ER,ORDRE
 S ER=$$LOA^LKZPAR(TEMP,"NUMERO.OPERATION",1,.ORDRE)
 S NOM=NOM_"/"_ORDRE_".001"
 S BPERE=$$RG
 S NPERE=$$GAM
 S BFILS=$$RO
 S NFILSE=NOM
 S NFILS=$$NOMFILS^%QSGES10(BPERE,NPERE,BFILS,NFILSE)
 D SX^%QSGESTI(BFILS,NFILS)
 Q:ER 1
 D PA^%QSGESTI(BFILS,NFILS,"NOM",NFILSE,1)
 D ADDO^%QSGEST3(BPERE,NPERE,ORDRE_".001",$$GO,BFILS,NFILSE)
 D STODK(BPERE,NPERE,BFILS,NFILS,NFILSE,ATT,NIV,INC)
 Q 0
 
STODK(BPERE,NPERE,BFILS,NFILS,NFILSE,ATT,NIV,INC) 
 N PARA,ER,II,VAL
 S PARA=$O(@ATT@(NIV,INC,""))
 F II=1:1 Q:PARA=""  D ST1 S PARA=$O(@ATT@(NIV,INC,PARA))
 D PA^%QSGESTI(BFILS,NFILS,"DATE.RECUPERATION."_$$ENT,$$TEMPSNO^%QMDATE(DD),1)
 D PA^%QSGESTI(BFILS,NFILS,"NOM",NFILSE,1)
 S (DX,DY)=10 X XY W II," ",INDEX," IND ",$J(NFILS,50)
 Q
ST1 N VAL
 S ER=$$LOAMV^LKZPAR(TEMP,PARA,.VAL)
 D:((ER=0)&(PARA'="%G"))&(PARA'="%O") MVS^%QSCALVA(BFILS,NFILS,PARA,"VAL")
 Q
 
RG() Q @LOCAL@("REP","GAMME")
RO() Q @LOCAL@("REP","OPERATION")
RA() Q @LOCAL@("REP","ARTICLE")
GO() Q @LOCAL@("REP","GO")
AG() Q @LOCAL@("REP","AG")
 
ENT() Q @LOCAL@("VT","ENT")
ART() Q @LOCAL@("VT","ARTICLE")
GAM() Q @LOCAL@("VT","GAMME")
 ;

