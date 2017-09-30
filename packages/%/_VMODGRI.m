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

;%VMODGRI^INT^1^59547,74035^0
GEMODGRI ;
 G:'($D(^%SCRE(SCR,"RELATION"))) FIN D POCLEPA^%VVIDEO W "Un instant..."
 K ^PILMOD($J) S %V=^%SCRE(SCR) F %U=1:1:%V I ($D(^%SCRE(SCR,%U))#10)=1,$D(OR(%U)),RESUL(%U)'=OR(%U) S ^PILMOD($J,SCR,%U)=1
 G:'($D(^PILMOD($J,SCR))) FIN
 K ^PILGRI($J),^GRILVU($J),^GRILSUP($J) S ^PILGRI($J,1)=SCR,NUP=2,NS=-1,%SCR=SCR
LSC1 S NS=$N(^PILGRI($J,NS)) G:NS=-1 FSC1 S SC1=^PILGRI($J,NS),SC2=-1
LSC2 S SC2=$N(^%SCRE(SC1,"RELATION",SC2)) G:SC2=-1 LSC1 S CH=^%SCRE(SC1,"RELATION",SC2),%V=^%SCRE(SC2),NBI=0 F %U=1:1 S %W=$P(CH,",",%U) G:%W="" LSC2 D:$D(^PILMOD($J,SC1,%W)) MOD
MOD I '($D(^PILGRI($J,SC2))) S ^PILGRI($J,NUP)=SC2,NUP=NUP+1
 F %U1=1:1:%V I ($D(^%SCRE(SC2,%U1))#10)=1,$D(^%SCRE(SC2,%U1,"INVISIBLE")) S IN=^%SCRE(SC2,%U1,"INVISIBLE") I IN["RESUL" S CH=$P($P(IN,"(",2),")",1) I $D(^PILMOD($J,SC1,CH)) S ^GRILSUP($J,SC1,SC2,%U1)=IN,^PILMOD($J,SC2,%U1)=CH
 Q
FSC1 K ^GRILVAL($J) S PNS=1,ORD=1 D VVS G FVSC
VVS S SC2=-1
VSC2 S SC2=$N(^GRILSUP($J,SCR,SC2)) Q:SC2=-1  S %U=-1
VPU S %U=$N(^GRILSUP($J,SCR,SC2,%U)) G:%U=-1 VSC2 S ^GRILVAL($J,PNS,SC2,ORD,%U,2)=@^GRILSUP($J,SCR,SC2,%U),^GRILVAL($J,PNS,SC2,ORD,%U,1)=OR(^PILMOD($J,SC2,%U)) G VPU
FVSC D ^%VSAVMUL(SCR) S NS=-1
KNS S NS=$N(^GRILVAL($J,NS)) G:NS=-1 FKSC S PNS=$ZP(^GRILVAL($J,""))+1,SCR=-1
KSCR S SCR=$N(^GRILVAL($J,NS,SCR)) G:SCR=-1 KNS S KV=-1,NOMTAB=$S($D(^%SCRE(SCR,"GLOSTOC")):^%SCRE(SCR,"GLOSTOC"),1:"^[QUI]"_SCR)
KVAL S KV=$N(^GRILVAL($J,NS,SCR,KV)) G:KV=-1 KSCR S %V=^%SCRE(SCR) K RESUL,VAL
 F %U=1:1:%V S RESUL(%U)=$S($D(^GRILVAL($J,NS,SCR,KV,%U,1)):^GRILVAL($J,NS,SCR,KV,%U,1),1:"") S:$D(^GRILVAL($J,NS,SCR,KV,%U,1)) VAL(%U)=RESUL(%U)
 D ^%VMULTGE(.STOP) S ORD=0
LOOP G:STOP<0 KVAL S %V=-1 F %U=1:1 S %V=$N(VAL(%V)) Q:%V=-1  G:VAL(%V)'=RESUL(%V) KVAL
 D DEL^%VCMSCOR
 K OR D MODI^%VCMSCOR G LOOP:'(OK)
 S %U=-1 F %V=1:1 S %U=$N(^PILMOD($J,SCR,%U)) Q:%U=-1  S OR(%U)=AFRESU(%U)
 S ORD=ORD+1,%U=-1 F %V=1:1 S %U=$N(^GRILVAL($J,NS,SCR,KV,%U)) Q:%U=-1  S RESUL(%U)=^GRILVAL($J,NS,SCR,KV,%U,2)
 S ROU=$S($D(^%SCRE(SCR,"ROUSTOC")):^%SCRE(SCR,"ROUSTOC"),1:"^%VAUTOST") S:ROU="" ROU="^%VAUTOST" D @ROU,VVS K OR D C3^%VMULTGE(.STOP) G LOOP
FKSC S SCR=%SCR,NOMTAB=$S($D(^%SCRE(SCR,"GLOSTOC")):^%SCRE(SCR,"GLOSTOC"),1:"^[QUI]"_SCR) D ^%VRESMUL(SCR),POCLEPA^%VVIDEO
FIN Q

