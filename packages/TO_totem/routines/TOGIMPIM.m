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

;TOGIMPIM^INT^1^59547,74872^0
TOGIMPIM ;
 
 D POCLEPA^%VVIDEO W $$L23^%QSLIB2("CTRLF pour ajouter un parametre") S TYMOD=$$^%QZCHW("Saisie") D ^TO3TYMOD S (PY,DY)=DEBP,DX=43 X XY
DEB S DY=PY+1,DX=43 X XY S MPASX=0,MPASY=1,NXI=42,NXS=44,NYI=DEBP-1,NYS=22 X XY D ^TOVIMPIM G:X1=1 END G:X1=6 AJOUT G DEB
AJOUT I %FIN'=1 D EDIT,POCLEPA^%VVIDEO
 D ^TOGETAJP S PY=7 G DEB
FIN Q
END K PY,MPASX,MPASY,NXI,NXS,NYI,NYS,TYMOD,ADPY,DPY,GF,DE,FI,PARAM Q
EDIT D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...") S (DLIG,LIG)=-1 F FG=1:1 S LIG=$N(^POSENR($I,PAGE,LIG)) Q:LIG=-1  S DLIG=LIG
 S LI=$S(DLIG=-1:8,1:DLIG+1) I LI>21 S LI=8,PAGE=PAGE+1
 K LIG,DLIG,FG S %FIN=1 G:%PAR'="E" IMP3 F I=1:1 S INEXT=$N(^[QUI]EXPLICI(YA,INEXT)) G:INEXT=-1 IMP D EXP
EXP S NEXT=$N(^[QUI]EXPLICI(YA,INEXT,-1))
 S ^POSENR($I,PAGE,LI)=NEXT_"^(E)",^POSFUL($I,PAGE,LI)=NEXT,^VALPAR($I,NEXT)="",^DON($I,NEXT)=I,LI=LI+1 I LI>(LILIM+1) S PAGE=PAGE+1,LI=8
 Q
IMP S NEXT=-1
IMP3 F I=1:1 S NEXT=$N(^[QUI]FULL(YA,NEXT)) Q:NEXT=-1  D IMP2
 S PAGE=0 G FIN
IMP2 I (NEXT["$")!((NEXT["%ARG")!(NEXT["%VALA")) G FIN
 I $D(^VALPAR($I,NEXT)) G FIN
 S ^POSENR($I,PAGE,LI)=NEXT_"^(I)",^POSFUL($I,PAGE,LI)=NEXT,^VALPAR($I,NEXT)="",LI=LI+1 I LI>(LILIM+1) S PAGE=PAGE+1,LI=8
 G FIN

