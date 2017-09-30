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

;%ANARB15^INT^1^59547,73866^0
%ANARB15 ;
ACQU 
 K @(TEMPO) S @TEMPO@(1)="SA",@TEMPO@(2)="REP",@TEMPO@(3)="REPI",@TEMPO@(4)="INDV",@TEMPO@(5)="ORD",@TEMPO@(6)="ATTR"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("ACQU2^%ANARB15") G INT^%ANARBR2
ACQU2 G:'(POS) DEPIL^%ANGEPIL
 I VAL="" S REPI=CXT("@","BASE"),REP=$$NOMLOG^%QSF(REPI) G ACQU21
 S REP=VAL,REPI=$$NOMINT^%QSF(VAL)
 I REPI="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Repertoire inconnu")) S POS=0,VAL="" G DEPIL^%ANGEPIL
ACQU21 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("ACQU3^%ANARB15") G INT^%ANARBR2
ACQU3 G:'(POS) DEPIL^%ANGEPIL
 I VAL="" S INDV=CXT("@","OBJET") G ACQU31
 I '($$IR^%QSGE5(REPI,VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Individu inexistant dans ce repertoire")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S INDV=VAL
ACQU31 S A=$$RED(SA,3)
 D EMPIL^%ANGEPIL("ACQU4^%ANARB15") G INT^%ANARBR2
ACQU4 G:'(POS) DEPIL^%ANGEPIL
 I VAL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nom de l'attribut incorrect")) S POS=0 G DEPIL^%ANGEPIL
 S ATTR=VAL
 S A=$$RED(SA,4)
 I A=0 S ORD="" G ACQU6
 D EMPIL^%ANGEPIL("ACQU5^%ANARB15") G INT^%ANARBR2
ACQU5 G:'(POS) DEPIL^%ANGEPIL
 S ORD=VAL
ACQU6 S VAL=$S(ORD'="":$$^%QSCALIN(REPI,INDV,ATTR,ORD),$$OAIR^%QSGE5(REPI,INDV,ATTR,1):$$^%QSCALIN(REPI,INDV,ATTR,1),1:$$^%QSCALVA(REPI,INDV,ATTR))
 D:AFF'="" @(AFF_"("_$$S1^%QZCHAD(ATTR)_","_$$S1^%QZCHAD(VAL)_")")
 G DEPIL^%ANGEPIL
 
 
SUBST 
 K @(TEMPO) S @TEMPO@(1)="AT",@TEMPO@(2)="IN",@TEMPO@(3)="VAR",@TEMPO@(4)="REP"
 S @TEMPO@(5)="E1",@TEMPO@(6)="E2",@TEMPO@(7)="SA",@TEMPO@(8)="VALE"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("SUBST1^%ANARB15") G INT^%ANARBR2
SUBST1 G:'(POS) DEPIL^%ANGEPIL
 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S VALE=VAL,A=$$RED(SA,2) D EMPIL^%ANGEPIL("SUBST2^%ANARB15") G INT^%ANARBR2
SUBST2 G:'(POS) DEPIL^%ANGEPIL
 I VAL="" S POS=0 G DEPIL^%ANGEPIL
 S E1=VAL,A=$$RED(SA,3) D EMPIL^%ANGEPIL("SUBST3^%ANARB15") G INT^%ANARBR2
SUBST3 G:'(POS) DEPIL^%ANGEPIL
 S E2=VAL
 S VAL=$$ZSUBST^%QZCHSUB(VALE,E1,E2)
 G DEPIL^%ANGEPIL
 Q
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

