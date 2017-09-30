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

;%ANARB16^INT^1^59547,73866^0
%ANARB16 ;
 
 
 
 
 
 
EVALUER 
 K @(TEMPO)
 S @TEMPO@(1)="SA",@TEMPO@(2)="REPNOE",@TEMPO@(3)="LIENOE"
 S @TEMPO@(4)="NOEINI",@TEMPO@(5)="REPFOC",@TEMPO@(6)="INDFOC"
 S @TEMPO@(7)="ETUDE",@TEMPO@(8)="REPTMP"
 D EMPV^%ANGEPIL(TEMPO)
 
 S SA=A
 S REPNOE="NOEUD.I",LIENOE="TRANSITION"
 
 S A=$$RED(SA,1) D EMPIL^%ANGEPIL("EVALU0^%ANARB16") G INT^%ANARBR2
EVALU0 
 I (VAL="")!(POS=0) G DEPIL^%ANGEPIL
 S NOEINI=VAL
 I '($$IR^%QSGEST5(REPNOE,NOEINI)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("noeud inconnu")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 
 S A=$$RED(SA,2) I A=0 S REPFOC="" G VEREP
 D EMPIL^%ANGEPIL("EVALU1^%ANARB16") G INT^%ANARBR2
EVALU1 
 I POS=0 G DEPIL^%ANGEPIL
 S REPFOC=VAL
VEREP 
 I REPFOC'="" S REPTMP=$$NOMINT^%QSF(REPFOC) I REPTMP'="" S REPFOC=REPTMP
 I REPFOC="" S REPFOC=CXT("@","BASE")
 I '($$REP^%QSGEST5(REPFOC)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("le repertoire focus est inconnu")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 
 S A=$$RED(SA,3) I A=0 S INDFOC="" G VERIND
 D EMPIL^%ANGEPIL("EVALU2^%ANARB16") G INT^%ANARBR2
EVALU2 
 I POS=0 G DEPIL^%ANGEPIL
 S INDFOC=VAL
VERIND 
 I INDFOC="" S INDFOC=CXT("@","OBJET")
 I '($$IR^%QSGEST5(REPFOC,INDFOC)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("individu focus inconnu")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 
 S A=$$RED(SA,4) I A=0 S:ORIG="TRAIT" ETUDE=1 S:ORIG="EVAL" ETUDE=0 G EVACT
 D EMPIL^%ANGEPIL("EVALU3^%ANARB16") G INT^%ANARBR2
EVALU3 
 I POS=0 G DEPIL^%ANGEPIL
 S ETUDE=VAL
 I ETUDE="" S:ORIG="TRAIT" ETUDE=1 S:ORIG="EVAL" ETUDE=0 G EVACT
 I '($$IR^%QSGEST5("ETUDE",ETUDE)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("individu etude inconnu")) S POS=0,VAL="" G DEPIL^%ANGEPIL
EVACT 
 S REPTMP=REPFOC,REPFOC=$$NOMLOG^%QSF(REPFOC)
 D INAF^%QMECAFF,REAF^%QMECAFF,AFFLIG^%QMECAFF
 S REPFOC=REPTMP
 D EMPIL^%ANGEPIL("RETEVA^%ANARB16") G EVAINT^%QMECEVA
RETEVA 
 S VAL=ETUDE
 D ENDAF^%QMECAFF
 D:MODAF=1 REAF^%TLIFEN D:MODAF=2 REAF^%TLBAIF(0) S:ORIG="EVAL" REAF=1
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

