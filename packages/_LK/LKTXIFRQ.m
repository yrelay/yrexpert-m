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

;LKTXIFRQ^INT^1^59547,74868^0
LKTXIFRQ(PAR,TABATT,D,F) 
 
 
 
 
 
 
 
 
 
 N I,J,K,L,ER,INDEX,NIV,INC,TAB,CLE,DEST,NPAR,TEMP,S,PCLE,P,VAL,PAR1
 N TRANS,ATT,ATT1,ATTN,TOTER,STO,REPN
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2)) K @(TEMP)
 S TRANS=$$EX^LKZ(TEMP)_",""TRANS"")"
 S PAR1=$$EX^LKZ(TEMP)_",""PAR"")"
 S ATT=$$CONCAS^LKZ(TEMP,"ATT")
 D ^LKTXTN(@TABATT,ATT)
 S RAG=$TR(@PAR@("RAG"),"""",""),RAGF=$TR(@PAR@("RAGF"),"""","")
 S REPN=$S(RAGF="RMGO":"OBSTETRIQUE",RAGF="RMGG":"GYNECOLOGIE",1:"")
 S FILS=$TR(@PAR@("FILS"),"""","")
 S ATT1=$O(@ATT@(1,"*","")),ATTN=$ZP(@ATT@(1,"*","")),TOTER=0
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
STO() N DOS,ER,GLO,II,PARA,NOMFILS
 N OR,INDIV,ADR2
 
 S ER=$$LOA^LKZPAR(TEMP,"NUMERO.DOSSIER",1,.DOS)
 
 
 
 
 
 I '($$IR^%QSGEST5(RAG,DOS)) D SSPERE
 S NOMFILS=$$NOMFILS^%QSGES10(RAG,DOS,RAGF,FILS)
 
 D ADDO^%QSGEST3(RAG,DOS,FILS,FILS,RAGF,FILS)
 D:REPN'="" TRAIT^IFMR007(RAGF,NOMFILS,REPN)
 
 S PARA=$O(@ATT@(1,"*",""))
 F II=1:1 Q:PARA=""  D ST1 S PARA=$O(@ATT@(1,"*",PARA))
 D PA^%QSGESTI(RAGF,NOMFILS,"DATE.RECUPERATION.IFM",$$TEMPSNO^%QMDATE($H),1)
 D PA^%QSGESTI(RAGF,NOMFILS,"NOM",FILS,1)
 S (DX,DY)=10 X XY W II," ",INDEX,"  ",NOMFILS
 Q 0
ST1 S ER=$$LOA^LKZPAR(TEMP,PARA,1,.VAL)
 D PA^%QSGESTI(RAGF,NOMFILS,PARA,VAL,1)
 W !,PARA,"  ",VAL
 Q
TEST D ^LKTXIFRQ("","")
 Q
SSPERE 
 D PA^%QSGESTI(RAG,DOS,"NOM",DOS,1)
 D PA^%QSGESTI(RAG,DOS,"ORIGINE.DOSSIER","YXP",1)
 S INDICE=$$INVERS^%QMDATE($$DATE^%QMDATE)_" "_$$HEURE^%QMDATE_" "_WHOIS_" 1"
 D PA^%QSGESTI(RAG,DOS,"NOTE","COMMENTAIRE.YXP",INDICE)
 S ^[QUI]QUERYT(RAG,DOS,INDICE,"LIGNE",1)="Dossier insere au repertoire PATIENT par YXP"
 S TRUC=$S(RAG="RMGG":"GYNECOLOGIQUE",1:"OBSTETRIQUE")
 S ^[QUI]QUERYT(RAG,DOS,INDICE,"LIGNE",2)="Car presence de renseignements de type "_TRUC
 S ^[QUI]QUERYT(RAG,DOS,INDICE,"LIGNE",3)="Mais pas de renseignement supplementaire concernant l'identite du patient"
 Q

