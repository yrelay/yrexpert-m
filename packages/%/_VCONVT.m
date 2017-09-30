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
;! Nomprog     : %VCONVT                                                      !
;! Module      : VIDEO                                                        !
;! But         : Convertion des touches GT.M en DTM                           !
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

%VCONVT(X) ;
 
 ; %INCCLAV : détail des correspondances
 
 S:'$D(X) T=$C(27)
 S T=$E($ZB,2,999),%=X
 
 I T=$C(91,68) S %=14 ; left
 I T=$C(91,67) S %=18 ; right
 I T=$C(91,65) S %=1  ; up
 I T=$C(91,66) S %=11 ; down
 I T=$C(79,80) s %=21 ; F1
 I T=$C(79,81) s %=22 ; F2
 I T=$C(79,82) s %=23 ; F3
 I T=$C(79,83) s %=24 ; F4
 I T=$C(79,84) s %=25 ; F5
 I T=$C(91,49,55,126) s %=26 ; F6
 I T=$C(91,49,56,126) s %=28 ; F7
 I T=$C(91,49,57,126) s %=29 ; F8
 I T=$C(91,50,48,126) s %=30 ; F9
 I T=$C(91,50,49,126) s %=31 ; F10
 I T=$C(91,50,51,126) s %=94 ; S-F1
 I T=$C(91,50,52,126) s %=95 ; S-F2
 I T=$C(91,50,53,126) s %=96 ; S-F3
 I T=$C(91,50,54,126) s %=97 ; S-F4
 I T=$C(91,50,56,126) s %=98 ; S-F5
 I T=$C(91,50,57,126) s %=99 ; S-F6
 I T=$C(91,51,49,126) s %=100 ; S-F7
 I T=$C(91,51,50,126) s %=101 ; S-F8
 I T=$C(91,51,51,126) s %=102 ; S-F9
 I T=$C(91,51,52,126) s %=103 ; S-F10
 I T=$C(91,50,126) S %=82  ; INSERT
 I T=$C(91,51,126) S %=127 ; DELETE
 I T=$C(91,49,126) S %=71  ; HOME
 I T=$C(91,52,126) S %=4   ; END
 I T=$C(91,53,126) S %=5   ; PAGUP
 I T=$C(91,54,126) S %=12  ; PAGDN
 
 ;I %=27 S %=1 ;; ESC
 ;I %=-6 S %=1 ;; Ctrl-F
 
 Q %
 
TEST
 N X,FLECHE
 U $P:ESCAPE
 R "[RETURN] pour arrêter, votre choix: ",*X
 S T=$E($ZB,1,999)
 W !,$A(T,1)_" / "_$A(T,2)_" / "_$A(T,3)_" / "_$A(T,4)
 W !,$A(X,1)_" / "_$A(X,2)_" / "_$A(X,3)_" / "_$A(X,4)
 W !,X
 W !,"$$CODFLEC^%INCCLAV(X,.FLECHE)",$$CODFLEC^%INCCLAV(X,.FLECHE)
 W !,"FLECHE",FLECHE,!
 G:$A(T,1)'=13 TEST
 Q
 
 

