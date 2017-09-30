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

;%SYSGES^INT^1^59547,73892^0
SYSGES ;
 
 
 
 
 
SPEIBM D CLEPAG^%VVIDEO,^%VZCDB("Routines specif. IBM/VM",0)
 S DX=0,DY=23
BSPEIBM X XY
 I DY>22 S DY=3 D CLEBAS^%VVIDEO S DY=3
 W "Routine : "
 R ROUT
 Q:ROUT=""
 I $E(ROUT)="'" K ^SPEIBM($E(ROUT,2,999)) S DY=DY+1 G BSPEIBM
 I $D(^ROUTINE(ROUT)) S ^SPEIBM(ROUT)="",DY=DY+1 G BSPEIBM
 I $D(^["MG"]ROUTINE(ROUT)) S ^SPEIBM(ROUT)="",DY=DY+1 G BSPEIBM
 S DYY=DY D ^%VSQUEAK,POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI("Inexistante. Confirmez-vous ? ","N")) D POCLEPA^%VVIDEO S DY=DYY G BSPEIBM
 D POCLEPA^%VVIDEO
 S ^SPEIBM(ROUT)=""
 S DY=DYY+1
 G BSPEIBM
 
 
SPEDTM D CLEPAG^%VVIDEO,^%VZCDB("Routines specif. DTM",0)
 S DX=0,DY=23
BSPEDTM X XY
 I DY>22 S DY=3 D CLEBAS^%VVIDEO S DY=3
 W "Routine : "
 R ROUT
 Q:ROUT=""
 I $E(ROUT)="'" K ^SPEDTM($E(ROUT,2,999)) S DY=DY+1 G BSPEDTM
 I $D(^ROUTINE(ROUT)) S ^SPEDTM(ROUT)="",DY=DY+1 G BSPEDTM
 I $D(^["MG"]ROUTINE(ROUT)) S ^SPEDTM(ROUT)="",DY=DY+1 G BSPEDTM
 S DYY=DY D ^%VSQUEAK,POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI("Inexistante. Confirmez-vous ? ","N")) D POCLEPA^%VVIDEO S DY=DYY G BSPEDTM
 D POCLEPA^%VVIDEO
 S ^SPEDTM(ROUT)=""
 S DY=DYY+1
 G BSPEDTM
 
 
RELEASE N REAL
 S REAL=$ZP(^ROUREAL(""))
 D CLEPAG^%VVIDEO,^%VZCDB("Routines modif. Release "_REAL_" du "_^ROUREAL(REAL),0)
 S DX=0,DY=23
BREALEA X XY
 I DY>22 S DY=3 D CLEBAS^%VVIDEO S DY=3
 W "Routine : "
 R ROUT
 Q:ROUT=""
 I $E(ROUT)="'" K ^ROUREAL(REAL,$E(ROUT,2,999)) S DY=DY+1 G BREALEA
 I $D(^ROUTINE(ROUT)) S ^ROUREAL(REAL,ROUT)="",DY=DY+1 G BREALEA
 I $D(^["MG"]ROUTINE(ROUT)) S ^ROUREAL(REAL,ROUT)="",DY=DY+1 G BREALEA
 S DYY=DY D ^%VSQUEAK,POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI("Inexistante. Confirmez-vous ? ","N")) D POCLEPA^%VVIDEO S DY=DYY G BREALEA
 D POCLEPA^%VVIDEO
 S ^ROUREAL(REAL,ROUT)=""
 S DY=DYY+1
 G BREALEA
 
 
GLOREAL N REAL
 S REAL=$ZP(^ROUREAL(""))
 D CLEPAG^%VVIDEO,^%VZCDB("Routines modif. Release "_REAL_" du "_^ROUREAL(REAL),0)
 S DX=0,DY=3
 X XY
 D ^%RSET
 S ROUT=0
 F %ROUT=0:0 S ROUT=$O(^UTILITY($J,ROUT)) Q:ROUT=""  S ^ROUREAL(REAL,ROUT)=""
 Q
 
NEXTREAL S REAL=^ROUREAL+1
 S:REAL<10 REAL="0"_REAL
 D CLEPAG^%VVIDEO,^%VZCDB("Nouvelle release",0)
 S LREAL="V2.2 REAL "_REAL
 S DX=10,DY=10 X XY W LREAL," le : "
 R DAT
 Q:DAT=""
 S ^ROUREAL=REAL
 S ^ROUREAL(LREAL)=DAT
 Q
 ;

