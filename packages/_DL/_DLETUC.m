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

;%DLETUC^INT^1^59547,73867^0
DLETUC ;
 
 
 
 
MODE 
 N M
 S (REFUSE,STOPUC)=0
 S M=$E(RESUL(ICC),1)
 I (M="R")!(M="r") S TAB(ICC)="REEL" D ^%VAFFICH Q
 I (M="S")!(M="s") S TAB(ICC)="SIMULATION" D ^%VAFFICH Q
 S (REFUSE,STOPUC)=1 Q
 Q
 
SENS 
 N P
 S (REFUSE,STOPUC)=0
 S P=$E(RESUL(ICC),1,2)
 I (P="AV")!(P="av") S TAB(ICC)="AVAL" D ^%VAFFICH Q
 I (P="AM")!(P="am") S TAB(ICC)="AMONT" D ^%VAFFICH Q
 S (REFUSE,STOPUC)=1
 Q
 
DECA 
 N P,NON,NONM,OUI,OUIM,MES,DEC
 I RESUL(ICC)="" S TAB(ICC)=^[QUI]RQSGLO("JALON","APP","DEC") G FDEC
 S (REFUSE,STOPUC)=0
 S P=$E(RESUL(ICC),1)
 S OUI=$$^%QZCHW("oui"),OUIM=$$^%QZCHW("OUI")
 I (P=$E(OUI))!(P=$E(OUIM)) S TAB(ICC)=OUIM G FDEC
 S NON=$$^%QZCHW("non"),NONM=$$^%QZCHW("NON")
 I (P=$E(NON))!(P=$E(NONM)) S TAB(ICC)=NONM G FDEC
 S (REFUSE,STOPUC)=1 Q
FDEC D ^%VAFFICH
 S DEC=RESUL(ICC)
 S MES=$$VERDEC^%DLPARAM(.DEC)
 I MES'="" D ^%VZEAVT(MES)
 D AFFI(0)
 S TAB(ICC)=DEC D ^%VAFFICH
 F I=18:1:20 S PATOUCH(I)=RESUL(ICC)="NON"
 S (REFUSE,STOPUC)=0
 Q
 
TYPDEC 
 N TYPD,TYPDEC
 S TYPD=^[QUI]RQSGLO("JALON","APP","TYPDEC")
 F I=ICC+1,ICC+2 S PATOUCH(I)=""
 I RESUL(ICC)="" S TAB(ICC)=$$DEF(TYPD) D ^%VAFFICH G TYPD2
 D PARTIE^%DLPARAM(RESUL(ICC),TYPD,.TYPDEC,.MSG)
 I TYPDEC["/" D ^%VZEAVT($$^%QZCHW("les solutions possibles sont")_" "_TYPD) S (REFUSE,STOPUC)=1 Q
 I MSG'="" D ^%VZEAVT(MSG)
 I TYPDEC="" S (REFUSE,STOPUC)=1 Q
 D AFFI(0)
 S TAB(ICC)=TYPDEC D ^%VAFFICH
TYPD2 
 I RESUL(ICC)="C" S PATOUCH(ICC+2)=1 D AFFI(2) Q
 I RESUL(ICC)="R" S PATOUCH(ICC+1)=1 D AFFI(1) Q
 I RESUL(ICC)="CR" Q
 S (REFUSE,STOPUC)=1 Q
 
DEF(TYPD) 
 N NB,STOP,TY
 S STOP=0
 F NB=1:1:3 S PA=$P(TYPD,"/",NB) Q:PA=""  I PA="R" S STOP=1 Q
 I STOP=1 Q "R"
 F NB=1:1:3 S PA=$P(TYPD,"/",NB) Q:PA=""  I PA="CR" S STOP=1 Q
 I STOP=1 Q "CR"
 Q "C"
 
AFFI(NB) 
 S ICC=ICC+NB
 S TAB(ICC)=$J("",10) D ^%VAFFICH
 S TAB(ICC)="" D ^%VAFFICH
 S ICC=ICC-NB
 Q
 
COEF 
 N MES
 I RESUL(ICC)="" S TAB(ICC)=^[QUI]RQSGLO("JALON","APP","COEF.SUP") D ^%VAFFICH Q
 S MES=$$VERCOEF^%DLPARAM(RESUL(ICC))
 I MES'="" D ^%VZEAVT(MES) S (REFUSE,STOPUC)=1 Q
 S (REFUSE,STOPUC)=0
 Q
 
ITER 
 N MES
 I RESUL(ICC)="" S TAB(ICC)=^[QUI]RQSGLO("JALON","APP","MAX.ITER") D ^%VAFFICH Q
 S MES=$$VERITER^%DLPARAM(RESUL(ICC))
 I MES'="" D ^%VZEAVT(MES) S (REFUSE,STOPUC)=1 Q
 S (REFUSE,STOPUC)=0
 Q
 
NUM(VAL) 
 I $$ENTP^%QZNBN(VAL)=0 Q 0
 I VAL=0 Q 0
 Q 1

