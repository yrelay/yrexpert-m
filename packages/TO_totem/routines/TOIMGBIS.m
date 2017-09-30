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

;TOIMGBIS^INT^1^59547,74872^0
TOIMGBIS ;
 
 S $ZT="",NTABN="IMPLICITES 2eme",NCLE=3,PNUM=2,F1=18,NFOR=1,NTRI="",PARA=" ",CONDIT=0
 S DD=-1 F UU=0:0 S DD=$N(^[QUI]TBNOM(NUFA,DD)) G:DD=-1 FIN S YA=$P(^[QUI]TBNOM(NUFA,DD),"^",1) I $D(^[QUI]IMPBIS(YA)) D:$D(TBMEM(DD)) ^TORESV D LOPAR D:$D(TBMEM(DD)) ^TOTBMEM
LOPAR S S=DD,NTRI=$O(^[QUI]IMPBIS(YA,NTRI)) G:NTRI="" FIN
 S PRX=^[QUI]IMPBIS(YA,NTRI),SOURCE=$E(PRX,2,$L(PRX)-1) G:($P(PRX,",",2)=PARA)&(CONDIT=1) LOPAR D:($P(PRX,",",2)'=PARA)&$D(^[QUI]UNDEFCI(PARA)) AVERTI S ^[QUI]UNDEFCI($P(PRX,",",2))=1 D TESCOND G LOPAR
TESCOND S $ZT="COND^TOERRIMP",PARA=$P(PRX,",",2),PARAP=$P(PARA,"""",2),ATEST="^[QUI]CIMPLICI"_PRX,@("CONDIT="_@ATEST) Q:CONDIT=0  K ^[QUI]UNDEFCI(PARA)
 S $ZT="AFF^TOERRIMP",^[QUI]RAISON(NUFA,S,PARAP)="^[QUI]IMPLICI"_PRX,AFFECT="^[QUI]AIMPLICI"_PRX,@("^V($I,YA,PARAP)="_@AFFECT),^[QUI]TVPAR(NUFA,S,PARAP)=^V($I,YA,PARAP) Q
FIN K ^[QUI]UNDEFCI Q
AVERTI D POCLEPA^%VVIDEO,^%VSQUEAK W "* ",PARA,$$^%QZCHW(" * non defini, nous aurons peut-etre des problemes") H 3 Q

