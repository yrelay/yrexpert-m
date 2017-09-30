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

;TOIMPIMP^INT^1^59547,74872^0
TOIMPIMP ;
 
 D CLEPAG^%VVIDEO S LILIM=20,DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Parametres de ")_YB D TO4^%VZCD S %ABAND=0,DX=0,DY=7 X XY D ^%AB3STAR
 K ^POSENR($I),^VBIS($I),^VALPAR($I),^DON($I),^POSFUL($I) S PAGE=1 D EDIT G:%ABAND=1 END G SUIT
 Q
EDIT S %PAR="E",%FIN=0,DEBP=$Y,INEXT=-1,LI=$Y,NEXT=$$^%QZCHW("QUANTITE") W ! S PY=$Y W "|",?2 S PX=$X
 D BLD^%VVIDEO W $E(NEXT,1,37) D NORM^%VVIDEO S DX=40,DY=PY X XY S ^POSENR($I,PAGE,PY)=NEXT_"^",^POSFUL($I,PAGE,PY)=NEXT,^VALPAR($I,NEXT)="" W " = " S PX=$X W ?75,$$^%QZCHW("(E)"),?79,"|" S LI=LI+1 I LI>LILIM D SUIT
 F I=1:1 S INEXT=$N(^[QUI]EXPLICI(YA,INEXT)) G:INEXT=-1 IMP D EXP G:%ABAND=1 FIN G:%FIN=1 FIN
EXP S NEXT=$N(^[QUI]EXPLICI(YA,INEXT,-1))
 W ! S PY=$Y W "|",?2 S PX=$X
 D BLD^%VVIDEO W $E(NEXT,1,37) D NORM^%VVIDEO S DX=40,DY=PY X XY S ^POSENR($I,PAGE,PY)=NEXT_$$^%QZCHW("^(E)"),^POSFUL($I,PAGE,PY)=NEXT,^VALPAR($I,NEXT)="",^DON($I,NEXT)=I W " = " S PX=$X W ?75,$$^%QZCHW("(E)"),?79,"|" S LI=LI+1 I LI>LILIM D SUIT
 Q
IMP S %PAR=$$^%QZCHW("I"),NEXT=-1,LI=$Y F I=1:1 S NEXT=$N(^[QUI]FULL(YA,NEXT)) Q:NEXT=-1  D IMP2 G:%ABAND=1 FIN G:%FIN=1 FIN
 S %FIN=1 G FIN
IMP2 I (NEXT["$")!((NEXT["%ARG")!(NEXT["%VALA")) G FIN
 I $D(^VALPAR($I,NEXT)) G FIN
 W ! S PY=$Y,PX=$X,^POSFUL($I,PAGE,PY)=NEXT,^POSENR($I,PAGE,PY)=NEXT_$$^%QZCHW("^(I)") W "|",?2,$E(NEXT,1,37),?40," = " S ^VALPAR($I,NEXT)="" W ?75,$$^%QZCHW("(I)"),?79,"|" S LI=LI+1 I LI>LILIM D SUIT
FIN Q
U S U="^[QUI]UNITE(YA,NEXT)" W:$D(@U) ?70,@(U) Q
SUIT D POCLEPA^%VVIDEO W $$L23^%QSLIB2("CTRLE acces aux parametres, RETURN suite,CTRLF Fin") W:%FIN=1 $$^%QZCHW(",+,-,page") S PAG=$$^%QZCHW("Page ")_PAGE,DX=40-($L(PAG)\2),DY=6 X XY W $$^%QZCHW("Page "),PAGE S DX=$X-1,DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,65:CTRLE,13:Y1="",61:(Y1="+")!(Y1="="),45:Y1=$$^%QZCHW("-")
SINON G:%FIN=0 SUIT S NPAG=Y1 G AFF
1 S %ABAND=1,STOP=1,%ABEND=1 G END
6 S %ABAND=1,STOP=1 G END
65 D ^TOGIMPIM G SUIT
13 G:%FIN=1 SUIT S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=0,DY=7,LI=7,PAGE=PAGE+1 X XY G FIN
43 G 61
45 G:%FIN=0 SUIT S NPAG=PAGE-1 G AFF
61 G:%FIN=0 SUIT S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=7 D CLEBAS^%VVIDEO
 S DDY=-1 F %QY=1:1 S DDY=$N(^POSENR($I,PAGE,DDY)) Q:DDY=-1  D ECR
 G SUIT
ECR S DY=DDY,DX=0 X XY W "|",?2 S PAR=$P(^POSENR($I,PAGE,DY),"^",1),TYP=$P(^POSENR($I,PAGE,DY),"^",2) D:TYP[$$^%QZCHW("E") BLD^%VVIDEO S DX=2 X XY W $E(PAR,1,37) D NORM^%VVIDEO S DX=40 X XY W " = ",^VALPAR($I,PAR) D NORM^%VVIDEO W ?75,TYP,?79,"|" D:^VALPAR($I,PAR)'="" ON Q
END K PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP Q
ON D REV^%VVIDEO,BLD^%VVIDEO S DX=1 X XY W $$^%QZCHW(" ") D NORM^%VVIDEO Q

