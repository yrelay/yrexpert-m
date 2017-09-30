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

;LKTXELRQ^INT^1^59547,74868^0
LKTXELRQ(PAR,TABATT,D,F) 
 
 
 
 
 
 
 
 
 
 
 N I,J,K,L,ER,INDEX,NIV,INC,TAB,CLE,DEST,NPAR,TEMP,S,PCLE,P,VAL,PAR1
 N TRANS,ATT,ATT1,ATTN,TOTER,STO,NPARAM,PILE
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S TRANS=$$EX^LKZ(TEMP)_",""TRANS"")"
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S PAR1=$$EX^LKZ(TEMP)_",""PAR"")"
 K @(TEMP)
 D INITFI^%QCASTA(PILE)
 S ATT1=$$CONCAS^LKZ(TEMP,"ATT1")
 D ^LKTXTN(@TABATT,ATT1)
 
 S TOTER=0
 S ER=$$INIT^LKZPAR(TEMP,@PAR@("LKZPAR"))
 S ATT=$$TAB^LKZPAR(TEMP)
 S INDEX=$O(@DATAS@(D))
 F I=1:1 Q:(INDEX=F)!(INDEX="")  D TI S INDEX=$O(@DATAS@(INDEX))
 S ER=$$FIN^LKZPAR(TEMP)
 K @(TEMP)
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
 S:$$LAST^LKZPAR(TEMP) ER=$$STU I ER=1 S TOTER=TOTER+1,DX=10,DY=11 X XY W TOTER
 S ER=$$EDGF^LKZPAR(TEMP)
 Q
 
STO() N NOM,ER,II,PARA,VAL,SE,SEI,PERE,NIVP,NIVA,VISU
 S SE=$$SE^NFPRIM,SEI=$$SEI^NFPRIM,VISU=1
 S ER=$$LOA^LKZPAR(TEMP,"NOM",1,.NOM)
 S ER=$$LOA^LKZPAR(TEMP,"NIVEAU.RELATIF",1,.NIVA)
 I ((NIVA+0)=NIVA)&(NIVA'=0) Q $$STO1
 
 S PERE=""
 S NIVA=0
 S @PILE@(NIVA)=NOM
 I VISU W !,NIVA," ",NIV,?(5*NIVA)+4,NOM
 Q $$STO2
 
STO1() S PERE=@PILE@(NIVA-1)
 S @PILE@(NIVA)=NOM
 I VISU W !,NIVA," ",NIV,?(5*NIVA)+4,NOM
 
 Q $$STO2
STO2() 
 
 
 I PERE'="" S NOML=$$NOML^NFPRIM(PERE,NOM) I '($$IR^%QSGEST5(SEI,NOML)) D LIER^NFPRIM(PERE,NOM,NOM)
 S PARA=$O(@ATT@(NIV,INC,""))
 F II=1:1 Q:PARA=""  D ST1 S PARA=$O(@ATT@(NIV,INC,PARA))
 D PA^%QSGESTI(SE,NOM,"DATE.RECUPERATION.ELC",$$TEMPSNO^%QMDATE(DD),1)
 D PA^%QSGESTI(SE,NOM,"NOM",NOM,1)
 Q 0
ST1 N LIEN,NOML
 S ER=$$LOA^LKZPAR(TEMP,PARA,1,.VAL)
 I (ER'=0)!(PARA=NOM) Q
 S LIEN=0
 S:($D(@ATT1@(NIV,INC,PARA,"INFO","LIEN"))#10)=1 LIEN=$S(@ATT1@(NIV,INC,PARA,"INFO","LIEN")=0:0,1:1)
 I VISU W ! W:LIEN "LIEN  " W PARA,?40,VAL
 I LIEN=0 D PA^%QSGESTI(SE,NOM,PARA,VAL,1) Q
 
 S NOML=$$NOML^NFPRIM(PERE,NOM)
 I PARA'="QUANTITE" D PA^%QSGESTI(SEI,NOML,PARA,VAL,1) Q
 
 D PA^%QSGESTI(SEI,NOML,PARA,VAL+$$^%QSCALVA(SEI,NOML,PARA),1)
 I VISU W ! W:LIEN "LIEN  " W PARA,?40,$$^%QSCALVA(SEI,NOML,PARA)
 Q
 
SE() 
 Q "ELC.SOUS.ENSEMBLE"
SEI() 
 Q "ELC.SOUS.ENSEMBLE.INCLU"
 
STU() N NOM,ER,II,PARA,VAL,ARTI,ARTI,PERE,NIVP,NIVA,VISU
 S ARTI=$$ART^LKTXELRQ,ARTI=$$ARTI^LKTXELRQ,VISU=1
 S ER=$$LOA^LKZPAR(TEMP,"NOM",1,.NOM)
 S ER=$$LOA^LKZPAR(TEMP,"NIVEAU.RELATIF",1,.NIVA)
 I ((NIVA+0)=NIVA)&(NIVA'=0) Q $$STU1
 
 S PERE=""
 S NIVA=0
 S @PILE@(NIVA)=NOM
 I VISU W !,NIVA," ",NIV,?(5*NIVA)+4,NOM
 Q $$STU2
 
STU1() S PERE=@PILE@(NIVA-1)
 S @PILE@(NIVA)=NOM
 I VISU W !,NIVA," ",NIV,?(5*NIVA)+4,NOM
 
 Q $$STU2
STU2() N RLIEN
 
 I PERE'="" S NOML=$$NOML^%QSGES20(PERE,NOM,$$LIEN^LKTXELRQ,NOM) I 1!('($$IR^%QSGEST5($$RLIEN^LKTXELRQ,NOML))) D ADDS^%QSGEST3(ARTI,PERE,$$LIEN^LKTXELRQ,ARTI,NOM)
 S RLIEN=$$RLIEN^LKTXELRQ
 S PARA=$O(@ATT@(NIV,INC,""))
 F II=1:1 Q:PARA=""  D STU11 S PARA=$O(@ATT@(NIV,INC,PARA))
 D PA^%QSGESTI(ARTI,NOM,"DATE.RECUPERATION.ELC",$$TEMPSNO^%QMDATE(DD),1)
 D PA^%QSGESTI(ARTI,NOM,"NOM",NOM,1)
 Q 0
STU11 N LIEN,NOML
 S ER=$$LOA^LKZPAR(TEMP,PARA,1,.VAL)
 I (ER'=0)!(PARA=NOM) Q
 S LIEN=0
 S:($D(@ATT1@(NIV,INC,PARA,"INFO","LIEN"))#10)=1 LIEN=$S(@ATT1@(NIV,INC,PARA,"INFO","LIEN")=0:0,1:1)
 I VISU W ! W:LIEN "LIEN  " W PARA,?40,VAL
 I LIEN=0 D PA^%QSGESTI(ARTI,NOM,PARA,VAL,1) Q
 
 S NOML=$$NOML^%QSGES20(PERE,NOM,$$LIEN^LKTXELRQ,NOM)
 I PARA'="QUANTITE" D PA^%QSGESTI(RLIEN,NOML,PARA,VAL,1) Q
 
 D PA^%QSGESTI(RLIEN,NOML,PARA,VAL+$$^%QSCALVA(RLIEN,NOML,PARA),1)
 I VISU W ! W:LIEN "LIEN  " W PARA,?40,$$^%QSCALVA(RLIEN,NOML,PARA)
 Q
 
ART() 
 Q "ARTICLE"
ARTI() 
 Q "ARTICLE"
LIEN() 
 Q "COMPOSE.DE"
RLIEN() 
 Q $$LIENI^%QSGEL3
 ;

