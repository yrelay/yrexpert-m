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

;%TLOB7^INT^1^59547,74030^0
%TLOB7 ;;03:41 PM  25 Mar 1992; ; 30 Mar 93  2:36 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ABAQUE(IDEB,NBREG) 
 N NOMG,NORME,IDENT,RES,INDI,NUGR,NBPAR,%SCPR,PREMIS
 N QUW,PREM,%NBPAR,SA,TOUS,TOUTES,PREMI,VALE,POS
 N CONC,%REFD,DEJAVU,ADRESSE,I,ACCEPT
 N NOMTREE,REF,RESU,PREMA,PREMB,%NBDEF
 N %NBSOL,STOP,ACCEPT,ATTA,INDA,VARA,REPA,EXP,IN
 N ERREUR,EXP2,RESAFF,LISRESUL,VAL
 
 K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 S QUW=QUI
 S NOMG=V(IDEB)
 I V(IDEB+1)'=$C(0) S SEUL=0,IDENT=V(IDEB+2),NORME=V(IDEB+1) G SUITE0
 S SEUL=1,NORME=$O(^[QUI]REFABAC(NOMG,""))
 S IDENT=$O(^[QUI]REFABAC(NOMG,NORME,""))
SUITE0 S NUGR=^[QUI]REFABAC(NOMG,NORME,IDENT)
 S %NBPAR=$$^%QCAZG("^[QUI]PARAGRIL(NUGR)")
 S %SCPR=$P($$^%QCAZG("^[QUI]GROUGRIL(NUGR)"),"|",3)
 S:%SCPR="" %SCPR="N"
 
 
 
 I (('(SEUL))&(V(IDEB+3)'=$C(0)))&(V(IDEB+3)'="") G EVALLPR
 S %REFD=NUGR,PREM=""
 S REPA=PARCO("REP"),OB=PARCO("IND")
BEVPR S PREM=$O(^[QUI]STRUCT(NOMG,2,"P",PREM)) G:PREM="" EVALAB
 S ATTA=^[QUI]STRUCT(NOMG,2,"P",PREM,"FULL")
 S VAL=$$^%QSCALVA(REPA,OB,ATTA)
 S ^VPAR($I,ATTA)=VAL
 S %REFD=%REFD_","""_$S(VAL'="":VAL,1:"   ")_""""
 G BEVPR
 
EVALLPR K ^VPAR($I)
 S PREMIS=V(IDEB+3)
 G:(PREMIS'=$C(0))&(PREMIS'="") LECPREM
 S PREM="",%REFD=NUGR
 F INDI=0:0 S PREM=$O(^[QUI]PARAGRIL(NUGR,PREM)) Q:PREM=""  S ^VPAR($I,PREM)="",%REFD=%REFD_",""   """
 G EVALAB
 
LECPREM S TOUS=$$^%QZCHW("TOUS"),TOUTES=$$^%QZCHW("TOUTES"),VALE=""
 S INDI=0,PREM=""
LECP1 S INDI=INDI+1,PREM=$O(^[QUI]STRUCT(NOMG,2,"P",PREM)) G:PREM="" LECPF
 S VAL=@PREMIS@(INDI)
 S:(VAL=TOUS)!(VAL=TOUTES) VAL=""
 S ^VPAR($I,^[QUI]STRUCT(NOMG,2,"P",PREM,"FULL"))=VAL
 G LECP1
LECPF S %REFD=NUGR,PREM=""
 F INDI=0:0 S PREM=$O(^VPAR($I,PREM)) Q:PREM=""  S %REFD=%REFD_","""_$S(^VPAR($I,PREM)'="":^VPAR($I,PREM),1:"   ")_""""
 
 
 
 
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
 
 
 
ACQRES I (('(SEUL))&(V(IDEB+4)'=$C(0)))&(V(IDEB+4)'="") G ABRES
 S RESU="",INDI=""
BACQ S RESU=$O(@ADRRESUL@(RESU)) G:RESU="" FINNORM
 S INDI=$O(^[QUI]STRUCT(NOMG,2,"R",INDI)) G:INDI="" FINNORM
 S EXP=$P(@ADRRESUL@(RESU),"|")
 S ATTA=RESU
 S RESAFF=$$AFF^%TLOPT(REPA,OB,RESU,1,EXP)
 G BACQ
 
 
 
ABRES S LISRESUL=V(IDEB+4)
 S RESU="" F INDI=1:1 S RESU=$O(@ADRRESUL@(RESU)) Q:RESU=""  S ^VALCONC($J,INDI)=$P(@ADRRESUL@(RESU),"|")
 K ^ORDRESUL($J)
 S INDA="" F IN=1:1 S INDA=$O(^[QUI]STRUCT(NOMG,2,"R",INDA)) Q:INDA=""  S ^ORDRESUL($J,^[QUI]STRUCT(NOMG,2,"R",INDA,"FULL"))=IN
 S REF=""
 F IN=1:1 S REF=$O(^ORDRESUL($J,REF)) Q:REF=""  S EXP=^VALCONC($J,IN),INDI=^ORDRESUL($J,REF),RESAFF=$$AFF^%TLOPT(@LISRESUL@(INDI,"R"),@LISRESUL@(INDI,"I"),@LISRESUL@(INDI,"A"),@LISRESUL@(INDI,"O"),EXP)
 
 
FINNORM 
FIN K ^VALCONC($J),^VPAR($I),^GRSOL($I),^ORDRESUL($J)
 Q VAL

