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
;! Nomprog     : %VACTLIM                                                     !
;! Module      : Vidéo                                                        !
;! But         : Limiter l'utilisation dans le temps.                         !
;!                                                                            !
;! Description : Fonction déconnectée.                                        !
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
;! HL002 ! HL     ! 00/00/00 ! Fonction déconnectée.                          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VACTLIM^INT^1^59550,54574^0
%VACTLIM ;;06:32 PM  2 Jan 1996
 
 
 Q  ;HL002
 N DATLIMU,DATDATA,DATJOUR,DATJM
 I ($D(^TD)#10)'=1 G ECHEC
 S DATLIMU=$$02^%QMDATE1($$EXTRAIRE(^TD))
 S DATJM=$P($H,","),DATJOUR=$$02^%QMDATE1(DATJM)
 I DATLIMU<DATJOUR G ECHEC
 S DATDATA=$S(($D(^[QUI]QUERY2("%"))#10)=1:$$02^%QMDATE1($$EXTRAIRE(^[QUI]QUERY2("%"))),1:DATJOUR)
 I DATDATA>DATJOUR G ECHEC
 S ^[QUI]QUERY2("%")=$$CODER(DATJM)
 Q
ECHEC H
 
CODER(JOUR) 
 Q $C(27)_$C(91)_$C(50)_$C(74)_$C(27)_"[1v"_JOUR_$C(27)_"[0v"_$C(27)_$C(91)_$C(50)_$C(74)
EXTRAIRE(CHCODE) 
 Q $P($P(CHCODE,"[1v",2),$C(27))
 
 
A7 N AJ S AJ=30 G AJECH
B3 N AJ S AJ=60 G AJECH
C5 N AJ S AJ=90 G AJECH
D2 N AJ S AJ=180 G AJECH
E6 N AJ S AJ=360 G AJECH
AJECH N PWD
 W !,"MOT DE PASSE ?",! R PWD I PWD'=$$MDP H
 S ^TD=$$CODER($$DH1^%QMDATE($P($$ADDAT^%QMDATE($$DATEX^%QMDATE($H),"12H00",(AJ*24)_"H00"),",")))
 Q
UNLIM N PWD
 W !,"MOT DE PASSE ?",! R PWD I PWD'=$$MDP H
 S ^TD=$$CODER(58073)
 Q
 
QR2 W !,"MOT DE PASSE ?",! R PWD I PWD'=$$MDP Q
 S ^[QUI]QUERY2("%")=$$CODER($P($H,",")) Q
 
MDP() N XX S XX=$P($H,",") Q (XX*XX)+1234567

