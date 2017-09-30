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

;%TLOGCMP^INT^1^59547,74030^0
%TLOGCMP ;;10:11 PM  10 Sep 1992 ; 09 Nov 92 12:13 PM
 
 
 
 N EOBJ,TRT,%TRT
 S EOBJ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LFOR") K @(EOBJ)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("COMPILATION DE TRAITEMENTS"))
 K @(EOBJ)
 D INIT^%QUCHOIP("^[QUI]TTL",1,"",0,5,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(EOBJ),END^%QUCHOIP
 S TRT=""
BCAFF D CLEPAG^%VVIDEO
 F %TRT=0:1:20 S TRT=$O(@EOBJ@(TRT)) Q:TRT=""  W !,TRT," ",$S($$COMPTRT^%TLOCMP(TRT,0):$$^%QZCHW("ok"),1:$$^%QZCHW("probleme"))
 D ^%VZEAVT("")
 I %TRT<20 D CLEPAG^%VVIDEO Q
 I $O(@EOBJ@(TRT))="" D CLEPAG^%VVIDEO Q
 G BCAFF
 Q
 
EXICOMP(TRT) Q $D(^[QUI]RQSDON("COMPTRT",TRT))
 
KILLCOMP(TRT) K ^[QUI]RQSDON("COMPTRT",TRT) Q
 
OKCOMP(TRT) N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"EXECMP")
 Q:'($D(^[QUI]RQSDON("COMPTRT",TRT))) 0
 I $D(@TEMP),'(@TEMP) Q 0
 Q 1
COPYCOMP(QUI,TRT1,QUI2,TRT2) 
 I $$EXICOMP(TRT1) D COPY^%QCAGLC($$CONCAS^%QZCHAD("^[QUI]RQSDON(""COMPTRT"")",TRT1),$$CONCAS^%QZCHAD("^[QUI2]RQSDON(""COMPTRT"")",TRT2))
 Q
INITSESS N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"EXECMP")
 I '($D(^[QUI]RQSDON("COMPTRT"))) S @TEMP=0
 D POCLEPA^%VVIDEO
 S @TEMP=0
 I $$CONFIRM^%VZEOUI("execution des versions compilees ?") S @TEMP=1
 Q
 
SESSCOMP 
 N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"EXECMP")
 I '($D(^[QUI]RQSDON("COMPTRT"))) S @TEMP=0
 D POCLEPA^%VVIDEO
 S @TEMP=1
 Q
 
 
 
 
SETREGA(AD) 
 S ^[QUI]RQSDON("COMPTRT",TRT,"$ADR",AD)=LIG Q
SETREGE(AD) 
 S ^[QUI]RQSDON("COMPTRT",TRT,"$ETQ",AD)=LIG Q
 
 
 
GETLIGA(AD) 
 Q $S($D(^[QUI]RQSDON("COMPTRT",PARCO("TRT"),"$ADR",AD)):^[QUI]RQSDON("COMPTRT",PARCO("TRT"),"$ADR",AD),1:"")
 
GETLIGE(AD) 
 Q $S($D(^[QUI]RQSDON("COMPTRT",PARCO("TRT"),"$ETQ",AD)):^[QUI]RQSDON("COMPTRT",PARCO("TRT"),"$ETQ",AD),1:"")
 ;
 ;

