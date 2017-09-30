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

;%QSDAPRM^INT^1^59547,73881^0
QSDAPRM ;
 
 
 
 
 
CDATE(DAT1,DAT2,COMP) 
 Q:COMP="=" $$EG(DAT1,DAT2)
 Q:COMP="<" $$INF(DAT1,DAT2)
 Q:COMP=">" $$SUP(DAT1,DAT2)
 Q:COMP="'=" $$NONEG(DAT1,DAT2)
 Q:COMP="'<" $$NONINF(DAT1,DAT2)
 Q:COMP="'>" $$NONSUP(DAT1,DAT2)
 
EG(DA1,DA2) 
 N DI1,DI2,D1,D2
 
 S DA1=$TR(DA1,",","."),DA2=$TR(DA2,",",".")
 S DI1=$P(DA1,"/",1),DI2=$P(DA1,"/",2)
 S D1=$P(DA2,"/",1),D2=$P(DA2,"/",2)
 I (DI2>D1)&(DI1<D2) Q 1
 Q 0
 
INF(DA1,DA2) 
 N DI2,D1
 
 S DA1=$TR(DA1,",","."),DA2=$TR(DA2,",",".")
 S DI2=$P(DA1,"/",2)
 S D1=$P(DA2,"/",1)
 
 I DI2'>D1 Q 1
 Q 0
 
SUP(DA1,DA2) 
 N DI1,D2
 
 S DA1=$TR(DA1,",","."),DA2=$TR(DA2,",",".")
 S DI1=$P(DA1,"/",1)
 S D2=$P(DA2,"/",2)
 I DI1'<D2 Q 1
 Q 0
 
NONEG(DA1,DA2) 
 Q '($$EG(DA1,DA2))
 
NONSUP(DA1,DA2) 
 Q '($$SUP(DA1,DA2))
 
NONINF(DA1,DA2) 
 Q '($$INF(DA1,DA2))
 ;

