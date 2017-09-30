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

;%VMOVMAS^INT^1^59547,74035^0
GEMOVMAS(IK,COD) 
 S DX=^MASQUE(SCR,"DESCC",%PI,IK,2),DY=^MASQUE(SCR,"DESCC",%PI,IK,3)
 S TBMOV="^MASQUE(SCR,""WAY"",%PI)" G @COD
66 S DX=DX-1
661 S DY=$O(@TBMOV@(DY)) G:DY="" 661
67 S DX=$O(@TBMOV@(DY,DX)) G:DX="" 661 G TEST
65 S DX=DX+1
651 S DY=$ZP(@TBMOV@(DY)) G:DY="" 651
68 S DX=$ZP(@TBMOV@(DY,DX)) G:DX="" 651 G TEST
TEST I $D(^MASQUE(SCR,"DESCC",%PI,IK,"PATOUCH")),^MASQUE(SCR,"DESCC",%PI,IK,"PATOUCH")=1 G @COD
 N %V S %V=@TBMOV@(DY,DX) Q %V
FIN K VU Q IK
REF K VU Q 0
INIT(%PI) K VU S TBMOV="^MASQUE(SCR,""WAY"",%PI)"
 S DY=$O(@TBMOV@("")) Q:DY="" 1
 S DX=$O(@TBMOV@(DY,"")) Q:DX="" 1
 N %V S %V=@TBMOV@(DY,DX) Q %V
 
 G FIN

