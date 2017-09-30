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

;%DLJANBR^INT^1^59547,73868^0
DLJANBR ;
 
PCH I $D(EXPVU(PCH)) S %RL=0,VXPX=EXPVU(PCH),AD="QUIT" G END
 I $E(PCH,1)="""" S PCH=$P($E(PCH,2,299),"""",1),CONCUR=0,AD="ZERO" G END
 D TO^%QZNBN1 I ISNUM=1 S AD="ESTENT" G END
 S AD="FIN" G END
 
 D ^%DLJRECI I %UNK S CONCUR=0,AD="ZERO" G END
 S AD="CONT"
END Q
IND S PRF=$P(PCH,"~",1),PCHIN=$P(PCH,"~",2,999),%UC=0,PREF="V(YA,"""_PRF_"."""
LPCH S %UC=%UC+1,PCH=$P(PCHIN,"~",%UC) G:PCH="" FPCH D @("PCH"_ROPC) S PREF=PREF_"_"_VXPX_"_"".""" G LPCH
FPCH S VXPX=$E(PREF,1,$L(PREF)-4)_")",%EXIN=VXPX D ^%ABINDIN
 K PREF,PCHIN Q
ART S PRF=$P(PCH,"~",1),PCHIN=$P(PCH,"~",2,999),%UC=0,PREF=""""_PRF_"."""
LAR S %UC=%UC+1,PCH=$P(PCHIN,"~",%UC) G:PCH="" FAR D @("PCH"_ROPC) S PREF=PREF_"_"_VXPX_"_"".""" G LAR
FAR S VXPX=$E(PREF,1,$L(PREF)-4) K PREF,PCHIN Q

