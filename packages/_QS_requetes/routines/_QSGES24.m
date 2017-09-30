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

;%QSGES24^INT^1^59547,73881^0
%QSGES24 ;;02:41 PM  5 Jun 1992
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EGALIND(%U7,%CUK1,%CUK2) 
 N TEMP,PILIND,IND1,IND2,AT1,AT2,IPILI,ICOUR,VAL1,VAL2,VAL,OR1,OR2
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S PILIND=$$CONCAS^%QZCHAD(TEMP,"I")
 S IPILI=0,@PILIND@(0,"B")=%U7,@PILIND@(0,"I1")=%CUK1,@PILIND@(0,"I2")=%CUK2,ICOUR=""
BCLINDI S ICOUR=$O(@PILIND@(ICOUR)) G:ICOUR="" SUCCES
 S BASE=@PILIND@(ICOUR,"B"),IND1=@PILIND@(ICOUR,"I1"),IND2=@PILIND@(ICOUR,"I2"),(AT1,AT2)=""
BCLAT S AT1=$O(^[QUI]QUERYV(BASE,IND1,AT1)),AT2=$O(^[QUI]QUERYV(BASE,IND2,AT2))
BCLAT2 I AT1'="",$D(^[QUI]RQSLIEN(BASE,AT1)) S AT1=$O(^[QUI]QUERYV(BASE,IND1,AT1)) G BCLAT2
 I AT2'="",$D(^[QUI]RQSLIEN(BASE,AT2)) S AT2=$O(^[QUI]QUERYV(BASE,IND2,AT2)) G BCLAT2
 
 G:AT1'=AT2 ECHEC G:AT1="" BCLINDI G:AT1="NOM" BCLAT G:$D(^[QUI]RQSLIEN(BASE,AT1)) LIEN S (OR1,OR2)=""
BCLORD S OR1=$O(^[QUI]QUERYV(BASE,IND1,AT1,OR1)),OR2=$O(^[QUI]QUERYV(BASE,IND2,AT1,OR2)) G:OR1'=OR2 ECHEC G:OR1="" BCLAT
 S VAL1=^[QUI]QUERYV(BASE,IND1,AT1,OR1),VAL2=^[QUI]QUERYV(BASE,IND2,AT1,OR2) G:VAL1'=VAL2 ECHEC G BCLORD
 
 
LIEN G BCLAT
 
ECHEC K @(TEMP) Q 0
SUCCES K @(TEMP) Q 1

