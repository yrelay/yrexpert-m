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

;%QSABAQU^INT^1^59547,73880^0
QSABAQU ;
 
EVAL(REPA,OB,TRT,ROUPRM,ROURES,ROUMAJ,MODEX,NOMG,NORME,IDENT,VAL,ERR) 
 N TEMPO
 S TEMPO=$$CONCAS^%QZCHAD($P($ZPOS,"^",2),"ABAQUE")
 D INIT^%ANGEPIL
 K @(TEMPO)
 S @TEMPO@(1)="SEUL",@TEMPO@(2)="NUGR",@TEMPO@(3)="%NBPAR"
 S @TEMPO@(4)="%NBPAR",@TEMPO@(5)="%SCPR",@TEMPO@(6)="%REFD",@TEMPO@(7)="PREM"
 S @TEMPO@(8)="ATTA",@TEMPO@(9)="DEJAVU",@TEMPO@(10)="INDI"
 S @TEMPO@(11)="ADDRESUL",@TEMPO@(12)="ACCEPT",@TEMPO@(13)="%NBSOL"
 S @TEMPO@(14)="%NBDEF",@TEMPO@(15)="STOP"
 D EMPV^%ANGEPIL(TEMPO)
 K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 S VAL=0
 S QUW=QUI,SEUL=0
 G:NORME'="" IDENT
 S:NORME="" NORME=$O(^[QUI]REFABAC(NOMG,""))
 I NORME="" S ERR=1 G FINER
IDENT G:IDENT'="" NUGR
 S IDENT=$O(^[QUI]REFABAC(NOMG,NORME,""))
 I IDENT="" S ERR=1 G FINER
NUGR I '($D(^[QUI]REFABAC(NOMG,NORME,IDENT))) S ERR=1 G FINER
 S NUGR=^[QUI]REFABAC(NOMG,NORME,IDENT)
 S %NBPAR=$$^%QCAZG("^[QUI]PARAGRIL(NUGR)")
 I %NBPAR="" S ERR=2 G FINER
 S %SCPR=$P($$^%QCAZG("^[QUI]GROUGRIL(NUGR)"),"|",3)
 S:%SCPR="" %SCPR="N"
 S %REFD=NUGR
 I ROUPRM'="" D @ROUPRM G EVALAB
 S PREM=""
BEVPR S PREM=$O(^[QUI]STRUCT(NOMG,2,"P",PREM))
 G:PREM="" EVALAB
 S ATTA=^[QUI]STRUCT(NOMG,2,"P",PREM,"FULL")
 S VAL=$$^%QSCALVA(REPA,OB,ATTA)
 S ^VPAR($I,ATTA)=VAL
 I TRT D:AFF'="" @(AFF_"("_$$S1^%QZCHAD(ATTA)_","_$$S1^%QZCHAD(VAL)_")")
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
 D ^%QCAGTU5
 S:STOP'=1 ACCEPT=0
 G:ACCEPT=1 SUITOK
 I '($D(^GRSOL($I))) S @("^[QUI]ABDEJEV("_%REFD_")")="???",VAL=0 G FINER
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
 I ROURES'="" D @ROURESUL G FINNORM
 G:ROUMAJ="" FINORM
 I TRT D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Affectations"))
 S RESU=-1,INDI=-1,ERREUR=0
BACQ S RESU=$N(@ADRRESUL@(RESU))
 G:RESU=-1 FINNORM
 S INDI=$N(^[QUI]STRUCT(NOMG,2,"R",INDI))
 G:INDI=-1 FINNORM
 S EXP=$P(@ADRRESUL@(RESU),"|")
 S ATTA=RESU
 D @ROUMAJ
 G BACQ
FINNORM I ERREUR=1 S VAL=0 G FINER
 
FIN K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 D DEPV^%ANGEPIL,EPIL^%ANGEPIL
 Q 1
 
FINER K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 D DEPV^%ANGEPIL,EPIL^%ANGEPIL
 Q 0
 
MAJVAL 
 G:ATTA'=$$^%QZCHW("NOM") SAFF
 I TRT D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit de modifier attribut NOM")) S ERREUR=1 Q
SAFF G:$$TYPE^%QSGEST9(REPA,ATTA)=0 SAFF1
 I TRT D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit de modifier un lien")) S ERREUR=1 Q
SAFF1 
 
 
 S EXP2=EXP
 I $$TYPE^%QSGESPE(ATTA_"/"_$$NOMLOG^%QSF(REPA))="DATE" S EXP2=$$INTF^%QMDAUC(REPA,ATTA,EXP2)
 I TRT,EXP2="" D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit utiliser chaine vide")) S ERREUR=1 G FIN
 D:MODEX'=1 PA^%QSGESTI(REPA,OB,ATTA,EXP2,1)
 I TRT D:MODAF'=0 ADD^%TLIFEN("ATT",ATTA_"<--"_EXP2)
 Q
 K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 G DEPIL^%ANGEPIL
MESER(NOER) 
 Q:NOER=1  W *
 Q:NOER=2  W *
 Q ""

