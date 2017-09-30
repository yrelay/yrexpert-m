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

;%AD1^INT^1^59547,73864^0
AD1 ;
 
SUPMN() 
 K ^[QUI]MN(RESUL(1))
 I $D(^MN(RESUL(1))),^MN(RESUL(1),"STATUT")'="RESERVE" K ^MN(RESUL(1))
 Q 1
SUPMNO() 
 K ^[QUI]MN(RESUL(1),RESUL(2))
 I $D(^MN(RESUL(1))),^MN(RESUL(1),"STATUT")'="RESERVE" K ^MN(RESUL(1),RESUL(2))
 Q 1
MODMN() 
 D STO^%VCMSCOR
 Q 0
AJ 
 S ^[QUI]MN="NOK"
 D ^%VAJOUT("ADMN")
 Q
CMS 
 S ^[QUI]MN="NOK"
 D ^%VCMS("ADMN")
 Q
VER 
 N OK,PB,AFF
 N MENU,OPT
 N LIB,ACT,TRT,LIS,SSM
 S ADPB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(ADPB)
 
 S ^[QUI]MN="NOK",OK=1,PB=0,AFF=0
 D ^%VZCDB($$^%QZCHW("VERIFICATION DES MENUS UTILISATEUR"),0),BLD^%VVIDEO W !,QUI D NORM^%VVIDEO
 D VER1
 I AFF D FINAFF
 I OK S ^[QUI]MN="OK"
 Q
VER1 
 S MENU=""
 F I=1:1 S MENU=$O(^[QUI]MN(MENU)) Q:MENU=""  Q:MENU="z"  I $D(^MN(MENU)),^MN(MENU,"STATUT")="RESERVE" S OK=0,PB=PB+1,AFF=1,@ADPB@(PB)="Menu : "_MENU_". Ce nom de menu est reserve Yrelay"
 
 
 S MENU=""
 F I=1:1 S MENU=$O(^[QUI]MN(MENU)) Q:MENU=""  Q:MENU="z"  W "*" D OPTION
 Q
OPTION 
 S OPT=""
 F I=1:1 S OPT=$O(^[QUI]MN(MENU,OPT)) Q:OPT=""  D EXISTE
 Q
EXISTE 
 S LIB=$P(^[QUI]MN(MENU,OPT),"^",1),ACT=$P(^[QUI]MN(MENU,OPT),"^",3),TRT=$P(^[QUI]MN(MENU,OPT),"^",4),LIS=$P(^[QUI]MN(MENU,OPT),"^",5),SSM=$P(^[QUI]MN(MENU,OPT),"^",6)
 I LIB="" S OK=0,PB=PB+1,AFF=1,@ADPB@(PB)="Menu : "_MENU_" Option : "_OPT_". Libelle non precise."
 I ACT="" S OK=0,PB=PB+1,AFF=1,@ADPB@(PB)="Menu : "_MENU_" Option : "_OPT_". Action non precisee."
 I ACT="ACTIVATION.TRAITEMENT",TRT="" S OK=0,PB=PB+1,AFF=1,@ADPB@(PB)="Menu : "_MENU_" Option : "_OPT_". Traitement non precise."
 I ACT="ACTIVATION.TRAITEMENT",LIS="" S OK=0,PB=PB+1,AFF=1,@ADPB@(PB)="Menu : "_MENU_" Option : "_OPT_". Liste non precisee."
 I ACT="SOUS.MENU",SSM="" S OK=0,PB=PB+1,AFF=1,@ADPB@(PB)="Menu : "_MENU_" Option : "_OPT_". Sous menu non precise."
 
 
 
 I ACT="SOUS.MENU",SSM'="",('($D(^[QUI]MN(SSM))))&('($D(^MN(SSM)))) S OK=0,PB=PB+1,AFF=1,@ADPB@(PB)="Menu : "_MENU_" Option : "_OPT_". Le sous menu "_SSM_" n'est pas declare"
 I ACT="SOUS.MENU",SSM'="",$D(^MN(SSM)) S AFF=1,PB=PB+1,@ADPB@(PB)="Menu : "_MENU_" Option : "_OPT_". Le sous menu "_SSM_" est deja installe. C'est un menu "_^MN(SSM,"STATUT")
 Q
FINAFF D POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI($$^%QZCHW("Consultation des problemes rencontres ?"),"O")) K @(ADPB) Q
 D CLEPAG^%VVIDEO
 I '(OK) D ^%VZCDB($$^%QZCHW("Menus utilisateur: problemes de structures"),0)
 I OK D ^%VZCDB($$^%QZCHW("Menus utilisateur: pas de problemes bloquants"),0)
 D CARSP^%VVIDEO(0,2,21,79,1)
 D REAFF^%QULIMO3(1,1,ADPB,0,2,79,21)
 D VISU^%QULIMO(0,2,79,21,ADPB,1)
 K @(ADPB)
 Q

