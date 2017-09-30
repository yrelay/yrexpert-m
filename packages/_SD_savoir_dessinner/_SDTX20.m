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

;%SDTX20^INT^1^59547,73890^0
SDTX20 ;;04:03 PM  7 Nov 1991
 ;;^[QUI]SDSYMBT("o",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 4 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("p",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("p",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("p",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("p",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("p",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("p",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("p",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 4 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("p",11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 6 ; -14 )
 ;;^[QUI]SDSYMBT("q",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("q",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("q",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("q",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("q",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("q",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("q",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("q",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 13 ) ; ( 21 ; -14 )
 ;;^[QUI]SDSYMBT("r",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; -0 ) ; ( 6 ; 13 )
 ;;^[QUI]SDSYMBT("r",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 10 ; 13 )
 ;;^[QUI]SDSYMBT("r",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("r",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; 13 ) ; ( 21 ; 9 )
 ;;^[QUI]SDSYMBT("s",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 11 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT("s",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 13 ) ; ( 8 ; 13 )
 ;;^[QUI]SDSYMBT("s",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 13 ) ; ( 6 ; 11 )
 ;;^[QUI]SDSYMBT("s",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 11 ) ; ( 6 ; 9 )
 ;;^[QUI]SDSYMBT("s",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 9 ) ; ( 8 ; 8 )
 ;;^[QUI]SDSYMBT("s",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 8 ) ; ( 19 ; 8 )
 ;;^[QUI]SDSYMBT("s",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 8 ) ; ( 21 ; 6 )
 ;;^[QUI]SDSYMBT("s",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 6 ) ; ( 21 ; 2 )
 ;;^[QUI]SDSYMBT("s",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 2 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT("s",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; -0 ) ; ( 8 ; -0 )
 ;;^[QUI]SDSYMBT("s",11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 6 ; 2 )
 ;;^[QUI]SDSYMBT("t",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 27 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("t",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("t",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("t",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("t",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 17 ; 13 )
 ;;^[QUI]SDSYMBT("u",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("u",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("u",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("u",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("u",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 13 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("v",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 14 ; -0 )
 ;;^[QUI]SDSYMBT("v",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; -0 ) ; ( 21 ; 13 )
 ;;^[QUI]SDSYMBT("w",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("w",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("w",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("w",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("w",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 36 ; 13 ) ; ( 36 ; 4 )
 ;;^[QUI]SDSYMBT("w",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 36 ; 4 ) ; ( 33 ; -0 )
 ;;^[QUI]SDSYMBT("w",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 33 ; -0 ) ; ( 25 ; -0 )
 ;;^[QUI]SDSYMBT("w",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 25 ; -0 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("w",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 11 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("x            ",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("x            ",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 13 ) ; ( 6 ; -0 )
 ;;^[QUI]SDSYMBT("y",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 6 ; 4 )
 ;;^[QUI]SDSYMBT("y",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("y",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 17 ; -0 )
 ;;^[QUI]SDSYMBT("y",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -0 ) ; ( 21 ; 4 )
 ;;^[QUI]SDSYMBT("y",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 13 ) ; ( 21 ; -10 )
 ;;^[QUI]SDSYMBT("y",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; -10 ) ; ( 17 ; -14 )
 ;;^[QUI]SDSYMBT("y",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 17 ; -14 ) ; ( 10 ; -14 )
 ;;^[QUI]SDSYMBT("y",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -14 ) ; ( 6 ; -10 )
 ;;^[QUI]SDSYMBT("z",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 13 ) ; ( 21 ; 13 )
 ;;^[QUI]SDSYMBT("z",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 13 ) ; ( 6 ; -0 )
 ;;^[QUI]SDSYMBT("z",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; -0 ) ; ( 21 ; -0 )

