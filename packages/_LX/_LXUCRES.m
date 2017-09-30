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

;%LXUCRES^INT^1^59547,73871^0
%LXUCRES ;
 
 
 
 
STOCK 
 D STOC^%LXAJMOD($$^%QZCHW(RESUL(1))) Q
 
SUP() K ^[QUI]ZSYSMORE(OR(1)),^[QUI]TOLEX(OR(1))
 D ^%LXMAJB(OR(1))
 
 S ^[QUI]TOLEX=^[QUI]TOLEX-1
 Q 1
 
 
 
 
 
 
AJMOTR(QUI,MOT) 
 S ^[QUI]ZSYSMORE(MOT)=""
 D STOC^%LXAJMOD(MOT) Q
 
AJMOTRL(QUI,L) 
 N I,MOT
 S MOT=$O(@L@(""))
 F I=0:0 Q:MOT=""  D AJMOTR(QUI,MOT) S MOT=$O(@L@(MOT))
 Q
 
 
 
SUPMOTR(IUQ,MOT) 
 S SQUI=QUI,QUI=IUQ
 K ^[IUQ]ZSYSMORE(MOT),^[IUQ]TOLEX(MOT)
 D ^%LXMAJB($$^%QZCHW(MOT))
 
 S:($D(^[QUI]TOLEX)#10)'=1 ^[QUI]TOLEX=1
 S ^[QUI]TOLEX=^[QUI]TOLEX-1
 S QUI=SQUI Q
 
 
RESERVE(QUI,MOT) 
 I MOT="" Q 0
 Q $D(^[QUI]ZSYSMORE(MOT))>0

