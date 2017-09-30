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

;TOPARGET^INT^1^59547,74874^0
TOPARGET ;
 
 D ^TOIMPIMP G:%ABEND=1 FIN
 D POCLEPA^%VVIDEO W "Un instant..."
 S PAR=-1 F %GG=1:1 S PAR=$N(^DON($I,PAR)) Q:PAR=-1  S NUM=^DON($I,PAR),VAL=^VALPAR($I,PAR) I VAL'="" S DON(NUM)=VAL
 S PARA=-1
 S PAG=-1 F %GG=1:1 S PAG=$N(^POSENR($I,PAG)) G:PAG=-1 FIN S LIG=-1 F %FF=1:1 S LIG=$N(^POSENR($I,PAG,LIG)) Q:LIG=-1  S CH=^POSENR($I,PAG,LIG),TYP=$P(CH,"^",2),PARB=$P(CH,"^",1) I TYP'["E" S PARA=^POSFUL($I,PAG,LIG) D TRAIT
TRAIT I PARA["'" D RL G END
 I '($D(^DON($I,PARA))) S VPA=^VALPAR($I,PARA) I VPA'="" S ^V($I,YA,PARA)=VPA,^[QUI]TVPAR(NUFA,TWREF,PARA)=VPA,^[QUI]RAISON(NUFA,TWREF,PARA)="IMPLICITE MODIFICATION" I $D(^[QUI]EXPGIMP(PARA,VPA))!$D(^[QUI]IGNORER(YA,PARA,VPA)) S %MODA="ART" D ^TO3PASYS
END Q
RL G:^VALPAR($I,PARB)="" END S REF="" F %HH=1:1:3 S REF=","""_$S($P(PARA,"'",%HH)="":YA,1:$P(PARA,"'",%HH))_""""_REF
 S REF=""""_$I_""""_REF,@("^VBIS("_REF_")")=^VALPAR($I,PARB) G END
FIN D CLEPAG^%VVIDEO,^TOTCADRE K %FF,%HH,%IFLAG,%PAR,CTRLP,CTRLR,FPARAM,LPG,PARB,CH,TYP,PAR,VAL,PARA,%GG,VPA,PAG,LIG Q

