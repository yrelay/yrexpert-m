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

;%VGETPAG^INT^1^59547,74035^0
GEGETPAG(TVL,GLA,VIS) 
 N PG,LC,XDEB,YDEB,XFIN
 F IT="PG","LC","XDEB","YFIN","XFIN","YDEB" S %U=@TVL@(IT),@IT=%U
 S FC=VAL("VAL",1),@GLA@("MOV",PG,LC,XDEB)=FC,LFLD=(XFIN-XDEB)+1,FLD="",NU="",@GLA@("PFC",FC,PG,LC)=1
 F %U=1:1 S NU=$O(@TVL@("VAL",NU)) Q:NU=""  S VL=@TVL@("VAL",NU) D TR
 S @GLA@("AFF",PG,LC,XDEB)=FLD,@GLA@("PFC",FC,PG,LC)=1 D ECR S LC=LC+1 I LC>YFIN S PG=PG+1,LC=YDEB,FLD="" D EFF
 S @GLA@("PCOUR")=PG,@GLA@("LCOUR")=LC,@TVL@("PG")=PG,@TVL@("LC")=LC Q
TR I FLD="" S FLD=FLD_VL G FTR
 S LG=($L(FLD)+$L(VL))+2 I LG<LFLD S FLD=FLD_"  "_VL G FTR
 S @GLA@("AFF",PG,LC,XDEB)=FLD,@GLA@("PFC",FC,PG,LC)=1 D ECR S LC=LC+1 I LC>YFIN S PG=PG+1,LC=YDEB,FLD="" D EFF
 S FLD="  "_VL
FTR Q
ECR G FTR:'(VIS) S DX=XDEB,DY=LC X XY W FLD G FTR
EFF G FTR:'(VIS) D NET^%VEFFSCR(XDEB,YDEB,XFIN,YFIN) G FTR
NET(GLA,FC) 
 N PG,LC S PG=""
LPG S PG=$O(@GLA@("PFC",FC,PG)) G FTR:PG="" S LC=""
LLC S LC=$O(@GLA@("PFC",FC,PG,LC)) G LPG:LC=""
 K @GLA@("AFF",PG,LC),@GLA@("MOV",PG,LC) G LLC

