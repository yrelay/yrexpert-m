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

;%VREADD^INT^1^59547,74036^0
VVREADD ;
 
 
DEL I ((PAGE=1)&((DX-1)<PCX))&(PCY=DY) D ^%VSQUEAK G LEC^%VREAD1
 
 I ((DX-1)'>%LGX)&(%YH=(DY-1)) D DELP G LEC^%VREAD1
 
 D PGD^%VREADG(DX,DY,PCX,PCY,%LGX,%LDX,%YH,%YB,NBC,PAGE,YG,.PG,.PD,.PG0,.PD0)
 D BOUT^%VREADG(DX,DY,%LGX,%LDX,%YB,NBC,YG,1,.TYPEB)
 S DX=DX-1,YG=PG0_$E(PG,1,$L(PG)-1)_PD_PD0 I VISU=1 D ZAVERTIS^%VREAD(YG),ZAVERTIS^%VREAD(PG),ZAVERTIS^%VREAD(PD) X XY
 S NBC=NBC-1
 
 
 I (TYPEB="L")&((PD_PD0)'="") D DELBL
 
 I DX'>%LGX S DX=%LDX-1,DY=DY-1 I (PD_PD0)="" D DELBL
 D ^%VREADW(PD_PD0_" ",DX,DY,%LGX,%LDX,%YB,1)
 X XY
 G LEC^%VREAD1
 
DELP 
 D UCONT^%VREADU(UCONT,0,"P",1,0,.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE)
 D PGD^%VREADG(DX,DY,PCX,PCY,%LGX,%LDX,%YH,%YB,NBC,PAGE,YG,.PG,.PD,.PG0,.PD0)
 S PG=$E(PG,1,$L(PG)-1)
 S YG=PG0_PG_PD_PD0
 S PG=$E(PG0,$L(PG0),$L(PG0))_PG
 S NBC=NBC-1
 I VISU=3 D ZAVERTIS^%VREAD(YG),ZAVERTIS^%VREAD(PG0),ZAVERTIS^%VREAD(PG),ZAVERTIS^%VREAD(PD)
 D AFFP^%VREAD1
 Q
 
DELL D UCONT^%VREADU(UCONT,0,"L",1,0,.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE)
 D ^%VREADW(PD_PD0_" ",DX,DY,%LGX,%LDX,%YB,1)
 X XY
 G LEC^%VREAD1
 
DELBL D UCONT^%VREADU(UCONT,1,"L",1,0,.DX,.DY,%LGX,%LDX,.%YB,.%YH,.PAGE)
 Q

