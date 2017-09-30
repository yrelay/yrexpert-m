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

;%ABGRCND^INT^1^59547,73864^0
%ABGRCND ;
 
 S XDP="("_RESUCONT_")",ADRF="TRAIT^%ABGRCND" D ^%ABFSQUL,RECONS^%ABFSQUL
 I EX'["," S SIG=$A($E(EX,1)),CPG=$S((SIG'>90)&(SIG'<65):1,1:0),EX="%INT"_$S(CPG=1:"=",1:"")_EX G AFF
 S PTG=$P(EX,",",1),PTD=$P(EX,",",2),CROC1=$E(PTG,1),CROC2=$E(PTD,$L(PTD)),EXG=$E(PTG,2,299),EXD=$E(PTD,1,$L(PTD)-1)
 I (CROC1'="[")&(CROC1'="]") S EX="%INT"_$S(CROC2="]":"'>",1:"<")_EXD G AFF
 S EX="%INT"_$S(CROC1="[":"'<",1:">")_EXG_"&(%INT"_$S(CROC2="]":"'>",1:"<")_EXD_")"
AFF S ^[QUW]GRCOND(%NUGR,DP,PY,PX)=EX
FIN S ODX=DX,ODY=DY D POCLEPA^%VVIDEO W EX," [RETURN] " R *RET S DX=ODX,DY=ODY X XY Q
TRAIT I $D(^PARCHGR($I,PCH)) S VPOL(VI)="VPAR("""_^PARCHGR($I,PCH)_""")"
 G FIN

