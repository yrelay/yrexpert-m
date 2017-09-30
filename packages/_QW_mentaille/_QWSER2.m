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

;%QWSER2^INT^1^59547,73886^0
QWSER2 ;
 
 
 
 
 
 
 
 
SELEC(REP,IND,DOM,TABSEL,ABVU) 
 N TEMP,%IAB,LATTR,%IAB
 I '($D(^[QUI]RQSGLO("QW","ABADO",DOM))) Q
 S LATTR=$$LATT^%QWSTOL(REP,IND)
 S IAB="" F %IAB=0:0 S IAB=$O(^[QUI]RQSGLO("QW","ABADO",DOM,IAB)) Q:IAB=""  D TRT
 Q
 
TRT 
 N NUGROU,NBP,%NBP,UU,PP,PREMATCH,TYP,RS,%RS
 
 I $D(@ABVU@(IAB)) S NUGROU=$P(^[QUI]GROUGRIL(IAB),"|"),%TYPN=$P($P(^[QUI]GROUGRIL(IAB),"|",2),"^",5) S:%TYPN="" %TYPN="SANS" S @GROUVU@(NUGROU)=1,@GROUVU@(NUGROU,%TYPN)=1
 
 Q:'($D(^[QUI]GROUGRIL(IAB)))
 S NUGROU=$P(^[QUI]GROUGRIL(IAB),"|")
 
 I ($D(@GROUVU@(NUGROU))#10)=1 G:@GROUVU@(NUGROU)=1 OKGR G:@GROUVU@(NUGROU)=0 FINTRT
 
 S NBP="",PREMATCH=1
 F %NBP=0:0 S NBP=$O(^[QUI]DEFGROUP(NUGROU,"P",NBP)) Q:(NBP="")!(PREMATCH=0)  S REFGR=^[QUI]DEFGROUP(NUGROU,"P",NBP) F UU=1:1 S PP=$P(REFGR,"/",UU) Q:(PP="")!(PREMATCH=0)  S PREMATCH=$D(@LATTR@(PP))
 I '(PREMATCH) S @GROUVU@(NUGROU)=0 Q
 S TYP="C"
 
 S RS=""
 F %RS=0:0 S RS=$O(^[QUI]GRILRESU(IAB,RS)) Q:RS=""  Q:'($D(@LATTR@(RS)))
 I RS="" S @GROUVU@(NUGROU)=0 Q
 S @GROUVU@(NUGROU)=1
OKGR 
 S %TYPN=""
 S %TYPN=$P($P(^[QUI]GROUGRIL(IAB),"|",2),"^",5)
 G:%TYPN="" OKNR
 I $D(@GROUVU@(NUGROU,%TYPN)) G:@GROUVU@(NUGROU,%TYPN)=1 OKNR Q:@GROUVU@(NUGROU,%TYPN)=0
 I (%TYPN=$$^%QZCHW("SANS"))!((%TYPN=$$^%QZCHW("TOUTES"))!(%TYPN=$$^%QZCHW("TOUTE"))) G OKNR
 I '($D(@LATTR@(%TYPN))) S @GROUVU@(NUGROU,%TYPN)=0 Q
 S @GROUVU@(NUGROU,%TYPN)=1
OKNR 
 S:'($D(^[QUI]RQSDON("QW","REM",2,DOM,IAB))) ^[QUI]RQSDON("QW","REM",2,DOM,IAB)=5E-1,^[QUI]RQSDON("QW","REM",2,DOM,IAB,"BONUS")=50,^[QUI]RQSDON("QW","REM",2,DOM,IAB,"MALUS")=50
 S @TABSEL@(2,DOM,IAB)=""
FINTRT Q
 
TEST 
 N RES
 D POCLEPA^%VVIDEO
 W !,"REPERTOIRE : " R REP W !,"INDIVIDU : " R IND
 S RES=$$SELEC(REP,IND)
 W !,"RESULTAT"
 F %I=0:0 Q:RES=""  W !," ",$P(RES,"^",2) S RES=$P(RES,"^",3,999)
 Q

