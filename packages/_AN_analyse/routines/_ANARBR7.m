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

;%ANARBR7^INT^1^59547,73866^0
%ANARBR7 ;
 
 
 
 
ABAQUE K @(TEMPO) S @TEMPO@(1)="NOMG",@TEMPO@(2)="NORME",@TEMPO@(3)="IDENT",@TEMPO@(4)="RES"
 S @TEMPO@(5)="INDI",@TEMPO@(6)="NUGR",@TEMPO@(7)="NBPAR",@TEMPO@(8)="%SCPR",@TEMPO@(9)="PREMIS"
 S @TEMPO@(10)="QUW",@TEMPO@(11)="PREM",@TEMPO@(12)="%NBPAR",@TEMPO@(13)="SA"
 S @TEMPO@(14)="TOUS",@TEMPO@(15)="TOUTES",@TEMPO@(16)="PREMI",@TEMPO@(17)="VALE",@TEMPO@(18)="POS"
 S @TEMPO@(19)="CONC",@TEMPO@(20)="%REFD",@TEMPO@(21)="DEJAVU",@TEMPO@(22)="ADRESSE",@TEMPO@(23)="I",@TEMPO@(24)="ACCEPT"
 S @TEMPO@(25)="NOMTREE",@TEMPO@(26)="REF",@TEMPO@(27)="RESU",@TEMPO@(28)="PREMA",@TEMPO@(29)="PREMB",@TEMPO@(30)="%NBDEF"
 S @TEMPO@(31)="%NBSOL",@TEMPO@(32)="STOP",@TEMPO@(33)="ACCEPT"
 S @TEMPO@(34)="ATTA",@TEMPO@(35)="INDA",@TEMPO@(36)="VARA",@TEMPO@(37)="REPA",@TEMPO@(38)="EXP",@TEMPO@(39)="IN"
 S @TEMPO@(40)="ERREUR",@TEMPO@(41)="EXP2"
 D EMPV^%ANGEPIL(TEMPO)
 K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 S QUW=QUI,SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("ABA1^%ANARBR7") G INT^%ANARBR2
ABA1 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le nom de l'abaque")) S VAL="",POS=0 G FIN
 S NOMG=VAL,SEUL=0
 G:$$RED(SA,2)'=0 COMPPRE^%ANARB18
 
 S SEUL=1
 S NORME=$O(^[QUI]REFABAC(NOMG,""))
 I NORME="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Abaque inconnue")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S IDENT=$O(^[QUI]REFABAC(NOMG,NORME,""))
 S NUGR=^[QUI]REFABAC(NOMG,NORME,IDENT)
 S %NBPAR=$$^%QCAZG("^[QUI]PARAGRIL(NUGR)")
 I %NBPAR="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nombre de parametres de l'abaque inconnu")) S VAL=0 G FIN^%ANARBR7
 S %SCPR=$P($$^%QCAZG("^[QUI]GROUGRIL(NUGR)"),"|",3)
 S:%SCPR="" %SCPR="N"
 S %REFD=NUGR,PREM="",REPA=CXT("@","BASE"),OB=CXT("@","OBJET")
BEVPR S PREM=$O(^[QUI]STRUCT(NOMG,2,"P",PREM))
 G:PREM="" EVALAB
 S ATTA=^[QUI]STRUCT(NOMG,2,"P",PREM,"FULL")
 S VAL=$$^%QSCALVA(REPA,OB,ATTA)
 S ^VPAR($I,ATTA)=VAL
 D:AFF'="" @(AFF_"("_$$S1^%QZCHAD(ATTA)_","_$$S1^%QZCHAD(VAL)_")")
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
 G:'(SEUL) ABRES^%ANARB18
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Affectations"))
 S RESU=-1,INDI=-1,ERREUR=0
BACQ S RESU=$N(@ADRRESUL@(RESU))
 G:RESU=-1 FINNORM
 S INDI=$N(^[QUI]STRUCT(NOMG,2,"R",INDI))
 G:INDI=-1 FINNORM
 S EXP=$P(@ADRRESUL@(RESU),"|")
 S ATTA=RESU
 D AFFAT^%TLIACTS(REPA,OB,ATTA,EXP,1)
 G BACQ
FINNORM I ERREUR=1 S VAL="",POS=0 G FIN
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Affectations terminees"))
 
FIN K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

