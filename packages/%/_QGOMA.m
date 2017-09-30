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

;%QGOMA^INT^1^59547,73876^0
%QGOMA ;
 N CUSTOM
 S CUSTOM=$$TEMP^%SGUTIL
 D INT("","","",CUSTOM,$$^%QZCHW("Groupage"))
 K @(CUSTOM)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INT(LBASE,STOCK,CREA,CUSTOM,TITRE) 
 N LISTES,TEMP,CTR,STOCK1,CREA1
 N GROAFF,GROUPE,GRLISTE
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S LISTES=$$CONCAS^%QZCHAD(TEMP,"LISTES")
 I STOCK="" S STOCK="STO^%QGOMA"
 I CREA="" S CREA="$$QGCREA^%QGOMA"
 S STOCK1="STO^%QGOMA"
 S CREA1=$$CONCAT^%QZCHAD(CREA,"NLISTE")
 
 S LLISENT=$$TEMP^%SGUTIL
 S GROAFF=$$TEMP^%SGUTIL
 S GROUPE=$$TEMP^%SGUTIL
 S GRLISTE=$$TEMP^%SGUTIL
 S GRESUL=$$TEMP^%SGUTIL
 
 D KILL
 D SEL(LLISENT,LBASE,.CTR)
 G:CTR'="" ABANDO
1 G:'($$^%QGINIT2(LLISENT)) ABANDO
 W *-1 S CTRLA=0,CTRLF=0
 D ^%QGDECI
 G FIN:$$^%QCAZG("CTRLF"),ABANDO
FIN 
 D MSG("Fin, et stockage des resultats.")
 D ^%QGSTOCK
 S OK=1
 D ON^%VZEATT
 D @(STOCK1_"(GRESUL)")
 D OFF^%VZEATT
 D KILL
 
 Q
 
ABANDO 
 D MSG("Abandon, les resultats ne seront pas pris en compte.")
 S OK=0 D KILL
 Q
 
KILL K ^ATTR($J),^LISTES($J),^AFFPAG($J),^PAG($J),^PAD($J),^GRV($J)
 K ^[QUI]GROUPE($J),^[QUI]GRATT($J)
 K @(TEMP)
 Q
 
MSG(MSG) D ^%VSQUEAK,POCLEPA^%VVIDEO,BLD^%VVIDEO
 W $P(MSG,",",1),$$NORM^%VVIDEO1,",",$P(MSG,",",2)
 H 1 D POCLEPA^%VVIDEO Q
 
SEL(SEL,LBASE,CTR) 
 N LISTE S CTR=""
 S LISTE=$$SEL^%QS0SEL1(LBASE,$$^%QZCHW("GROUPAGE"))
 I LISTE="" S CTR="A" Q
 S @SEL@(LISTE)=""
 Q
 
STO(LLISTE) 
 D ^%QGSTO(LLISTE) Q
 
QGCREA(LISTE) 
 Q $$^%QGCREA(LISTE)

