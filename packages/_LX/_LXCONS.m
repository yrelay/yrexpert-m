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

;%LXCONS^INT^1^59547,73870^0
LEXCONS ;
 
 N HA,Z,L1
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,30,0,4,1,0,$$^%QZCHW("CONSULTATION BREVE"))
 S DY=22 X XY
 W $$^%QZCHW("#.<lexeme>.<lexeme>... -> Mots finissant par ")
 W !,$$^%QZCHW("<lexeme>.<lexeme>...   -> Mots commencant par ")
BEG S DX=20,DY=6 X XY W $$^%QZCHW("A consulter : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S PCH=Y1
 S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=(40-($L(PCH)+4))\4 X XY D CAG^%VVIDEO W "* ",PCH," *"
 D ^%VZEATT
 G:$E(PCH,1)'="#" ABN S Y1=$E(PCH,2,$L(PCH)),PCH="",NPT=$L(Y1,".") F %U=1:1:NPT S %V=$P(Y1,".",%U),PCH="."_%V_PCH
 S PCH=$E(PCH,2,$L(PCH)) D ^%LXRECAB G ABN1
ABN D ^%LXABREV
ABN1 S HA=0,DX=0,DY=7 X XY D CLEBAS^%VVIDEO X XY S PAR=-1,NB=1
 F UU=0:0 S PAR=$N(^MOTLEX($I,PAR)),S=-1 Q:PAR=-1  D:$D(^[QUI]TOLEX(PAR)) BLD^%VVIDEO W !,?20,PAR S:'($D(^[QUI]TOLEX(PAR))) S=$N(^[QUI]TOSYNONY(PAR,S)) D BLD^%VVIDEO W:S'=-1 " (",S,")" S NB=NB+1 D NORM^%VVIDEO D:NB>10 STOP Q:HA=1
 I HA'=1 D ^%VZEAVT($$^%QZCHW("Fin "))
 S DX=0,DY=6 D CLEBAS^%VVIDEO
 S DY=22 X XY
 W $$^%QZCHW("#.<lexeme>.<lexeme>... -> Mots finissant par ")
 W !,$$^%QZCHW("<lexeme>.<lexeme>...   -> Mots commencant par ")
 G BEG
 
FIN D CLEPAG^%VVIDEO Q
 
STOP D POCLEPA^%VVIDEO W $$^%QZCHW("(F)in,autre caractere pour continuer") R *REP S REP=$C(REP)
 S:REP="F" HA=1 S NB=1,DX=0,DY=7 D CLEBAS^%VVIDEO X XY
 Q

