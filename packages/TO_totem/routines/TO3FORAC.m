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

;TO3FORAC^INT^1^59547,74870^0
TO3FORAC ;
 
 S %BLOC=0 I ADEL["FORMU",XDP[":" S %BLOC=1 G END
 D CORRECT^%ABRECPO I CORRECT=0 S AEXEC=0 G END
 S XPX=1,AEXEC=1,IKS=$N(T(-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(T(IK)) Q:IKS=-1  I IKS'=(IK+1) S PCH=$E(XDP,IK+1,IKS-1) W "*" D ABREV S VPOL(XPX)=VXPX,XPX=XPX+1
 D ^%ABRECON G KILL Q
ABREV S ROPC="^TO3FORAC" G:$E(PCH,1)="""" PCH
 I PCH["'" S BES("IMPLICI",PCH)=1 D ^%ABLATFO Q
 I PCH["~" D IND^%ABANABR Q
PCH D ^%ABANABR G @AD
CONT G FIN
ZERO I CONCUR=0 G CONCAT
FIN S BES("IMPLICI",PCH)=1,CONCUR=1,PCHCOMP=PCH,%RL=0 D:$D(^[QUI]RANG(WB1,PCHCOMP)) ^%AB3IMPI S VXPX="^V($I,YA,"""_PCHCOMP_""")",%BIL=PCHCOMP,%PYT="P" D ^%ABLIBTY Q
ESTENT S VXPX=PCH Q
QUIT Q
END Q
CONCAT I $E(PCH,1)="$" S VXPX=PCH G END
 G TPCT:ETUD="TPCTGAM",LIT0:NOLIT=0
KNU S ^[QUI]UNKN(WB1,PCH,$E(PCH,1,2)_$R(10000))=ADEL_" "_FFF,PCHCOMP=PCH D DEB^%AB3KEMP S VXPX="^V($I,YA,"""_PCHCOMP_""")",%BIL=PCHCOMP,%PYT="UP" D ^%ABLIBTY G END
TPCT F IT=$$^%QZCHW("DUREE.PREPARATION"),$$^%QZCHW("COUT.PREPARATION"),$$^%QZCHW("COUT.UNITAIRE"),$$^%QZCHW("DUREE.UNITAIRE") G:PCH=IT FIN
 G FIN:$D(^AUTREFO($J,PCH)),KNU
LIT0 S VXPX=""""_PCH_"""",%BIL=PCH,%PYT="C" D ^%ABLIBTY G END
KILL K CORRECT,IH,IK,IKS,NOLIT,VI,XPX Q

