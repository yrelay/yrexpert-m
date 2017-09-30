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

;%QWACR2^INT^1^59547,73886^0
QWACR2 ;
 
 
 
 
 
 
ACTIV(NUGR,REP,IND) 
 N EXTR,NOUV
 S TYPNOR=$O(^[QUI]GRTYPN(NUGR,""))
 S NOUV=1,PROD=0
 G:TYPNOR="SANS" SUITAC
 Q:'($$EXIRIA^%QWSTOL(REP,IND,TYPNOR)) PROD
 S VALNOR=$O(^[QUI]GRTYPN(NUGR,TYPNOR,""))
 Q:$$VALEUR^%QWSTOL(REP,IND,TYPNOR)'=VALNOR PROD
SUITAC K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 S EXTR=$P(^[QUI]GROUGRIL(NUGR),"|",2)
 S NOMG=$P(EXTR,"^",1)
 S NORME=$P(EXTR,"^",2)
 S IDENT=$P(EXTR,"^",3)
 S %NBPAR=$$^%QCAZG("^[QUI]PARAGRIL(NUGR)")
 S %SCPR=$P($$^%QCAZG("^[QUI]GROUGRIL(NUGR)"),"|",3)
 S:%SCPR="" %SCPR="N"
 S %REFD=NUGR,PREM=""
BEVPR S PREM=$O(^[QUI]STRUCT(NOMG,2,"P",PREM))
 G:PREM="" EVALAB
 S ATTA=^[QUI]STRUCT(NOMG,2,"P",PREM,"FULL")
 S VAL=$$VALEUR^%QWSTOL(REP,IND,ATTA)
 S ^VPAR($I,ATTA)=VAL
 S %REFD=%REFD_","""_$S(VAL'="":VAL,1:"   ")_""""
 G BEVPR
EVALAB S DEJAVU=$$^%QCAZG("^[QUI]ABDEJEV("_%REFD_")")
 G:DEJAVU="" SUITAB2
 
 
 I DEJAVU["?" S VAL=0 G FIN
 
 
 
 
 
 S VAL=$$^%QCAZG("^[QUI]ABDEJEV("_%REFD_",""TYPSOL"")")
 G:VAL="" SUITAB2
 S INDI=-1,ADRRESUL="^[QUI]GRUPLET("_DEJAVU_")"
 G ACQRES
SUITAB2 
 S ACCEPT=0,NOMTREE="^[QUI]GRUPLET(NUGR",%TAD="^%ABGUPLE"
 S %NBDEF=0,%NBSOL=1
 S QUW=QUI
 D ^%QCAGTU5
 S:STOP'=1 ACCEPT=0
 G:ACCEPT=1 SUITOK
 I '($D(^GRSOL($I))) S @("^[QUI]ABDEJEV("_%REFD_")")="???",VAL=0 G FIN
 G:STOP'=1 SUITAB3
 
SUITOK S VAL=1
 S REF=NUGR,RESU=-1
 F INDI=0:0 S RESU=$N(^[QUI]EVALGRIL(NUGR,RESU)) Q:RESU=-1  S REF=REF_","""_^GRIL($I,^[QUI]EVALGRIL(NUGR,RESU))_""""
 S ADRRESUL="^[QUI]GRUPLET("_REF_")",@("^[QUI]ABDEJEV("_%REFD_")")=REF,@("^[QUI]ABDEJEV("_%REFD_",""TYPSOL"")")=1
 G ACQRES
SUITAB3 
 S %NBDEF=$N(^GRSOL($I,-1)),%NBSOL=$N(^GRSOL($I,%NBDEF,-1))
 S ADRRESUL="^[QUI]GRUPLET("_^GRSOL($I,%NBDEF,%NBSOL)_")",@("^[QUI]ABDEJEV("_%REFD_")")=^GRSOL($I,%NBDEF,%NBSOL),@("^[QUI]ABDEJEV("_%REFD_",""TYPSOL"")")=2
 S VAL=2
ACQRES 
 S RESU=-1,INDI=-1,ERREUR=0
BACQ S RESU=$N(@ADRRESUL@(RESU))
 G:RESU=-1 FINNORM
 S INDI=$N(^[QUI]STRUCT(NOMG,2,"R",INDI))
 G:INDI=-1 FINNORM
 S EXP=$P(@ADRRESUL@(RESU),"|")
 S ATTA=RESU
 D MAJVAL
 G BACQ
FINNORM I ERREUR=1 S VAL="",POS=0 G FIN
 
FIN K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 Q PROD
 
MAJVAL 
 Q:ATTA=$$^%QZCHW("NOM")
 
SAFF1 
 
 
 S EXP2=EXP
 I $$TYPE^%QSGESPE(ATTA_"/"_$$NOMLOG^%QSF(REP))="DATE" S EXP2=$$INTF^%QMDAUC(REP,ATTA,EXP2)
 I (EXP2'="")&(EXP2'="Indefini"),'($$EXIRIA^%QWSTOL(REP,IND,ATTA)) S RES=$$AFFECT^%QWSTOE(2,NUGR,NOUV,REP,IND,ATTA,1,EXP2),NOUV=0 I RES S PROD=1
 Q
 
TEST 
 D POCLEPA^%VVIDEO
 W !,"ACTIVER L'ABAQUE N : " R NAB
 W !," INDIVIDU ?" R IND
 W !," REPERTOIRE ?" R REP
 W $$ACTIV(NAB,REP,IND)
 Q

