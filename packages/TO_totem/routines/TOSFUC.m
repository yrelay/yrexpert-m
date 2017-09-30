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

;TOSFUC^INT^1^59547,74875^0
TOSFUC ;;12:53 AM  17 Apr 1990
 
 
 
 
1 S (REFUSE,STOPUC)=0 Q
B S:RESUL(IC)="" STOPUC=1,REFUSE=1 Q
 
ERRUC D ^%VSQUEAK W " ... [RETURN]" S REFUSE=1 R *BIDON D POCLEPA^%VVIDEO
FIN K BIDON Q
 
TERM 
 D 1 I (RESUL(IC)'="E")&(RESUL(IC)'="T") D POCLEPA^%VVIDEO W "(E)cran graphique ou (T)able tracante " G ERRUC
 G FIN
 
ART 
 D 1,B G:REFUSE FIN
 I '($D(^[QUI]SENSFICH(RESUL(IC)))) D POCLEPA^%VVIDEO W "Pas de savoir-faire pour ",RESUL(IC) G ERRUC
 G FIN
 
DOM 
 D 1,B G:REFUSE FIN
 I '($D(^[QUI]SENSFICH(RESUL(IC-1),1,RESUL(IC)))) D POCLEPA^%VVIDEO W "Pas de domaine ",RESUL(IC)," pour ",RESUL(IC-1) G ERRUC
 G FIN
 
ATT 
 D 1,B G:REFUSE FIN
 I '($D(^[QUI]SENSFICH(RESUL(IC-2),1,RESUL(IC-1),RESUL(IC)))) D POCLEPA^%VVIDEO W "Pas d'attribut ",RESUL(IC)," calcule pour ",RESUL(IC-2),"/",RESUL(IC-1) G ERRUC
 G FIN
 
NBL 
 D 1,B G:REFUSE FIN
 I RESUL(IC)'?.N D POCLEPA^%VVIDEO W "Un nombre S.V.P. ... [RETURN]" G ERRUC
 I RESUL(IC)>25 D POCLEPA^%VVIDEO W "25 est le maximum ... [RETURN]" G ERRUC
 G FIN
 
NBN 
 D 1 G FIN
 I RESUL(IC)'?.N D POCLEPA^%VVIDEO W "Un nombre S.V.P. ... [RETURN]" G ERRUC
 I RESUL(IC)>30 D POCLEPA^%VVIDEO W "30 est le maximum ... [RETURN]" G ERRUC
 G FIN

