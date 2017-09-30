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

;%ANARB28^INT^1^59547,73866^0
%ANARB28 ;;04:37 PM  17 Dec 1991;
 
 
 
 
 
SOLVE K @(TEMPO) S @TEMPO@(1)="REP",@TEMPO@(2)="IND",@TEMPO@(3)="DOM",@TEMPO@(4)="BUT",@TEMPO@(5)="A",@TEMPO@(6)="SA"
 
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(SA,1) D EMPIL^%ANGEPIL("RET1^%ANARB28") G INT^%ANARBR2
RET1 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le repertoire de l'individu")) G ERR
 I VAL="" S REP=CXT("@","BASE") G RET10
 S REP=$$NOMINT^%QSF(VAL) I REP="" D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Repertoire de l'individu")) G ERR
RET10 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("RET2^%ANARB28") G INT^%ANARBR2
RET2 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le nom de la l'individu")) G ERR
 I VAL="" S REP=CXT("@","OBJET") G RET20
 S IND=VAL I '($$IR^%QSGEST5(REP,IND)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Individu inconnu")) G ERR
RET20 S A=$$RED(SA,3) D EMPIL^%ANGEPIL("RET3^%ANARB28") G INT^%ANARBR2
RET3 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le domaine")) G ERR
 S DOM=VAL
 S A=$$RED(SA,4) D EMPIL^%ANGEPIL("RET4^%ANARB28") G INT^%ANARBR2
RET4 I (VAL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible identifier le predicat but")) S VAL="",POS=0 G ERR
 S BUT=VAL
 D SAUVECR^%TLUTIL
 S VAL=$$RUN^%PSDKB2(REP,IND,DOM,BUT,MODAF'=0,1,.CXT)
 D CLEPAG^%VVIDEO,RESTECR^%TLUTIL
 D DEPV^%ANGEPIL
 G DEPIL^%ANGEPIL
 
ERR S VAL="",POS=0 D DEPV^%ANGEPIL G DEPIL^%ANGEPIL
 
 
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

