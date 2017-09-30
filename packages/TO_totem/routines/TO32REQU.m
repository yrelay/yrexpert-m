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

;TO32REQU^INT^1^59547,74869^0
TO32REQU ;
 
 
 K ^EQUIVAL($I),^DESACOR($I)
 S %DESAC=0,TABCOM="^[QUI]REFANTET",OLDYA=YA,OLDYB=YB,(YA,YB)=YASSET D ^TO4GEXPL,^TO3CHSOU S ADR="TRAIT^TO32REQU",(NOMTREE,NOMTAB)=TABCOM_"("""_YB_"""",NUEQ=1 D ^%QCAGTU2
 S YA=OLDYA,YB=OLDYB Q
TRAIT 
 S NUC=%PR-1,PAR=^JTO4GEXP($I,NUC),^V($I,$$^%QZCHW("REALISATION"),PAR)=B(%PR),VCOMP=B(%PR),VSOURCE=^V($I,YA,PAR)
 I (VCOMP=$$^%QZCHW("TOUS"))!(VCOMP=$$^%QZCHW("TOUTES")) S VCOMP=""
 I (VSOURCE=$$^%QZCHW("TOUS"))!(VSOURCE=$$^%QZCHW("TOUTES")) S VSOURCE=""
 I %PR=2 S %NDESAC=0
 S %ACCEPAR=0 D ^TO42COMP
 I %ACCEPAR=0 S %NDESAC=%NDESAC+1
 I %NDESAC>%DESAC S %NDESAC=%NDESAC-1,STOP="F" G CONTIN
 I NUC=%NPAR D OK S %GAM=1,BLOCPH=1,STOP=1
CONTIN Q
OK S PAR=-1,TAB=NOMTAB F ZZ=1:1 S PAR=$N(^ITO4GEXP($I,PAR)) Q:PAR=-1  S TAB=TAB_","""_^V($I,$$^%QZCHW("REALISATION"),PAR)_""""
 S TAB=TAB_")",NUF=-1
 F ZZ=0:0 S NUF=$N(@TAB@(NUF)) Q:NUF=-1  S NRF=-1 F ZA=0:0 S NRF=$N(@TAB@(NUF,NRF)) Q:NRF=-1  D AFF S NUEQ=NUEQ+1 G CONTIN
 G CONTIN
AFF S NUREF=NRF,INUFA=NUF
 Q
 
TEST W !,$$^%QZCHW("quel article : ") R YA Q:YA=""
 S YB=YA,NU=-1 F UU=0:0 S NU=$N(^[QUI]EXPLICI(YA,NU)) Q:NU=-1  S PAR=$N(^[QUI]EXPLICI(YA,NU,-1)) W !,?10,PAR," ? " R VAL S ^V($I,YA,PAR)=VAL
 W !,$$^%QZCHW("Merci..."),! D ^TO4GEQUI
 S NU=-1 F UU=0:0 S NU=$N(^EQUIVAL($I,NU)) Q:NU=-1  W !,^EQUIVAL($I,NU)
 G TEST

