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

;%QGMUC^INT^1^59547,73876^0
%QFMUC ;
AFCH(CH) S DX=^%SCRE(SCR,CH,2),DY=^%SCRE(SCR,CH,3) X XY W ^%SCRE(SCR,CH,1) D BLD^%VVIDEO W RESUL(CH) D NORM^%VVIDEO Q
WARN(MSG) D ^%VZEAVT(MSG) Q
PARAVI Q
FRESH D CLEPAG^%VVIDEO S OOIC=IC D BEG^%VAFIGRI,^%VAFISCR S (IC,ICC)=OOIC Q
QUER S BSE=$P(^[QUI]GRIDETU(RESUL(2)),"^",1),QUER=$$NOMINT^%QSF(BSE)
 I QUER'=$$^%QSCALVA("L0",RESUL(3),"BASE") D WARN("La liste "_RESUL(3)_" n'est pas du type """_BSE_"""") S REFUSE=1 Q
 S REFUSE=0 Q
ATTR1 S REFUSE=0,CTRLF=0 I RESUL(IC)="%REPERTOIRE" S STOPUC=1 Q
 S REFUSE=0,CTRLF=0 Q:RESUL(IC)'="?"
 D ^%VZEAVT("%REPERTOIRE ou le nom d'un attribut ") S REFUSE=1 Q
ATTR2 S REFUSE=0,CTRLF=0 Q

