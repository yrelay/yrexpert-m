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

;%PBIANSY^INT^1^59547,73873^0
PTIANSYN(SYNT,EXPR,A,P,S) N E,%S
 S S=-1
 F %S=0:0 S S=$N(SYNT(S)) Q:S=-1  D ONE(SYNT(S),EXPR,.E,.A,.P) Q:'(E)
 Q '(E)
ONE(%9SQUE,%9EXPR,%9ERR,TABLEX,TABPAR) 
 
 
 K TABLEX,TABPAR N C,CAR,IDF,E,I,INT,NR,NX,S S NR=0,NX=0,E=%9EXPR,%9ERR=0
 F I=1:1:$L(%9SQUE) D NTI Q:%9ERR
 Q
CAR S C=$E(E,1,1) Q
NTI S CAR=$E(%9SQUE,I,I) D @$S("*X"'[CAR:"NSEP",1:"NPAR") Q
NPAR D CAR S IDF="" G:(C?1N)!("+-"[C) NBR
BARAM D CAR S %9ERR=C'?1A G:%9ERR FA D IDF G:%9ERR FA D CAR G:C'="." FA D LEC S IDF=IDF_"." G BARAM
FA S:CAR="*" NX=NX+1,TABLEX(NX)=IDF S NR=NR+1,TABPAR(NR)=IDF Q
IDF D LECIDF Q
LECIDF D CAR S IDF=IDF_C D LEC
BIDF D CAR Q:(C'?1NA)&(C'=":")  S IDF=IDF_C D LEC G BIDF
NSEP D CAR S %9ERR=CAR'=C Q:%9ERR  D LEC Q
NBR D SIGN,INTEG Q:%9ERR  S IDF=+(S_INT) D CAR I C="." D LEC,INTEG Q:%9ERR  S IDF=IDF_"."_INT
 S:CAR="*" NX=NX+1,TABLEX(NX)=IDF S NR=NR+1,TABPAR(NR)=IDF Q
INTEG S INT=""
BINTEG D CAR Q:C'?1N  S INT=INT_C D LEC G BINTEG
SIGN S S="+" D CAR I "+-"[C S S=C D LEC
 Q
LEC S E=$E(E,2,$L(E)) Q
NTEST W !,"Syntaxe : " R %9SQUE W !,"Expression : " R %9EXPR
 D ONE(%9SQUE,%9EXPR,.%9ERR,.TABLEX,.TABPAR)
 W !,"Resultat --> ",%9ERR Q

