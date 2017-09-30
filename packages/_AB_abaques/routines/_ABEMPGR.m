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

;%ABEMPGR^INT^1^59547,73864^0
%ABEMPGR ;
 
 K COMEXI,EXICOM S LI=-1,TOC="^[QUW]OCGRIL(NOMG,%NORM,DP)" D BLD^%VVIDEO S:'($D(NOMGC)) NOMGC=NOMG_"/COMMENT"
 F %V="P","R" S %W=$S(%V="P":"R",1:"P"),DA=$S(%V="P":%DH,1:%DB),DB=DA+$S(%V="P":3,1:PSEP),LI=DB,FN=$S(%V="P":%PH,1:%PB)+DB D AFF
 G RET
AFF F II=1:1 S LI=$N(@TOC@(%V,LI)) Q:LI=-1  Q:LI>FN  S COLO=-1 F JJ=1:1 S COLO=$N(@TOC@(%V,LI,COLO)) Q:COLO=-1  D AFF1
 Q
AFF1 S COMEXI(COLO)=1 S:$D(^[QUW]OCGRIL(NOMGC,%NORM,DP,%V,LI,COLO))!$D(^[QUW]OCGRIL(NOMGC,%NORM,DP,%W,LI,COLO)) EXICOM(COLO)=1 S DY=LI-DA,DX=COLO,MSG=^[QUW]OCGRIL(NOMG,%NORM,DP,%V,LI,COLO) X XY W MSG
 Q
RET D NORM^%VVIDEO S COLO=-1 F II=1:1 S COLO=$N(COMEXI(COLO)) Q:COLO=-1  S DY=2,DX=COLO+(LCHP\2) X XY W $S($D(EXICOM(COLO)):"-c-",1:"   ")
 K COMEXI,EXICOM,DA,DB,LI,FN,II,TOC,COLO,JJ D NORM^%VVIDEO Q

