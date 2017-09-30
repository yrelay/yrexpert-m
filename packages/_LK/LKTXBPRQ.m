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

;LKTXBPRQ^INT^1^59547,74868^0
LKTXBPRQ(PAR,TABATT,D,F) 
 
 
 
 
 
 
 
 
 
 
 D MSG^%VZEATT("ecriture dans dkbms en cours ...")
 N I,J,K,L,ER,INDEX,NIV,INC,TAB,CLE,DEST,NPAR,TEMP,S,PCLE,P,VAL,PAR1
 N TRANS,ATT,ATT1,ATTN,TOTER,STO,NPARAM,PILE,CREA,RF,RFI,NBR
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
 
STU() N NOM,ER,II,PARA,VAL,ARTI,ARTI,PERE,NIVP,NIVA,VISU,RF,RFI
 S ARTI=$$ART^LKTXBPRQ,ARTI=$$ARTI^LKTXBPRQ,VISU=1
 S RF=$$RFILS,RFI=$$RFILSI
 S ER=$$LOA^LKZPAR(TEMP,"NOM",1,.NOM)
 ;;S ER=$$LOA^LKZPAR(TEMP,"NIVEAU.RELATIF",1,.NIVA)
 ;;I (NIVA+0=NIVA)&(NIVA'=0) Q $$STU1
 
 S PERE=^[QUI]RQSDON("LKBRP","ENTITE")
 D PA^%QSGESTI(ARTI,PERE,"NOM",PERE,1)
 D PA^%QSGESTI(ARTI,PERE,"DATE.RECUPERATION",$$TEMPSNO^%QMDATE(DD),1)
 S NIVA=0
 S @PILE@(NIVA)=NOM
 
 S DX=40,DY=12 X XY S NBR=$S('($D(NBR)):1,1:NBR+1) W NBR
 Q $$STU2
 
STU1() S PERE=@PILE@(NIVA-1)
 S @PILE@(NIVA)=NOM
 
 
 Q $$STU2
STU2() N RLIEN
 
 
 I PERE'="" S NOML=$$NOML1^%QSGES20(PERE,NOM,$$LIEN^LKTXBPRQ,NOM) I NOML="" S NOML=$$NOML^%QSGES20(PERE,NOM,$$LIEN^LKTXBPRQ,NOM) I 1!('($$IR^%QSGEST5($$RLIEN^LKTXBPRQ,NOML))) D ADDS^%QSGEST3(ARTI,PERE,$$LIEN^LKTXBPRQ,ARTI,NOM)
 S RLIEN=$$RLIEN^LKTXBPRQ
 S PARA=$O(@ATT@(NIV,INC,"")),CREA=0
 F II=1:1 Q:PARA=""  D STU11 S PARA=$O(@ATT@(NIV,INC,PARA)),CREA=0
 D PA^%QSGESTI(ARTI,NOM,"DATE.RECUPERATION",$$TEMPSNO^%QMDATE(DD),1)
 D PA^%QSGESTI(ARTI,NOM,"NOM",NOM,1)
 Q 0
STU11 N LIEN,NOML,ORD,COMP
 S ER=$$LOA^LKZPAR(TEMP,PARA,1,.VAL)
 S ER=$$LOA^LKZPAR(TEMP,"REPERE.CIRCUIT.IMPRIME",1,.COMP)
 
 I '(CREA) D ADDO^%QSGEST3(ARTI,PERE,COMP,RF,RFI,COMP),PA^%QSGESTI(RFI,PERE_","_COMP,"NOM",COMP,1),PA^%QSGESTI(RFI,PERE_","_COMP,"NOM.COMPOSANT",NOM,1)
 I (ER'=0)!(PARA=NOM) Q
 S LIEN=0
 S:($D(@ATT1@(NIV,INC,PARA,"INFO","LIEN"))#10)=1 LIEN=$S(@ATT1@(NIV,INC,PARA,"INFO","LIEN")=0:0,1:1)
 
 I LIEN=0 D PA^%QSGESTI(ARTI,NOM,PARA,VAL,1) Q
 
 
 S NOML=$$NOML1^%QSGES20(PERE,NOM,$$LIEN^LKTXBPRQ,NOM) I NOML="" S NOML=$$NOML^%QSGES20(PERE,NOM,$$LIEN^LKTXBPRQ,NOM) I 1!('($$IR^%QSGEST5($$RLIEN^LKTXBPRQ,NOML))) D ADDS^%QSGEST3(ARTI,PERE,$$LIEN^LKTXBPRQ,ARTI,NOM)
 
 I PARA="REPERE.CIRCUIT.IMPRIME" G STU12
 D PA^%QSGESTI(RFI,PERE_","_COMP,PARA,VAL,1)
 Q
 
STU12 D PA^%QSGESTI(RLIEN,NOML,"QUANTITE",1+$$^%QSCALVA(RLIEN,NOML,"QUANTITE"),1)
 
 Q
 
ART() 
 Q ^[QUI]RQSDON("LKBRP","REPERTOIRE.NOMENCLATURE")
ARTI() 
 Q $$NOMINT^%QSF($$ART)
LIEN() 
 Q ^[QUI]RQSDON("LKBRP","LIEN.NOMENCLATURE")
RLIEN() 
 Q $$LIENI^%QSGEL3
 
RFILS() 
 Q ^[QUI]RQSDON("LKBRP","REPERTOIRE.REPERE")
RFILSI() 
 Q $$NOMINT^%QSF($$RFILS)
 
NEXT(PARA) 
 N ORDS,NORD,VALS S NORD="",VALS="",ORDS=0
 F I=0:0 S NORD=$$NXTRIAO^%QSTRUC8(RLIEN,NOML,PARA,NORD) Q:NORD=""  S ORDS=NORD
 Q ORDS+1

