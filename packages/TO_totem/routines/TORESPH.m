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

;TORESPH^INT^1^59547,74875^0
TORESPH ;
 
 S DT=0,PT=0,INCO="       ??",P="^[QUI]PHAS(NUFA,YA)"
 S YA=-1 I DEV="ECR" D CLEPAG^%VVIDEO
 E  H 5 W #
LOOP S YA=$N(^[QUI]PHAS(NUFA,YA)) G:YA=-1 FIN2
 W !,?10,"Gamme de fabrication proposee pour : ",!,!,?10,^[QUI]TIDENTO(NUFA,YA),!,!,!,!,?1,"No",?6,"Sections",?25,"Operations",?52,"Temps",?73,"Couts",!,!
 S N=-1 F I=1:1 S N=$N(^[QUI]PHAS(NUFA,YA,N)) G:N=-1 FIN W ?1,N,?6,^[QUI]SECT(NUFA,YA,^[QUI]PHAS(NUFA,YA,N)),?25,^[QUI]PHAS(NUFA,YA,N) D CUTU W !
 G FIN
CUTU S CT=$S($D(^[QUI]COUT(NUFA,YA,@P@(N))):$J(^[QUI]COUT(NUFA,YA,@P@(N)),9,2),1:INCO)
 S TE=$S($D(^[QUI]DUREE(NUFA,YA,@P@(N))):$J(^[QUI]DUREE(NUFA,YA,@P@(N)),9,2),1:INCO)
 S:$D(^[QUI]DUREE(NUFA,YA,@P@(N))) DT=DT+^[QUI]DUREE(NUFA,YA,@P@(N)) S:$D(^[QUI]COUT(NUFA,YA,@P@(N))) PT=PT+^[QUI]COUT(NUFA,YA,@P@(N)) W ?50,TE,?70,CT Q
FIN W !,?1,"*** TOTAL",?50,$J(DT,9,2),?70,$J(PT,9,2)
 I DEV="ECR" D POCLEPA^%VVIDEO W "Frapper RETURN pour continuer" R XX S DT=0,PT=0 D CLEPAG^%VVIDEO
 E  W #
 G LOOP
FIN2 C:DEV="IMPR" IMPR Q

