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

;%VREADG^INT^1^59547,74036^0
VVREADG ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PGD(DX,DY,PCX,PCY,%LGX,%LDX,%YH,%YB,NBC,PAGE,YG,PG,PD,PG0,PD0) 
 N LPG
 
 
 S:PAGE=1 LPG=$S(DY'=PCY:(((%LDX-PCX)+(((DY-PCY)-1)*((%LDX-%LGX)-1)))+DX)-%LGX,1:DX-PCX)
 
 S:PAGE'=1 LPG=((DX-%LGX)-1)+(((DY-%YH)-1)*((%LDX-%LGX)-1))
 S PD=$E(YG,NBC,999)
 S PG0=$E(YG,1,(NBC-LPG)-1)
 S PG=$E(YG,NBC-LPG,NBC-1)
 S PD0=""
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
PGDL(DX,DY,PCX,PCY,%LGX,%LDX,NBC,PAGE,YG,PGL,PDL) 
 S PDL=$$MIN((%LDX-DX)-1,($L(YG)-NBC)+1)
 S PGL=$S((PAGE=1)&(DY=PCY):DX-PCX,1:DX-%LDX)
 Q
MIN(A,B) Q:A<B A Q B
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
BOUT(DX,DY,%LGX,%LDX,%YB,NBC,YG,MODE,TYPE) 
 N LPD,VISU
 S VISU=0
 
 S LPD=($L(YG)-NBC)+1
 
 
 
 I VISU D ZAVERTIS("LPD "_LPD_" MODE "_MODE_" %LDX "_%LDX_" DX "_DX_" DY "_DY_" %YB "_%YB)
 I (LPD-MODE)=(%LDX-DX) S TYPE=$S(MODE=0:"P",1:"L") D:VISU ZAVERTIS("A") Q
 
 I (((LPD-MODE)-(%LDX-DX))#((%LDX-%LGX)-1))'=0 S TYPE="" D:VISU ZAVERTIS("B") Q
 
 I (((LPD-MODE)-(%LDX-DX))\((%LDX-%LGX)-1))=((%YB-DY)-1) S TYPE=$S(MODE=0:"P",1:"L") D:VISU ZAVERTIS("C") Q
 
 S TYPE=$S(MODE=0:"P",1:"L") D:VISU ZAVERTIS("D")
 Q
ZAVERTIS(A) 
 N DX,DY D ^%VZEAVT(A) Q
 
 
 
 
 
 
 
 
NL(YG,NBC,%LGX,%LDX) 
 N A,B
 S A=$L($E(YG,NBC+1,9999)),B=(%LDX-%LGX)-1
 Q (A\B)+((A#B)'=0)

