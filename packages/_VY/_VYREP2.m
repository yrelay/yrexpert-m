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

;%VYREP2^INT^1^59547,74036^0
ZUCREP2 ;
 
 
 
 
 
 
 
 
 
 
 
 
CHL(R) 
 
 
 
 
 
 
 
 
 N CHOIX
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)'="?"
 I R="" S (REFUSE,STOPUC)=1 Q
 S CHOIX=$$^%QS1CHLI(R)
 D NORM^%VVIDEO,CLEPAG^%VVIDEO
 D ^%VAFIGRI
 D ^%VAFISCR
 I (CHOIX'="")&(CHOIX'=-1) S (RESUL(ICC),TAB(ICC))=CHOIX D ^%VAFFICH Q
 S RESUL(ICC)="",(REFUSE,STOPUC)=1 Q
 
L(R) 
 
 
 
 
 
 
 S (REFUSE,STOPUC)=($$VAIR^%QSGEST5("L0",RESUL(ICC),"OBJET",R)=0)&($$NOMINT^%QSF(RESUL(ICC))="") Q
CHR 
 
 
 
 
 
 
 N CHOIX
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)'="?"
 S CHOIX=$$REP^%QSGES14
 D NORM^%VVIDEO,CLEPAG^%VVIDEO
 D ^%VAFIGRI
 D ^%VAFISCR
 I (CHOIX'="")&(CHOIX'=-1) S (RESUL(ICC),TAB(ICC))=CHOIX D ^%VAFFICH Q
 S RESUL(ICC)="",(REFUSE,STOPUC)=1 Q
 
R 
 
 
 
 
 
 
 N MOT
 D ABR^%LXUC4 Q:(REFUSE=1)!(STOPUC=1)
 I $$LEX^%LXSTOCK(RESUL(ICC),.MOT)'=1 S (REFUSE,STOPUC)=1 Q
 S RESUL(ICC)=MOT
 S (REFUSE,STOPUC)='($$REPM^%QSGEST9(RESUL(ICC))) Q:(REFUSE=0)!(STOPUC=0)
 D ^%VZEAVT($$^%QZCHW(RESUL(ICC))_$$^%QZCHW(" n'est pas un repertoire"))
 Q
CHRLI(R) 
 
 
 
 
 
 
 N CHOIX,BASE,INT,INT1
 S INT="INT1"
 S BASE=$$NOMINT^%QSF(R)
 S (REFUSE,STOPUC)=0
 Q:RESUL(ICC)'="?"
 Q:BASE=""
 S CHOIX=$$^%QSGES16(BASE,INT)
 D NORM^%VVIDEO,CLEPAG^%VVIDEO
 D ^%VAFIGRI
 D ^%VAFISCR
 I (CHOIX'="")&(CHOIX'=-1) S (RESUL(ICC),TAB(ICC))=CHOIX D ^%VAFFICH Q
 S RESUL(ICC)="",(REFUSE,STOPUC)=1 Q
 
RLI(R) 
 
 
 
 
 
 
 N MOT,BASED,BASE
 S BASE=$$NOMINT^%QSF(R)
 D ABR^%LXUC4 Q:(REFUSE=1)!(STOPUC=1)
 I $$LEX^%LXSTOCK(RESUL(ICC),.MOT)'=1 S (REFUSE,STOPUC)=1 Q
 S RESUL(ICC)=MOT
 S BASED=$$REPD^%QSGEL2(BASE,RESUL(ICC))
 S (REFUSE,STOPUC)=BASED="" Q:(REFUSE=0)!(STOPUC=0)
 D ^%VZEAVT($$^%QZCHW(RESUL(ICC))_" "_$$^%QZCHW("n'est pas un lien lie a")_" "_R)
 Q

