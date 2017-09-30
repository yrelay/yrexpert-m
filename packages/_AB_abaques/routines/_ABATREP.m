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

;%ABATREP^INT^1^59547,73864^0
ABATREP ;
 N X,LIST,CTR,Z,NOAT D CURRENT^%IS
 S LIST=""
 I $D(^EXLIST($I)) S LIST=^EXLIST($I) G ACQAT
 I '($$OKR^%INCOIN("CIAT")) G END
 D POCLEPA^%VVIDEO W $$^%QZCHW("Souhaitez-vous prendre en compte des attributs originaires des repertoires ? ")
 R *X:^TOZE($I,"ATTENTE") G END:X'=$A("O")
ACQLIST D POCLEPA^%VVIDEO S LIST=$$^%VZAME1($$^%QZCHW("Nom de la liste d'attributs  :"))
 G:CTRLA!CTRLF END
 G:LIST="" ACQLIST
 I LIST="?" S LIST=$$^%QUCHOYO("^[QUI]ZLILA",.R,1) G:LIST="" ACQLIST
ACQAT G:LIST="" END
 I '($D(^[QUI]ZLILA(LIST))) D ^%VZEAVT($$^%QZCHW("Liste inexistante ...")) G ACQLIST
 S NOAT=-1
 F Z=0:0 S NOAT=$N(^[QUI]ZLILA(LIST,NOAT)) Q:NOAT=-1  S ^[QUI]FULL(ARTI,^[QUI]ZLILA(LIST,NOAT))=1
END S ^EXLIST($I)=LIST
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Analyse du Savoir-Faire"),0),BLD^%VVIDEO W !,ARTI D NORM^%VVIDEO Q
 ;

