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

;%ABEV05^INT^1^59547,73864^0
%ABEV05 ;
 
OK K VALRET,B,NOM,GRIL,^VPAR($I) F %V=0,1 S PARA=-1 F %U=1:1 S PARA=$N(^GRIL($I,%V,PARA)) Q:PARA=-1  S ^VPAR($I,PARA)=^GRIL($I,%V,PARA)
 S PARA=$N(^[QUW]TOCPVCOL(NUGR,OK(1),PARA)) Q:PARA=-1  S V1=^[QUW]TOCPVCOL(NUGR,OK(1),PARA),PAG=$P(V1,"|",2)
OK2 S %NORM=NORM,DP=$P(PAG,"/",1),XX=$P(PAG,"/",2),QU=QUW,NT="^[QU]STRUCT(NOMG)" D CLEPAG^%VVIDEO,CAG^%VVIDEO,132^%VVIDEO,CAG^%VVIDEO W ?20,$$^%QZCHW("Valeurs determinees") D BEG^%ABGTPAR,^%ABAFGRI,^%ABEMPGR
 D BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO S %LL="",DY=-1,DX=XX
 S DPP=DP+$S(DX=10:0,DX=33:1,1:2),AFF=DPP,LAF=$L(AFF)+1 F UU=LAF:1:LCHP S AFF=AFF_" "
 S DY=2 X XY W AFF
 D NORM^%VVIDEO S DX=90,DY=4 X XY W $$^%QZCHW("Parametres Proposes :"),!,! S DY=$Y,PARA=-1 F UU=0:0 S PARA=$N(^VPAR($I,PARA)) Q:PARA=-1  X XY W $S(^VPAR($I,PARA)="":$$^%QZCHW("Quelque soit ")_PARA,^VPAR($I,PARA)="   ":PARA_$$^%QZCHW(" : ""TOUS"""),1:PARA_" : "_^VPAR($I,PARA)) S DY=DY+1
 S AW=$$^%QZCHW("partie basse"),%V="P",%NORM=NORM,%IDENT=IDENT D SSMEN^%ABMOCUR
 D 80^%VVIDEO,CLEPAG^%VVIDEO Q

