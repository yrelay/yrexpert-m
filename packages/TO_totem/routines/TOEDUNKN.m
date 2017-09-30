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

;TOEDUNKN^INT^1^59547,74872^0
TOEDUNKN ;
 
 D CLEPAG^%VVIDEO S DX=0,DY=0 D REV^%VVIDEO X XY W $$^%QZCHW("INCONNUS dans les blocs-phases") D NORM^%VVIDEO Q:'($D(^AFFPAG($I)))
 S NBPAG=$S($D(^AFFPAG($I,PAGE)):PAGE,1:PAGE-1),PAGE=1,DX=0,DY=6 D CLEBAS^%VVIDEO,AFF1 G SUIT
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux objets,(C)orrection") S PAG=$$^%QZCHW("Page ")_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=6 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,65:CTRLE,SUIT:Y1="",61:(Y1="+")!(Y1="=")
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 D AFF G SUIT
1 G END
6 G END
65 D ^TOTRUNKN G SUIT
43 G 61
45 S NPAG=PAGE-1 D AFF G SUIT
61 S NPAG=PAGE+1 D AFF G SUIT
AFF I '($D(^AFFPAG($I,NPAG))) D ^%VSQUEAK Q
 S PAGE=NPAG,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 S DX=0,DY=-1 F %QY=1:1 S DY=$N(^AFFPAG($I,PAGE,DY)) Q:DY=-1  S LIGNE=^AFFPAG($I,PAGE,DY) X XY F PLC=2:1 Q:$P(LIGNE,"^",PLC)=""  W $P(LIGNE,"^",PLC)," "
 Q
END K PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP Q

