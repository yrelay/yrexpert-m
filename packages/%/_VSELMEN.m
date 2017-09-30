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

;%VSELMEN^INT^1^59547,74036^0
GESELMEN(XG,T1,T2,T3,XC,YC) 
 S TBMOV=T2,PY=$O(@T2@("")),PX=$O(@T2@(PY,"")),DX=XG,DY=-1 F %U=1:1 S DY=$N(@T1@(DY)) Q:DY=-1  X XY W @T1@(DY)
LEC S DX=PX,DY=PY X XY D ^%VZEREVS S PX=$X,PY=$Y G CTRLA:X1=1,CTRLF:X1=6,GET:X1=13 G:X1<32 LEC S X1=$C(X1) G:$D(@T3@(X1)) EX
LP S X2=$ZP(@T3@(X1)),X2=$O(@T3@(X2)) G:$E(X2,1,$L(X1))'=X1 LEC S X3=$O(@T3@(X2)) G EX1:$E(X3,1,$L(X1))'=X1 D ^%VSQUEAK R *X:60 G:X<32 LEC S X1=X1_$C(X) G LP
EX1 S X1=X2 G EX
EX S YC=@T3@(X1),XC=$P(YC,"/",2),YC=$P(YC,"/",1) G FIN
GET S XC=PX,YC=PY G FIN
CTRLA S (XC,YC)="CTRLA" G FIN
CTRLF S (XC,YC)="CTRLF" G FIN
FIN Q

