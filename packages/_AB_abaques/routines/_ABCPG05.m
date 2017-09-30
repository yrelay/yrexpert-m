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

;%ABCPG05^INT^1^59547,73864^0
%ABCPG05 ;
 D COMPBN S COL=-1,TB="^[QUW]TOCPNUPL(NUGR"
LCOL S COL=$N(^PARA($J,COL)) G:COL=-1 FCOL S REF="",PARA=-1
LA S PARA=$N(^PARA($J,COL,"A",PARA)) G:PARA=-1 FA S VP=^PARA($J,COL,"A",PARA),REF=REF_","""_VP_"""" G LA
FA I '($D(^PARA($J,COL,"N"))) S @(TB_REF_")")=COL G LCOL
 K ^PNUM($J)
LN S PARA=$N(^PARA($J,COL,"N",PARA)) G:PARA=-1 FN S VP=^PARA($J,COL,"N",PARA),(BIN,BI)=$P(VP,",",1),BS=$P(VP,",",2),^PNUM($J,PARA,BI)=1 F %U=1:1 S BI=$N(^[QUW]TOCPBORN(NUGR,PARA,"I",BI)) Q:BI=-1  Q:BI>BS  S ^PNUM($J,PARA,BI)=1
 G LN
FN K ^PILP1($J),^PILP2($J) S PARA=$N(^PNUM($J,PARA)) Q:PARA=-1  S BI=-1 F %U=1:1 S BI=$N(^PNUM($J,PARA,BI)) Q:BI=-1  S ^PILP1($J,%U)=""""_BI_""""
 S PS="^PILP1($J)",PB="^PILP2($J)"
LP S PARA=$N(^PNUM($J,PARA)) G:PARA=-1 FP S BI=-1,%V=1 K @(PB)
LBI S BI=$N(^PNUM($J,PARA,BI)) G:BI=-1 FBI S NU=-1
LNU S NU=$N(@PS@(NU)) G:NU=-1 LBI S RC=@PS@(NU),RC=RC_","""_BI_"""",@PB@(%V)=RC,%V=%V+1 W "." G LNU
FBI S %U=PS,PS=PB,PB=%U G LP
FP S NU=-1 F %U=1:1 S NU=$N(@PS@(NU)) Q:NU=-1  S RFC=REF_","_@PS@(NU),@(TB_RFC_")")=COL
 G LCOL
FCOL Q
COMPBN S PP=-1
F1 S PP=$N(^[QUW]TOCPBORN(NUGR,PP)) G:PP=-1 FF1 S TB="^[QUW]TOCPBORN(NUGR,PP)",BI=$O(@TB@("I","")) G:BI="" F1 S BS=$ZP(@TB@("I","")) G:BS="" F1 S BC=BI F %U=1:1 S BC=$O(@TB@("S",BC)) Q:BC=""  Q:BC>BS  S @TB@("I",BC)=1
 G F1
FF1 K PP,TB,BI,BS,BC Q

