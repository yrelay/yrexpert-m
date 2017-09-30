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

;LKYVAL2^INT^1^59547,74868^0
LKYVALI() 
 
 
 
 
 K ^DAT
 N ROOT,BASE,MSG,I,LIEN,LIEN1,PILE,INTERD
 S ROOT=$$CONCAS^%QZCHAD("^[QUI]LK","TOLAS") K @(ROOT)
 S PILE="^[QUI]LKY(""PILE1"")"
 S MSG=""
 D INITFI^LKZSTACK(PILE)
 S BASE=$$NOMINT^%QSF($$REP^%QSGES14)
 I BASE="" S MSG="Nom de repertoire invalide" D ^%VZEAVT($$^%QZCHW(MSG)) Q MSG
 S MSG=$$^LKYINIT($$CONCAS^%QZCHAD("^DAT",BASE),BASE)
 I MSG'="" D ^%VZEAVT($$^%QZCHW(MSG)) Q MSG
 S ^DAT=BASE,INTERD(BASE)=""
 D PUSH^LKZSTACK(PILE,BASE)
 F I=0:0 Q:$$PILEVIDE^LKZSTACK(PILE)!(MSG'="")  D T
 K @(PILE)
 Q MSG
T S LIEN=$$POP^LKZSTACK(PILE)
 D PUSH^LKZSTACK(PILE,LIEN)
 S LIEN1=$$NOMINT^%QSF($$^LKYLIEN(LIEN,.INTERD))
 I LIEN1="" S LIEN=$$POP^LKZSTACK(PILE) Q
 S MSG=$$^LKYINIT($$CONCAS^%QZCHAD("^DAT",LIEN1),LIEN1)
 I MSG'="" D ^%VZEAVT($$^%QZCHW(MSG)) Q
 S ^DAT(LIEN,"R",$$NOMLOG^%QSF(LIEN1))="",INTERD(LIEN1)=""
 D PUSH^LKZSTACK(PILE,LIEN1)
 Q

