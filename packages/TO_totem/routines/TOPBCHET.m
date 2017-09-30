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

;TOPBCHET^INT^1^59547,74874^0
TOPBCHET ;
 
 K ^SELEC($I),^POSENR($I) S %IL=0,NBCLCH=0,PAGE=0,LG=25,ARC=-1 F AA=1:1 S ARC=$N(^GLOCLI($I,ARC)) Q:ARC=-1  D TRAIT
 I NBCLCH=1 K ^POSENR($I)
FIN I $D(^POSENR($I)) D ^TOPBCHNU
 K AA,ARC,AFUN,NN,NBETU,NF,KO,%FN,FANU,TWREF,TT,TRWK,REP,FN,NBCLCH Q
TRAIT Q:'($D(^[QUI]PSRLFILI(ARC)))  Q:'($D(^[QUI]PSRLRTES(ARC)))
 S AFUN=-1 F NN=1:1 S AFUN=$N(^[QUI]PSRLRTES(ARC,AFUN)) Q:AFUN=-1  D TR1
 Q
TR1 S NBETU=^[QUI]PSRLRTES(ARC,AFUN),NBETU=$P(NBETU,"^",5),ETAD=$P(^[QUI]PSRLRTES(ARC,AFUN),"^",2),TAAD=$P(ETAD,"/",3)_"/"_$P(ETAD,"/",2)_"/"_$P(ETAD,"/",1)
 G:NBETU'=1 STR1 I $D(^[QUI]TREEWORK(AFUN)) D TR2 Q
 I $N(^[QUI]TREEWORK(AFUN))[AFUN S AFUN=$N(^[QUI]TREEWORK(AFUN)) D TR2
 Q
STR1 S NF=AFUN F %FN=1:1 Q:NF=-1  D:$D(^[QUI]TREEWORK(NF)) TR3 S NF=$N(^[QUI]TREEWORK(NF)) Q:NF'[AFUN
 Q
TR2 S FANU=AFUN,TWREF=-1
 F TT=1:1 S TWREF=$N(^[QUI]TREEWORK(FANU,TWREF)) Q:TWREF=-1  S TRWK=^[QUI]TREEWORK(FANU,TWREF),ARC=$P(TRWK,"^",10) I (ARC'="")&(ARC'=" ") S:$D(^[QUI]TVPAR(FANU)) %IL=%IL+1,^SELEC($I,0,%IL)=FANU_"^"_TWREF_"^"_ARC,NF=FANU D TR3 K NF
 Q
TR3 Q:'($D(^[QUI]TVPAR(NF)))  S LG=LG+1 I LG>21 S LG=8,PAGE=PAGE+1
 S NBCLCH=NBCLCH+1,^POSENR($I,PAGE,LG)=ARC_"^"_NF_"^"_TAAD Q

