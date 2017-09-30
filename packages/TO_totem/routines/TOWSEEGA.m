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

;TOWSEEGA^INT^1^59547,74876^0
TOWSEEGA ;
 
 D CLEPAG^%VVIDEO S LILIM=20,DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("SCHEMAS DE LAMINAGE") D TO4^%VZCD S DX=0,DY=10 X XY W $$^%QZCHW("Un instant...")
 D ^TOWALLGA S %9QUIT=0
 I '($D(^POSENR($I))) D POCLEPA^%VVIDEO W $$^%QZCHW("Aucun schema n'a ete cree ! [RETURN] ") R *RET G END
 D ENTET S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=1,DX=0,DY=8 D CLEBAS^%VVIDEO G AFF1
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux objets,?:Repere") S PAG=$$^%QZCHW("Page ")_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=6 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G ORD:Y1="?",1:CTRLA,6:CTRLF,65:CTRLE,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 G END
6 G END
65 D ^TOWTRGA S %9QUIT=0 G SUIT
43 G 61
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=8 D CLEBAS^%VVIDEO
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^POSENR($I,PAGE,DY)) D NORM^%VVIDEO Q:DY=-1  D AFF2
 
 Q:%9QUIT=1  G SUIT
AFF2 D:$D(^COMPILVU($I,PAGE,DY)) SUP S DX=3,%9OBV=^POSENR($I,PAGE,DY),%CPT=1 F DX=2,20,35,51 X XY W $P(%9OBV,"^",%CPT) S %CPT=%CPT+1
 Q
END D SUPPR K %9COL,%9OBV,%9SP($I),%9CPT,PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP Q
ON D REV^%VVIDEO,BLD^%VVIDEO S DX=1 X XY W " " D NORM^%VVIDEO Q
FIN Q
ORD S STOP=0,DX=0,DY=5 D CLEBAS^%VVIDEO S PG=-1 F I=1:1 S PG=$N(^POSFUL($I,PG)) Q:PG=-1  D ECORD Q:STOP=1
 I STOP'=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Fin [RETURN] ") R *RET
 S DX=0,DY=5 D CLEBAS^%VVIDEO,ENTET G AFF1
ECORD S RENS=^POSFUL($I,PG),AA=$P(RENS,"^",1),BB=$P(RENS,"^",2),CC=$P(RENS,"^",3),DD=$P(RENS,"^",4)
 W !,$$^%QZCHW("Page "),$S(PG<10:" ",1:""),PG,?9,AA,?27,BB,?42,CC,?58,DD D:$Y'<22 ALOR
 G FIN
ALOR D L7^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,RET)
 G:(RET'=13)&(RET'=1) ALOR S:RET=1 STOP=1 S DX=0,DY=5 D CLEBAS^%VVIDEO X XY G FIN
SUP S DX=0 X XY D BLD^%VVIDEO,BLK^%VVIDEO W "S" G FIN
SUPPR S %9PAG=-1,%9LIN=-1 F %9PG=1:1 S %9PAG=$N(^COMPILVU($I,%9PAG)) Q:%9PAG=-1  F %9LG=1:1 S %9LIN=$N(^COMPILVU($I,%9PAG,%9LIN)) Q:%9LIN=-1  D SUPP1
 G FIN
SUPP1 S %9OBV=^COMPILVU($I,%9PAG,%9LIN),PLC=1 F %IT="%AL","%ET","%LA","%EP" S @%IT=$P(%9OBV,"^",PLC),PLC=PLC+1
 D ^TOWKILGA G FIN
ENTET S DX=1,DY=7 X XY W $$^%QZCHW("Alliages") S DX=20 X XY W $$^%QZCHW("Etats") S DX=37 X XY W $$^%QZCHW("Normes") S DX=50 X XY W $$^%QZCHW("Epaisseurs finales") G FIN

