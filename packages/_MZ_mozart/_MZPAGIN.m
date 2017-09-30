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

;%MZPAGIN^INT^1^59547,73872^0
MOZPAGIN ;
 
 Q:'($D(^AFFPAG($I)))  S:'($D(TIT)) TIT="" S GAPBN=$S($D(^AFFPAG($I,EGAP)):EGAP,1:EGAP-1),EGAP=1,DX=0,DY=5 D CLEBAS^%VVIDEO S DX=0,DY=6 X XY W TIT G AFF1
SUIT D POCLEPA^%VVIDEO W $$L17^%QSLIB1("") S GAP="Page "_EGAP_"/"_GAPBN
 S DX=40-($L(GAP)\2),DY=5 X XY W GAP S DX=(($X-$L(GAPBN))-1)-$L(EGAP),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) SUIT S NGAP=Y1 G AFF
1 G END
6 G END
43 G 61
45 S NGAP=EGAP-1 G AFF
61 S NGAP=EGAP+1 G AFF
AFF I '($D(^AFFPAG($I,NGAP))) D ^%VSQUEAK G SUIT
 S EGAP=NGAP,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 O 0 S DY=-1 F %QY=1:1 S DY=$N(^AFFPAG($I,EGAP,DY)) Q:DY=-1  S DX=0 X XY W ^AFFPAG($I,EGAP,DY)
 G SUIT
END S DX=0,DY=5 D CLEBAS^%VVIDEO K ^AFFPAG($I),GAP,EGAP,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NGAP,%QY,TIT Q

