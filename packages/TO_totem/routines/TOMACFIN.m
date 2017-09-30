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

;TOMACFIN^INT^1^59547,74873^0
TOMACFIN ;
 
 K MCF S MCF("MC")=$N(@TB0@(FOR("NPH"),1,-1)) G:MCF("MC")'=-1 T0 S (MCF("COUT"),MCF("DUREE"),MCF("SEC"),MCF("RAIS"))="???" G AFF
T0 D T1 S MCF("QS")=MCF("SEC"),MCF("QC")=MCF("COUT"),MCF("QD")=MCF("DUREE"),MCF("QR")=MCF("RAIS"),MCF("QT")=$S(MCF("QC")["?":99999999999E-0,1:MCF("QC"))
T2 S MCF("MC")=$N(@TB0@(FOR("NPH"),1,MCF("MC"))) G:MCF("MC")=-1 T3 D T1 G:MCF("QS")["?" T4 G:MCF("COUT")["?" T2 G:MCF("COUT")'<MCF("QT") T2
T4 S MCF("QC")=MCF("COUT"),MCF("QS")=MCF("SEC"),MCF("QD")=MCF("DUREE"),MCF("QR")=MCF("RAIS"),MCF("QT")=$S(MCF("QC")["?":99999999999E-0,1:MCF("QC")) G T2
T3 S MCF("SEC")=MCF("QS"),MCF("COUT")=MCF("QC"),MCF("DUREE")=MCF("QD"),MCF("RAIS")=MCF("QR")
AFF S MCF("OPOG")=OP_"/"_OG,^[QUI]SECT(NUFA,TWREF,MCF("OPOG"))=MCF("SEC"),^[QUI]COUT(NUFA,TWREF,MCF("OPOG"))=$P(MCF("DUREE"),"^",1),^[QUI]CARATPC(NUFA,TWREF,MCF("OPOG"),"COUT.UNITAIRE")=$P(MCF("DUREE"),"^",1)
 S MCF("DUREEX")=$P(MCF("DUREE"),"^",2,500),^[QUI]DUREE(NUFA,TWREF,MCF("OPOG"))=MCF("DUREEX"),^[QUI]CARATPC(NUFA,TWREF,MCF("OPOG"),"DUREE.PREPARATION")=$P(MCF("DUREEX"),"^",1)
 S ^[QUI]CARATPC(NUFA,TWREF,MCF("OPOG"),"DUREE.UNITAIRE")=$P(MCF("DUREEX"),"^",2)
 I MCF("RAIS")'="???" S ^[QUI]RAISON(NUFA,TWREF,MCF("OPOG"))=MCF("RAIS") D ^TOAUTRFO
 
 
 S:MCF("SEC")'="???" ^PHASADM($I,NUFA,TWREF,"DIM",FOR("NPH"))=MCF("SEC")_"|"_PH_"|"_OP
 S ^PHASADM($I,NUFA,TWREF,"CONS",FOR("NPH"))=MCF("SEC")_"|"_PH_"|"_OP_"|"_PH(1)_"|"_OP(1) G:'(%IND) NIND S FOR("IN")=-1
 F %U=1:1 S FOR("IN")=$N(^INDPH($J,FOR("IN"))) Q:FOR("IN")=-1  S ^PHASADM($I,NUFA,TWREF,"CONS",FOR("NPH"),"IND",FOR("IN"))=^INDPH($J,FOR("IN"))
NIND S ^NBRGLEV($I,NUFA,"COUR")=^NBRGLEV($I,NUFA,"COUR")+1,^PHASADM($I,NUFA,TWREF,"MAC","OK",MCF("SEC"),OP,PH)=OG D:MCF("SEC")'["?" PARA
FIN S MCF("%TMC")="^TENTATIV($I,NUFA,TWREF,""MAC"",MCF(""%MC""),OP,PH)",MCF("%TBPH")="^TENTATIV($I,NUFA,TWREF,""PHMAC"",PH,OP)",MCF("%MC")=-1 F MCF("%U9")=1:1 S MCF("%MC")=$N(@MCF("%TBPH")@(MCF("%MC"))) Q:MCF("%MC")=-1  K @(MCF("%TMC"))
 K MCF Q
T1 S MCF("RMC")=@TB0@(FOR("NPH"),1,MCF("MC")),MCF("%U9")=1 F IT="MCF(""SEC"")","MCF(""COUT"")","MCF(""DUREE"")","MCF(""RAIS"")" S @IT=$P(MCF("RMC"),"|",MCF("%U9")),MCF("%U9")=MCF("%U9")+1
 Q
PARA S MCF("OPOG")=OP_"/"_OG,MCF("QT")="^S($I,NUFA,TWREF,MCF(""OPOG""),MCF(""SEC""))",MCF("QR")="^[QUI]PARMAC(NUFA,TWREF,MCF(""OPOG""))",MCF("QC")=-1
 F MCF("%U8")=0:0 S MCF("QC")=$N(@MCF("QT")@(MCF("QC"))) Q:MCF("QC")=-1  S @MCF("QR")@(MCF("QC"))=@MCF("QT")@(MCF("QC"))
 Q

