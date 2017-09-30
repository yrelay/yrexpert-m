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

;%ABAFSSP^INT^1^59547,73863^0
%ABAFSSP ;
 
 S DYH=$S(%V="P":5,1:PSEP+2),DYB=$S(%V="P":PSEP,1:21),DXG=0,DXD=79,DE=DYH-1,FI=DYB-1 D LWIN^%VVIDEO
 S DX=9 F DY=DE:1:FI X XY W LIG3
FREQ1 S NBV=0,DX=0,DA=$S(%V="P":%DH,1:%DB),DB=DA+$S(%V="P":3,1:PSEP),DC=DB,FN=$S(%V="P":%PH,1:%PB)+DB F UU=0:0 S DC=$N(^[QU]STRUCT(NOMG,2,%V,DC)) Q:DC=-1  Q:DC>FN  S NBV=NBV+1,DY=DC-DA X XY W ^[QU]STRUCT(NOMG,2,%V,DC)
 K EXICOM S LI=-1,TOC="^[QUW]OCGRIL(NOMG,%NORM,DP)" D BLD^%VVIDEO S:'($D(NOMGC)) NOMGC=NOMG_"/COMMENT"
 S DA=$S(%V="P":%DH,1:%DB),DB=DA+$S(%V="P":3,1:PSEP),LI=DB,FN=$S(%V="P":%PH,1:%PB)+DB D AFF
 D NORM^%VVIDEO,GESCUR^%ABGTPAR S WH=%D,WBT=$S(%V="P":%CP,1:%CR),DY=$S(%V="P":3,1:PSEP),DX=0 I NOMG'["/COMMENT" X XY W "        " D BLK^%VVIDEO
 S CUM=^CUMUL($I,NOMG,%V,WH),MSG=CUM_"."_((WBT-NBV)-CUM)_"."_WBT,@("%R"_$S(%V="P":"H",1:"B"))=MSG,DX=7-$L(MSG) X XY W MSG D NORM^%VVIDEO
FIN K CUM,WH,WB,MSG,NBV,DA,DB,DC,DE,FI,FN,LI,II,TOC Q
AFF F II=1:1 S LI=$N(@TOC@(%V,LI)) Q:LI=-1  Q:LI>FN  S COLO=-1 F JJ=1:1 S COLO=$N(@TOC@(%V,LI,COLO)) Q:COLO=-1  S DY=LI-DA,DX=COLO,MSG=^[QUW]OCGRIL(NOMG,%NORM,DP,%V,LI,COLO) X XY W MSG
 Q

