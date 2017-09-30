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

;%LXABR2^INT^1^59547,73870^0
%LXABR2 ;;03:50 PM  11 Dec 1992; ; 11 Dec 92  2:58 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SEARCHW(PCH,GLOB,TABRES) 
 N CH,%PCH,RES
 S @TABRES=0
 S CH="" F %CH=0:0 S CH=$O(@GLOB@(CH)) Q:CH=""  I $$CMPX(PCH,CH,"") S @TABRES@(CH)=RES,@TABRES=@TABRES+1
 Q
 
 
CMP(M1,M2) N J,K
 G:M1=M2 OK
 G:M1="" NOK
 I $E(M1)="*" S K=$L(M2)+1 F J=K:-1 G:J=0 NOK I $$CMP($E(M1,2,$L(M1)),$E(M2,J,$L(M2))) G OK
 I $E(M1)="#" S K=$F(M2,"."),K=$S(K=0:$L(M2)+1,1:K-1) F J=K:-1 G:J=0 NOK I $$CMP($E(M1,2,$L(M1)),$E(M2,J,$L(M2))) G OK
 I $E(M1)="?" G:M2="" NOK G:M2="." NOK G:$$CMP($E(M1,2,$L(M1)),$E(M2,2,$L(M2))) OK G NOK
 G:$E(M1)'=$E(M2) NOK G:$$CMP($E(M1,2,$L(M1)),$E(M2,2,$L(M2))) OK
NOK Q 0
OK Q 1
 
 
CMPX(M1,M2,VAL) N J,K
 I M1=M2 S RES=VAL G OKX
 G:M1="" NOKX
 I $E(M1)="*" S K=$L(M2)+1 F J=K:-1 G:J=0 NOKX I $$CMPX($E(M1,2,$L(M1)),$E(M2,J,$L(M2)),VAL_$E(M2,1,J-1)_"/") G OKX
 I $E(M1)="#" S K=$F(M2,"."),K=$S(K=0:$L(M2)+1,1:K-1) F J=K:-1 G:J=0 NOKX I $$CMPX($E(M1,2,$L(M1)),$E(M2,J,$L(M2)),VAL_$E(M2,1,J-1)_"/") G OKX
 I $E(M1)="?" G:M2="" NOKX G:M2="." NOKX G:$$CMPX($E(M1,2,$L(M1)),$E(M2,2,$L(M2)),VAL_$E(M2)_"/") OKX G NOKX
 G:$E(M1)'=$E(M2) NOKX G:$$CMPX($E(M1,2,$L(M1)),$E(M2,2,$L(M2)),VAL) OKX
NOKX Q 0
OKX Q 1
 
 
TEST N TEMP,RES,VAL
 S TEMP=$$TEMP^%SGUTIL,RES=$$TEMP^%SGUTIL
 S @TEMP@("ABANDON")="",^("CONS.MODIF.SUP.DE.GAMMES")="",^("CONS.MODIF.SUP.DE.REPERTOIRES")="",^("C.M.S.D.INDIVIDUS")="",^("TEST.NUMERO.1")="",^("TEST.NUMERO.2")="",^("TEST.NUMERO.20")="",^("ESSAI.NUMERO.1")="",^("ABCDEFG")="",^("LPDEML")=""
TBCL W !," a rechercher " R VAL Q:VAL=""
 K @(RES)
 D SEARCHW(VAL,TEMP,RES)
 S R="" F  S R=$O(@RES@(R)) Q:R=""  W !,R
 G TBCL

