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

;%DLCAPA^INT^1^59547,73867^0
JLCAPA ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DATAVAL(MA,UNITE,CAPST,DA,DALIM,VAL,REG,PLUS,PREM,NBDEC,MAXDEC,DATEDEB,DATEF,DEC) 
 N CHA,JOUR,CAPA,ERREUR,DAT,VALI
 I DA<2000 Q 0
 S DATEDEB=""
BDAV I DA'<DALIM S ERRNONBL=8 Q 0
 S JOUR=$$DATENO3^%QMDATE(DA)
 S CAPA=$$^%QSCALIN($$MACH^%DLCON2,MA,$$CAPACITE^%DLCON2,JOUR)
 G:CAPA'="" DATAC
 S CAPA=CAPST
DATAC S CH=$S($D(^[QUI]MACAP(MA,JOUR)):^[QUI]MACAP(MA,JOUR),1:"")
 S CHA=$P(CH,"^",2)+0
 G:(CHA+VAL)>CAPA DATAC2
 
 S:DATEDEB="" DATEDEB=DA
 S DATEF=DA
 Q 1
 
DATAC2 S DAT=$O(^[QUI]PLPLACAL(REG,DA))
 I DAT="" S ERR=7 Q 0
 S DEC=DEC+1
 I (NBDEC+DEC)>MAXDEC Q 0
 
 S VALI=VAL
 I PLUS,CHA'>CAPA S VAL=VAL-(CAPA-CHA) S:DATEDEB="" DATEDEB=DA
 I PREM S PREM=0 I VALI=VAL Q 0
 S DA=DAT
 G BDAV
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DATAMON(MA,UNITE,CAPST,DA,DALIM,VAL,REG,PLUS,PREM,NBDEC,MAXDEC,DATEDEB,DATEF,DEC) 
 N JOUR,CHA,CH,CAPA,ERREUR,VALI
 I DA<2000 Q 0
 S DATEF=""
BDAM I DA'>DALIM S ERRNONBL=8 Q 0
 S JOUR=$$DATENO3^%QMDATE(DA)
 S CAPA=$$^%QSCALIN($$MACH^%DLCON2,MA,$$CAPACITE^%DLCON2,JOUR)
 G:CAPA'="" DATMC
 S CAPA=CAPST
DATMC S CH=$S($D(^[QUI]MACAP(MA,JOUR)):^[QUI]MACAP(MA,JOUR),1:"")
 S CHA=$P(CH,"^",2)+0
 G:(CHA+VAL)>CAPA DATMC2
 
 S:DATEF="" DATEF=DA
 S DATEDEB=DA
 Q 1
 
DATMC2 S DAT=$ZP(^[QUI]PLPLACAL(REG,DA))
 I DAT="" S ERR=7 Q 0
 S DEC=DEC+1
 I (NBDEC+DEC)>MAXDEC Q 0
 
 S VALI=VAL
 I PLUS,CHA'>CAPA S VAL=VAL-(CAPA-CHA) S:DATEF="" DATEF=DA
 I PREM S PREM=0 I VAL=VALI Q 0
 S DA=DAT
 G BDAM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ADDCONT(MA,UNITE,CAPST,DA,VAL) 
 N JOUR,CHA,ERREUR,CHCAPA,CH,P1,P2
 I DA<2000 Q 0
 S JOUR=$$DATENO3^%QMDATE(DA)
 S CAPA=$$^%QSCALIN($$MACH^%DLCON2,MA,$$CAPACITE^%DLCON2,JOUR)
 G:CAPA'="" AJCHA
 S CAPA=CAPST
AJCHA S CH=$S($D(^[QUI]MACAP(MA,JOUR)):^[QUI]MACAP(MA,JOUR),1:"")
 I CH="" S P1="",P2="^^^",CHA=VAL G AJCHA2
 S CHA=$P(CH,"^",2)+VAL
 S P1=$P(CH,"^"),P2=$P(CH,"^",3,10)
AJCHA2 Q:CHA>CAPA 0
 S ^RESSOUR($J,MA,JOUR)=$$^%QCAZG("^RESSOUR($J,"""_MA_""",JOUR)")+VAL
 S ^[QUI]MACAP(MA,JOUR)=P1_"^"_CHA_"^"_P2
 Q 1
 ;

