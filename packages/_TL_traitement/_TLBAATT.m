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

;%TLBAATT^INT^1^59547,74028^0
TLBAATT ;
 
STATT(REP,IND,ATT,VAL,ORD,TYP) 
 N ORA,OVAL,TTYP,LVAL
 I ((REP="")!(IND=""))!(ATT="") Q
 I (TYP="AJOUT")&(VAL="") Q
 S LVAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LVAL") K @(LVAL)
 I ORD="" S ORD=1
 I ORD'="*" S OVAL=$$^%QSCALIN(REP,IND,ATT,ORD) S:(OVAL'="")&(TYP="AJOUT") TYP="MODIFICATION" S @LVAL@(ORD)=OVAL
 I ORD="*" D MVG^%QSCALVA(REP,IND,ATT,LVAL,.TTYP)
 I REP=CXT("%","BASE") S REP="%",IND="%"
 S TYP=TYP_".ATTRIBUT",ORD=""
BCSTUN 
 S ORD=$O(@LVAL@(ORD)) I ORD="" Q
 S OVAL=@LVAL@(ORD)
 S ORA=@GLOETD@("ATTRIBUT")+1,@GLOETD@("ATTRIBUT")=ORA
 S @GLOETD@("ATTRIBUT",ORA,"PAS")=@GLOETD@("PAS")
 S @GLOETD@("ATTRIBUT",ORA,"TRAITEMENT")=TRT
 S @GLOETD@("ATTRIBUT",ORA,"REGLE")=NUMRG
 S @GLOETD@("ATTRIBUT",ORA,"REPERTOIRE")=REP
 S @GLOETD@("ATTRIBUT",ORA,"INDIVIDU")=IND
 S @GLOETD@("ATTRIBUT",ORA,"ATTRIBUT")=ATT
 S @GLOETD@("ATTRIBUT",ORA,"INDICE")=ORD
 S @GLOETD@("ATTRIBUT",ORA,"ANCIENNE.VALEUR")=OVAL
 S @GLOETD@("ATTRIBUT",ORA,"VALEUR")=VAL
 S @GLOETD@("ATTRIBUT",ORA,"TYPE")=TYP
 G BCSTUN
 
STIND(REP,IND,ORD,VAR,TYP) 
 N ORA
 S ORA=@GLOETD@("ATTRIBUT")+1,@GLOETD@("ATTRIBUT")=ORA
 S @GLOETD@("ATTRIBUT",ORA,"PAS")=@GLOETD@("PAS")
 S @GLOETD@("ATTRIBUT",ORA,"TRAITEMENT")=TRT
 S @GLOETD@("ATTRIBUT",ORA,"REGLE")=NUMRG
 S @GLOETD@("ATTRIBUT",ORA,"REPERTOIRE")=REP
 S @GLOETD@("ATTRIBUT",ORA,"INDIVIDU")=IND
 S @GLOETD@("ATTRIBUT",ORA,"NUMERO.ORDRE")=ORD
 S @GLOETD@("ATTRIBUT",ORA,"VARIABLE")=VAR
 S @GLOETD@("ATTRIBUT",ORA,"TYPE")=TYP_".INDIVIDU"
 Q
 
STLIEN(REPS,INDS,LIEN,REPD,INDD,TYP) 
 N ORA
 S ORA=@GLOETD@("ATTRIBUT")+1,@GLOETD@("ATTRIBUT")=ORA
 S @GLOETD@("ATTRIBUT",ORA,"PAS")=@GLOETD@("PAS")
 S @GLOETD@("ATTRIBUT",ORA,"TRAITEMENT")=TRT
 S @GLOETD@("ATTRIBUT",ORA,"REGLE")=NUMRG
 S @GLOETD@("ATTRIBUT",ORA,"REPERTOIRE.SOURCE")=REPS
 S @GLOETD@("ATTRIBUT",ORA,"INDIVIDU.SOURCE")=INDS
 S @GLOETD@("ATTRIBUT",ORA,"LIEN")=LIEN
 S @GLOETD@("ATTRIBUT",ORA,"REPERTOIRE.DESTINATION")=REPD
 S @GLOETD@("ATTRIBUT",ORA,"INDIVIDU.DESTINATION")=INDD
 S @GLOETD@("ATTRIBUT",ORA,"TYPE")=TYP_".LIEN"
 Q
 
REPRISE(LOCAL) 
 N ORDI,ITOT,TYP,GLO,REP,IND,NIV,VAR
 S ITOT=@GLOETD@("ATTRIBUT")
 S ORDI=1
BCLREP 
 I ORDI>ITOT G FINREP
 S GLO=$$CONCAS^%QZCHAD(GLOETD,"ATTRIBUT,"_ORDI)
 S TYP=@GLO@("TYPE")
RECATT 
 I TYP'["ATTRIBUT" G RECIND
 S REP=@GLO@("REPERTOIRE"),IND=@GLO@("INDIVIDU")
 I LOCAL&(REP'="%") G RCSUI
 I REP="%" S REP=CXT("%","BASE"),IND=CXT("%","OBJET")
 I (TYP["AJOUT")!(TYP["MODIFICATION") D PA^%QSGESTI(REP,IND,@GLO@("ATTRIBUT"),@GLO@("VALEUR"),@GLO@("INDICE"))
 I TYP["SUPPRESSION" D PSO^%QSGESTI(REP,IND,@GLO@("ATTRIBUT"),@GLO@("INDICE"))
 G RCSUI
RECIND 
 I TYP'["INDIVIDU" G RECLIE
 I TYP'["AJOUT" G SUPIND
 
 S REP=@GLO@("REPERTOIRE"),IND=@GLO@("INDIVIDU")
 I LOCAL G RECXT
 I $$IR^%QSGEST5(REP,IND) G RECXT
 S NIV=$$CREER^%QSGEIND(REP,IND,@GLO@("NUMERO.ORDRE"),1,"") I NIV'=0 G RCSUI
RECXT 
 S VAR=@GLO@("VARIABLE")
 S CXT(VAR,"BASE")=REP,CXT(VAR,"OBJET")=IND
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,IND,1)
 G RCSUI
SUPIND 
 I LOCAL G RCSUI
 I TYP["SUPPRESSION" D SX^%QSGESTK(@GLO@("REPERTOIRE"),@GLO@("INDIVIDU"))
 G RCSUI
RECLIE 
 I LOCAL G RCSUI
 I TYP'["LIEN" G RCSUI
 I TYP["AJOUT" D ADDS^%QSGEST3(@GLO@("REPERTOIRE.SOURCE"),@GLO@("INDIVIDU.SOURCE"),@GLO@("LIEN"),@GLO@("REPERTOIRE.DESTINATION"),@GLO@("INDIVIDU.DESTINATION"))
 I TYP["SUPPRESSION" D SUPS^%QSGEST3(@GLO@("REPERTOIRE.SOURCE"),@GLO@("INDIVIDU.SOURCE"),@GLO@("LIEN"),@GLO@("REPERTOIRE.DESTINATION"),@GLO@("INDIVIDU.DESTINATION"))
RCSUI 
 S ORDI=ORDI+1 G BCLREP
FINREP 
 S ORDI=""
BCLPC 
 S ORDI=$O(@GLOETD@("CONTEXTE",ORDI)) I ORDI="" Q
 S NIV=""
BCLDP 
 S NIV=$O(@GLOETD@("CONTEXTE",ORDI,NIV)) I NIV="" G BCLPC
 S CXT(ORDI,NIV)=@GLOETD@("CONTEXTE",ORDI,NIV) G BCLDP

