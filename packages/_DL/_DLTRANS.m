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

;%DLTRANS^INT^1^59547,73868^0
%DLTRANS ;
 
 
 
 
 
TRANS1 
 N REPMA,MA,JOUR,ATCHA,CHA,JDEB,JFIN,MACTRAN,JDEB2,JFIN2,JOURFIN,LIG,M
 N TEMPMA
 S TEMPMA=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MAC")
 K @(TEMPMA)
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Changt format date sur Machines"),0)
 D ON^%VZEATT
 S REPMA=$$MACH^%DLCON2
 S ATCHA=$$CHARGE^%DLCON2
ALLMA S MA=""
TRANS10 S MA=$O(^[QUI]MACAP(MA))
 G:(MA="")!(MA="z") TRANS12
 S JOUR=""
TRANS11 S JOUR=$O(^[QUI]MACAP(MA,JOUR))
 G:JOUR="" TRANS10
 S @TEMPMA@(MA,$$12^%QMDATE1(JOUR))=^[QUI]MACAP(MA,JOUR)
 G TRANS11
 
TRANS12 D ^%QCAGLK("^[QUI]MACAP")
 D GLOCOP^%QCAGLC(TEMPMA,"^[QUI]MACAP")
 K @(TEMPMA)
 S MA=""
TRANS13 S MA=$$NXTRI^%QSTRUC8(REPMA,MA)
 G:MA="" TRANS15
 K @(TEMPMA)
 B:MA="AP1" "L" D MVG^%QSCALVA(REPMA,MA,ATCHA,TEMPMA,.TYP)
 D PSV^%QSGESTI(REPMA,MA,ATCHA)
 S JOUR=""
TRANS14 S JOUR=$O(@TEMPMA@(JOUR))
 G:JOUR="" TRANS13
 D PA^%QSGESTI(REPMA,MA,ATCHA,@TEMPMA@(JOUR),$$12^%QMDATE1(JOUR))
 G TRANS14
 
TRANS15 K @(TEMPMA)
 S MA=""
TRANS16 S MA=$O(^[QUI]MACOP(MA))
 G:MA="" TRANS111
 S JOUR=""
TRANS17 S JOUR=$O(^[QUI]MACOP(MA,JOUR))
 G:JOUR="" TRANS16
 S JOUR2=$$12^%QMDATE1(JOUR)
 S LAN=""
TRANS18 S LAN=$O(^[QUI]MACOP(MA,JOUR,LAN))
 G:LAN="" TRANS17
 S STAD=""
TRANS19 S STAD=$O(^[QUI]MACOP(MA,JOUR,LAN,STAD))
 G:STAD="" TRANS18
 S OPER=""
TRANS110 S OPER=$O(^[QUI]MACOP(MA,JOUR,LAN,STAD,OPER))
 G:OPER="" TRANS19
 S @TEMPMA@(MA,JOUR2,LAN,STAD,OPER)=^[QUI]MACOP(MA,JOUR,LAN,STAD,OPER)
 G TRANS110
 
TRANS111 D ^%QCAGLK("^[QUI]MACOP")
 D GLOCOP^%QCAGLC(TEMPMA,"^[QUI]MACOP")
 K @(TEMPMA)
 Q
 ;
 ;
 ;

