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

;%ANARB10^INT^1^59547,73866^0
%ANARB10 ;
 
 
 
 
 
EXP K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("EXP1^%ANARB10") G INT^%ANARBR2
EXP1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFNUM^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$EXP^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
SQR K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("SQR1^%ANARB10") G INT^%ANARBR2
SQR1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$POSITIF^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique ou non positif ou nul")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$SQR^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
SQ K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("SQ1^%ANARB10") G INT^%ANARBR2
SQ1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFNUM^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$SQ^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
PUIS K @(TEMPO) S @TEMPO@(1)="ARG",@TEMPO@(2)="VAL1",@TEMPO@(3)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("PUIS1^%ANARB10") G INT^%ANARBR2
PUIS1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 1er argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL1=VAL,A=$$RED(SA,2) D EMPIL^%ANGEPIL("PUIS2^%ANARB10") G INT^%ANARBR2
PUIS2 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 2nd argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFPWR^%TLCAMTH(VAL1,VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument(s) non numerique(s)")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$PUIS^%TLCAMTH(VAL1,VAL)
 G DEPIL^%ANGEPIL
 
CHRONO K @(TEMPO) S @TEMPO@(1)="ARG",@TEMPO@(2)="VAL1",@TEMPO@(3)="SA" D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("CHRONO1^%ANARB10") G INT^%ANARBR2
CHRONO1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 1er argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL1=VAL,A=$$RED(SA,2) D EMPIL^%ANGEPIL("CHRONO2^%ANARB10") G INT^%ANARBR2
CHRONO2 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 2nd argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S ARG="CHRONO^%ANARB10/"_VAL1_"/"_VAL
 S VAL=$$FONC^%TLFNUMI("%QMDACHR",ARG)
 G DEPIL^%ANGEPIL
 
SIN K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("SIN1^%ANARB10") G INT^%ANARBR2
SIN1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFNUM^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$SIN^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
COS K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("COS1^%ANARB10") G INT^%ANARBR2
COS1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFNUM^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$COS^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
ARCSIN K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("ARCSIN1^%ANARB10") G INT^%ANARBR2
ARCSIN1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFARC^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique ou non compris entre [-1,1]")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$ARCSIN^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
ARCOS K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("ARCOS1^%ANARB10") G INT^%ANARBR2
ARCOS1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFARC^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique ou non compris entre [-1,1]")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$ARCCOS^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
ABS K @(TEMPO) S @TEMPO@(1)="ARG" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("ABS1^%ANARB10") G INT^%ANARBR2
ABS1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFNUM^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$ABS^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

