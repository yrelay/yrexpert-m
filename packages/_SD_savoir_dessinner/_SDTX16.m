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

;%SDTX16^INT^1^59547,73889^0
SDTX16 ;;
 ;;^[QUI]SDSYMBT(0,1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT(0,2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 23 ; 13 )
 ;;^[QUI]SDSYMBT(0,3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 13 ) ; ( 19 ; 27 )
 ;;^[QUI]SDSYMBT(0,4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 27 ) ; ( 8 ; 27 )
 ;;^[QUI]SDSYMBT(0,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 27 ) ; ( 4 ; 13 )
 ;;^[QUI]SDSYMBT(0,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 13 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT(1,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; -0 ) ; ( 14 ; 26 )
 ;;^[QUI]SDSYMBT(1,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 26 ) ; ( 6 ; 15 )
 ;;^[QUI]SDSYMBT(2,1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; -0 ) ; ( 4 ; -0 )
 ;;^[QUI]SDSYMBT(2,2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; -0 ) ; ( 4 ; 4 )
 ;;^[QUI]SDSYMBT(2,3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 4 ) ; ( 23 ; 13 )
 ;;^[QUI]SDSYMBT(2,4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 13 ) ; ( 23 ; 19 )
 ;;^[QUI]SDSYMBT(2,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 19 ) ; ( 17 ; 26 )
 ;;^[QUI]SDSYMBT(2,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 26 ) ; ( 10 ; 26 )
 ;;^[QUI]SDSYMBT(2,7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 26 ) ; ( 4 ; 19 )
 ;;^[QUI]SDSYMBT(3,1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 2 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT(3,2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT(3,3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 23 ; 4 )
 ;;^[QUI]SDSYMBT(3,4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 4 ) ; ( 23 ; 9 )
 ;;^[QUI]SDSYMBT(3,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 9 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT(3,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 13 ) ; ( 23 ; 17 )
 ;;^[QUI]SDSYMBT(3,7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 17 ) ; ( 23 ; 23 )
 ;;^[QUI]SDSYMBT(3,8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 23 ) ; ( 19 ; 27 )
 ;;^[QUI]SDSYMBT(3,9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 27 ) ; ( 8 ; 27 )
 ;;^[QUI]SDSYMBT(3,10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 27 ) ; ( 4 ; 25 )
 ;;^[QUI]SDSYMBT(4,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; -0 ) ; ( 14 ; 27 )
 ;;^[QUI]SDSYMBT(4,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 27 ) ; ( 4 ; 13 )
 ;;^[QUI]SDSYMBT(4,7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 13 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT(5,1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 27 ) ; ( 4 ; 27 )
 ;;^[QUI]SDSYMBT(5,2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 27 ) ; ( 4 ; 13 )
 ;;^[QUI]SDSYMBT(5,3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 13 ) ; ( 8 ; 17 )
 ;;^[QUI]SDSYMBT(5,4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 17 ) ; ( 19 ; 17 )
 ;;^[QUI]SDSYMBT(5,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 17 ) ; ( 23 ; 13 )
 ;;^[QUI]SDSYMBT(5,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 13 ) ; ( 23 ; 4 )
 ;;^[QUI]SDSYMBT(5,7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 4 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT(5,8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT(5,9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 4 ; 4 )
 ;;^[QUI]SDSYMBT(6,1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 25 ) ; ( 19 ; 27 )
 ;;^[QUI]SDSYMBT(6,2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 27 ) ; ( 8 ; 27 )
 ;;^[QUI]SDSYMBT(6,3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 27 ) ; ( 4 ; 23 )
 ;;^[QUI]SDSYMBT(6,4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 23 ) ; ( 4 ; 4 )
 ;;^[QUI]SDSYMBT(6,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 4 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT(6,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT(6,7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 23 ; 4 )
 ;;^[QUI]SDSYMBT(6,8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 4 ) ; ( 23 ; 9 )
 ;;^[QUI]SDSYMBT(6,9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 9 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT(6,10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 13 ) ; ( 8 ; 13 )
 ;;^[QUI]SDSYMBT(6,11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 13 ) ; ( 4 ; 9 )
 ;;^[QUI]SDSYMBT(7,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 27 ) ; ( 23 ; 27 )
 ;;^[QUI]SDSYMBT(7,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 27 ) ; ( 4 ; -0 )
 ;;^[QUI]SDSYMBT(8,1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT(8,2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 13 ) ; ( 8 ; 13 )
 ;;^[QUI]SDSYMBT(8,3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 27 ) ; ( 19 ; 27 )
 ;;^[QUI]SDSYMBT(8,4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 27 ) ; ( 23 ; 23 )
 ;;^[QUI]SDSYMBT(8,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 23 ) ; ( 23 ; 17 )
 ;;^[QUI]SDSYMBT(8,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 17 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT(8,7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 13 ) ; ( 23 ; 9 )
 ;;^[QUI]SDSYMBT(8,8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 9 ) ; ( 23 ; 4 )
 ;;^[QUI]SDSYMBT(8,9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 4 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT(8,10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 4 ; 4 )
 ;;^[QUI]SDSYMBT(8,11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 4 ) ; ( 4 ; 9 )
 ;;^[QUI]SDSYMBT(8,12)=12 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 9 ) ; ( 8 ; 13 )
 ;;^[QUI]SDSYMBT(8,13)=13 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 13 ) ; ( 4 ; 17 )
 ;;^[QUI]SDSYMBT(8,14)=14 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 17 ) ; ( 4 ; 23 )
 ;;^[QUI]SDSYMBT(8,15)=15 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 23 ) ; ( 8 ; 27 )
 ;;^[QUI]SDSYMBT(9,1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 2 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT(9,2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT(9,3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 23 ; 4 )
 ;;^[QUI]SDSYMBT(9,4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 4 ) ; ( 23 ; 23 )
 ;;^[QUI]SDSYMBT(9,5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 23 ) ; ( 19 ; 26 )
 ;;^[QUI]SDSYMBT(9,6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 26 ) ; ( 8 ; 26 )
 ;;^[QUI]SDSYMBT(9,7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 26 ) ; ( 4 ; 23 )
 ;;^[QUI]SDSYMBT(9,8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 23 ) ; ( 4 ; 17 )
 ;;^[QUI]SDSYMBT(9,9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 17 ) ; ( 8 ; 13 )
 ;;^[QUI]SDSYMBT(9,10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 13 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT(9,11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 13 ) ; ( 23 ; 17 )
 ;;^[QUI]SDSYMBT("%",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; 27 )
 ;;^[QUI]SDSYMBT("%",2)=2 ; CERCLE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 23 ) ; ( 6 ; 23 )
 ;;^[QUI]SDSYMBT("%",3)=3 ; CERCLE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 4 ) ; ( 14 ; 4 )
 ;;^[QUI]SDSYMBT("'",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 26 ) ; ( 10 ; 19 )
 ;;^[QUI]SDSYMBT("(",1)=1 ; ARC ; 1 ; "NORMAL" ; 1 ; ( 14 ; 27 ) ; ( 14 ; -0 ) ; ( 21 ; 13 )

