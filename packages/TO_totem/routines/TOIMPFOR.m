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

;TOIMPFOR^INT^1^59547,74872^0
TOIMPFOR ;
 
 
 
 
 
 
 
 
 
 
 
TRAITIMP(ARTI) 
 N LIST,NOATT,%L,%A
 Q:'($D(^[QUI]TOTGLO("IMPFOR",ARTI)))
 S LIST=""
 F %L=0:0 S LIST=$O(^[QUI]TOTGLO("IMPFOR",ARTI,LIST)) Q:LIST=""  S NOATT="" F %A=0:0 S NOATT=$O(^[QUI]ZLILA(LIST,NOATT)) Q:NOATT=""  S ^[QUI]FULL(ARTI,^[QUI]ZLILA(LIST,NOATT))=1
 Q
 
 
 
 
LISTE 
 N LIST
 S (REAF,REFUSE)=0
 S LIST=Y1
 I LIST="?" G CHLIST
 G:LIST="" NOLIST
 I '($D(^[QUI]ZLILA(LIST))) D ^%VZEAVT($$^%QZCHW("Liste inexistante ...")) G NOLIST
 S RESUL(IC)=LIST
 Q
NOLIST S REFUSE=1 Q
CHLIST D INIT^%QUCHOIP("^[QUI]ZLILA","",1,16,6,50,16),AFF^%QUCHOIP
 S LIST=$$UN^%QUCHOIP
 D END^%QUCHOIP,CLEAR^%VVIDEO
 I LIST="" S REFUSE=1
 S RESUL(IC)=LIST
 S REAF=1 D ^%VAFIGRI,^%VAFISCR Q
 ;

