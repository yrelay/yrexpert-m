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

;%QS0TRIE^INT^1^59547,73880^0
%QS0TRIE() 
 
 
 
 
 
 
 
 
 N L,OKECR D ^%QUAPAD($$^%QZCHW("TRI D'UNE LISTE")) S L=$$UN^%QUAPAGM
 I L="" D POCLEPA^%VVIDEO Q 1
 Q $$TRIER(L)
 
 
 
TRIER(L) N A,ATRI,B,C,L2,S,S2,T,OKECR,MERR,RESU
 K ATRI
 
 D ^%QSLUTR2(.ATRI) Q:'($D(ATRI)) 1
 S RESU=1
 G TTRI
TRIERT(L,ATRI) N A,B,C,L2,S,S2,T,OKECR,MERR,RESU
 S RESU=1 G TTRI
TRIERP(L,ATRI) N A,B,C,L2,S,S2,T,OKECR,MERR,RESU
 S RESU=""
TTRI I WHOIS("ETUDE")'=0 D TRIETU^%QSLUTRI(L,.ATRI) K ATRI Q 1
 S OKECR=$$GET^%SGVAR("ECR")
 S A=$$^%QSCALVA("L0",L,"ADRESSE") I A="" S MERR=$$^%QZCHW("Impossible de retrouver les individus de la liste ... desole") G ERR1
 S C=$$^%QSCALVA("L0",L,"CARD") I C="" S MERR=$$^%QZCHW("Impossible de retrouver le cardinal de cette liste ... desole") G ERR1
 S B=$$^%QSCALVA("L0",L,"BASE") I B="" S MERR=$$^%QZCHW("Impossible de determiner le repertoire des individus de cette liste ... desole") G ERR1
 S L2=$$^%QSCALVA("L0",L,"TRIEE")
 
 I L2="" D:OKECR POCLEPA^%VVIDEO,^%VSQUEAK W:OKECR $$^%QZCHW("un instant") S L2=$$DEFAUT^%QSLUTRI(A) D ADDA^%QS0(L,"TRIEE",L2),ADDA^%QS0(L,"TRIABLE","OUI")
 I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("Tri en cours ... un instant ")
 S S=$$GEN^%QCAPOP("TRI"),S2="^[QUI]ZLIGTRIE("_""""_S_""""_")"
 D ^%QSLUTRI(A,L2,S2,.ATRI,B)
 K ATRI
 D ADDA^%QS0(L,"TRIEE",S2),ADDA^%QS0(L,"TRIABLE","OUI"),USE^%QS0(L) K @(L2)
 Q $S(RESU=1:1,1:S)
 
ERR1 I OKECR D POCLEPA^%VVIDEO,^%VSQUEAK W MERR H 3 Q RESU
 Q RESU

