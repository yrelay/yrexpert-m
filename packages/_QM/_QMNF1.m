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

;%QMNF1^INT^1^59547,73879^0
QMNF1 ;
 
 
 
 
 
AJ 
 N REP,BASI,REPD,BASID,IND,IND2,LIEN,SCR,ABENDSCR,MSG,TYP
 D CLEPAG^%VVIDEO
AJ2 S SCR="QMNFNO1"
 Q:'($D(^%SCRE(SCR)))
 K RESUL
 S RESUL(3)="AJOUT"
 D AFF^%VACTGRQ(SCR,.RESUL)
 Q:ABENDSCR
 Q:(RESUL(1)="")!(RESUL(2)="")
 S REP=RESUL(1),BASI=$$NOMINT^%QSF(REP),LIEN=RESUL(2)
 S TYP=$$TYPE^%QSGEST9(BASI,LIEN) I ((TYP'=3)&(TYP'=4))&(TYP'=5) D ^%VZEAVT($$^%QZCHW("Ce lien et ce repertoire sont incompatibles")) G AJ2
 S BASID=$$REPD^%QSGEL2(BASI,LIEN),REPD=$$NOMLOG^%QSF(BASID)
 S SCR="QMNFNO2"
ERR K RESUL
 S RESUL(1)=LIEN,RESUL(2)=REP,RESUL(4)=REPD
AJ3 D AFF^%VACTGRQ(SCR,.RESUL)
 Q:ABENDSCR
 I (RESUL(3)="")!(RESUL(5)="") G AJ2
 S IND=RESUL(3),IND2=RESUL(5)
 I '($$IR^%QSGE5(BASI,IND)) S IND=$$M^%QAX(IND)
 I '($$IR^%QSGE5(BASI,IND)) D ^%VZEAVT($$^%QZCHW("Premier individu inconnu")) G ERR
 G:$$IR^%QSGE5(BASID,IND2) AJ4
 S IND2=$$M^%QAX(IND2)
 G:$$IR^%QSGE5(BASID,IND2) AJ4
 D POCLEPA^%VVIDEO
 I $$MES^%VZEOUI($$^%QZCHW("Element inconnu...Voulez vous le creer ? "),"N")'=1 D POCLEPA^%VVIDEO G ERR
 I $$CREER^%QSGEIND(BASID,IND2,"",1,.MSG)=1 D ^%VZEAVT(MSG) G ERR
 D POCLEPA^%VVIDEO
AJ4 I $$OVAIR^%QSGE5(BASI,IND,LIEN,IND2,IND2) D ^%VZEAVT($$^%QZCHW("Lien deja existant, refuse")_" !") S RESUL(5)="" G AJ3
 D ^%VZEATT
 D ADDS^%QSGEST3(BASI,IND,LIEN,BASID,IND2)
 D POCLEPA^%VVIDEO
 S RESUL(5)=""
 G AJ3

