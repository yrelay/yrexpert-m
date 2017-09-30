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

;%MZGRMOD^INT^1^59547,73872^0
%MZGRMOD ;
 
 
DUPG() 
 I '($D(OR(1))) G END
 S GC=OR(1),NG=RESUL(1) G:GC=NG FIN D POCLEPA^%VVIDEO W "Un instant..."
 D ALL^%QSGEST2($$GI^%MZQS,GC,NG),STO^%VCMSCOR,AFPG^%VCMSCOR(NOMTAB_"("_$P(NOM,"(",2,599)),NEWOLD^%VCMSCOR
 D KILLVISA(NG)
 G END
 
MODG() 
MODQ I OR(1)'=RESUL(1) D ^%VZEAVT("L'identificateur de gamme ne peut-etre modifie ..."),POCLEPA^%VVIDEO,REAF2 G MODQ
 D POCLEPA^%VVIDEO W $$^%QZCHW("Voulez-vous vraiment modifier O/N ?") R *REP D POCLEPA^%VVIDEO W "Un instant..."
 S REP=$C(REP) I (REP'="N")&(REP'="O") D ^%VSQUEAK G MODQ
 I REP="N" D POCLEPA^%VVIDEO,REAF G END
 S GC=OR(1),NG=RESUL(1)
 
 I GC'=NG K @(m("OLDN")) G END
MAJQS 
 S %V=^%SCRE(SCR),RSRS=^[QUI]MOZGARDE(RESUL(1))
 S %U=1
MAJQS2 S %U=%U+1 I %U>%V G MAJQSF
 I RESUL(%U)=AFRESU(%U) G MAJQS2
 S VAL=$$^%QCAZG("^%SCRE(SCR,%U,""QUERY"",""MOZ"")")
 I ((RESUL(%U)="")&(AFRESU(%U)'=""))&(VAL'="") D PS^%QSGESTI($$GI^%MZQS,RESUL(1),$P(VAL,"~",1),AFRESU(%U),$S($P(VAL,"~",3)'="":$P(VAL,"~",3),1:1)) G MAJQS2
 I (RESUL(%U)'="")&(VAL'="") D PA^%QSGESTI($$GI^%MZQS,RESUL(1),$P(VAL,"~",1),RESUL(%U),$S($P(VAL,"~",3)'="":$P(VAL,"~",3),1:1)) G MAJQS2
 S $P(RSRS,"^",%U-1)=RESUL(%U)
 G MAJQS2
MAJQSF S ^[QUI]MOZGARDE(RESUL(1))=RSRS
 
 
 D POCLEPA^%VVIDEO
 G END
 
SUPG() 
 K @(m("OLDN")) S GC=OR(1),NG=RESUL(1) D POCLEPA^%VVIDEO W "Un instant..." D SX^%QSGESTK($$GI^%MZQS,NG) G FIN
FIN Q 1
END Q 0
KILLVISA(NOM) 
 S ATT="VISA." F A=0:0 S ATT=$$NXTRIA^%QSTRUC8($$GI^%MZQS,NOM,ATT) Q:ATT'["VISA"  D SAH^%QSGESTI($$GI^%MZQS,NOM,ATT)
 Q
REAF S %V=^%SCRE(SCR) F %U=1:1:%V S RESUL(%U)=AFRESU(%U)
 D ^%VAFISCR Q
REAF2 S %V=^%SCRE(SCR),RESUL(1)=OR(1)
 D ^%VAFISCR Q

