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

;%DLCAP2^INT^1^59547,73867^0
JLCAP2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
RETRAIT(OPRES) 
 N U,SEM,DA,CH,CHA,P1,P2,JOUR
 S U=""
BRET S U=$O(@OPRES@(U))
 Q:U=""
 G:'($D(@OPRES@(U,2))) BRET
 S DA=@OPRES@(U,2)
 S JOUR=$$DATENO3^%QMDATE(DA)
 S MA=@OPRES@(U,3)
 G:'($D(^[QUI]MACAP(MA,JOUR))) RETGL
 S CH=^[QUI]MACAP(MA,JOUR)
 S CHA=$P(CH,"^",2)-@OPRES@(U,1)
 S:CHA<0 CHA=0
 S P1=$P(CH,"^"),P2=$P(CH,"^",3,10)
 S ^[QUI]MACAP(MA,JOUR)=P1_"^"_CHA_"^"_P2
RETGL G:'($D(^RESSOUR($J,MA,JOUR))) BRET
 S CHA=^RESSOUR($J,MA,JOUR)-@OPRES@(U,1)
 S:CHA<0 CHA=0
 I CHA=0 K ^RESSOUR($J,MA,JOUR) G BRET
 S ^RESSOUR($J,MA,JOUR)=CHA
 G BRET
 
 
 
 
 
 
 
 
 
 
 
 
 
ADD(MA,UNITE,DA,VAL) 
 N CHA,ERR,JOUR,CH,RMA,CHAT
 S JOUR=$$DATENO3^%QMDATE(JOUR)
 S ^RESSOUR($J,MA,JOUR)=$$^%QCAZG("^RESSOUR($J,"""_MA_""",JOUR)")+VAL
 S CH=$S($D(^[QUI]MACAP(MA,JOUR)):^[QUI]MACAP(MA,JOUR),1:"")
 I CH="" S P1="",P2="^^^" G ADDMAJ
 S P1=$P(CH,"^"),P2=$P(CH,"^",3,10),VAL=VAL+$P(CH,"^",2)
ADDMAJ S ^[QUI]MACAP(MA,JOUR)=P1_"^"_VAL_"^"_P2
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
ADDPART(MA,UNITE,CAPST,DA,VAL,RECH,CHAREST) 
 N CHA,ERR,JOUR,CHCAPA,CH,P1,P2
 S CHAREST=0
 S JOUR=$$DATENO3^%QMDATE(DA)
 S CAPA=$$^%QSCALIN($$MACH^%DLCON2,MA,$$CAPACITE^%DLCON2,JOUR)
 G:CAPA'="" AJCHAP
 S CAPA=CAPST
AJCHAP S CH=$S($D(^[QUI]MACAP(MA,JOUR)):^[QUI]MACAP(MA,JOUR),1:"")
 I CH="" S P1="",P2="^^^",CHA=0 G AJCHAP2
 S CHA=$P(CH,"^",2)
 S P1=$P(CH,"^"),P2=$P(CH,"^",3,10)
AJCHAP2 Q:CHA'<CAPA 0
 S CHAREST=0
 I (CHA+VAL)>CAPA N VAL2 S VAL2=VAL,VAL=CAPA-CHA,CHAREST=VAL2-VAL
 S CHA=CHA+VAL
 Q:RECH 1
 S ^RESSOUR($J,MA,JOUR)=$$^%QCAZG("^RESSOUR($J,"""_MA_""",JOUR)")+VAL
 S ^[QUI]MACAP(MA,JOUR)=P1_"^"_CHA_"^"_P2
 Q 1
 
RETSOU 
 N NO,U
 N MA,CH,P1,P2,P3
 S MA=""
BERRDA S MA=$O(^RESSOUR($J,MA))
 G:MA="" FINSOU
 S NO=""
BERRSEM S NO=$O(^RESSOUR($J,MA,NO))
 G:NO="" BERRDA
 S U=^RESSOUR($J,MA,NO)
 S CH=$$^%QCAZG("^[QUI]MACAP("""_MA_""",NO)")
 S P1=$P(CH,"^"),P2=$P(CH,"^",2),P3=$P(CH,"^",3,10)
 S U=P2-U
 S:U<0 U=0
 S ^[QUI]MACAP(MA,NO)=P1_"^"_U_"^"_P3
 G BERRSEM
 
FINSOU K ^RESSOUR($J)
 Q
 
 
 
 
 
CAPASTA(MA,UNITE,MESS) 
 N V
 S V=$$^%QSCALIN($$MACH^%DLCON2,MA,$$CAPACITE^%DLCON2,1)
 I V="" D:MESS INSERR2^%DLUTIL("  "_$$^%QZCHW("MACHINE")_" "_MA,30,LISRES) Q 99999999
 S V=V+0
 I V=0 D:MESS INSERR2^%DLUTIL("  "_$$^%QZCHW("MACHINE")_" "_MA,31,LISRES) Q 99999999
 Q V
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DECAL(DATIN,DATEN,REGIME,NBDEC,MAXDEC) 
 N DI,DF
 Q:NBDEC>MAXDEC 0
 I DATIN<DATEN S DI=DATIN,DF=DATEN G DECAL2
 S DI=DATEN,DF=DATIN
DECAL2 S NBDEC=NBDEC+$$NBJ^%QMDRUTI(REGIME,DI,DF)
 I NBDEC>MAXDEC Q 0
 Q 1

