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

;%TXAJLI^INT^1^59547,74031^0
%TXAJLI ;
 
 
 
 
 N RESUL,PATOUCH,AFRESU,DEJALU,SCR,NOMTAB,ABENDSCR,CMS,MEN,ADR,CTR,DATTT
 S MEN(1)=$$^%QZCHW("Ajouter")_"^AJ"
 S MEN(2)=$$^%QZCHW("Consulter")_"^CONS"
DEB D HRV^%TXINDH
 S DX=0,DY=17 D CLEBAS^%VVIDEO
 S DATTT=TAD
 K RESUL,PATOUCH,AFRESU,DEJALU
 S SCR="IFRDVLI",NOMTAB=^%SCRE(SCR,"GLOSTOC"),(CTRLF,CMS,ABENDSCR)=0
ACT S DX=0,DY=23 D CLEBAS^%VVIDEO,^%VQUIKMN(30,80,23,"MEN",.ADR,.CTR) Q:(CTR="A")!(CTR="F")
 G:ADR'="" @ADR G ACT
 
AJ 
 F %I=1:1:^%SCRE(SCR) S RESUL(%I)="",PATOUCH(%I)=""
 D ^%VAFIGRI,^%VAFISCR,^%VMODISC G:ABENDSCR=1 ACT
 D ^%VAUTOST
 G ACT
CONS 
 D ^%VCMS(SCR) G DEB

