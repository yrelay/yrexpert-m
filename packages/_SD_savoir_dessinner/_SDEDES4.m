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

;%SDEDES4^INT^1^59547,73888^0
SDEDES4 ;
 
 
 
 
 
ARC 
 I ((VAL(4)="")&(VAL(5)=""))&(VAL(13)="") S MERR=$$^%QZCHW("Le point central n'est pas defini") G AFFER
 I VAL(13)="" S COOR(1)="( "_VAL(4)_" ; "_VAL(5)_" )" G ARC1
 S OK=$$CREPT^%SDEDES5(VAL(4),VAL(5),VAL(13),1) Q:'(OK)
 S COOR(1)=VAL(13)
ARC1 I ((VAL(10)'="")&(VAL(11)'=""))&(VAL(12)'="") G ARCF2
 I VAL(14)="" S COOR(2)="( "_VAL(6)_" ; "_VAL(7)_" )" G ARC2
 S OK=$$CREPT^%SDEDES5(VAL(6),VAL(7),VAL(14),2) Q:'(OK)
 S COOR(2)=VAL(14)
ARC2 I VAL(15)="" S COOR(3)="( "_VAL(8)_" ; "_VAL(9)_" )" G ARC3
 S OK=$$CREPT^%SDEDES5(VAL(8),VAL(9),VAL(15),3) Q:'(OK)
 S COOR(3)=VAL(15)
ARC3 S TEXT=VAL(1)_" ; ARC ; "_VAL(2)_" ; "_VAL(3)_" ; 1 ; "_COOR(1)_" ; "_COOR(2)_" ; "_COOR(3)
 G ARC4
 
ARCF2 S TEXT=VAL(1)_" ; ARC ; "_VAL(2)_" ; "_VAL(3)_" ; 2 ; "_COOR(1)_" ; "_VAL(10)_" ; "_VAL(11)_" ; "_VAL(12)_" ; "_VAL(13)_" ; "_VAL(15)
 
ARC4 I VAL(16)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(16)
 G ANAL
 
 
CERCLE 
 I ((VAL(4)="")&(VAL(5)=""))&(VAL(9)="") S MERR=$$^%QZCHW("Le point central n'est pas defini") G AFFER
 I VAL(9)="" S COOR(1)="( "_VAL(4)_" ; "_VAL(5)_" )" G CERCL1
 S OK=$$CREPT^%SDEDES5(VAL(4),VAL(5),VAL(9),1) Q:'(OK)
 S COOR(1)=VAL(9)
CERCL1 I VAL(8)'="" G CERCLF2
 I VAL(10)="" S COOR(2)="( "_VAL(6)_" ; "_VAL(7)_" )" G CERCL2
 S OK=$$CREPT^%SDEDES5(VAL(6),VAL(7),VAL(10),2) Q:'(OK)
 S COOR(2)=VAL(10)
CERCL2 S TEXT=VAL(1)_" ; CERCLE ; "_VAL(2)_" ; "_VAL(3)_" ; 1 ; "_COOR(1)_" ; "_COOR(2)
 G CERCL3
 
CERCLF2 S TEXT=VAL(1)_" ; CERCLE ; "_VAL(2)_" ; "_VAL(3)_" ; 2 ; "_COOR(1)_" ; "_VAL(8)
 
CERCL3 I VAL(11)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(11)
 G ANAL
 
 
RECTAN 
 I ((VAL(4)="")&(VAL(5)=""))&(VAL(11)="") S MERR=$$^%QZCHW("Le point de depart n'est pas defini") G AFFER
 I VAL(11)="" S COOR(1)="( "_VAL(4)_" ; "_VAL(5)_" )" G RECTA1
 S OK=$$CREPT^%SDEDES5(VAL(4),VAL(5),VAL(11),1) Q:'(OK)
 S COOR(1)=VAL(11)
RECTA1 I (VAL(8)'="")&(VAL(9)'="") G RECTAF2
 I VAL(12)="" S COOR(2)="( "_VAL(6)_" ; "_VAL(7)_" )" G RECTA2
 S OK=$$CREPT^%SDEDES5(VAL(6),VAL(7),VAL(12),2) Q:'(OK)
 S COOR(2)=VAL(12)
RECTA2 S TEXT=VAL(1)_" ; RECTANGLE ; "_VAL(2)_" ; "_VAL(3)_" ; "_VAL(10)_" ; 1 ; "_COOR(1)_" ; "_COOR(2)
 G ANAL
 
RECTAF2 S TEXT=VAL(1)_" ; RECTANGLE ; "_VAL(2)_" ; "_VAL(3)_" ; "_VAL(10)_" ; 2 ; "_COOR(1)_" ; "_VAL(8)_" ; "_VAL(9)_$S(VAL(12)="":"",1:" ; "_VAL(12))
 G ANAL
 
 
ELLIPSE 
 I ((VAL(4)="")&(VAL(5)=""))&(VAL(13)="") S MERR=$$^%QZCHW("Le point sur l'axe n'est pas defini") G AFFER
 I VAL(13)="" S COOR(1)="( "_VAL(4)_" ; "_VAL(5)_" )" G ELLIP1
 S OK=$$CREPT^%SDEDES5(VAL(4),VAL(5),VAL(13),1) Q:'(OK)
 S COOR(1)=VAL(13)
ELLIP1 I ((VAL(10)'="")&(VAL(11)'=""))&(VAL(12)'="") G ELLIPF2
 I VAL(14)="" S COOR(2)="( "_VAL(6)_" ; "_VAL(7)_" )" G ELLIP2
 S OK=$$CREPT^%SDEDES5(VAL(6),VAL(7),VAL(14),2) Q:'(OK)
 S COOR(2)=VAL(14)
ELLIP2 I VAL(15)="" S COOR(3)="( "_VAL(8)_" ; "_VAL(9)_" )" G ELLIP3
 S OK=$$CREPT^%SDEDES5(VAL(8),VAL(9),VAL(15),3) Q:'(OK)
 S COOR(3)=VAL(15)
ELLIP3 S TEXT=VAL(1)_" ; ELLIPSE ; "_VAL(2)_" ; "_VAL(3)_" ; 1 ; "_COOR(1)_" ; "_COOR(2)_" ; "_COOR(3)
 G ELLIP4
 
ELLIPF2 S TEXT=VAL(1)_" ; ELLIPSE ; "_VAL(2)_" ; "_VAL(3)_" ; 2 ; "_COOR(1)_" ; "_VAL(10)_" ; "_VAL(11)_" ; "_VAL(12)_" ; "_VAL(14)_" ; "_VAL(15)
 
ELLIP4 I VAL(16)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(16)
 G ANAL
 
 
DEMIEL 
 I ((VAL(4)="")&(VAL(5)=""))&(VAL(13)="") S MERR=$$^%QZCHW("Le point sur l'axe n'est pas defini") G AFFER
 I VAL(13)="" S COOR(1)="( "_VAL(4)_" ; "_VAL(5)_" )" G DEMEL1
 S OK=$$CREPT^%SDEDES5(VAL(4),VAL(5),VAL(13),1) Q:'(OK)
 S COOR(1)=VAL(13)
DEMEL1 I ((VAL(10)'="")&(VAL(11)'=""))&(VAL(12)'="") G DEMELF2
 I VAL(14)="" S COOR(2)="( "_VAL(6)_" ; "_VAL(7)_" )" G DEMEL2
 S OK=$$CREPT^%SDEDES5(VAL(6),VAL(7),VAL(14),2) Q:'(OK)
 S COOR(2)=VAL(14)
DEMEL2 I VAL(15)="" S COOR(3)="( "_VAL(8)_" ; "_VAL(9)_" )" G DEMEL3
 S OK=$$CREPT^%SDEDES5(VAL(8),VAL(9),VAL(15),3) Q:'(OK)
 S COOR(3)=VAL(15)
DEMEL3 S TEXT=VAL(1)_" ; DEMIE.ELLIPSE ; "_VAL(2)_" ; "_VAL(3)_" ; 1 ; "_COOR(1)_" ; "_COOR(2)_" ; "_COOR(3)
 G DEMEL4
 
DEMELF2 S TEXT=VAL(1)_" ; DEMIE.ELLIPSE ; "_VAL(2)_" ; "_VAL(3)_" ; 2 ; "_COOR(1)_" ; "_VAL(10)_" ; "_VAL(11)_" ; "_VAL(12)_" ; "_VAL(14)_" ; "_VAL(15)
 
DEMEL4 I VAL(16)'="" S TEXT=TEXT_" ; ""CONDITION"" ; "_VAL(16)
 G ANAL
 
 
ANAL 
 N NBL
 D ALLEG^%SDEDES5
 I $$CONF^%SDEDES5(TEXT,.NBL)=0 S OK=0 G FANAL
 S OK=$$LIGNE^%SDEANT1(TEXT,1,22-NBL,ANCNOM,1,0,.NOM,.TEXT,.MERR)
FANAL D RESTOR^%SDEDES5
 Q
 
AFFER 
 D ERR^%PKSAISI(MERR,0)
 S OK=0
 Q

