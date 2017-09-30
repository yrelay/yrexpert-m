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

;%MZREGL^INT^1^59547,73872^0
MOZREGL ;
 
 
 
 
 
OPER 
 S (TCAX,LIK)=EDCL,YA=$$GI^%MZQS,OK=1
OPER1 S TCAX=$O(@%TT@($J,0,TCAX)) G FIN:TCAX="" S CLX=@%TT@($J,0,TCAX),PYTX=$P(CLX,"^",1) G FIN:PYTX=1,OPER1:PYTX'=2
 S CLX=$P(CLX,"^",2)
 
 
 
 
 S V(YA,"ACTION")=$$GETLBLAN^%VTLBLAN($P(CLX,$C(1),1))
 S V(YA,"OBJET")=$$GETLBLAN^%VTLBLAN($P(CLX,$C(1),2))
 S V(YA,"MANIERE")=$$GETLBLAN^%VTLBLAN($P(CLX,$C(1),3))
 S V(YA,"OUTIL")=$$GETLBLAN^%VTLBLAN($P(CLX,$C(1),4))
 S V(YA,"MACHINE")=RESUL(2)
 D ^%MZINEV G OPER1
ACTION 
 S (TCAX,LIK)=EDCL,YA=$$GI^%MZQS,OK=1
ACT1 S TCAX=$ZP(@%TT@($J,0,TCAX)) G FIN:TCAX="" S CLX=@%TT@($J,0,TCAX),PYTX=$P(CLX,"^",1) G ACT1:PYTX'=1
 S CLX=$P(CLX,"^",2)
 S V(YA,"ACTION")=RESUL(1)
 S V(YA,"OBJET")=RESUL(2)
 S V(YA,"MANIERE")=RESUL(3)
 S V(YA,"OUTIL")=RESUL(4)
 
 S V(YA,"MACHINE")=$$GETLBLAN^%VTLBLAN($P(CLX,$C(1),2))
 D ^%MZINEV
FIN 
 K PYTX,CLX,TCAX,V,^v(YA),^v($I) Q

