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

;LKEXTNSC^INT^1^59547,74867^0
LKLONSC W *
 
 
 
 
 
EXNSC ;;|0,0,DESTINATION,"D"|19
 ;;|0,0,DESTINATION,"F"|21
 ;;|0,0,ORIGINE.EXPEDITION,"D"|22
 ;;|0,0,ORIGINE.EXPEDITION,"F"|24
 ;;|0,0,POIDS.EXPEDIE,"D"|25
 ;;|0,0,POIDS.EXPEDIE,"F"|31,NUM
 ;;|0,0,QUANTITE.EXPEDIEE,"D"|32
 ;;|0,0,QUANTITE.EXPEDIEE,"F"|36,NUM
 ;;|0,0,STATUT.DE.LIVRAISON,"D"|45
 ;;|0,0,STATUT.DE.LIVRAISON,"F"|45
 ;;|0,0,NUMERO.ACOMPTE,"D"|46
 ;;|0,0,NUMERO.ACOMPTE,"F"|47
 ;;|0,0,MODE.EXPEDITION,"D"|48
 ;;|0,0,MODE.EXPEDITION,"F"|51
 ;;|0,0,ATELIER,"D"|53
 ;;|0,0,ATELIER,"F"|54
 ;;|0,0,DATE.EXPEDITION,"D"|78
 ;;|0,0,DATE.EXPEDITION,"F"|80
 ;;
SOM ;;QUANTITE.DEJA.EXPEDIEE#^PARCLI($J,"QUANTITE.EXPEDIEE");POIDS.DEJA.EXPEDIE#^PARCLI($J,"POIDS.EXPEDIE");NOMBRE.EXPEDITIONS.DEJA.EFFECTUEES#1
 
PARNSC ;;|EDGE|EDGE^LKEXTNSC|
 ;;
EDGE(NIV,X) 
 Q 0

