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

;%ABCPGPA^INT^1^59547,73864^0
%ABCPGPA ;
 
 G QUES
AFFICH S DY=4 D CLEBAS^%VVIDEO,^%ABCPGAF
QUES D POCLEPA^%VVIDEO W $$L1^%QSLIB1
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 G TOUT:REP=$A("T") G:(REP'=43)&((REP'=45)&((REP'=1)&((REP'=13)&(REP'=61)))) QUES G @REP
61 G 43
43 G:'($D(^POSENR($I,PAGE+1))) QUES S PAGE=PAGE+1,DY=4 D CLEBAS^%VVIDEO G AFFICH
45 G:'($D(^POSENR($I,PAGE-1))) QUES S PAGE=PAGE-1,DY=4 D CLEBAS^%VVIDEO G AFFICH
1 S X1=1 G FIN
13 D POCLEPA^%VVIDEO W $$L2^%QSLIB1
 S MPASX=0,MPASY=1,NYI=LH-1,NYS=LB+1,NXI=-1,NXS=79
RECH S DX=0,DY=POSY S:'($D(^POSENR($I,PAGE,POSY))) DY=5 S ATT=10000 X XY D ^%VZECUR S POSY=$Y G:(X1'=13)&((X1'=1)&((X1'=6)&(X1'=7))) RECH S POSY=POSY+1,ISN=$S(X1=13:X1+2,X1=6:"QUES",X1=7:7,1:"FIN") G @ISN
TOUT S PAGE=-1 F %U=0:0 S PAGE=$N(^POSENR($I,PAGE)) Q:PAGE=-1  S PYY=-1 F %U=0:0 S PYY=$N(^POSENR($I,PAGE,PYY)) Q:PYY=-1  S ^TACOMPIL($I,PAGE,PYY)=^POSENR($I,PAGE,PYY)
 G 1
15 G:'($D(^POSENR($I,PAGE,$Y))) 13
 S PYY=$Y,^TACOMPIL($I,PAGE,PYY)=^POSENR($I,PAGE,PYY),RG=1 F TT="Y1","Y2","Y3","Y4" S @TT=$P(^POSENR($I,PAGE,PYY),"^",RG),RG=RG+1
 D BLD^%VVIDEO,BLK^%VVIDEO S DX=0,DY=$Y X XY W Y1 S DX=40 X XY W Y2 S DX=60 X XY W $E(Y3,1,15) S DX=75 X XY W Y4 D NORM^%VVIDEO S DX=0,DY=PYY X XY G RECH
7 G:'($D(^POSENR($I,PAGE,$Y))) 13
 S PYY=$Y G:'($D(^TACOMPIL($I,PAGE,PYY))) RECH K ^TACOMPIL($I,PAGE,PYY) S RG=1 F TT="Y1","Y2","Y3","Y4" S @TT=$P(^POSENR($I,PAGE,PYY),"^",RG),RG=RG+1
 W Y1,?40,Y2,?60,$E(Y3,1,15),?75,Y4 S DX=0,DY=PYY X XY G RECH
FIN Q

