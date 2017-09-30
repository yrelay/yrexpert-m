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

;%AV8C^INT^1^59547,73867^0
%AV8C ;;12:24 PM  4 Nov 1993;
 
 
 
 
 
 
 
 
 
 
 
indeval N REP,IND
 G:'(EXPR) indev2
 S TXT=TXT(1)
 I TXT(1)="%courant" G indev2
 D AJEXPR^%AV8("individu "_TXT,"INDIVIDU")
indev2 Q:'(EVAL)
 I TV(1)="%courant" S ROUT=@GLOROUT@("INDIVIDU COURANT") D @(ROUT_"(.REP,.IND)") S TVV=REP_$C(0)_IND,TR="" Q
 S ROUT=@GLOROUT@("PROXIMITE") D @(ROUT_"(TV(1),.REP,.IND)") S TVV=REP_$C(0)_IND,TR=""
 I EVAL>1 D AJEVAL^%AV8(TVV,TVV)
 Q
 
 
subex N NUMK,SUBEX
 I EXPR S SUBEX=$E(TXT(1),2,$L(TXT(1))-1),TXT=$S(SUBEX=0:"()",1:"("_@DEJAEXP@(SUBEX,"TXT")_")")
 Q:'(EVAL)
 S NUMK=$E(TV(1),2,$L(TV(1))-1)
 S TVV=@DEJAEXP@(NUMK,"VV"),TRR=@DEJAEXP@(NUMK,"RR")
 
 Q
 
indice I EXPR S TXT=TXT(1)_TXT(2)
 Q:'(EVAL)  S TVV=TV(1)_$C(0)_TV(2),TRR=TR(1)_$C(0)_TR(2) Q
 
chap N REP,IND,ATT,ORD
 G:'(EXPR) chap2
 I $E(TXT(2))="%" S TXT=TXT(2) D AJEXPR^%AV8(TXT,"ATTRIBUT.TEMPORAIRE") G chap2
 S TXT=TXT(2)_"^"_TXT(1) D AJEXPR^%AV8(TXT,"ATTRIBUT")
chap2 Q:'(EVAL)
 S REP=$P(TV(1),$C(0)),IND=$P(TV(1),$C(0),2),ATT=$P(TV(2),$C(0)),ORD=$P(TV(2),$C(0),2)
 S:$E(ATT)="%" REP="%",IND=$J,TV(1)=REP_$C(0)_IND
 S ROUT=@GLOROUT@("ACCES BASE")
 S @("TVV="_ROUT_"(REP,IND,ATT,ORD)")
 S TRR=TV(1)_$C(0)_TV(2)
 I EVAL>1 D AJEVAL^%AV8($S($E(TV(2))="%":TV(2),1:TRR),TVV)
 Q
 
 
 
BINSTD I EXPR S TXT=TXT(1)_VAL_TXT(2) D AJEXPR^%AV8(TXT,"EXPR")
 Q:'(EVAL)  S TVV=$C(0) S:(TV(1)'=$C(0))&(TV(2)'=$C(0)) @("TVV=(TV(1)"_VAL_"TV(2))") S TRR=""
 I EVAL>1 D AJEVAL^%AV8(TVV,TVV)
 Q

