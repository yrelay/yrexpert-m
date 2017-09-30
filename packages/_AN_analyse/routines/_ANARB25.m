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

;%ANARB25^INT^1^59547,73866^0
%ANARB25 ;
 
 
 
 
ERR S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D ADD^%TLIFEN("LOG","  "_MSG)
 G DEPIL^%ANGEPIL
 
 
RACCOR 
 K @(TEMPO)
 S @TEMPO@(1)="P1",@TEMPO@(2)="P2",@TEMPO@(3)="P3",@TEMPO@(4)="P4",@TEMPO@(5)="P5",@TEMPO@(6)="P6",@TEMPO@(7)="P7",@TEMPO@(8)="P8",@TEMPO@(9)="P9"
 S @TEMPO@(10)="SA",@TEMPO@(11)="SYNT",@TEMPO@(12)="OK",@TEMPO@(13)="POP",@TEMPO@(14)="NUM",@TEMPO@(15)="RES",@TEMPO@(16)="MSG",@TEMPO@(17)="I",@TEMPO@(18)="VALPAR"
 D EMPV^%ANGEPIL(TEMPO)
 S I=0
 S SA=A
PARR 
 S I=I+1
 S A=$$RED(SA,I)
 D EMPIL^%ANGEPIL("FRA^%ANARB25") G INT^%ANARBR2
FRA 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer")_" "_I_"eme "_$$^%QZCHW("parametre") G ERR
 S VALPAR=$S($$NUM^%QZNBN(VAL)=1:VAL,1:""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""")
 S @("P"_I)=VALPAR
 I I'=9 G PARR
 
ANAR 
 D EMPIL^%ANGEPIL("ANAR0^%ANARB25") G CONDIT^%ANARB23
ANAR0 
 S SYNT="RACCORDEMENT ; "_P4_" ; "_P5_" ; "_P6_" ; "_$E(P7,2,$L(P7)-1)_" ; "_P8_" ; "_$E(P9,2,$L(P9)-1)_COND
 G ANAL^%ANARB23
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

