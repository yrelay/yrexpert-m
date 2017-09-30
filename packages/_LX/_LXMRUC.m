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

;%LXMRUC^INT^1^59547,73870^0
LEXMRUC ;
 
 
 
 
 
 
MOD() Q:(RESUL(1)="")!(RESUL(2)="") 0
 Q 1
 
STO Q:(RESUL(1)="")!(RESUL(2)="")
 S ^MOTRESAI(RESUL(2),RESUL(1))="^"
 Q
 
SUPP() Q:(OR(1)="")!(OR(2)="") 0
 K ^MOTRESAI(OR(2),OR(1))
 K ^MOTRESA(OR(1),OR(2))
 Q 1
 
 
MODM() Q:RESUL(1)="" 0
 Q 1
 
AVERT D POCLEPA^%VVIDEO
 D ^%VZEAVT("En cas d'ajout, modification, suppression, les mots reserves doivent etre recompiles (option ""COMPILATION DES MOTS RESERVES"") et prevenir le Developpement")
 D ^%VZEAVT("Les mots reserves ne seront visibles dans le lexique qu'apres compilation et reinstallation du schema.")
 D POCLEPA^%VVIDEO
 Q
 
 
 
 
STOCK(MOT,COM1,COM2,COM3,COM4,COM5,UNIT,ABUNIT,LSYNO,LAPPLI) 
STOCK2 
 N SYNO,IL,%I
 S IL=""
 S ^MOTRES(MOT)=COM1_"^"_COM2_"^"_COM3_"^"_COM4_"^"_COM5_"^"_UNIT_"^"_ABUNIT_"^"
 I LSYNO'="" S SYNO="" F %I=0:0 S SYNO=$O(@LSYNO@(SYNO)) Q:SYNO=""  S ^MOTRESY(MOT,SYNO)="^"
 S %I=$D(^[QUI]ZSYSMORE)
 I ((%I#10)=0)!((%I\10)=0) S ^[QUI]ZSYSMORE=0
 S ^[QUI]ZSYSMORE(MOT)=""
 S ^[QUI]ZSYSMORE=^[QUI]ZSYSMORE+1
 Q:LAPPLI=""
 S IL=""
BSTO S IL=$O(@LAPPLI@(IL))
 Q:IL=""
 S ^MOTRESA(MOT,@LAPPLI@(IL))="^"
 S ^MOTRESAI(@LAPPLI@(IL),MOT)="^"
 G BSTO
 ;
 ;

