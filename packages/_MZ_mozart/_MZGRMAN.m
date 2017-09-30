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

;%MZGRMAN^INT^1^59547,73872^0
%MZGRMAN ;
 
 
 
AJ 
 
 
 D ^%VAUTOST
 
 Q
DUPG() 
 I '($D(OR(1))) S OR(1)=GC
 S GC=OR(1),NG=RESUL(1) G:GC=NG FIN D POCLEPA^%VVIDEO W "Un instant..." K ^[QUI]MOZART(NG)
 
 
 D STO^%VCMSCOR
 S ABENDSCR=0 I REFGAM=1 D REAF3 G ARDUP
 
 S OR=$P(NG,",",$L(NG,","))
 D ^%VZEATT,^%QMCP9(WHOIS,QUI,$$GI^%MZQS,GC,WHOIS,QUI,NG,OR),POCLEPA^%VVIDEO
 D AFPG^%VCMSCOR(NOMTAB_"("_$P(NOM,"(",2,599)),NEWOLD^%VCMSCOR
 S ^[QUI]MOZGARDE(NG)=^[QUI]MOZGARDE(GC)
 D KILLVISA(NG)
 D REAF2
ARDUP 
 
 G END
MODG() 
MODQ Q $$MODG^%MZGRMOD
 
SUPG() 
 
 
 K @(m("OLDN")) S GC=OR(1),NG=RESUL(1) D POCLEPA^%VVIDEO W "Un instant..." K ^[QUI]MOZART(NG) D SX^%QSGESTK($$GI^%MZQS,NG)
 
 G FIN
FIN Q 1
END Q 0
KILLVISA(NOM) 
 S ATT="VISA." F A=0:0 S ATT=$$NXTRIA^%QSTRUC8($$GI^%MZQS,NOM,ATT) Q:ATT'["VISA"  D SAH^%QSGESTI($$GI^%MZQS,NOM,ATT)
 Q
REAF S %V=^%SCRE(SCR) F %U=1:1:%V S RESUL(%U)=AFRESU(%U)
 D ^%VAFISCR Q
REAF2 S %V=^%SCRE(SCR) F %U=1:1:%V S AFRESU(%U)=RESUL(%U)
 D ^%VAFIGRI,^%VAFISCR Q
REAF3 S %V=^%SCRE(SCR) F %U=1:1:%V S RESUL(%U)=AFRESU(%U)
 D ^%VAFIGRI,^%VAFISCR Q

