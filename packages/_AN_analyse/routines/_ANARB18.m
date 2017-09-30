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

;%ANARB18^INT^1^59547,73866^0
%ANARB18 ;
 
 
 
 
 
 
COMPPRE S A=$$RED(SA,3) D EMPIL^%ANGEPIL("ABA2^%ANARB18") G INT^%ANARBR2
ABA2 I VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier 3eme cle de l'abaque")) S VAL="",POS=0 G FIN^%ANARBR7
 S IDENT=VAL,A=$$RED(SA,2) D EMPIL^%ANGEPIL("ABA3^%ANARB18") G INT^%ANARBR2
ABA3 I VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier norme de l'abaque")) S VAL="",POS=0 G FIN^%ANARBR7
 S NORME=VAL,NUGR=$$^%QCAZG("^[QUI]REFABAC(NOMG,NORME,IDENT)")
 I NUGR="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Abaque inconnue")) S VAL=0 G FIN^%ANARBR7
 S %NBPAR=$$^%QCAZG("^[QUI]PARAGRIL(NUGR)")
 I %NBPAR="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nombre de parametres de l'abaque inconnu")) S VAL=0 G FIN^%ANARBR7
 S %SCPR=$P($$^%QCAZG("^[QUI]GROUGRIL(NUGR)"),"|",3)
 S:%SCPR="" %SCPR="N"
 S PREMIS=$$RED(SA,4)
 K ^VPAR($I) S PREM=-1
 G:PREMIS'=0 LECPREMIS
 F INDI=0:0 S PREM=$N(^[QUI]PARAGRIL(NUGR,PREM)) Q:PREM=-1  S ^VPAR($I,PREM)=""
 G SUITAB
LECPREMIS S TOUS=$$^%QZCHW("TOUS"),TOUTES=$$^%QZCHW("TOUTES"),VALE="",POS=1,INDI=0
LECP1 S INDI=INDI+1,PREM=$N(^[QUI]STRUCT(NOMG,2,"P",PREM)) G:PREM=-1 LECPF
 S A=$$RED(PREMIS,INDI) G:A=0 LECPF D EMPIL^%ANGEPIL("LECP2^%ANARB18")
 G INT^%ANARBR2
LECP2 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer premisse no ")_INDI_"") S VAL=""
 S:(VAL=TOUS)!(VAL=TOUTES) VAL=""
 S ^VPAR($I,^[QUI]STRUCT(NOMG,2,"P",PREM,"FULL"))=VAL
 G LECP1
LECPF I A=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Il manque une premisse")) S VAL="",POS=0 G FIN^%ANARBR7
 I $$RED(PREMIS,INDI)'=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Trop de premisses")) S POS=0,VAL="" G FIN^%ANARBR7
SUITAB S %REFD=NUGR,PREM=-1
 F INDI=0:0 S PREM=$N(^VPAR($I,PREM)) Q:PREM=-1  S %REFD=%REFD_","""_$S(^VPAR($I,PREM)'="":^VPAR($I,PREM),1:"   ")_""""
 G EVALAB^%ANARBR7
 
 
 
 
ABRES S RESU=-1
 F INDI=1:1 S RESU=$N(@ADRRESUL@(RESU)) Q:RESU=-1  S ^VALCONC($J,INDI)=$P(@ADRRESUL@(RESU),"|")
AFFRESULT 
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Affectations"))
 S INDA=-1,CONC=$$RED(SA,5) K ^ORDRESUL($J)
 F IN=1:1 S INDA=$N(^[QUI]STRUCT(NOMG,2,"R",INDA)) Q:INDA=-1  S EXP=$$RED(CONC,IN) Q:EXP=0  S ^ORDRESUL($J,^[QUI]STRUCT(NOMG,2,"R",INDA,"FULL"))=EXP
 I EXP=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Plus de resultantes que de parametres")) S VAL="",POS=0 G FIN^%ANARBR7
 S EXP=$$RED(CONC,IN)
 I EXP'=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Plus de parametres que de resultantes")) S VAL="",POS=0 G FIN^%ANARBR7
 S REF=-1,ERREUR=0
 F IN=1:1 S REF=$N(^ORDRESUL($J,REF)) Q:REF=-1  S EXP=^VALCONC($J,IN),INDI=^ORDRESUL($J,REF) D AFF^%TLIACTS(INDI,EXP)
 G FINNORM^%ANARBR7
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

