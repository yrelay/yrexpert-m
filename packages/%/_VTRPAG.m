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

;%VTRPAG^INT^1^59547,74036^0
GETRPAG(TRA) 
 S NBPG=$ZP(^GEPAG($I,SCR,TPIL,"AFF",""))
 S ^%VLIS($J,1)="CTRLE^CTRLE",^%VLIS($J,2)="Page^PGE",^%VLIS($J,3)="+^PL",^%VLIS($J,3,"EQU")="=",^%VLIS($J,4)="-^MS",^%VLIS($J,5)="CTRLA^CTRLA"
 S PAG=1 D AFF
SEL D ^%VQUIKMN(%LIXG+1,%LIXD-1,%LIYB-1,"^%VLIS($J)",.ST,.CTR) G CTRLE:CTR="E",CTRLA:CTR="A",SEL:ST="",@ST
CTRLE S TBMOV="^GEPAG($I,SCR,TPIL,""MOV"",PAG)",PY=$O(@TBMOV@("")) G CTRLA:PY="" S PX=$O(@TBMOV@(PY,"")) G CTRLA:PX=""
LEC S DX=PX,DY=PY D ^%VZEREVS S PX=$X,PY=$Y G SEL:X1=1,OK:X1=13,LEC
OK S TRA=@TBMOV@(PY,PX) G FIN
CTRLA S TRA="CTRLA" G FIN
PL S NEW=PAG+1 G:'($D(^GEPAG($I,SCR,TPIL,"AFF",NEW))) SEL S PAG=NEW D AFF G SEL
MS S NEW=PAG-1 G:'($D(^GEPAG($I,SCR,TPIL,"AFF",NEW))) SEL S PAG=NEW D AFF G SEL
PGE D EFF^%VGENMEN S DX=PX,DY=PY X XY W "Page : " S DX=$X D ^%VLEC G:Y1="" SEL G:'($D(^GEPAG($I,SCR,TPIL,"AFF",Y1))) PGE S PAG=Y1 D AFF G SEL
AFF D NET^%VEFFSCR(%LIXG+2,%LIYH+2,%LIXD-2,%LIYB-2)
 S DY=-1 F %U=1:1 S DY=$N(^GEPAG($I,SCR,TPIL,"AFF",PAG,DY)) Q:DY=-1  S DX=-1 F %U=1:1 S DX=$N(^GEPAG($I,SCR,TPIL,"AFF",PAG,DY,DX)) Q:DX=-1  X XY W ^GEPAG($I,SCR,TPIL,"AFF",PAG,DY,DX)
FIN Q

