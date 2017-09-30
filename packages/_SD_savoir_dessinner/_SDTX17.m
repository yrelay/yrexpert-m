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

;%SDTX17^INT^1^59547,73889^0
SDTX17 ;;07:13 PM  4 Dec 1991
 ;;^[QUI]SDSYMBT(")",1)=1 ; ARC ; 1 ; "NORMAL" ; 1 ; ( 14 ; -0 ) ; ( 14 ; 27 ) ; ( 6 ; 13 )
 ;;^[QUI]SDSYMBT(".",1)=1 ; CERCLE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 0 ) ; ( 1 ; 0 )
 ;;^[QUI]SDSYMBT("*",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 8 ) ; ( 14 ; 19 )
 ;;^[QUI]SDSYMBT("*",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 8 ) ; ( 19 ; 19 )
 ;;^[QUI]SDSYMBT("*",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 8 ) ; ( 8 ; 19 )
 ;;^[QUI]SDSYMBT("+",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 13 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT("+",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 8 ) ; ( 14 ; 19 )
 ;;^[QUI]SDSYMBT("-",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 13 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT("/",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; 27 )
 ;;^[QUI]SDSYMBT("=",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 15 ) ; ( 19 ; 15 )
 ;;^[QUI]SDSYMBT("=",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 9 ) ; ( 8 ; 9 )
 ;;^[QUI]SDSYMBT("A",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 14 ; 26 )
 ;;^[QUI]SDSYMBT("A",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 26 ) ; ( 27 ; -0 )
 ;;^[QUI]SDSYMBT("A",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 7 ; 13 ) ; ( 20 ; 13 )
 ;;^[QUI]SDSYMBT("B",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("B",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 27 ) ; ( 14 ; 27 )
 ;;^[QUI]SDSYMBT("B",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 27 ) ; ( 19 ; 23 )
 ;;^[QUI]SDSYMBT("B",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 23 ) ; ( 19 ; 17 )
 ;;^[QUI]SDSYMBT("B",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 19 ; 17 ) ; ( 14 ; 13 )
 ;;^[QUI]SDSYMBT("B",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 13 ) ; ( 21 ; 13 )
 ;;^[QUI]SDSYMBT("B",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 13 ) ; ( 27 ; 9 )
 ;;^[QUI]SDSYMBT("B",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 9 ) ; ( 27 ; 4 )
 ;;^[QUI]SDSYMBT("B",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 4 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("B",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; -0 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("C",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 23 ) ; ( 21 ; 27 )
 ;;^[QUI]SDSYMBT("C",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; 27 ) ; ( 6 ; 27 )
 ;;^[QUI]SDSYMBT("C",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 27 ) ; ( 0 ; 21 )
 ;;^[QUI]SDSYMBT("C",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 21 ) ; ( 0 ; 6 )
 ;;^[QUI]SDSYMBT("C",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 6 ) ; ( 6 ; -0 )
 ;;^[QUI]SDSYMBT("C",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; -0 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("C",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; -0 ) ; ( 27 ; 4 )
 ;;^[QUI]SDSYMBT("CADRE",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 27 )
 ;;^[QUI]SDSYMBT("CADRE",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 27 ) ; ( 27 ; 27 )
 ;;^[QUI]SDSYMBT("CADRE",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 27 ) ; ( 27 ; -0 )
 ;;^[QUI]SDSYMBT("CADRE",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; -0 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("D",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("D",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 27 ) ; ( 14 ; 27 )
 ;;^[QUI]SDSYMBT("D",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 27 ) ; ( 23 ; 23 )
 ;;^[QUI]SDSYMBT("D",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 23 ) ; ( 27 ; 17 )
 ;;^[QUI]SDSYMBT("D",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 17 ) ; ( 27 ; 9 )
 ;;^[QUI]SDSYMBT("D",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 9 ) ; ( 23 ; 4 )
 ;;^[QUI]SDSYMBT("D",11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 23 ; 4 ) ; ( 14 ; -0 )
 ;;^[QUI]SDSYMBT("D",12)=12 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; -0 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("DEGRE",5)=5 ; CERCLE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 23 ) ; ( 4 ; 25 )
 ;;^[QUI]SDSYMBT("DIAMETRE",5)=5 ; CERCLE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 13 ) ; ( 19 ; 13 )
 ;;^[QUI]SDSYMBT("DIAMETRE",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; 4 ) ; ( 23 ; 23 )
 ;;^[QUI]SDSYMBT("E",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("E",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 27 ; 26 )
 ;;^[QUI]SDSYMBT("E",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; -0 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("E",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 13 ) ; ( 14 ; 13 )
 ;;^[QUI]SDSYMBT("F",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("F",2)=2 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 27 ; 26 )
 ;;^[QUI]SDSYMBT("F",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 13 ) ; ( 14 ; 13 )
 ;;^[QUI]SDSYMBT("G",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 13 ) ; ( 14 ; 13 )
 ;;^[QUI]SDSYMBT("G",8)=8 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 13 ) ; ( 27 ; 6 )
 ;;^[QUI]SDSYMBT("G",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 6 ) ; ( 21 ; -0 )
 ;;^[QUI]SDSYMBT("G",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 21 ; -0 ) ; ( 6 ; -0 )
 ;;^[QUI]SDSYMBT("G",11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; -0 ) ; ( 0 ; 6 )
 ;;^[QUI]SDSYMBT("G",12)=12 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 6 ) ; ( 0 ; 21 )
 ;;^[QUI]SDSYMBT("G",13)=13 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 21 ) ; ( 6 ; 27 )
 ;;^[QUI]SDSYMBT("G",14)=14 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 27 ) ; ( 27 ; 27 )
 ;;^[QUI]SDSYMBT("H",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("H",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 26 ) ; ( 27 ; -0 )
 ;;^[QUI]SDSYMBT("H",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 13 ) ; ( 27 ; 13 )
 ;;^[QUI]SDSYMBT("I",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 26 ) ; ( 14 ; -0 )
 ;;^[QUI]SDSYMBT("I",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; -0 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT("I",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 26 ) ; ( 19 ; 26 )
 ;;^[QUI]SDSYMBT("J",7)=7 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 8 ; 26 ) ; ( 19 ; 26 )
 ;;^[QUI]SDSYMBT("J",9)=9 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 5 ) ; ( 14 ; 26 )
 ;;^[QUI]SDSYMBT("J",10)=10 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 6 ) ; ( 14 ; 4 )
 ;;^[QUI]SDSYMBT("J",11)=11 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 14 ; 4 ) ; ( 10 ; -0 )
 ;;^[QUI]SDSYMBT("J",12)=12 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 10 ; -0 ) ; ( 4 ; -0 )
 ;;^[QUI]SDSYMBT("J",13)=13 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 4 ; -0 ) ; ( 0 ; 4 )
 ;;^[QUI]SDSYMBT("J",14)=14 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 4 ) ; ( 0 ; 6 )
 ;;^[QUI]SDSYMBT("K",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("K",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 13 ) ; ( 19 ; 26 )
 ;;^[QUI]SDSYMBT("K",6)=6 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 6 ; 17 ) ; ( 19 ; -0 )
 ;;^[QUI]SDSYMBT("L",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("L",4)=4 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; -0 ) ; ( 0 ; -0 )
 ;;^[QUI]SDSYMBT("M",1)=1 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; -0 ) ; ( 0 ; 26 )
 ;;^[QUI]SDSYMBT("M",3)=3 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 27 ; 26 ) ; ( 27 ; -0 )
 ;;^[QUI]SDSYMBT("M",5)=5 ; DROITE ; 1 ; "NORMAL" ; 1 ; ( 0 ; 26 ) ; ( 14 ; 13 )

