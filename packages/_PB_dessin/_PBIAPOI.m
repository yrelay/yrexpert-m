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

;%PBIAPOI^INT^1^59547,73873^0
PTIAPOIN ;
 N NOM,R,S,X,Y G @MODE
0 
 
 D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"Pointez avec la mire"),^%PBPZGRA
 S R=$$LOC^%PBMFN(.X,.Y) G:R=0 FIN D POINT^%PBMFN(X,Y,0)
 G L0
1 
X D ^%PBPZALF,POCLEPA^%VVIDEO W "X = " S DX=$X,DY=$Y D ^%VLEC
 I CTRLA!(Y1="") G FIN
 S S="+" I "+-"[$E(Y1,1) S S=$E(Y1,1),Y1=$E(Y1,2,$L(Y1))
 I Y1'?.N D ^%VSQUEAK G X
 S @("X="_S_Y1)
Y D POCLEPA^%VVIDEO W "Y = " S DX=$X,DY=$Y D ^%VLEC
 I CTRLA!(Y1="") G FIN
 S S="+" I "+-"[$E(Y1,1) S S=$E(Y1,1),Y1=$E(Y1,2,$L(Y1))
 I Y1'?.N D ^%VSQUEAK G Y
 S @("Y="_S_Y1)
 D ^%PBPZGRA,POINT^%PBMFN(X,Y,0),^%PBPZALF G L0
L0 D ^%PBPZALF,POCLEPA^%VVIDEO W "Nom de ce point : " S DX=$X,DY=$Y D ^%VLEC
 I CTRLA D ^%PBPZGRA,POINT^%PBMFN(X,Y,1) G FIN
 S NOM=Y1 G:NOM="" OK
 I $$POINT^%PBSOV(O,V,NOM) D POCLEPA^%VVIDEO,^%VSQUEAK W "Un point porte deja ce nom ... refuse [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO G L0
 D ^%PBPZONG
OK S R=$$ADD^%PBSOV(O,V,$$POINT^%PBEL(X,Y,"","",NOM))
 D:NOM'="" ADDPOINT^%PBSOV(O,V,NOM,X,Y),^%PBPZGRA,TEXTE^%PBMFN(X+20,Y+20,NOM,0,"H")
FIN I MODE D ^%PBPZALF,POCLEPA^%VVIDEO,NORM^%VVIDEO Q

