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

;%VVISDUP^INT^1^59547,74036^0
GEVISDUP ;
 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Un instant"),"..." D ^%VMULSAV(SCR)
 S SC="SIM"_$I,PX=5,PY=5,%V=^%SCRE(SCR),%W=0
 K ^SAV($I),^%SCRE(SC),^%SCREC(SC),^REP($I),^IREP($I)
 F %U=1:1:%V I ($D(^%SCRE(SCR,%U))#10)=1 S %W=%W+1,^IREP($I,%U)=%W S:$D(^%SCRE(SCR,%U,"INVISIBLE")) ^REP($I,%U)="I" D TR
 S ^SAV($I)=SCR,SCR=SC,^%SCRE(SC)=%W K RESUL,AFRESU,FRESU F %U=1:1:%W S RESUL(%U)=""
 D ^%VCURWAY(SCR),^%VAFIGRI,^%VMODISC G ABEND:ABENDSCR=1
 S SCR=^SAV($I),%V=^%SCRE(SCR) K OR S %U="" F %V=1:1 S %U=$O(RESUL(%U)) Q:%U=""  S OR(%U)=RESUL(%U)
 K RESUL F %U=1:1:%V S RESUL(%U)=$S($D(^IREP($I,%U)):OR(^IREP($I,%U)),1:"")
 K OR D CLEPAG^%VVIDEO,^%VAFIGRI,^%VCMSVIS(.SU) G QUIT:SU'="OK"
 K ^VIS($J),OR F IT="RESUL","AFRESU" S %U="" F %V=1:1 S %U=$O(@IT@(%U)) Q:%U=""  S ^VIS($J,IT,%U)=@IT@(%U) S:IT="AFRESU" OR(%U)=AFRESU(%U)
 D ^%VMULRES(SCR) S %U="" F %V=1:1 S %U=$O(^REP($I,%U)) Q:%U=""  S FRESU(%U)=RESUL(%U)
 S %U="" F %V=1:1 S %U=$O(^VIS($J,"RESUL",%U)) Q:%U=""  I RESUL(%U)="" S RESUL(%U)=^VIS($J,"RESUL",%U),FRESU(%U)=^VIS($J,"AFRESU",%U)
 D ^%VAFIGRI,^%VAFISCR,^%VMODISC G FIN:ABENDSCR D DUPL^%VCMSCOR I '(OK) K OR S ABENDSCR=1 G FIN
 D STO^%VCMSCOR,^%VDUPGRI,AFPG^%VCMSCOR(NOMTAB_"("_$P(NOM,"(",2,599)),NEWOLD^%VCMSCOR S ABENDSCR=1 G FIN
ABEND S SCR=^SAV($I),ABENDSCR=1
QUIT D ^%VMULRES(SCR),CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR
FIN S ABENDSCR=1
END K OR,^SAV($I),^VIS($J),^REP($I) Q
TR S LIB=$S($D(^%SCRE(SCR,%U,"INVISIBLE")):$S($D(^%SCRE(SCR,%U,"NOM")):^%SCRE(SCR,%U,"NOM"),1:""),1:^%SCRE(SCR,%U,1)),LIB=$$GETLBLAN^%VTLBLAN(LIB) S:LIB="" LIB="???" S ^%SCRE(SC,%W,1)=LIB_" : ",^%SCRE(SC,%W,2)=PX,^%SCRE(SC,%W,3)=PY,PY=PY+1
 S ^%SCRE(SC,%W,4)=$S($D(^%SCRE(SCR,%U,4)):^%SCRE(SCR,%U,4),1:"") Q

