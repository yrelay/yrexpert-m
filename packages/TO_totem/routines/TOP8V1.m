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

;TOP8V1^INT^1^59547,74874^0
TOP8V1 ;
 
 
 
 N LIGNE,I,ARC,TAB,J,REGLE,REP
 D CLEPAG^%VVIDEO
 F I=0:1 Q:$$LIGNE(I,.LIGNE)
 
 F I=I:1 Q:$$ARC(I,.ARC)
 S ARC("*")=""
 W !,$$^%QZCHW("avec graduation ?") S REGLE=$$^%VZEOUI("O")
 S TAB="ARC" S:($D(ARC("*"))#10)=1 TAB="^[QUI]CLICHE"
 D CLEPAG^%VVIDEO,132^%VVIDEO W *-1
 S ARC=$O(@TAB@("")),J=0
 F I=0:0 Q:ARC=""  R *REP:0 D TOUCHE^%INCCLAV(REP,.REP) Q:REP=1  D T1 S ARC=$O(@TAB@(ARC))
 Q
T1 I $D(^[QUI]CLICHE(ARC))<9 W !,"ARC ",ARC," inexistant" S J=J+1 Q
 S LIGNE=$O(LIGNE(""))
 F I=0:0 Q:LIGNE=""  D T2 S LIGNE=$O(LIGNE(LIGNE))
 Q
T2 W !,ARC,?10,LIGNE S J=J+1
 I ($D(^[QUI]CLICHE(ARC,LIGNE))#10)=0 W " ligne ",LIGNE," inexistante" Q
 I '(REGLE) W !,^[QUI]CLICHE(ARC,LIGNE)
 I REGLE W ! D R^LKV(0,132,^[QUI]CLICHE(ARC,LIGNE))
 Q
LIGNE(I,LIGNE) 
 N CTR S CTR=""
 D MESD^%VLECFL2("",$$^%QZCHW("Quelle ligne ? "),0,I,.CTR,.LIGNE)
 Q:(LIGNE="")!(CTR'="") 1
 S LIGNE(LIGNE)=""
 Q 0
ARC(I,ARC) 
 N CTR S CTR=""
 D MESD^%VLECFL2("",$$^%QZCHW("Quel arc ? (* pour tous)"),0,I,.CTR,.ARC)
 Q:(ARC="")!(CTR'="") 1
 S ARC(ARC)=""
 Q 0
TEST D ^TOP8V1 Q

