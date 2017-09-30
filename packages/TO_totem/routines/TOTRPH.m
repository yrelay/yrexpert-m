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

;TOTRPH^INT^1^59547,74876^0
TOTRPH ;
 
 D POCLEPA^%VVIDEO S PDL=$$^%QZCHW("? Rep.,(V)isu.,(G)en. des tps & couts,(T)ps & couts,(D)im. a l'out.,(C)onsignes") W PDL S DX=0,PY=7
DEB S MPASX=0,MPASY=1,NXI=-1,NXS=79,NYI=7,NYS=22
DEB1 S DY=PY+1 S:DY>21 (DY,PY)=21 S DX=0 X XY D ^%VZECUR G:X1=1 1 S PY=$Y G:'($D(^POSENR($I,PAGE,PY))) DEB1 G:((((((X1'=1)&(X1'=67))&(X1'=68))&(X1'=71))&(X1'=84))&(X1'=63))&(X1'=86) DEB1
 G @X1
FIN Q
END K TD,RESUL,SCRE,%II,COM,LY,PY,PDL,MPASX,MPASY,NXI,NXS,NYI,NYS,TYMOD,ADPY,DPY,GF,DE,FI,PARAM,CONF,DT,PH,NUOR,OP,RET,TIT,%LGR,%CH,TD,^AFFPAG($I),%SS,%DD,%CC,SEC,DO,NUCO,GL,EGAP Q
1 G END
86 S DT=^POSENR($I,PAGE,PY),RESUL(1)=ARTI,RESUL(2)=$P(DT,"^",2),RESUL(3)=$P(DT,"^",1),RESUL(4)=$P(DT,"^",3),TD=^[QUI]PHASE(ARTI,RESUL(2),RESUL(3),RESUL(4))
 F %II=1:1:25 S RESUL(%II+4)=$P(TD,"^",%II)
 S SCR="PHASE" D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR,POCLEPA^%VVIDEO
 W "(RETURN)" R *RET D CADRE^TOAFFPH,AFF^TOAFFPH G TOTRPH
71 D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("      *** Confirmer la generation *** ") R *CONF G:CONF'=71 TOTRPH S DT=^POSENR($I,PAGE,PY),PH=$P(DT,"^",2),NUOR=$P(DT,"^",1),OP=$P(DT,"^",3) D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") D TRAIT^TOGENFOR G TOTRPH
63 D POCLEPA^%VVIDEO S DT=^POSENR($I,PAGE,PY) W $$^%QZCHW("Phase/"),$P(DT,"^",2) R *RET:3 D POCLEPA^%VVIDEO W $$^%QZCHW("Operation/"),$P(DT,"^",3) R *RET:3 G TOTRPH
84 K ^AFFPAG($I) S TIT=$$^%QZCHW("Sections"),%CH=$$^%QZCHW("No cond."),%LGR=70 D ^%QZCHBK S TIT=TIT_%CH,DT=^POSENR($I,PAGE,PY),PH=$P(DT,"^",2),OP=$P(DT,"^",3) D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") S GL=28,EGAP=0
 S SEC=-1 F %SS=1:1 S SEC=$N(^[QUI]FORMULE(ARTI,PH,OP,SEC)) Q:SEC=-1  S NUCO=-1 F %CC=1:1 S NUCO=$N(^[QUI]FORMULE(ARTI,PH,OP,SEC,NUCO)) Q:NUCO=-1  D T1
 I '($D(^AFFPAG($I))) D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Pas de temps et couts") H 2 G TOTRPH
 D ^TOPAGIN,AFF^TOAFFPH G TOTRPH
67 K ^AFFPAG($I) S TIT=$$^%QZCHW("Sections"),%CH=$$^%QZCHW("No cond."),%LGR=70 D ^%QZCHBK S TIT=TIT_%CH,DT=^POSENR($I,PAGE,PY),PH=$P(DT,"^",2),OP=$P(DT,"^",3) D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") S GL=28,EGAP=0
 S SEC=-1 F %SS=1:1 S SEC=$N(^[QUI]OUTCONS(ARTI,PH,OP,SEC)) Q:SEC=-1  S NUCO=-1 F %CC=1:1 S NUCO=$N(^[QUI]OUTCONS(ARTI,PH,OP,SEC,NUCO)) Q:NUCO=-1  D T1
 I '($D(^AFFPAG($I))) D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Pas de consigne") H 2 G TOTRPH
 D ^TOPAGIN,AFF^TOAFFPH G TOTRPH
68 K ^AFFPAG($I) S TIT=$$^%QZCHW("Sections"),%CH=$$^%QZCHW("Dimension a l'outil"),%LGR=(35+$L(%CH))-$L(TIT) D ^%QZCHBK S TIT=TIT_%CH,%CH=$$^%QZCHW("No cond."),%LGR=78-$L(TIT) D ^%QZCHBK S TIT=TIT_%CH
 S DT=^POSENR($I,PAGE,PY),PH=$P(DT,"^",2),OP=$P(DT,"^",3) D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") S GL=28,EGAP=0
 S SEC=-1 F %SS=1:1 S SEC=$N(^[QUI]DIMOUT(ARTI,PH,OP,SEC)) Q:SEC=-1  S DO=-1 F %DD=1:1 S DO=$N(^[QUI]DIMOUT(ARTI,PH,OP,SEC,DO)) Q:DO=-1  S NUCO=-1 F %CC=1:1 S NUCO=$N(^[QUI]DIMOUT(ARTI,PH,OP,SEC,DO,NUCO)) Q:NUCO=-1  D T2
 I '($D(^AFFPAG($I))) D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Pas de dimension a l'outil") H 2 G TOTRPH
 D ^TOPAGIN,AFF^TOAFFPH G TOTRPH
T1 S TD=SEC,%CH=NUCO,%LGR=(70+$L(NUCO))-$L(SEC) D ^%QZCHBK S TD=TD_%CH G STO
T2 S TD=$E(SEC,1,33),%CH=$E(DO,1,33),%LGR=(35+$L(%CH))-$L(TD) D ^%QZCHBK S TD=TD_%CH,%CH=NUCO,%LGR=(70+$L(NUCO))-$L(TD) D ^%QZCHBK S TD=TD_%CH G STO
STO S GL=GL+1 I GL>21 S EGAP=EGAP+1,GL=8
 S ^AFFPAG($I,EGAP,GL)=TD Q

