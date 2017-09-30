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

;%QSVUC^INT^1^59547,73883^0
RQSVUC ;
 
OK S (REFUSE,STOPUC)=0 Q
ERR S (REFUSE,STOPUC)=1 Q
SQ D ^%VSQUEAK G ERR
M(M) D ^%VSQUEAK,POCLEPA^%VVIDEO W M," ... [RETURN]" R *DX:^TOZE($I,"ATTENTE")
 D POCLEPA^%VVIDEO Q
REAF N SIC,SICC
 S SIC=IC,SICC=ICC
 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR
 S CI=SIC,ICC=SICC Q
 
VISA G:RESUL(IC)="" SQ
 I $E(RESUL(IC),1,5)'="VISA." D ^%VZEAVT($$^%QZCHW("Le nom d'un visa doit commencer par VISA.")) G ERR
 G OK
 
REP G:RESUL(IC)="" SQ
 G:RESUL(IC)'="?" RTEST
 S RESUL(IC)=$$^%QUCHOYO("^[QUI]RQSNOLOG",.REAF,1)
 I REAF=2 D REAF
 G:RESUL(IC)="" ERR
RTEST I '($D(^[QUI]RQSNOLOG(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("Repertoire inconnu")) G ERR
 G OK
 
DELAI G:RESUL(IC)="" SQ
 I RESUL(IC)="?" D ^%VZEAVT($$^%QZCHW("Delai = nombre de jours")) G ERR
 G:RESUL(IC)'?.N SQ
 G OK
SIGN 
 G:RESUL(IC)="" OK
 I '($D(^[QUI]RQSVSIGN(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("Signataire inconnu")) G ERR
 G OK
SIGN2 
 G:RESUL(IC)="" OK
 I '($D(^[QUI]RQSVSIGN(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("OK, mais ce signataire est encore inconnu"))
 G OK

