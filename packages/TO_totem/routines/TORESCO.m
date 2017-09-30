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

;TORESCO^INT^1^59547,74875^0
TORESCO ;
 
 S DEV=^TABIDENT(WHOIS,"PRINTER") D CLEPAG^%VVIDEO
QUES S DX=0,DY=10 X XY W "Voulez vous les resultats de la comprehension sur (E)cran ou (I)mprimante " R *REP:60 S:REP=-1 REP=13 G:REP=13 FIN S REP=$C(REP) G:(REP'="E")&(REP'="I") QUES W " OK" I REP="I" O DEV U DEV
 D CLEPAG^%VVIDEO W ?30,"RESULTATS DE LA COMPREHENSION le ",%DAT
AMBI I '($D(^[QUI]AMBI)) W !,!,!,?5,"PAS D'AMBIGUITE DANS LA RECONNAISSANCE DES PARAMETRES",!,!,! G UNKN
 S N=-1 F NN=0:0 S N=$N(^[QUI]AMBI(N)) Q:N=-1  S M=-1 F MM=0:0 S M=$N(^[QUI]AMBI(N,M)) Q:M=-1  S L=-1 F LL=0:0 S L=$N(^[QUI]AMBI(N,M,L)) Q:L=-1  W !,!,?5,"Articles : ",N,?40,"Ambiguite sur : ",M,!,?5,"Repere : ",^[QUI]AMBI(N,M,L)
UNKN I '($D(^[QUI]UNKN)) W !,!,?5,"PAS DE PARAMETRE INCONNU" G FIN
 S N=-1 F NN=0:0 S N=$N(^[QUI]UNKN(N)) Q:N=-1  S M=-1 F MM=0:0 S M=$N(^[QUI]UNKN(N,M)) Q:M=-1  S L=-1 F LL=0:0 S L=$N(^[QUI]UNKN(N,M,L)) Q:L=-1  W !,!,?5,"Article : ",N,?40,"Inconnu : ",M,!,?5,"Repere : ",^[QUI]UNKN(N,M,L)
FIN C:REP="I" DEV Q

