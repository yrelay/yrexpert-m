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

;%SDTX19^INT^1^59547,73889^0
SDTX19 ;;
 ;;^[QUI]SDSYMBT("a",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 2 ) ; ( 6 ; 6 )
 ;;^[QUI]SDSYMBT("a",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 6 ) ; ( 8 ; 8 )
 ;;^[QUI]SDSYMBT("a",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 8 ) ; ( 21 ; 8 )
 ;;^[QUI]SDSYMBT("b",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 27 ) ; ( 6 ; -0 )
 ;;^[QUI]SDSYMBT("b",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("b",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("b",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 9 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("b",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 4 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("b",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 6 ; -0 )
 ;;^[QUI]SDSYMBT("c",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 11 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("c",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("c",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 13 ) ; ( 6 ; 9 )
 ;;^[QUI]SDSYMBT("c",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("c",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("c",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("c",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 21 ; 2 )
 ;;^[QUI]SDSYMBT("d",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 27 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("d",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; -0 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("d",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("d",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 6 ; 9 )
 ;;^[QUI]SDSYMBT("d",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("d",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 13 ) ; ( 21 ; 13 )
 ;;^[QUI]SDSYMBT("e",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; -0 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT("e",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 6 ; 2 )
 ;;^[QUI]SDSYMBT("e",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 2 ) ; ( 6 ; 13 )
 ;;^[QUI]SDSYMBT("e",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT("e",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 13 ) ; ( 21 ; 11 )
 ;;^[QUI]SDSYMBT("e",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 11 ) ; ( 21 ; 6 )
 ;;^[QUI]SDSYMBT("e",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 6 ) ; ( 19 ; 4 )
 ;;^[QUI]SDSYMBT("e",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 4 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("f",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; -0 ) ; ( 6 ; 25 )
 ;;^[QUI]SDSYMBT("f",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 25 ) ; ( 8 ; 27 )
 ;;^[QUI]SDSYMBT("f",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 27 ) ; ( 15 ; 27 )
 ;;^[QUI]SDSYMBT("f",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 2 ; 13 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("g",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; -0 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("g",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("g",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 6 ; 9 )
 ;;^[QUI]SDSYMBT("g",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("g",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 13 ) ; ( 21 ; 13 )
 ;;^[QUI]SDSYMBT("g",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 13 ) ; ( 21 ; -14 )
 ;;^[QUI]SDSYMBT("g",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; -14 ) ; ( 8 ; -14 )
 ;;^[QUI]SDSYMBT("g",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -14 ) ; ( 6 ; -12 )
 ;;^[QUI]SDSYMBT("h",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 27 ) ; ( 6 ; -0 )
 ;;^[QUI]SDSYMBT("h",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("h",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("h",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 9 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("i",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 13 ) ; ( 14 ; -0 )
 ;;^[QUI]SDSYMBT("i",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 12 ; -0 ) ; ( 15 ; -0 )
 ;;^[QUI]SDSYMBT("i",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 15 ; 13 ) ; ( 12 ; 13 )
 ;;^[QUI]SDSYMBT("j",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 13 ) ; ( 14 ; -10 )
 ;;^[QUI]SDSYMBT("j",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; -10 ) ; ( 12 ; -14 )
 ;;^[QUI]SDSYMBT("j",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 12 ; -14 ) ; ( 8 ; -14 )
 ;;^[QUI]SDSYMBT("j",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -14 ) ; ( 6 ; -10 )
 ;;^[QUI]SDSYMBT("j",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 12 ; 13 ) ; ( 15 ; 13 )
 ;;^[QUI]SDSYMBT("k",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; -0 ) ; ( 6 ; 27 )
 ;;^[QUI]SDSYMBT("k",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 15 ; 27 ) ; ( 6 ; 13 )
 ;;^[QUI]SDSYMBT("k",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 15 ; -0 )
 ;;^[QUI]SDSYMBT("l",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; -0 ) ; ( 14 ; 27 )
 ;;^[QUI]SDSYMBT("l",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 12 ; -0 ) ; ( 15 ; -0 )
 ;;^[QUI]SDSYMBT("l",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 27 ) ; ( 12 ; 27 )
 ;;^[QUI]SDSYMBT("m",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; -0 ) ; ( 6 ; 11 )
 ;;^[QUI]SDSYMBT("m",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 11 ) ; ( 8 ; 13 )
 ;;^[QUI]SDSYMBT("m",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 13 ) ; ( 12 ; 13 )
 ;;^[QUI]SDSYMBT("m",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 11 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("m",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 11 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT("m",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 13 ) ; ( 15 ; 13 )
 ;;^[QUI]SDSYMBT("m",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 15 ; 13 ) ; ( 14 ; 11 )
 ;;^[QUI]SDSYMBT("m",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 11 ) ; ( 12 ; 13 )
 ;;^[QUI]SDSYMBT("m",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 11 ) ; ( 14 ; 4 )
 ;;^[QUI]SDSYMBT("n",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; -0 ) ; ( 6 ; 13 )
 ;;^[QUI]SDSYMBT("n",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("n",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("n",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("n",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 9 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("o",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("o",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("o",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("o",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("o",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("o",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("o",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 21 ; 4 )

