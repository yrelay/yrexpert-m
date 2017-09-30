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

;%SDTX18^INT^1^59547,73889^0
SDTX18 ;;
 ;;^[QUI]SDSYMBT("M",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 13 ) ; ( 27 ; 26 )
 ;;^[QUI]SDSYMBT("N",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("N",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 26 ) ; ( 27 ; -0 )
 ;;^[QUI]SDSYMBT("N",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 27 ; -0 )
 ;;^[QUI]SDSYMBT("O",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 8 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT("O",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT("O",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 27 ; 8 )
 ;;^[QUI]SDSYMBT("O",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 8 ) ; ( 27 ; 19 )
 ;;^[QUI]SDSYMBT("O",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 19 ) ; ( 19 ; 27 )
 ;;^[QUI]SDSYMBT("O",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 27 ) ; ( 8 ; 27 )
 ;;^[QUI]SDSYMBT("O",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 19 ) ; ( 0 ; 8 )
 ;;^[QUI]SDSYMBT("O",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 26 ) ; ( 0 ; 19 )
 ;;^[QUI]SDSYMBT("P",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 27 )
 ;;^[QUI]SDSYMBT("P",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 27 ) ; ( 23 ; 27 )
 ;;^[QUI]SDSYMBT("P",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 27 ) ; ( 27 ; 23 )
 ;;^[QUI]SDSYMBT("P",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 23 ) ; ( 27 ; 17 )
 ;;^[QUI]SDSYMBT("P",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 17 ) ; ( 23 ; 13 )
 ;;^[QUI]SDSYMBT("P",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 13 ) ; ( 0 ; 13 )
 ;;^[QUI]SDSYMBT("PLUS.MOINS",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 8 ) ; ( 19 ; 8 )
 ;;^[QUI]SDSYMBT("PLUS.MOINS",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 15 ) ; ( 19 ; 15 )
 ;;^[QUI]SDSYMBT("PLUS.MOINS",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 21 ) ; ( 14 ; 9 )
 ;;^[QUI]SDSYMBT("Q",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 8 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT("Q",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT("Q",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 27 ; 8 )
 ;;^[QUI]SDSYMBT("Q",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 8 ) ; ( 27 ; 19 )
 ;;^[QUI]SDSYMBT("Q",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 19 ) ; ( 19 ; 27 )
 ;;^[QUI]SDSYMBT("Q",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 27 ) ; ( 8 ; 27 )
 ;;^[QUI]SDSYMBT("Q",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 19 ) ; ( 0 ; 8 )
 ;;^[QUI]SDSYMBT("Q",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 26 ) ; ( 0 ; 19 )
 ;;^[QUI]SDSYMBT("Q",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; -0 ) ; ( 19 ; 8 )
 ;;^[QUI]SDSYMBT("R",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 27 )
 ;;^[QUI]SDSYMBT("R",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 27 ) ; ( 23 ; 27 )
 ;;^[QUI]SDSYMBT("R",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 27 ) ; ( 27 ; 23 )
 ;;^[QUI]SDSYMBT("R",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 23 ) ; ( 27 ; 17 )
 ;;^[QUI]SDSYMBT("R",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 17 ) ; ( 23 ; 13 )
 ;;^[QUI]SDSYMBT("R",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 13 ) ; ( 0 ; 13 )
 ;;^[QUI]SDSYMBT("R",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 13 ) ; ( 27 ; 9 )
 ;;^[QUI]SDSYMBT("R",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 9 ) ; ( 27 ; -0 )
 ;;^[QUI]SDSYMBT("S",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 4 ) ; ( 4 ; -0 )
 ;;^[QUI]SDSYMBT("S",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; -0 ) ; ( 23 ; -0 )
 ;;^[QUI]SDSYMBT("S",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; -0 ) ; ( 27 ; 4 )
 ;;^[QUI]SDSYMBT("S",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 4 ) ; ( 27 ; 9 )
 ;;^[QUI]SDSYMBT("S",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 9 ) ; ( 23 ; 13 )
 ;;^[QUI]SDSYMBT("S",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 13 ) ; ( 4 ; 13 )
 ;;^[QUI]SDSYMBT("S",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 13 ) ; ( 0 ; 17 )
 ;;^[QUI]SDSYMBT("S",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 17 ) ; ( 0 ; 23 )
 ;;^[QUI]SDSYMBT("S",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 23 ) ; ( 4 ; 27 )
 ;;^[QUI]SDSYMBT("S",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 27 ) ; ( 23 ; 27 )
 ;;^[QUI]SDSYMBT("S",11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 27 ) ; ( 27 ; 23 )
 ;;^[QUI]SDSYMBT("SIGMA",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 53 ) ; ( 54 ; 53 )
 ;;^[QUI]SDSYMBT("SIGMA",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 54 ; -0 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("SIGMA",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -1 ) ; ( 27 ; 26 )
 ;;^[QUI]SDSYMBT("SIGMA",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 26 ) ; ( 0 ; 53 )
 ;;^[QUI]SDSYMBT("SIGMA",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 54 ; 53 ) ; ( 54 ; 45 )
 ;;^[QUI]SDSYMBT("SIGMA",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 54 ; -1 ) ; ( 54 ; 7 )
 ;;^[QUI]SDSYMBT("T",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 27 ; 26 )
 ;;^[QUI]SDSYMBT("T",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 26 ) ; ( 14 ; -1 )
 ;;^[QUI]SDSYMBT("U",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 27 ) ; ( 0 ; 8 )
 ;;^[QUI]SDSYMBT("U",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 8 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT("U",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT("U",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 27 ; 8 )
 ;;^[QUI]SDSYMBT("U",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 8 ) ; ( 27 ; 27 )
 ;;^[QUI]SDSYMBT("V",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 14 ; -0 )
 ;;^[QUI]SDSYMBT("V",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 26 ) ; ( 14 ; -0 )
 ;;^[QUI]SDSYMBT("W",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("W",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 14 ; 13 )
 ;;^[QUI]SDSYMBT("W",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 13 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("W",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 27 ; 26 )
 ;;^[QUI]SDSYMBT("X",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 26 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("X",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 27 ; -0 )
 ;;^[QUI]SDSYMBT("Y",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 14 ; 13 )
 ;;^[QUI]SDSYMBT("Y",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 26 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("Z",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 27 ; 26 )
 ;;^[QUI]SDSYMBT("Z",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; -0 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("Z",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 26 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("a",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("a",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 21 ; 11 )
 ;;^[QUI]SDSYMBT("a",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 11 ) ; ( 21 ; 2 )
 ;;^[QUI]SDSYMBT("a",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 2 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT("a",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT("a",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 6 ; 2 )

