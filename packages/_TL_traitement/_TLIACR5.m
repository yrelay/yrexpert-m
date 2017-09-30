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

;%TLIACR5^INT^1^59547,74029^0
%TLIACR5 ;;02:47 PM  10 Feb 1992;
 
 
 
 
 
SAISIR 
 N LIS,NOMSM,TITRE,MUET
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Saisie en tableau"))
 S NOMSM=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(NOMSM="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer nom saisie")) S ECHEC=1 Q
 I '($$EX^%QUBKGES(NOMSM)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Saisie inconnue")) S ECHEC=1 Q
 S LIS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(LIS="") D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Imposs. evaluer nom liste")) S ECHEC=1 Q
 I '($$IR^%QSGE5("L0",LIS)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Liste inconnue")) S ECHEC=1 Q
 S TITRE=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S TITRE=""
 S MUET=$$SUBST^%ANARBR2($$RED(ACTI,4),.CXT,"ATT^%TLIACT3",.POS)
 I (POS=0)!(MUET="") S MUET=0
 I (MUET'=0)&(MUET'=1) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Mode inconnu")) S ECHEC=1 Q
 D ACTIV^%QUBKKA(NOMSM_$C(0)_$C(0)_LIS_$C(0)_$C(0)_TITRE,MUET,1)
 Q
 
 
ERR D:MODAF ADD^%TLIFEN("LOG","  "_MSG)
 S ECHEC=1
 Q
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

