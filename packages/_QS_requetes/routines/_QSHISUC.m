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

;%QSHISUC^INT^1^59547,73882^0
QSHISUC ;
 
 
 
 
 
 
 
 
 
 
 
NUM(RES) 
 I RES="" D ^%VUCPOP Q
 N GLO S GLO=^%SCRE("QSHISTO","GLOSTOC")
 I $D(@GLO@(RESUL(1),RESUL(2),RESUL(3),RES)) D ^%VUCPOP Q
 Q
 
ABSCI(RES) 
 N N,NUM,COL,m,GLO
 S REFUSE=1,NUM=""
 I RES="" D ^%VZEAVT($$^%QZCHW("Le champ abscisse doit etre rempli")) Q
 S GLO=^%SCRE("QSHISTO","GLOSTOC")
 D NORMALIS^%QZNBN1(.RES)
 S ICC=IC,RESUL(IC)=RES,(TAB(IC),TAB(ICC))=RES D ^%VAFFICH
 S REFUSE=0
 F N=1:1 S NUM=$O(@GLO@(RESUL(1),RESUL(2),RESUL(3),NUM)) Q:NUM=""  I $D(@GLO@(RESUL(1),RESUL(2),RESUL(3),RES)) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Attention le point d'abscisse ")_RES_$$^%QZCHW(" existe deja")) Q
 Q
 
ORDO(RES) 
 S REFUSE=1
 I RES="" D ^%VZEAVT($$^%QZCHW("Le champ ordonnee doit etre rempli")) Q
 D NORMALIS^%QZNBN1(.RES)
 S ICC=IC,(RESUL(ICC),TAB(ICC))=RES D ^%VAFFICH
 S REFUSE=0
 Q

