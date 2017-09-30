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

;%PBIAXE^INT^1^59547,73873^0
PTIAXE ;
 N A,B,C,R,S,X,X1,X2,X3,X4,Y,Y1,Y2,Y3,Y4
 D REV^%VVIDEO
L0 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez un point de l'axe avec la mire")
 D ^%PBPZGRA S R=$$LOC^%PBMFN(.X,.Y) G:R=0 END
 D ^%PBPZALF
L1 D POCLEPA^%VVIDEO W "Angle de cet axe ? : " S DX=$X,DY=$Y D ^%VLEC,POCLEPA^%VVIDEO
 I CTRLA!(Y1="") G END
 S S="+" S:"+-"[$E(Y1,1) S=$E(Y1,1),Y1=$E(Y1,2,$L(Y1))
 I Y1'?1N.N D ^%VSQUEAK G L1
 S @("S="_S_Y1)
 D NEWP^%PBCACV(X,Y,100,$$NORM^%PBCACV(S+90),.X1,.Y1)
 D NEWP^%PBCACV(X,Y,100,$$NORM^%PBCACV(S-90),.X2,.Y2)
 D HORTO^%PBMFN(X1,Y1,X2,Y2,.X3,.Y3,.X4,.Y4,.A,.B,.C)
 S X3=$$Y^%PBMFN(X3),Y3=$$Y^%PBMFN(Y3),X4=$$Y^%PBMFN(X4),Y4=$$Y^%PBMFN(Y4)
 D ^%PBPZONG,DROITE^%PBP5EC(X3,Y3,X4,Y4,0,"M",0),ADD(X3,Y3,X4,Y4)
END Q
INIT K AXES S AXES=0 Q
ADD(X1,Y1,X2,Y2) S AXES=AXES+1,AXES(AXES)=X1_"^"_Y1_"^"_X2_"^"_Y2 Q
AFF N A,%A F A=1:1:AXES S %A=AXES(A) D DROITE^%PBP5EC($P(%A,"^",1),$P(%A,"^",2),$P(%A,"^",3),$P(%A,"^",4),0,"M",0)
 Q

