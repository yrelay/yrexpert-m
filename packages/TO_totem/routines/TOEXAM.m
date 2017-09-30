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

;TOEXAM^INT^1^59547,74872^0
TOEXAM ;
 
 S XX="ZR  ZL @ROU S (^LOCAROUT(ROU),^TOTGLOB(ROU))=$T(+1) F LIG=1:1 S LIGN=$T(+LIG) Q:LIGN=""""  S POS=0 F UU=0:0 S POS=$F(LIGN,""^"",POS) Q:POS=0  X EXAM "
 S EXAM="S LR=$E(LIGN,POS,299),EXP="""" F VV=1:1 X:($E(LR,VV)="" ""!($E(LR,VV)="","")!($L($E(LR,VV))=0)!($E(LR,VV)="":"")) ECR Q:($E(LR,VV)="" ""!($E(LR,VV)="","")!($L($E(LR,VV))=0)!($E(LR,VV)="":""))  S EXP=EXP_$E(LR,VV)"
 S ECR="Q:EXP=""""  Q:($L(EXP)>8)  I $D(^UTILITY(""ROU"",EXP))!($D(^[""MGR""]UTILITY(""ROU"",EXP))) X AFF"
 S AFF="W !,?10,EXP S ^TOTGLOB(ROU,EXP)=$S($D(^TOTGLOB(ROU,EXP)):^TOTGLOB(ROU,EXP)+1,1:1),^LOCAROUT(EXP,ROU)=$S($D(^LOCAROUT(EXP,ROU)):^LOCAROUT(EXP,ROU)+1,1:1)"
 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$L23^%QSLIB2("RETURN Fin de liste, CTRLF toutes") S DX=0,DY=0 X XY W $$^%QZCHW("Cross-reference sur les appels de routines : "),!,!,! S DY=$Y,DX=10
QUES S DY=DY+1 X XY W "- " S DX=$X D ^%VLEC G FIN:CTRLA,TOUTES:CTRLF,TRAIT:Y1="" S TBROUT(Y1)=1,DX=10,DY=DY+1 G QUES
TRAIT S RO=-1 F SS=0:0 S RO=$N(TBROUT(RO)) Q:RO=-1  K VALCLE S NOMTAB="^UTILITY",ADR="TRAIT1^TOEXAM",VALCLE(1)="ROU",VALCLE(2)=RO D ^%VKMULG
 Q
TRAIT1 S ROU=B2 K ^TOTGLOB(ROU) W !,ROU X XX
 Q
TOUTES K ^TOTGLOB,^LOCAROUT S ROU=0 F TT=0:0 S ROU=$N(^UTILITY("ROU",ROU)) Q:ROU=-1  W !,ROU X XX
 Q

