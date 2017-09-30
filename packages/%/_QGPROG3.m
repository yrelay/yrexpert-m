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

;%QGPROG3^INT^1^59547,73876^0
%QGPROG3 ;;06:34 PM  7 Jun 1993; ; 10 Jun 93  7:08 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INT(NOMLISTE,LISTATT,ATTTOL,TITRE,LISRES,TIMOUT) 
 N LISTES,TEMP,CTR,STOCK1,CREA1,STOCK,CREA,CUSTOM
 N LLISENT,GRESUL,GROAFF,GROUPE,GRLISTE
 S TEMP=$$TEMP^%SGUTIL
 S CUSTOM=$$TEMP^%SGUTIL
 S LISTES=$$CONCAS^%QZCHAD(TEMP,"LISTES")
 S STOCK="STO^%QGPROG3"
 S CREA="$$QGCREA^%QGOMA"
 S STOCK1=$$CONCAS^%QZCHAD(STOCK,"^GRESUL($J)")
 S CREA1=$$CONCAT^%QZCHAD(CREA,"NLISTE")
 
 S LLISENT=$$TEMP^%SGUTIL
 S GROAFF=$$TEMP^%SGUTIL
 S GROUPE=$$TEMP^%SGUTIL
 S GRLISTE=$$TEMP^%SGUTIL
 S GRESUL=$$TEMP^%SGUTIL
 
 D KILL
 I LISRES="" S LISRES=$$GEN^%QCAPOP("GRP"),ADRESSE="^[QUI]RQS2("""_LISRES_""",""OBJET"")" D CREERL^%QS0XG1(LISRES,"L0",ADRESSE,"GROUPAGE","GROUPAGE")
 
 S @LLISENT@(NOMLISTE)=""
1 G:'($$^%QGPROG2(LLISENT,LISTATT,ATTTOL)) ABANDO
 S CTRLA=0,CTRLF=0
 D ^%QGDECI
 G FIN:CTRLF,ABANDO
FIN 
 D ON^%VZEATT
 D ^%QGSTOCK,STO(GRESUL)
 D KILL
 D OFF^%VZEATT
 Q LISRES
 
ABANDO 
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Abandon sans sauvegarde"))'=1 G FIN
 D KILL
 Q ""
 
KILL K ^ATTR($J),^LISTES($J),^AFFPAG($J),^PAG($J),^PAD($J),^GRV($J)
 K @(GROUPE),^[QUI]GRATT($J),@(GRLISTE),@(GROAFF),@(GRESUL)
 K @(TEMP)
 Q
 
 
 
STO(LLISTE) 
 N ADRESSE,LL,%L
 
 
 S LL="" F %L=0:0 S LL=$$SUIVL^%QS0XG1(LISRES,LL) Q:LL=""  I '($D(@LLISTE@(LL))) D RETIRL^%QS0XG1(LISRES,LL),ELIML^%QS0XG1(LL)
 D ^%QGSTO2(LLISTE,LISRES)
 S LL="" F %L=0:0 S LL=$O(@LLISTE@(LL)) Q:LL=""  I '($$INLIS^%QS0XG2(LISRES,LL)) D AJOUT^%QS0XG1(LISRES,LL)
 Q
 
QGCREA(LISTE) 
 Q $$^%QGCREA(LISTE)
 ;
 ;
 ;

