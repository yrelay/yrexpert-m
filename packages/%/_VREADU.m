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

;%VREADU^INT^1^59547,74036^0
VVREADU ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
UCONT(UCONT,BOUT,TYPE,MODE,NL,DX,DY,%LGX,%LDX,%YB,%YH,PAGE) 
 D:UCONT'="" @$$CONCAT^%QZCHAD(UCONT,"BOUT,.TYPE,MODE,NL,PAGE,.%YB,.%YH")
 
 I (BOUT=1)&(TYPE="P") S TYPE="" Q
 
 I ((TYPE="L")&(MODE=0))&(BOUT=0) S DX=%LGX+1,DY=DY+1 Q
 
 I ((TYPE="L")&(MODE=0))&(BOUT=1) Q
 
 I (TYPE="P")&(MODE=0) S PAGE=PAGE+1,DX=%LGX+1,DY=%YH+1 Q
 
 I ((TYPE="L")&(MODE=1))&(BOUT=0) S DX=%LDX-1,DY=DY-1 Q
 
 I ((TYPE="L")&(MODE=1))&(BOUT=1) Q
 
 I (TYPE="P")&(MODE=1) S PAGE=PAGE-1,DX=%LDX-1,DY=%YB-1 Q
 
 I TYPE="P2" S PAGE=1,DX=%LGX+1,DY=%YH+1 Q
 Q
 
 
UCONT1(BOUT,TYPE,MODE,PAGE,%YB,%YH) 
 N PLAN,PLAF
 S PLAN=15,PLAF=5,PLAFD=10
 
 
 I ((TYPE="P")&(MODE=0))&(%YB<PLAN) S %YB=%YB+1,TYPE="L" Q
 
 I (((BOUT=0)&(TYPE="P"))&(MODE=0))&(%YB'<PLAN) S %YH=PLAF,%YB=PLAF+2 Q
 
 
 
 I ((TYPE="P")&(MODE=1))&(PAGE'>2) S %YH=PLAFD,%YB=PLAN Q
 
 I ((TYPE="P")&(MODE=1))&(PAGE>2) S %YH=PLAF,%YB=PLAN Q
 
 I (TYPE="L")&(MODE=1) S %YB=%YB-1 Q
 S TYPE=""
 Q

