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

;TORQYC^INT^1^59547,74875^0
TORQYC ;
 
 
 
 
 
COMP(IC) 
 Q:RESUL(IC)=""
 N GLO,IND,IND1,IND2
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(GLO)
 S IND1="" F I=0:0 S IND1=$O(^[QUI]NOMENC(IND1)) Q:IND1=""  S IND2="" F I=0:0 S IND2=$O(^[QUI]NOMENC(IND1,IND2)) Q:IND2=""  S @GLO@(IND1)="",@GLO@(IND2)=""
 I RESUL(IC)="?" D CHIND(GLO),REAF(IND) Q
 I '($D(@GLO@(RESUL(IC)))) D ^%VZEAVT("composant inconnu") S REFUSE=1 Q
 Q
 
LATT(IC) 
 N GLO,IND
 S GLO=$$ADR^%QMLILA
 I RESUL(IC)="" Q
 I RESUL(IC)="?" D POCLEPA^%VVIDEO,BLD^%VVIDEO W $$^%QZCHW("liste d'attributs predefinie") G HELP
 I '($D(@GLO@(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("liste d'attributs inconnue")) S REFUSE=1
 Q
 
LISTE(IC) 
 N GLO,IND
 S GLO=$$LISTIND^%QSGEST6("L0")
 I RESUL(IC)="" Q
 I RESUL(IC)="?" D POCLEPA^%VVIDEO,BLD^%VVIDEO W $$^%QZCHW("liste predefinie") G HELP
 I '($D(@GLO@(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("liste inconnue")) S REFUSE=1
 Q
 
RQS(IC) 
 N GLO,IND
 S GLO=$$LISTIND^%QSGEST6("RQS")
 I RESUL(IC)="" Q
 I RESUL(IC)="?" D POCLEPA^%VVIDEO,BLD^%VVIDEO W $$^%QZCHW("requete predefinie") G HELP
 I '($D(@GLO@(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("requete inconnue")) S REFUSE=1
 Q
 
HELP D NORM^%VVIDEO,CHIND(GLO),POCLEPA^%VVIDEO
 I IND="" S REFUSE=1 Q
 D REAF(IND)
 Q
 
CHIND(GLO) 
 D INIT^%QUCHOIP(GLO,"",1,50,8,27,10),AFF^%QUCHOIP
 S IND=$$UN^%QUCHOI6
 D END^%QUCHOIP,CLFEN^%VVIDEO(50,8,10,27)
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 Q
 
REAF(VAL) 
 S TAB(IC)=$J(" ",$L(RESUL(IC))) D ^%VAFFICH
 S TAB(IC)=VAL D ^%VAFFICH S RESUL(IC)=VAL Q

