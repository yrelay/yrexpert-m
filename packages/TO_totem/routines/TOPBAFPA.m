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

;TOPBAFPA^INT^1^59547,74874^0
TOPBAFPA ;
 
 Q:'($D(^LISTAFF($I)))  S:'($D(TIT)) TIT="" S GAPBN=$S($D(^LISTAFF($I,EGAP)):EGAP,1:EGAP-1),EGAP=1,DX=0,DY=5 D CLEBAS^%VVIDEO S DX=0,DY=6 X XY W TIT D AFF1
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux objets") S GAP="Page "_EGAP_"/"_GAPBN
 S DX=40-($L(GAP)\2),DY=5 X XY W GAP S DX=(($X-$L(GAPBN))-1)-$L(EGAP),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,5:CTRLE,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NGAP=Y1 D AFF G SUIT
1 G END
6 G END
5 D:$D(%PROGTR) @%PROGTR G SUIT
43 G 61
45 S NGAP=EGAP-1 D AFF G SUIT
61 S NGAP=EGAP+1 D AFF G SUIT
AFF I '($D(^LISTAFF($I,NGAP))) D ^%VSQUEAK Q
 S EGAP=NGAP,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 O 0 S DY=-1 F %QY=1:1 S DY=$N(^LISTAFF($I,EGAP,DY)) D NORM^%VVIDEO Q:DY=-1  S DX=0 X XY D ON W ^LISTAFF($I,EGAP,DY)
 Q
ON I '($D(^SELEC($I,EGAP,DY))) W "  " Q
 S RAC=$S(($D(^SELEC($I))#10)=1:^SELEC($I),1:"S"),RAC=$E(RAC,1)_" " D BLD^%VVIDEO,BLK^%VVIDEO W RAC
 Q
END S DX=0,DY=5 D CLEBAS^%VVIDEO K ^LISTAFF($I),GAP,EGAP,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NGAP,%QY,TIT Q

