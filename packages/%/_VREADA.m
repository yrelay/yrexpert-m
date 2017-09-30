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

;%VREADA^INT^1^59547,74036^0
VVREADA(UCONT,YG,NBC,DX,DY,%LGX,%LDX,%YB,%YH,PAGE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TYPE,MODE
 D BLD^%VVIDEO X XY W $E(YG,NBC,NBC) D NORM^%VVIDEO
 S DX=DX+1
 
LECB I DX<%LDX X XY Q
 
 I (DX'<%LDX)&((DY+1)<%YB) S DY=DY+1,DX=%LGX+1 X XY Q
 
 S TYPE="P",MODE=0
 D UCONT^%VREADU(UCONT,0,.TYPE,MODE,$$NL^%VREADG(YG,NBC,%LGX,%LDX),.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE)
 
 I TYPE="L" D ^%VREADW("",DX,DY,%LGX,%LDX,%YB,0) X XY Q
 
 D PGD^%VREADG(DX,DY,%LGX+1,%YH+1,%LGX,%LDX,%YH,%YB,NBC,PAGE,YG,.PG,.PD,.PG0,.PD0)
 D ^%VREADW(PG_PD,%LGX+1,%YH+1,%LGX,%LDX,%YB,0)
 X XY
 Q
 
REAFF(YG,NBC,DX,DY,%LGX,%LDX,%YB,%YH,PAGE) 
 N PG,PD,PG0,PD0
 D PGD^%VREADG(DX,DY,%LGX+1,%YH+1,%LGX,%LDX,%YH,%YB,NBC,PAGE,YG,.PG,.PD,.PG0,.PD0)
 I PAGE=1 D ^%VREADW(YG,%LGX+1,%YH+1,%LGX,%LDX,%YB,0) X XY Q
 
 D ^%VREADW(PG_PD,%LGX+1,%YH+1,%LGX,%LDX,%YB,0) X XY
 Q

