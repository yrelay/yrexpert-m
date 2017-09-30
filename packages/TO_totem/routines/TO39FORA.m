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

;TO39FORA^INT^1^59547,74869^0
TO39FORA ;
 
 S %BLOC=0 I ADEL["FORMU",XDP[":" S %BLOC=1 G END
 D CORRECT^%ABRECPO I CORRECT=0 S AEXEC=0 G END
 S XPX=1,AEXEC=1,IKS=$N(T(-1)),VI=1 F IH=0:0 S IK=IKS,IKS=$N(T(IK)) Q:IKS=-1  I IKS'=(IK+1) S PCH=$E(XDP,IK+1,IKS-1) W "*" D ABREV
 Q
ABREV I PCH["'" S BES($$^%QZCHW("IMPLICI"),PCH)=1 D ^TO39LATF Q
 I $E(PCH,1)="""" S PCH=$P($E(PCH,2,299),"""",1),CONCUR=0 G ZERO
 D TO^%QZNBN1 G:ISNUM=1 ESTENT
 G:$D(^[QUI]FULL(WB1,PCH)) FIN I (PCH["~")&(WB2'["~") S CONCUR=0 G ZERO
 D ^%ABRECIN I %UNK S CONCUR=0 G ZERO
 S ^[QUI]RANG(ARTI,WB2)=1 G FIN
ZERO I CONCUR=0 G CONCAT
FIN S BES($$^%QZCHW("IMPLICI"),PCH)=1,CONCUR=1,PCHCOMP=PCH D ^TO39KEMP S %BIL=PCHCOMP,%PYT=$$^%QZCHW("P") D ^%ABLIBTY
FIN1 S %RL=0,VPOL(XPX)="^V($I,YA,"""_PCHCOMP_""")",XPX=XPX+1 Q
ESTENT S VPOL(XPX)=PCH,XPX=XPX+1 Q
END Q
CONCAT I $E(PCH,1)="$" S VPOL(XPX)=PCH,XPX=XPX+1 G END
 I NOLIT=1 D ^%ABLIEU S ^[QUI]UNKN(WB1,PCH,$E(PCH,1,2)_$R(10000))=ADEL_$$^%QZCHW(" ")_FFF,PCHCOMP=PCH D DEB^TO39KEMP S %BIL=PCH,%PYT="UP" D ^%ABLIBTY G FIN1
 S VPOL(XPX)=""""_PCH_"""",XPX=XPX+1,%BIL=PCH,%PYT=$$^%QZCHW("C") D ^%ABLIBTY G END

