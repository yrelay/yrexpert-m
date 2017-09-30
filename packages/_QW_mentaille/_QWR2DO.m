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

;%QWR2DO^INT^1^59547,73886^0
QWR2DO ;
 
 
 
 
 N %LIG,ABSEL,BLANCS,CORRES,DOM,IAB,IDE,NOR,OBJ,P,PHRASE,TEMP,TR,X,VAL
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Connection d'abaques a un domaine"),0)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"R2DO") K @(TEMP)
 S CORRES=$$CONCAS^%QZCHAD(TEMP,"COR")
 S ABSEL=$$CONCAS^%QZCHAD(TEMP,"ABS")
BCLDOM K @(CORRES)
 D ^%QUAPAD($$^%QZCHW("Choisissez un domaine"))
 S DOM=$$CHOIX^%QWDMU
 I DOM="" K @(TEMP) Q
 D ^%VZEATT
 S %LIG=1,P=$ZP(^QX($J,""))+1
 S BLANCS="                                       "
 K ^[QUI]QX($J,P),^QX($J,P)
 S ^[QUI]QX($J,P,"LC",1)=75
 S IAB=""
MAKE S IAB=$O(^[QUI]GROUGRIL(IAB)) G:(IAB="")!(IAB="z") FMAKE
 S VAL=^[QUI]GROUGRIL(IAB),VAL=$P(VAL,"|",2)
 S OBJ=$P(VAL,"^"),PHRASE=$E(OBJ,1,29),PHRASE=PHRASE_$E(BLANCS,1,30-$L(PHRASE))
 S NOR=$P(VAL,"^",2),PHRASE=PHRASE_$E(NOR,1,9),PHRASE=PHRASE_$E(BLANCS,1,40-$L(PHRASE))
 S IDE=$P(VAL,"^",3),PHRASE=PHRASE_$E(IDE,1,32),PHRASE=PHRASE_$E(BLANCS,1,75-$L(PHRASE))
 S:$D(^[QUI]RQSGLO("QW","ABADO",DOM,IAB)) PHRASE=$E(PHRASE,1,$L(PHRASE)-2)_"* "
 S @CORRES@(PHRASE,"IA")=IAB
 S ^[QUI]QX($J,P,"T",%LIG,1)=PHRASE
 S %LIG=%LIG+1
 G MAKE
FMAKE 
 S X=$$INI^%QUCHOI4(1,"",0,4,79,17,"",P,0)
 D POCLEPA^%VVIDEO,AFF^%QUCHOI4(P)
 D ^%VZCDB($$^%QZCHW("Choisissez les abaques a connecter a")_" "_DOM,0)
 D ^%QUCHOYP(ABSEL)
 S TR=""
BCLAB S TR=$O(@ABSEL@(TR))
 I TR="" D END^%QUCHOI4(P) K @(ABSEL),^[QUI]QX($J,P) G BCLDOM
 S IAB=@CORRES@(TR,"IA")
 I $E(TR,74)="*" K ^[QUI]RQSGLO("QW","ABADO",DOM,IAB) G BCLAB
 S ^[QUI]RQSGLO("QW","ABADO",DOM,IAB)=""
 G BCLAB

