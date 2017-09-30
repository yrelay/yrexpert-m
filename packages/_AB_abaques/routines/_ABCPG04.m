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

;%ABCPG04^INT^1^59547,73864^0
%ABCPG04 ;
 
GETVAL S COL=$S(XX=10:0,XX=33:1,1:2)+DP,NBPAR=^[QUW]PARAGRIL(NUGR)
 S NBNUL=0,%TS="z",%STOP=0 F %VV="P","R" S LIG=-1 F MM=0:0 S LIG=$N(^LIGSCRC($I,%VV,LIG)) Q:LIG=-1  S PARA=^LIGSCRC($I,%VV,LIG,"P"),NCAZ=NCAZ+1 G:(%VV="R")&(%STOP=1) END D TRAIV
 G END
TRAIV S AVORT=0 G @%VV
R I NBNUL'<NBPAR K ^PARA($J,COL) G END
 I '($D(@TB@(DP,%VV,LIG,XX))) S ^[QUW]TOCPVCOL(NUGR,COL,PARA)=$$^%QZCHW("Indefini|")_DP_"/"_XX W "." G END
 S ^[QUW]TOCPVCOL(NUGR,COL,PARA)=@TB@(DP,%VV,LIG,XX)_"|"_DP_"/"_XX W "." G END
P S AN=$S(^LIGSCRC($I,%VV,LIG)=1:"N",1:"A")
 I '($D(@TB@(DP,%VV,LIG,XX))) S LIB=$S(AN="A":"z",1:"z,z"),NBNUL=NBNUL+1 G ZZ
 S LIB=$$GETLBLAN^%VTLBLAN(@TB@(DP,%VV,LIG,XX)) I LIB="" S NBNUL=NBNUL+1,LIB=$S(AN="A":"z",1:"z,z") G ZZ
 I (LIB=$$^%QZCHW("TOUS"))!((LIB=$$^%QZCHW("TOUTES"))!(LIB=$$^%QZCHW("SINON"))) S VAL=%TS,LIB=$S(AN="A":"z",1:"z,z") G ZZ
 I ^LIGSCRC($I,%VV,LIG)=1 D BRAQ G END
ZZ S ^PARA($J,COL,AN,PARA)=LIB,VAL=LIB S:(AN="A")&(LIB'="z") ^[QUW]TOCPVPAR(NUGR,PARA,LIB,COL)=1 G END
VSUP S VBORN=VSUP D DECI S VSUP=VSUP-DECI Q
VINF S VBORN=VINF D DECI S VINF=VINF+DECI Q
DECI I VBORN'["." S DECI=1/1000000 Q
 S DECI=("."_$P(VBORN,".",2))+0,LD=$L($P(DECI,".",2))+6,PUD=1 F %U=1:1:LD S PUD=PUD*10
 S DECI=1/PUD Q
BRAQ S CPG="",CPD="",BRAQ=LIB,MEMBG=$P(BRAQ,",",1),MEMBD=$P(BRAQ,",",2),(PCH,VSUP)=$E(MEMBD,1,$L(MEMBD)-1) D TO^%QZNBN1 D:'(ISNUM) ERROR^%ABCPG02 S CPD=$E(MEMBD,$L(MEMBD)) D:CPD="[" VSUP G:%SCPR="N" BRAQS
 
BRAQS S:MEMBG["==>" MEMBG="*-99999999" S VINF=$E(MEMBG,2,299),PCH=VINF D TO^%QZNBN1 D:'(ISNUM) ERROR^%ABCPGEX S CPG=$E(MEMBG,1) D:CPG="]" VINF
 S ^[QUW]TOCPBORN(NUGR,PARA,"I",VINF+0)=1,^[QUW]TOCPBORN(NUGR,PARA,"S",VSUP+0)=1,^PARA($J,COL,"N",PARA)=(VINF+0)_","_(VSUP+0)
END Q

