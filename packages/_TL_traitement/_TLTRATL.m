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

;%TLTRATL^INT^1^59547,74031^0
QSTRARQS ;
 S R=$ZP(^ROUTINE("%QS")) K ^UTILITY($J) F I=1:1 S R=$O(^ROUTINE(R)) Q:R=""  Q:$E(R,1,3)'="%QS"  S ^UTILITY($J,R)=""
 Q:'($D(^UTILITY($J)))
 S R=""
LR S R=$O(^UTILITY($J,R)) Q:R=""  S MR=0,NL=0 K ^U($J)
LL K QS S NL=$O(^ROUTINE(R,0,NL)) G STO:(NL="")&(MR=1),LR:NL="" S LI=^ROUTINE(R,0,NL) I LI'["^%QS" S ^U($J,NL)=LI G LL
 F J=1:1 S IT=$P(LI,"^%QS",J) Q:IT=""  S QS(J)=IT
 S J=1 F I=1:1 S J=$O(QS(J)) Q:J=""  D TR
 S CH="",J="" F I=1:1 S J=$O(QS(J)) Q:J=""  S CH=CH_QS(J)
 S ^U($J,NL)=CH W "." G LL
TR S CH=QS(J),PF="RQS" F U=1:1:5 S CC=$E(CH,U) Q:'($$OK($A(CC)))  S PF=PF_CC
 S QS(J)="^%QS"_CH,MR=1 Q
OK(X) 
 Q:X<48 0
 Q:X>90 0
 Q:(X>57)&(X<65) 0
 Q 1
STO S X="ZR  X Y ZS @R"
 S Y="S L="""" F V=1:1 S L=$O(^U($J,L)) Q:L=""""  ZI ^U($J,L)"
 X X G LR

