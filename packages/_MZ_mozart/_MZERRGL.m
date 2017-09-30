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

;%MZERRGL^INT^1^59547,73871^0
MOZERRGL ;
 
ADR S %YAERR=1,LLB=0 D ^%MZERRZE Q:%EXPLIC=0
ADR2 S $ZT="",DC=PNUM,TTAA="^[QUI]MOZREL"
 S %1AR=0,NOMTAB=TTAA,TTBB=TTAA,PAR=-1 D ^%VTNAMFU S:%NFU'="" TTAA=%NFU
 S CGRIL=@(TTAA_"("_SOURCE_")") Q
COND K ^EVERROR($I) S $ZT="" D CLEPAG^%VVIDEO,ADR G:%EXPLIC=0 RET S DXG=0,DYH=0,LH=80,LV=3 D CARS^%VVIDEO S MSG="Relation "_RI_"  """_IT1_"-"_IT2_"""",(DXI,DX)=40-($L(MSG)\2),DY=1,DX=DX-4 X XY D G0ON^%VVIDEO W "```" D G0OFF^%VVIDEO
 S DX=DXI X XY D BLD^%VVIDEO W MSG D NORM^%VVIDEO,G0ON^%VVIDEO W " ```" S DXG=0,DYH=3,LH=80,LV=9 D CARS^%VVIDEO
 S DY=5,DX=5 X XY W "Conditionnement : " S DX=2,DY=DY+2 X XY
 F CAS=1:1 S ITEM=$P(CGRIL,"^",DC) Q:ITEM=""  D AFFI
 S DXG=0,DYH=12,LH=80,LV=11 D CARS^%VVIDEO G FIN
AFFI I ((CAS-1)#4)=0 D 1^%MZVSFSU S PO=5 G AFFJ
 I ((CAS-3)#4)=0 D 2^%MZVSFSU S PO=46 G AFFJ
 I ((CAS-2)#4)=0 S PO=43
 I ((CAS-4)#4)=0 S PO=75
AFFJ D:ITEM["??" INCO S DX=PO X XY W $S(PO=5:$J(ITEM_" ",37),1:ITEM_" ") D NORM^%VVIDEO S DC=DC+1 I (CAS#4)=0 S DY=DY+1 X XY
 Q
FIN 
 S $ZT=""
 D ^%MZERROR S OK=0
RET K %TBVAL,EXPAF,EXP,TTBB
 S:$D(OLDU) U=OLDU K OLDU D CLEPAG^%VVIDEO
 D STAT1^%MZWORD G @ADERROR
INCO S METI=$S(ITEM[" (":$P(ITEM," (",1),1:$P(ITEM,"  ",1)),AAYY=-1 F %AY=1:1 S AAYY=$N(^v($I,AAYY)) Q:AAYY=-1  G:$D(^v($I,AAYY,METI)) END
 S ^EVERROR($I,METI)=1 X XY D BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO Q
END Q

