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

;%HXIIMP2^INT^1^59547,73869^0
HXIIMP2(X,Y,H,L,LC,E,CL) 
 
 
 
 
 
 
 N NOCOL,NOLIN,LIN,COL,LIMLIN,LIMCOL,ESPREST
 S NOCOL=$P(@CL,"^",1)
 S NOLIN=$P(@CL,"^",2)
 S DY=Y,DX=X X XY
 I NOLIN>H S LIMLIN=H
 E  S LIMLIN=NOLIN
 I (NOCOL*(LC+E))>L S LIMCOL=L\(LC+E)
 I (NOCOL*(LC+E))'>L S LIMCOL=NOCOL
 I LIMCOL=0 S LIMCOL=1
 S LCVAR=LC
 I LC>L S LCVAR=L
 S ESPREST=$S(LIMCOL=1:L-(LIMCOL*(LC+E)),1:LCVAR)
 F LIN=1:1:LIMLIN D BOUC
 Q
 
BOUC F COL=1:1:LIMCOL S CH=$S($D(@CL@(COL,LIN)):@CL@(COL,LIN),1:""),^IMP($J,$Y,$X)=$E(CH,1,LCVAR)_$J(" ",E),DX=$X+$L(^IMP($J,$Y,$X)) X XY I $L(CH)<LCVAR S ^IMP($J,$Y,$X)=$J(" ",LCVAR-$L(CH)),DX=$X+$L(^IMP($J,$Y,$X)) X XY
 S COL=COL+1,CH=$S($D(@CL@(COL,LIN)):@CL@(COL,LIN),1:"")
 S ^IMP($J,$Y,$X)=$E(CH,1,ESPREST),DX=$X+$L(^IMP($J,$Y,$X)) X XY
 I $L(CH)<ESPREST S ^IMP($J,$Y,$X)=$J(" ",ESPREST),DX=$X+$L(^IMP($J,$Y,$X)) X XY
 
 S DY=DY+1,DX=X X XY Q

