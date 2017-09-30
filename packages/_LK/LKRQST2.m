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

;LKRQST2^INT^1^59547,74867^0
RQS(PAR,TABATT,D,F,EXTERNE) 
 
 
 
 
 
 
 
 
 
 N %I,ATT,ER,INC,INDIV,INDEX,NIV,ORDRE,PARAM,PARAM1,PAR1,TEMP,TRANS,TOTER,V
 S TEMP=$$CONCAS^LKZ("^TEMPORAI",$J_","_$P($ZPOS,"^",2))
 S TRANS=$$EX^LKZ(TEMP)_",""TRANS"")"
 S PAR1=$$EX^LKZ(TEMP)_",""PAR"")"
 S TOTER=0
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 S ATT=$$TAB^LKZPAR(TEMP)
 
 S INDIV=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INDIV") K @(INDIV)
 S INDEX=D
 F %IIJ=1:1 S INDEX=$O(@DATAS@(INDEX)) Q:(INDEX=F)!(INDEX="")  S PARAM="" D TI
 S ER=$$FIN^LKZPAR(TEMP)
 K @(INDIV)
 Q ER
 
TI S PARAM=$O(@DATAS@(INDEX,PARAM)) Q:PARAM=""
 D ^%VZEATT
 S PARAM1=$$PARAM1^LKZ2(DATAS,INDEX,PARAM)
 S ORDRE=""
TJ S ORDRE=$O(@DATAS@(INDEX,PARAM,ORDRE))
 G:ORDRE="" TI
 D TATR
 G TJ
TATR 
 S ER=$$EDGE^LKZPAR(TEMP,PARAM,PARAM1)
 S ER=$$INC^LKZPAR(TEMP)
 S NIV=$$NIV^LKZPAR(TEMP),INC=$$I^LKZPAR(TEMP)
 S V=@DATAS@(INDEX,PARAM,ORDRE)
 I '($D(@EXTERNE@("LKEX",NIV,INC,PARAM,ORDRE,"D"))) G TS
 
 S V=$$^%QMDAINT(V,@EXTERNE@("LKEX",NIV,INC,PARAM,ORDRE,"F"))
TS 
 S ER=$$STO^LKZPAR(TEMP,PARAM,ORDRE,V)
 
 I $$LAST^LKZPAR(TEMP) S ER=$$STO
 I ER=1 S TOTER=TOTER+1,DX=10,DY=11 X XY W TOTER_$$^%QZCHW(" erreur(s) lors du stockage")
 S ER=$$EDGF^LKZPAR(TEMP)
 Q
 
STO() N BASE,BASEL,CH,ER,GLO,IND,INDL,II,MSG,ORDRE,OR,PARA,CHEMPR,VAL
 N EREP,NCLE,LIEN,BASEC,BASEP
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
 S BASE=$$BASE
 S EREP=$$NOMLOG^%QSF(BASE)
 
 S ER=$$LOAMV^LKZPAR(TEMP,"NOM",.IND)
 
 Q:$D(IND)<10 1
 S OR=$O(IND("")),IND=IND(OR)
 S NCLE=^[QUI]RQSNCLES(BASE)
 
 I NCLE=1 G INDB
 
 S BASEC=BASE,CHEMPR="",OR=NCLE
PERE 
 D PEREFILS^%QSGEL2(BASEC,.BASEP,.LIEN)
 S LIEN=$$LIENI^%QSGEL2(BASEP,BASEC,LIEN,2)
 S CHEMPR=CHEMPR_LIEN
 I '($D(@ATT@(NIV,INC,"NOM~"_CHEMPR))) D MSG^%VZEATT($$^%QZCHW("L'un des ascendants de")_" "_IND_" "_$$^%QZCHW("ne peut etre cree")) G ERR
 S OR=OR-1
 S @GLO@("LIEN",OR,CHEMPR)=BASEP
 S BASEC=BASEP,(BASEP,LIEN)=""
 S CHEMPR=CHEMPR_"~"
 I OR'=1 G PERE
 
 D MSG^%VZEATT($$^%QZCHW("Creation des ascendants"))
 
 S OR="",MSG=0
 F II=0:0 S OR=$O(@GLO@("LIEN",OR)) Q:OR=""  S PARA=$O(@GLO@("LIEN",OR,"")) I $$CRPER^LKRQST3(PARA,OR,@GLO@("LIEN",OR,PARA))=1 S MSG=1 Q
 D POCLEPA^%VVIDEO
 I MSG=1 G ERR
 K @GLO@("LIEN")
 
INDB 
 
 I NCLE'=1 S IND=@GLO@("PERE",NCLE-1)_","_IND
 S MSG=EREP_" "_IND
 S DX=0,DY=10 D CLEBAS^%VVIDEO X XY W $E(MSG,1,RM-2)
 
 I $D(@INDIV@(IND)) G LIEN
 S ER=$$LOAMV^LKZPAR(TEMP,"ORDRE",.ORDRE)
 G:$$IR^%QSGE5(BASE,IND) PAS
 D MSG^%VZEATT($$^%QZCHW("Creation de")_" "_IND_" "_$$^%QZCHW("dans le repertoire")_" "_EREP)
 S OR=$O(ORDRE(""))
 I OR="" S ORDRE=""
 I OR'="" S ORDRE=ORDRE(OR)
 
 S OR=$$CREPER^%QSGEIND(BASE,IND,ORDRE,.MSG)
 D POCLEPA^%VVIDEO
 I OR D MSG^%VZEATT(MSG) Q 1
PAS D PA^%QSGESTI(BASE,IND,"DATE.RECUPERATION.PASSERELLE",$$TEMPSNO^%QMDATE(DD),1)
 S @INDIV@(IND)=""
 
 S PARA=""
 D MSG^%VZEATT($$^%QZCHW("Mise a jour des attributs"))
 S TEMPOPO=$$TEMP^%SGUTIL
 
 F II=1:1 S PARA=$O(@ATT@(NIV,INC,PARA)) Q:PARA=""  I PARA'["~" D STA
 
 D STOX
 D POCLEPA^%VVIDEO
LIEN 
 S @GLO@("IND",EREP,"IND")=IND
 S @GLO@("IND",EREP,"BASE")=BASE
 
 S PARA=""
 F II=0:0 S PARA=$O(@ATT@(NIV,INC,PARA)) Q:PARA=""  I PARA["~" S @GLO@("LIEN",EREP_"~"_$P(PARA,"~",2,99))=""
 
PARCL 
 S PARA="",MSG=0
 D MSG^%VZEATT($$^%QZCHW("Scrutation/Creation des individus lies"))
 F II=0:0 S PARA=$O(@GLO@("LIEN",PARA)) Q:PARA=""  I $$CREL^LKRQST3=1 S MSG=1 Q
 D POCLEPA^%VVIDEO
 I MSG=1 G ERR
 
 I $D(@GLO@("LIEN")) G PARCL
 
 D MSG^%VZEATT($$^%QZCHW("Mise a jour des attributs")_" "_$$^%QZCHW("pour les individus lies"))
 S PARA=""
 F II=0:0 S PARA=$O(@ATT@(NIV,INC,PARA)) Q:PARA=""  I PARA["~" D STL^LKRQST3
 D POCLEPA^%VVIDEO
 K @(GLO)
 Q 0
 
ERR 
 K @(GLO) Q 1
 
BASE() 
 Q @EXTERNE@("BASE")
 
 
 
STA 
 N ORD,%O
 Q:PARA="NOM"
 K VAL
 S ER=$$LOAMV^LKZPAR(TEMP,PARA,.VAL)
 I (ER=0)&(PARA'["%") S ORD="" F %O=0:0 S ORD=$O(VAL(ORD)) Q:ORD=""  S @TEMPOPO@(PARA,ORD)=VAL(ORD)
 Q
 
STOATT 
 N NECR,ORD,ATTX,INDX,VALX
 S PARA="",NECR=1
STOATT2 S PARA=$O(@TEMPOPO@(PARA))
 I PARA="" Q:NECR  S NECR=1,PARA="" G STOATT2
 S ORD=""
STOATT3 S ORD=$O(@TEMPOPO@(PARA,ORD)) G:ORD="" STOATT2
 S ORDX=ORD
 I $E(ORDX)'="@" S NECR=0 D PA^%QSGESTI(BASE,IND,PARA,@TEMPOPO@(PARA,ORD),ORD) K @TEMPOPO@(PARA,ORD) G STOATT3
 S ATTX=$P($E(ORDX,2,$L(ORDX)),"(")
 S INDX=$P(ORDX,"(",2,9999) S:INDX="" INDX=1
 S VALX=$$^%QSCALIN(BASE,IND,ATTX,INDX)
 G:VALX="" STOATT3
 S NECR=0 D PA^%QSGESTI(BASE,IND,PARA,@TEMPOPO@(PARA,ORD),VALX) K @TEMPOPO@(PARA,ORD) G STOATT3
 
STOX N NECR,ORD,ATTX,INDX,VALX,%P,%O
 S PARA="",NECR=1
STOX2 S PARA=$O(@TEMPOPO@(PARA))
 I PARA="" G:NECR ECR S NECR=1,PARA="" G STOX2
 S ORD=""
STOX3 S ORD=$O(@TEMPOPO@(PARA,ORD)) G:ORD="" STOX2 G:$E(ORD)'="@" STOX3
 S ATTX=$P($E(ORD,2,$L(ORD)),"(")
 S INDX=$P(ORD,"(",2,9999) S:INDX="" INDX=1
 I $D(@TEMPOPO@(ATTX,INDX)) S:@TEMPOPO@(ATTX,INDX)'="" @TEMPOPO@(PARA,@TEMPOPO@(ATTX,INDX))=@TEMPOPO@(PARA,ORD)
 S NECR=0
 K @TEMPOPO@(PARA,ORD)
 G STOX3
 
ECR 
 S PARA="" F %P=0:0 S PARA=$O(@TEMPOPO@(PARA)) Q:PARA=""  S ORD="" F %O=0:0 S ORD=$O(@TEMPOPO@(PARA,ORD)) Q:ORD=""  D:$E(ORD)'="@" PA^%QSGESTI(BASE,IND,PARA,@TEMPOPO@(PARA,ORD),ORD)
 Q

