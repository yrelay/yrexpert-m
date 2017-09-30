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

;%SY5LIB1^INT^1^59547,73892^0
%SY5LIB1 ;;09:29 AM  8 Jun 1993; ; 08 Jun 93  9:38 AM
 
 
L1() Q:MODTM $$^%QZCHW("(+) P.suiv, (-) P.prec, ESCP:Aband, RETURN:Accord, (T)out")
 Q $$^%QZCHW("(+) P.suiv, (-) P.prec, BREAK:Aband, RETURN:Accord, (T)out")
 
L2() Q:MODTM $$^%QZCHW("RETURN:Selection, (CTRLG)Suppres. selection, (ESCP)Abandon, (CTRLF)Pagination")
 Q $$^%QZCHW("RETURN:Selection, (CTRLG)Suppres. selection, (BREAK)Abandon, (CTRLF)Pagination")
 
L3() Q:MODTM $$^%QZCHW("Ligne de separation. RETURN sur la position choisie,ESCP : pas de ligne")
 Q $$^%QZCHW("Ligne de separation. RETURN sur la position choisie, BREAK : pas de ligne")
 
L4() Q:MODTM $$^%QZCHW("ESCP:Abandon, CTRLB:Balayage premisses ou resultantes")
 Q $$^%QZCHW("BREAK:Abandon, CTRLB:Balayage premisses ou resultantes")
 
L5() Q:MODTM $$^%QZCHW("(+) P.suiv, (-) P.prec, ESCP:Aband, RETURN:Accord")
 Q $$^%QZCHW("(+) P.suiv, (-) P.prec, BREAK:Aband, RETURN:Accord")
 
L6() Q:MODTM $$^%QZCHW("RETURN:Selection, (CTRLG)Suppres. selection, (ESCP)Abandon, (CTRLF)Pagination")
 Q $$^%QZCHW("RETURN:Selection, (CTRLG)Suppres. selection, (BREAK)Abandon, (CTRLF)Pagination")
 
L7() Q:MODTM $$^%QZCHW("CTRLF:pour accord, ESCP:pour abandon")
 Q $$^%QZCHW("CTRLF:pour accord, BREAK:pour abandon")
 
L8() Q:MODTM $$^%QZCHW("+, -, CTRLE:Acces ")_AW_$$^%QZCHW(", CTRLU:Unites, ESCP")_$S(%LL="":$$^%QZCHW(":Abandon"),1:$$^%QZCHW(":Ret. grille"))
 Q $$^%QZCHW("+, -, CTRLE:Acces ")_AW_$$^%QZCHW(", CTRLU:Unites, BREAK")_$S(%LL="":$$^%QZCHW(":Abandon"),1:$$^%QZCHW(":Ret. grille"))
 
L9() Q:MODTM $$^%QZCHW("+, -, CTRLE:Acces ")_AW_$$^%QZCHW(", ESCP")_$S(%LL="":$$^%QZCHW(":Abandon"),1:$$^%QZCHW(":Ret. grille"))
 Q $$^%QZCHW("+, -, CTRLE:Acces ")_AW_$$^%QZCHW(", BREAK")_$S(%LL="":$$^%QZCHW(":Abandon"),1:$$^%QZCHW(":Ret. grille"))
 
L10() Q:MODTM $$^%QZCHW("(ESCP) Abandon, Autre caractere pour continuer ")
 Q $$^%QZCHW("(BREAK) Abandon, Autre caractere pour continuer ")
 
L11() Q:MODTM $$^%QZCHW("(RETURN) Valeur suivante, (ESCP) Abandon ")
 Q $$^%QZCHW("(RETURN) Valeur suivante, (BREAK) Abandon ")
 
L12() Q:MODTM $$^%QZCHW("(ESCP) Fin affichage;(CTRLF) Fin affichage de l'abaque courante ")
 Q $$^%QZCHW("(BREAK) Fin affichage;(CTRLF) Fin affichage de l'abaque courante ")
 
L13() Q:MODTM $$^%QZCHW("(S)uppression, (RETURN) Valeur suivante, (ESCP) Abandon ")
 Q $$^%QZCHW("(S)uppression, (RETURN) Valeur suivante, (BREAK) Abandon ")
 
L14() Q:MODTM $$^%QZCHW("(RETURN) pour continuer ; (ESCP) pour abandonner ; (CTRLF) fin ")
 Q $$^%QZCHW("(RETURN) pour continuer ; (BREAK) pour abandonner ; (CTRLF) fin ")
 
L15() Q:MODTM $$^%QZCHW("Nbre de desaccords (0 :par defaut), ESCP:fin, CTRLF:valeurs de parametres ? ")
 Q $$^%QZCHW("Nbre de desaccords (0 :par defaut), BREAK:fin, CTRLF:valeurs de parametres ? ")
 
L16() Q:MODTM $$^%QZCHW("Recherche epuisee : ESCP pour recommencer, CTRLF pour finir")
 Q $$^%QZCHW("Recherche epuisee : BREAK pour recommencer, CTRLF pour finir")
 
L17(LIB) Q:MODTM $$^%QZCHW("(+), (-), (P)age, (ESCP) abandon")_$S(LIB'="":", "_$$^%QZCHW(LIB),1:"")
 Q $$^%QZCHW("(+), (-), (P)age, (BREAK) abandon")_$S(LIB'="":", "_$$^%QZCHW(LIB),1:"")
 
L18(LIB) Q:MODTM $$^%QZCHW("(RETURN) pour continuer")_", "_$$^%QZCHW(LIB)_", "_$$^%QZCHW("(ESCP) fin")
 Q $$^%QZCHW("(RETURN) pour continuer")_", "_$$^%QZCHW(LIB)_", "_$$^%QZCHW("(BREAK) fin")
 
L19() Q:MODTM $$^%QZCHW("Impression sur (E)cran ou sur (I)mprimante (ESCP abandon)")
 Q $$^%QZCHW("Impression sur (E)cran ou sur (I)mprimante (CTRLA abandon)")
 
LL1() Q:MODTM $$^%QZCHW("+,-,Page,(CTRLF) fin de la gamme,(ESCP) abandon ")
 Q $$^%QZCHW("+,-,Page,(CTRLF) fin de la gamme,(BREAK) abandon ")
 
LL2() Q:MODTM $$^%QZCHW("[RETURN] pour continuer,(ESCP) pour abandonner ")
 Q $$^%QZCHW("[RETURN] pour continuer,(BREAK) pour abandonner ")
 
LL3(PRG) 
 Q:MODTM $$^%QZCHW("ESCP:Abandon,"_$S(PRG="":"",1:"CTRLE:acces aux objets,")_"+,-,page,(?) repere")
 Q $$^%QZCHW("BREAK:Abandon,"_$S(PRG="":"",1:"CTRLE:acces aux objets,")_"+,-,page,(?) repere")
 
LL4() Q:MODTM $$^%QZCHW("ESCP:Fin,CTRLE:choix d'une gamme,+,-,Page,(?)repere") Q $$^%QZCHW("BREAK:Fin,CTRLE:choix d'une gamme,+,-,Page,(?)repere")
 
LL5() Q:MODTM $$^%QZCHW("(A)ttributs,(V)isualisation,(S)uppression,CTRLG:gomme,ESCP abandon")
 Q $$^%QZCHW("(A)ttributs,(V)isualisation,(S)uppression,CTRLG:gomme,BREAK abandon")
 
LL6() Q:MODTM $$^%QZCHW("(S)election d'une gamme,CTRLG:gomme,ESCP abandon")
 Q $$^%QZCHW("(S)election d'une gamme,CTRLG:gomme,BREAK abandon")
 
LL7 D POCLEPA^%VVIDEO
 I MODTM W $$^%QZCHW("ESCP pour finir ") Q
 W $$^%QZCHW("BREAK pour finir ") Q

