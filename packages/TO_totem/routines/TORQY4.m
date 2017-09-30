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

;TORQY4^INT^1^59547,74875^0
TORQY4 ;
 
 
 
 
 
 
 
 
CAD 
 N MSG
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,1,0,$$^%QZCHW("TRANSFERT TOTEM ----> DKBMS")) Q
 
ETUDE(GLO,ABORT,DIA) 
 
 N CH D CAD
CCH S DX=5,DY=8 X XY
 S CTRLA="",CH=$$^%VZECH2("Voulez-vous afficher ","TOUTES LES ETUDES","LES ETUDES PROVENANT D'UNE LISTE")
 I (CH=1)!(CH=6) S ABORT=1 Q
 I (CH'="TOUTES LES ETUDES")&(CH'="LES ETUDES PROVENANT D'UNE LISTE") G CCH
 
ATTRI I $$MES^%QMLILL($$^%QZCHW("liste des attributs a transferer")_" : ",.LILA) S ABORT=1 Q
 I LILA="" D ^%VZEAVT($$^%QZCHW("Attention il faut au moins transferer un attribut")) G ATTRI
 D ^%VZEATT
 D LISTE(LILA,.LISTE)
 S RI=$$RI^TORQXIN
 
 I CH="LES ETUDES PROVENANT D'UNE LISTE" S ABORT=0 D DIALOG Q
 
 S DIA=1 D CAD,MSG^%VZEATT("Preparation de l'affichage des etudes Totem")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LILAB=$$CONCAS^%QZCHAD(TEMP,"LILAB")
 
 S ADR=$$LISTIND^%QSGEST6(RI)
 S R=$$TTES^TORQXMB(ADR,LILAB,2,RI,GLO,1),ABORT=$S($O(@GLO@(""))="":1,1:0) Q
 
LISTE(ZLILA,LISTE) 
 
 N ADR,I,ATT,OATT
 I ZLILA="*" S LISTE="*" Q
 S ADR=$$LIST^%QMLILA(ZLILA)
 I ADR="" S LISTE="*" Q
 S OATT=$O(@ADR@(""))
 F I=0:0 Q:(OATT="")!(OATT]"A")  S:@ADR@(OATT)'="" LISTE(@ADR@(OATT))="" S OATT=$O(@ADR@(OATT))
 Q
 
DIALOG 
 S DX=0,DY=8 X XY D CLEBAS^%VVIDEO S DX=12,DY=8 X XY
 S CTRLA="",DIAL=$$^%VZECH2("Transfert ","AVEC DIALOGUE","SANS DIALOGUE")
 I (DIAL=1)!(DIAL=6) S ABORT=1 Q
 S DIA=$S(DIAL="AVEC DIALOGUE":1,DIAL="SANS DIALOGUE":0),ABORT=0,R=$$^TORQXMB(GLO,DIA),ABORT=$S($O(@GLO@(""))="":1,1:0) Q
 ;

