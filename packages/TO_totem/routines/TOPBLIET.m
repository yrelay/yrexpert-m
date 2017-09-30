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

;TOPBLIET^INT^1^59547,74874^0
TOPBLIET ;
QUES S DILAV=0,NODEVI=SFA I NODEVI'["/" S NDV2=NODEVI G TR
 S NODEV=NODEVI,NODEVI=$P(NODEV,"/",1),NDV2=$P(NODEV,"/",2),NU1=+($E(NODEVI,8,11)),NU2=+($E(NDV2,8,11)),MO1=+($E(NODEVI,6,7)),MO2=+($E(NDV2,6,7)),AN1=+($E(NODEVI,4,5)),AN2=+($E(NDV2,4,5))
 D VALID G:'(VALID) FIN
 F %NN=1:1 Q:((NODEVI[NDV2)!(NODEVI=-1))!(NODEVI="z")  D STO S:NODEVI'="z" NODEVI=$N(^[QUI]TREEWORK(NODEVI)) S NU1=+($E(NODEVI,8,11)),MO1=+($E(NODEVI,6,7)),AN1=+($E(NODEVI,4,5)) D VALID Q:'(VALID)
TR F %NN=1:1 Q:((NODEVI'[NDV2)!(NODEVI=-1))!(NODEVI="z")  D STO S NODEVI=$N(^[QUI]TREEWORK(NODEVI))
FIN K NODEVI,NODEV,NDV2,NU1,NU2,MO1,MO2,AN1,AN2,%NN,%VW,VALID
 Q
VALID S VALID=1 S:AN2<AN1 VALID=0 I AN1=AN2 S:MO1>MO2 VALID=0 I MO1=MO2 D NVALI Q
NVALI Q:$E(NU1,1)<$E(NU2,1)  I $E(NU1,1)>$E(NU2,1) S VALID=0 Q
 Q:$E(NU1,2)<$E(NU2,2)  I $E(NU1,2)>$E(NU2,2) S VALID=0 Q
 Q:$E(NU1,3)<$E(NU2,3)  I $E(NU1,3)>$E(NU2,3) S VALID=0 Q
 Q:$E(NU1,4)<$E(NU2,4)  I $E(NU1,4)>$E(NU2,4) S VALID=0 Q
 Q
STO Q:NODEVI="z"  S TWREF=-1 F %TW=1:1 S TWREF=$N(^[QUI]TREEWORK(NODEVI,TWREF)) Q:TWREF=-1  S:$D(^[QUI]TVPAR(NODEVI)) DILAV=1,LG=LG+1,^SELEC($I,0,LG)=NODEVI_"^"_TWREF_"^"_$P(^[QUI]TREEWORK(NODEVI,TWREF),"^",10)
 Q

