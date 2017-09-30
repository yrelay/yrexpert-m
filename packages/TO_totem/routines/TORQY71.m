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

;TORQY71^INT^1^59547,74875^0
TORQY71 ;
 
 
 
 
 
 
 
 
 
 
GAMME 
 I %AJM'="A",RESUL(IC)'="" S REFUSE=0 I RES'=GAMM D ^%VZEAVT($$^%QZCHW("Il est interdit de modifier la valeur de ce champ")) S (RESUL(IC),TAB(IC))=GAMM,ICC=IC D ^%VAFFICH Q
 Q
NOMENC 
 I %AJM'="A",RESUL(IC)'="" S REFUSE=0 I RES'=NOMENC D ^%VZEAVT($$^%QZCHW("Il est interdit de modifier la valeur de ce champ")) S (RESUL(IC),TAB(IC))=NOMENC,ICC=IC D ^%VAFFICH Q
 I (RESUL(IC)=0)&(RESUL(IC+1)'="") S RESUL(IC+1)="" D ^%VAFIGRI,^%VAFISCR
 Q
 
LIEN 
RET 
 I RESUL(IC)="" Q
 I RESUL(IC-1)=0 D ^%VZEAVT($$^%QZCHW("pas de nomenclature : valeur inutile")) S REFUSE=1 Q
 I RESUL(8)="" D ^%VZEAVT($$^%QZCHW("Le repertoire recepteur doit etre defini.")) S REFUSE=1 Q
 N RPERI
 S RPERI=$$NOMINT^%QSF(RESUL(8)) I RPERI="" D ^%VZEAVT($$^%QZCHW("Impossible de trouver le repertoire")_" "_RESUL(8)) S REFUSE=1 Q
 I RESUL(IC)="?" G CHOIX
 
 I $$TYPE^%QSGEST9(RPERI,RESUL(IC))=0 D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("n'est pas un lien pour le repertoire")_" "_RPERI) S REFUSE=1 Q
 I $$TYPE^%QSGEST9(RPERI,RESUL(IC))<4 D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("n'est pas un lien involutif pour le repertoire")_" "_$$NOMLOG^%QSF(RPERI)) S REFUSE=1 Q
 I $$QUAL^%QSGEL2(RPERI,RESUL(IC))=0 D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("n'est pas un lien qualifie")) S REFUSE=1 Q
 S REFUSE=0
 Q
 
CHOIX 
 N LIEN,TABLIEN,I,J
 D LIEN^%QSGEST9(RPERI,"TABLIEN")
 S I="" F J=0:0 S I=$O(TABLIEN(I)) Q:I=""  I TABLIEN(I)>3 S LIEN(I)=1
 I '($D(LIEN)) D ^%VZEAVT($$^%QZCHW("Il n'existe pas de liens involutifs pour le repertoire ")_RPERI) S REFUSE=1 Q
 D INIT^%QUCHOIP("LIEN","",1,1,13,78,8),AFF^%QUCHOIP
 S RESUL(IC)=$$UN^%QUCHOIP
 D ^%VAFIGRI,^%VAFISCR
 S REFUSE=0
 G RET
 
REPG 
 I RESUL(4)=1 G REPG2
 I RESUL(4)=0,RESUL(IC)="" Q
 D ^%VZEAVT($$^%QZCHW("pas de gamme : valeur inutile")) S REFUSE=1 Q
REPG2 I '($$REPM^%QSGEST9(RESUL(IC))) D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("n'est pas un repertoire")) S REFUSE=1 Q
 N LIENS,OK,LL
 D LIEN^%QSGEST9($$NOMINT^%QSF(RESUL(IC)),"LIENS")
 S OK=0,LL="" F I=0:0 S LL=$O(LIENS(LL)) Q:LL=""  I LIENS(LL)=2 S OK=1 Q
 I '(OK) S REFUSE=1 D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("n'a pas de repertoires fils")) Q
 Q
RRN 
 I RESUL(6)=0 D ^%VZEAVT($$^%QZCHW("pas de nomenclature : valeur inutile")) S REFUSE=1 Q
 Q:RESUL(IC)=""
 I '($$REPM^%QSGEST9(RESUL(IC))) D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("n'est pas un repertoire")) S REFUSE=1 Q
 N LIENS,OK,LL
 D LIEN^%QSGEST9($$NOMINT^%QSF(RESUL(IC)),"LIENS")
 S OK=0,LL="" F I=0:0 S LL=$O(LIENS(LL)) Q:LL=""  I LIENS(LL)=4 S OK=1 Q
 I '(OK) S REFUSE=1 D ^%VZEAVT(RESUL(IC)_" "_$$^%QZCHW("n'a pas de liens involutifs")) Q
 Q

