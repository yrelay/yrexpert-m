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

;TOP0SEEC^INT^1^59547,74874^0
TOP0SEEC ;
 
BEG D CADRE S DX=0,DY=5 D CLEBAS^%VVIDEO S DX=0,DY=10 X XY W "Un instant..."
 D ^TOP0ALLC K ^VALPAR($I)
 I '($D(^POSENR($I))) D POCLEPA^%VVIDEO W "Aucune fiche de liaison n'a ete generee ! [RETURN] " R *RET G END
 S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1)
BEG1 S PAGE=$S('($D(OPAGE)):1,1:OPAGE) D TET G AFF1
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux objets,?:Repere,CTRLJ:Impression")
 S PAG="Page "_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=6 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G ORD:Y1="?",1:CTRLA,6:CTRLF,10:CTRLJ,65:CTRLE,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 G END
6 G END
10 S %GL="^POSENR(DOLARI,PAGE)",HPG="ARC^Client^Date^Qte comm.^Poids comm.",%POS="3^15^40^55^67",BPG="*** Tonnage total : "_^TONCUM($I,"TOTAL")_" ***"_"^ ^ ^     total"_"^"_^TONCUM($I,PAGE) D ^TOP0EDPA
 G SUIT
65 D ^TOP0TRC1 G SUIT
43 G 61
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG D TET
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^POSENR($I,PAGE,DY)) D NORM^%VVIDEO Q:DY=-1  S LIGNE=^POSENR($I,PAGE,DY),COL=1,DX=0 D ON X XY F XX=3,15,40,55,67 W ?XX,$P(LIGNE,"^",COL) S COL=COL+1
 W !,"  *** Tonnage total : ",^TONCUM($I,"TOTAL")," ***",?61,"total",?67,^TONCUM($I,PAGE)
 I $D(%QUIT) Q:%QUIT=1
 G SUIT
END D:$D(^FLASUP($I)) KILL K ^FLASUP($I),^POSENR($I),^POSFUL($I),^TONCUM($I),PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP Q
FIN Q
ON I $D(^FLASUP($I,$P(LIGNE,"^",1))) D BLD^%VVIDEO,BLK^%VVIDEO W "S" S DX=2
 Q
ORD S STOP=0,DX=0,DY=5 D CLEBAS^%VVIDEO S PG=-1 F I=1:1 S PG=$N(^POSFUL($I,PG)) Q:PG=-1  D ECORD Q:STOP=1
 I STOP'=1 D POCLEPA^%VVIDEO W "Fin [RETURN] " R *RET
 S DX=0,DY=5 D CLEBAS^%VVIDEO,TET G AFF1
ECORD S DD=^POSFUL($I,PG),FF=$P(DD,"^",2),DD=$P(DD,"^",1)
 W !,"Page ",$S(PG<10:" ",1:""),PG,?9,DD,!,?9,FF D:$Y'<21 ALOR
 G FIN
ALOR D POCLEPA^%VVIDEO W $$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET)
 G:(RET'=13)&(RET'=1) ALOR S:RET=1 STOP=1 S DX=0,DY=5 D CLEBAS^%VVIDEO X XY G FIN
KILL D KILL^TOP0KFLI Q
TET S DX=0,DY=5 D CLEBAS^%VVIDEO,BLD^%VVIDEO S DX=0,DY=7 X XY W ?3,"ARC",?15,"Client",?40,"Date",?55,"Qte comm.",?67,"Poids comm." D NORM^%VVIDEO Q
CADRE D CLEPAG^%VVIDEO S LILIM=20,DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="Fiches de liaison" D TO4^%VZCD Q

