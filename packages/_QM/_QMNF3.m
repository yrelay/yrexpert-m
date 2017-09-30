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

;%QMNF3^INT^1^59547,73879^0
QMNF3 ;
 
 
 
 
 
REP 
 N CH
 I RESUL(IC)="?" D CHOIXR,AFF Q
 I RESUL(IC)="" S REFUSE=1 Q
 
 I '($$REPM^%QSGEST9(RESUL(IC))) D ^%VZEAVT($$^%QZCHW("Repertoire inexistant")_"...") S REFUSE=1
 Q
 
LIEN 
 N CH,REP,TYP
 I RESUL(IC)="?" D CHOIXL,AFF Q
 I RESUL(IC)="" S REFUSE=1 Q
 S REP=$$NOMINT^%QSF(RESUL(1))
 I '($D(^[QUI]RQSLIEN(REP,RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("Lien inexistant")_"...") S REFUSE=1 Q
 S TYP=$$TYPE^%QSGEST9(REP,RESUL(IC))
 I ((TYP'=3)&(TYP'=4))&(TYP'=5) S (STOPUC,REFUSE)=1
 Q
 
IND 
 
 N CH,MOT
 I RESUL(IC)="?" D CHOIXI,AFF Q
 I RESUL(IC)="" S REFUSE=1 Q
 I $$IR^%QSGE5($$NOMINT^%QSF(RESUL(2)),RESUL(IC)) Q
 S MOT=$$M^%QAX(RESUL(IC))
 I $$IR^%QSGE5($$NOMINT^%QSF(RESUL(2)),MOT) Q
 D ^%VZEAVT($$^%QZCHW("Individu inexistant")_"...") S REFUSE=1
 Q
 
COMP 
 N CH,MOT
 I RESUL(IC)="?" D SELECT,AFF Q
 I RESUL(IC)="" S REFUSE=1 Q
 I $$IR^%QSGE5($$NOMINT^%QSF(RESUL(4)),RESUL(IC)) Q
 S MOT=$$M^%QAX(RESUL(IC))
 I $$IR^%QSGE5($$NOMINT^%QSF(RESUL(4)),MOT) Q
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("Element inexistant...Voulez vous le creer ? "),"N")'=1 D POCLEPA^%VVIDEO S REFUSE=1 Q
 I $$CREER^%QSGEIND($$NOMINT^%QSF(RESUL(4)),MOT,"",1,1) S REFUSE=1
 D POCLEPA^%VVIDEO
 Q
 
CHOIXR 
 N GLO
 S GLO="^RQSAUTOR(WHOIS)"
 D INIT^%QUCHOIP(GLO,"",1,1,12,78,9),AFF^%QUCHOIP
 S CH=$$UN^%QUCHOIP
 D END^%QUCHOIP,CLFEN^%VVIDEO(0,12,9,79)
 Q
 
CHOIXL 
 N GLO1,AAA
 S AAA="GLO1"
 D LIENNOM^%QSGES23($$NOMINT^%QSF(RESUL(1)),AAA)
 D INIT^%QUCHOIP(AAA,"",1,1,12,78,9),AFF^%QUCHOIP
 S CH=$$UN^%QUCHOIP
 D END^%QUCHOIP,CLFEN^%VVIDEO(0,12,9,79)
 Q
 
CHOIXI 
 N GLO
 S GLO=$$LISTIND^%QSGEST6($$NOMINT^%QSF(RESUL(2)))
 D INIT^%QUCHOIP(GLO,"",1,1,12,78,9),AFF^%QUCHOIP
 S CH=$$UN^%QUCHOIP
 D END^%QUCHOIP,^%VAFIGRI,^%VAFISCR
 Q
 
SELECT 
 N LISTE,GLO,IND,TABLIEN
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
 S TABLIEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABLIEN") K @(TABLIEN)
 S LISTE=$$LISTIND^%QSGEST6($$NOMINT^%QSF(RESUL(4)))
 S IND="" F %U=0:0 S IND=$O(@LISTE@(IND)) Q:IND=""  S @GLO@(IND)=""
 
 
 D MVG^%QSCALVA($$NOMINT^%QSF(RESUL(2)),RESUL(3),RESUL(1),TABLIEN,.TYPE)
 S IND="" F %U=0:0 S IND=$O(@TABLIEN@(IND)) Q:IND=""  K @GLO@(IND)
 D INIT^%QUCHOIP(GLO,"",1,1,12,78,9),AFF^%QUCHOIP
 S CH=$$UN^%QUCHOIP
 D END^%QUCHOIP,^%VAFIGRI,^%VAFISCR
 K @(GLO),@(TABLIEN)
 Q
 
AFF S REFUSE=1,TAB(ICC)=$J(" ",20) D ^%VAFFICH
 S TAB(IC)=CH D ^%VAFFICH S REFUSE=0 Q
 
 
 
 
ATTRI 
 Q:RESUL(IC)=""
 I $$EXIST^%LXSTOCK(RESUL(IC)) Q
 D ^%VZEAVT($$^%QZCHW("Attribut inexistant au lexique"))
 S REFUSE=1
 Q

