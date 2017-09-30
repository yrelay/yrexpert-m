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

;%MZPSAIS^INT^1^59547,73872^0
MOZPSAIS ;
 
 D CLEPAG^%VVIDEO S @%TT@($J,0,EDCL)=XOP_"^"_X,DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="Parametres identifies" D 4^%VZCD K ^LISTE($J),^DEJAVU($J) S PGE=1,LI=8,YA="MOZ"
 S IT=-1 F %U=1:1 S IT=$N(^v($I,YA,IT)) Q:IT=-1  S ^LISTE($J,PGE,LI)=IT_"^"_^v($I,YA,IT),^DEJAVU($J,PGE,LI)=1,LI=LI+1 I LI>21 S PGE=PGE+1,LI=8
T0 S NBPAG=$S($D(^LISTE($J,PGE)):PGE,1:PGE-1),PGE=1 G AFF1
T3 D POCLEPA^%VVIDEO W "CTRLA:Abandon,CTRLE:Acces a la grille,+,-,page" S GAP="Page "_PGE_"/"_NBPAG
 S DX=40-($L(GAP)\2),DY=6 X XY W GAP S DX=(($X-$L(NBPAG))-1)-$L(PGE),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,5:CTRLE,T3:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 T3 S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) T3 S NGAP=Y1 G AFF
1 G END
5 D ^%MZAPSAI G T3
43 G 61
45 S NGAP=PGE-1 G AFF
61 S NGAP=PGE+1 G AFF
AFF I '($D(^LISTE($J,NGAP))) D ^%VSQUEAK G T3
 S PGE=NGAP,DX=0,DY=DEBY+2 D CLEBAS^%VVIDEO
AFF1 O 0 S PTS=" " F %U=1:1:78 S PTS=PTS_"."
 S DY=-1 F %QY=1:1 S DY=$N(^LISTE($J,PGE,DY)) Q:DY=-1  D AFF2
 K PTS,PS,PS1,PS2 G T3
AFF2 S DX=0 I $D(^DEJAVU($J,PGE,DY)) D REV^%VVIDEO,BLD^%VVIDEO X XY W " " D NORM^%VVIDEO
 S DX=2 X XY S PS=^LISTE($J,PGE,DY),PS1=$P(PS,"^",1),PS2=$P(PS,"^",2) W PS1,$E(PTS,1,40-($L(PS1)+3)),?40,"= ",PS2
 Q
END D CLEPAG^%VVIDEO O 0 S X=@%TT@($J,0,EDCL),XOP=$P(X,"^",1),X=$P(X,"^",2,999) D STAT1^%MZWORD,RF^%MZED K ^LISTE($J),GAP,PGE,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NGAP,%QY,TIT Q

