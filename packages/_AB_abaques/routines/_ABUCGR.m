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

;%ABUCGR^INT^1^59547,73864^0
%ABUCGR ;
 
 S REFUSE=0,UDX=PX,UDY=$Y,CHPNU=$J("",9) I C["~" S %IND=1 G FORM
 G NOF
FORM D EV^%LXUC6(C,.CFULL) G PARA:CFULL="" D ^%ABINDAB(CFULL,.EXPEV) I (EXPEV["%")&(EXPEV'[$$^%QZCHW("%MACHINE")) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Expression refusee...") H 1 S REFUSE=1 G REAFF
 S REFUSE=0 G REAFF
NOF S PCH=C D ^%LXABR S C=PCH
 G:CONCUR'=1 ALORS
 S PRECO=PCHCOMP,CFULL=PCHCOMP
 I $D(^[QUI]TOLEX(PRECO)) D POCLEPA^%VVIDEO W PCH,"=",PRECO H 1 G END
 I '($D(^[QUI]TOSYNONY(PRECO))) G REFUS
 S PRECOS=$N(^[QUI]TOSYNONY(PRECO,-1)) G:PRECOS=-1 REFUS D ^%VSQUEAK,POCLEPA^%VVIDEO W PCH,"=",PRECO,$$^%QZCHW(" est syn. de "),PRECOS,$$^%QZCHW(" ==> Subst. [RETURN] ") R *RET D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...")
 S LIBCPT=PRECOS,CFULL=PRECOS D ^%LXBESTA S PRECOS=PCH
 S CAF=CHPNU D AFFICH S CAF=PRECOS D AFFICH S C=PRECOS G END
AFFICH S DX=UDX,DY=UDY X XY W CAF G FIN
REFUS S REFUSE=1,CAF=CHPNU D ^%VSQUEAK,AFFICH G FIN
ALORS G:CONCUR=2 AMBI
UNKN 
P1 
 
 
PARA D ^%VSQUEAK S CAF=CHPNU D AFFICH,POCLEPA^%VVIDEO W $$^%QZCHW("Refusee ! (L)exique/(B)Cons.breve/[RETURN] ") R *RET S REFUSE=1,RET=$C(RET) G:RET=$$^%QZCHW("B") BREV G:RET=$$^%QZCHW("L") LEX G FIN
AMBI D ^%VSQUEAK S CAF=CHPNU D AFFICH,POCLEPA^%VVIDEO W $$^%QZCHW("Veuillez etre plus precis ! "),PCH,$$^%QZCHW(" est ambigu. [RETURN] ") R *RET S REFUSE=1 G FIN
FIN D POCLEPA^%VVIDEO Q
REAFF D CLEPAG^%VVIDEO,^%ABGRIL,FREQ1 S DX=UDX,DY=UDY X XY G FIN
LEX D ^%LXAJMOD,CLEPAG^%VVIDEO,^%ABGRIL,FREQ1 S DX=UDX,DY=UDY,REFUSE=1 X XY G FIN
BREV D ^%LXCONS,CLEPAG^%VVIDEO,^%ABGRIL,FREQ1 S DX=UDX,DY=UDY,REFUSE=1 X XY G FIN
FREQ1 D ^%ABGTPAR S NBP=0,NBR=0,YY=1,DX=0,DY=-1
 N %V F %V=$$^%QZCHW("P"),"R" S NB="NB"_%V,DA=$S(%V=$$^%QZCHW("P"):%DH,1:%DB),DB=DA+$S(%V=$$^%QZCHW("P"):3,1:PSEP),DC=DB,FN=$S(%V=$$^%QZCHW("P"):%PH,1:%PB)+DB F UU=0:0 S DC=$N(^[QU]STRUCT(NOMG,2,%V,DC)) Q:DC=-1  Q:DC>FN  S @NB=@NB+1,DY=DC-DA X XY W "        " X XY W ^[QU]STRUCT(NOMG,2,%V,DC)
 Q
END G:$L(C)<8 FIN
 S C=$E(C,1,8),DX=0,DY=%PY X XY W "         " X XY W C S DX=9 X XY W LIG3 G FIN

