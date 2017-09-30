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

;%LXTR^INT^1^59547,73871^0
LEXTR ;
 
 
 
 
 
 
 
 
 D POCLEPA^%VVIDEO
 S PDL=$$^%QZCHW("?:commentaires,S:synonymes,D:destruction,U:unite,CTRLG:gomme,"_$S(MODTM:"ESCP",1:"BREAK")_" abandon ")
 W PDL S DX=0,PY=7
DEB S MPASX=0,MPASY=1,NXI=-1,NXS=79,NYI=7,NYS=21
DEB1 D ECHON^%VVIDEO S DY=PY+1 S:DY>20 (DY,PY)=20 S DX=0 X XY D ^%VZECUR G:X1=1 1 G:(X1'=1)&((X1'=63)&((X1'=83)&((X1'=7)&((X1'=68)&(X1'=85))))) DEB1
 S PY=$Y G:'($D(^POSENR($I,PAGE,PY))) DEB1 G @X1
END K COM,LY,PY,PDL,MPASX,MPASY,NXI,NXS,NYI,NYS,TYMOD,ADPY,DPY,GF,DE,FI,PARAM Q
1 G END
68 I '($D(^VALPAR($I,PAGE,PY))) S ^VALPAR($I,PAGE,PY)=1 D BLD^%VVIDEO,REV^%VVIDEO S DX=0,DY=PY X XY W "D" D NORM^%VVIDEO
 G DEB1
7 I $D(^VALPAR($I,PAGE,PY)) K ^VALPAR($I,PAGE,PY) S DX=0,DY=PY X XY W "  "
 G DEB1
63 S PAR=^POSENR($I,PAGE,PY)
 I $P(^[QUI]TOLEX(PAR),"^",1,5)="^^^^" D:$D(^VALPAR($I,PAGE,PY)) REV^%VVIDEO,BLD^%VVIDEO S DY=PY,DX=0 X XY W $S($D(^VALPAR($I,PAGE,PY)):"D",1:"  ") D NORM^%VVIDEO,^%VZEAVT($$^%QZCHW("Ce mot n'a pas de commentaire ")) W PDL S DX=0,DY=PY G DEB1
 S (%NOM,RS)=$P(^[QUI]TOLEX(PAR),"^",1,5) D ^%VKMULC,AFFCOM
630 D ^%VZEAVT(""),AFF G DEB1
83 S PAR=^POSENR($I,PAGE,PY)
 I '($D(^[QUI]TOLEXS(PAR))) D:$D(^VALPAR($I,PAGE,PY)) REV^%VVIDEO,BLD^%VVIDEO S DY=PY,DX=0 X XY W $S($D(^VALPAR($I,PAGE,PY)):"D",1:"  ") D NORM^%VVIDEO,^%VZEAVT($$^%QZCHW("Ce mot n'a pas de synonyme "))
 I '($D(^[QUI]TOLEXS(PAR))) W PDL S DX=0,DY=PY G DEB1
 S DY=7,DX=0,STOP=0 D CLEBAS^%VVIDEO W $$^%QZCHW("Synonyme de : "),PAR,!
 S SYN="" F I=1:1 S SYN=$O(^[QUI]TOLEXS(PAR,SYN)) Q:SYN=""  W !,SYN I $Y'<21 D ALOR Q:STOP=1
 I STOP'=1 D ^%VZEAVT($$^%QZCHW("Fin "))
 D AFF G DEB
85 S PAR=^POSENR($I,PAGE,PY)
 I '($D(^[QUI]TOLEXU(PAR))) D:$D(^VALPAR($I,PAGE,PY)) REV^%VVIDEO,BLD^%VVIDEO S DY=PY,DX=0 X XY W $S($D(^VALPAR($I,PAGE,PY)):"D",1:"  ") D NORM^%VVIDEO,^%VZEAVT($$^%QZCHW("Ce mot n'a pas d'unite "))
 I '($D(^[QUI]TOLEXU(PAR))) W PDL S DX=0,DY=PY G DEB1
 S DY=7,DX=0,STOP=0 D CLEBAS^%VVIDEO W $$^%QZCHW("Unite de : "),PAR,! S UNT=$O(^[QUI]TOLEXU(PAR,"")) W !,UNT I $Y'<21 D ALOR Q:STOP=1
 I STOP'=1 D ^%VZEAVT($$^%QZCHW("Fin "))
 D AFF G DEB
ALOR D POCLEPA^%VVIDEO W $$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET)
 G:(RET'=1)&(RET'=13) ALOR S:RET=1 STOP=1
 S DY=7,DX=0 D CLEBAS^%VVIDEO Q
AFF S DX=0,DY=7 D CLEBAS^%VVIDEO
 S DY="" F I=1:1 S DY=$O(^POSENR($I,PAGE,DY)) Q:DY=""  S DX=4 X XY W ^POSENR($I,PAGE,DY) I $D(^VALPAR($I,PAGE,DY)) D BLD^%VVIDEO,REV^%VVIDEO S DX=0 X XY W "D" D NORM^%VVIDEO
 Q
AFFCOM S DY=7,DX=0 D CLEBAS^%VVIDEO W $$^%QZCHW("Commentaires sur "),PAR,! F I=1:1 Q:'($D(%RS(I)))  W !,%RS(I)
 Q

