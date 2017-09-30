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

;TKINIT7^INT^1^59547,74869^0
TKINIT7 ;
 
BEG S I=1,OS=$S($D(^TK("OS")):^("OS"),1:"")
B1 F I=I:1 S A=$T(TEXT+I) G:" ;"[A EXIT I $P(A," ;")?1A.E S T=$P(A," ;") W !,?5,$P(A,";",2),?50,$$^%QZCHW("Initialize? (Y or N) "),"Y" S A="Y" Q:"Nn"'[A
 W !,$$^%QZCHW("Initializing "),T
 S M=0,^TK(0,T,M)="",H="" F I=I+1:1 S A=$T(TEXT+I) G:A="" B2 S:$P(A," ;")?1A.E I=I-1 G:$P(A," ;")?1A.E B2 S C=$P(A,";",2,99) D B3
B2 S:H'="" ^(M)="S "_$E(H,2,255) Q:A=""  G B1
B3 I $P(C,"\")["*" S D=$P($P(C,"\"),"*",2),C=$P(C,"\",2,99) Q:D'[OS
 F J=1:2:$L(C,"\")-1 S D=$P(C,"\",J),E=$P(C,"\",J+1),X="X="_E,@(X),^TK(0,T,D)=X W "." S Y=",TK("""_D_""")="_E S:($L(H)+$L(Y))>240 ^(M)="S "_$E(H,2,255),M=M+1,H="" S H=H_Y
EXIT Q
 
TEXT 
MSMPC 
 ;
 ;
 ;
 ;
 ;

