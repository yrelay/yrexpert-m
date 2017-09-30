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
;! HL002 ! HL     ! 25/08/12 ! ZN n'existe pas dans DTM                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QCSCDIR^INT^1^59547,73875^0
%ZZUVX ;
 
 
 N ZU
 
 ;HL002 ZN DIR
 ;D ^%ZN(DIR)
 S ZN=$$ZGBLDIR^%GTM(DIR)
 Q
 
FIN Q
GOTO(DIR) D %ZZUVX Q
QUI D INT^%DIR,CURRENT^%IS,MESD^%VLECFL2(%DIR,"Quel directory ? ",$X,$Y,.C,.Y) Q:C'=""  D GOTO(Y) W ! D ^%DIR,ECHON^%VVIDEO Q
 
 
ADR(HOST,DIR) 
 N ZU
 ;HL002 ZN DIR
 S ZN=$$ZGBLDIR^%GTM(DIR)
 Q
 
EXIST(DIR) 
EXIST2 N PROG,ZT,OK
 S PROG=$$PCONF^%INCASTO("PROG")
 
 I PROG="" D ^%VZEAVT($$^%QZCHW("La partition programme est indefinie : veuillez contacter YXP")) Q 0
 S $ZT="ERR^%QCSCDIR",OK=0
 
 D ADR("",DIR)
 S OK=1
 D ADR("",PROG)
RET Q OK
 
ERR S $ZT=""
 G RET

