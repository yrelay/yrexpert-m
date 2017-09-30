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

;%TLOUSO^INT^1^59547,74030^0
%TLOUSO ;;05:29 PM  30 Mar 1992;
 
 N TRT,SOR,DEV
 
 W !,"nom du traitement : " R TRT
 W !,"(I)mprimante, (E)cran, (F)ichier [E]" R SOR
 S:(SOR'="I")&(SOR'="F") SOR="E"
 D @("O"_SOR),OUT(TRT),@("C"_SOR)
 Q
OE S DEV=$I O DEV Q
OF W !,"nom du fichier : " R FILE S DEV=10 O 10:(MODE="w":FILE=FILE) Q
OI S DEV=30 O DEV Q
CE Q
CF C DEV Q
CI U DEV W # Q
 
OUT(TRT) 
 U DEV W !,"TRAITEMENT ",TRT,!,"--------------------------",!,!
 S LIG="" F  S LIG=$O(^[QUI]TTL(TRT,2,LIG)) Q:LIG=""  U DEV W !,^[QUI]TTL(TRT,2,LIG)
 W !,!
 S LIG="" F  S LIG=$O(^[QUI]TTL(TRT,2,LIG)) Q:LIG=""  U DEV W !,^[QUI]TTL(TRT,2,LIG) D IMPCOMP
 Q
IMPCOMP I '($D(^[QUI]RQSDON("COMPTRT",TRT,LIG))) W !,"   ** non compile **  " Q
 S IC="" F  S IC=$O(^[QUI]RQSDON("COMPTRT",TRT,LIG,IC)) Q:IC=""  W !,"    ",^[QUI]RQSDON("COMPTRT",TRT,LIG,IC)
 Q

