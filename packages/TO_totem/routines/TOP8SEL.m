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

;TOP8SEL^INT^1^59547,74874^0
TOP8SEL ;
 
 
 K ^[QUI]TOP8SEL($J)
 K ^SELEC($J) D ^TOP0DAHE G:'(%OK) FIN G BEG:'($D(^SELEC($J))) S %DATH=-1
LLD S %DATH=$N(^SELEC($J,%DATH)) G:%DATH=-1 FIN K DAAT,HEUR S DATE=$P(%DATH," ",1),DATE=$P(DATE,"/",3)_$P(DATE,"/",2)_$P(DATE,"/",1),HOUR=$P(%DATH," ",2),HOUR=$TR(HOUR,"H",".") D BEG G LLD
BEG I $D(%ARRET) Q:%ARRET=1
 Q:('($D(DATE)))!('($D(HOUR)))  Q:(((DATE="")!(HOUR=""))!(DATE=-1))!(HOUR=-1)
 D ^TOP0CORR
 S TBP="^TABPARA($I)",PACLI="^[QUI]P0GETARC(DATE,HOUR)",PARCL="^[QUI]PARCLICH(ARC)",ARC=$O(@PACLI@("")) F AA=1:1 Q:ARC=""  S ^[QUI]TOP8SEL($J,ARC)="",ARC=$O(@PACLI@(ARC))
 I $O(^[QUI]TOP8SEL($J,""))="" Q
 D ^TOP8TLR("^[QUI]TOP8SEL($J)")
 K ^[QUI]TOP8SEL($J)
 
KILL D CLEPAG^%VVIDEO S DX=0,DY=10 X XY S R=$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de tous les global TOTEM ?")) Q:R'=1
 I WHOIS="BTL" F I="^[QUI]TREEWORK","^[QUI]TVPAR","^[QUI]PHAS","^[QUI]SECT","^[QUI]DEJAFAB","^[QUI]CONS","^[QUI]RAISMAT","^[QUI]ORDEVAL","^[QUI]DIM","^[QUI]RAISON","^[QUI]COUT","^[QUI]DUREE","^[QUI]PAREFLAT","^[QUI]PARMAT" K @(I)
FIN Q
TEST D ^TOP8SEL
 Q
 S GLOB="TXTX"
 S TXTX("0012903")=""
 S TXTX("0161K01")=""
 S TXTX("JHGHFHGF")=""

