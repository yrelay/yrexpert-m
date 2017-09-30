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

;%ANARB14^INT^1^59547,73866^0
%ANARB14 ;
 
TRIMES 
 K @(TEMPO)
 S @TEMPO@(1)="DA",@TEMPO@(2)="TRIM"
 D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("TRIMES2^%ANARB14") G INT^%ANARBR2
TRIMES2 G:'(POS) DEPIL^%ANGEPIL
 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 I '($$^%QMDASAI(VAL,.DA)) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$^%QMDAFFI(DA,9)
 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S TRIM=$P(VAL,"/"),VAL=$P(TRIM,"T",2)
 G DEPIL^%ANGEPIL
 
MOIS 
 K @(TEMPO)
 S @TEMPO@(1)="DA",@TEMPO@(2)="MOI"
 D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("MOIS2^%ANARB14") G INT^%ANARBR2
MOIS2 G:'(POS) DEPIL^%ANGEPIL
 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 I '($$^%QMDASAI(VAL,.DA)) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$^%QMDAFFI(DA,8)
 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S MOI=$P(VAL,"/"),VAL=$P(MOI,"M",2)
 S:$L(VAL)=1 VAL="0"_VAL
 G DEPIL^%ANGEPIL
 
SEMAI 
 K @(TEMPO)
 S @TEMPO@(1)="DA",@TEMPO@(2)="SEM"
 D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("SEMAI2^%ANARB14") G INT^%ANARBR2
SEMAI2 G:'(POS) DEPIL^%ANGEPIL
 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 I '($$^%QMDASAI(VAL,.DA)) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$^%QMDAFFI(DA,6)
 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S SEM=$P(VAL,"/"),VAL=$P(SEM,"S",2)
 S:$L(VAL)=1 VAL="0"_VAL
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

