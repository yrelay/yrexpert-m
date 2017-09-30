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

;%QSINTEL^INT^1^59547,73882^0
%QSINTEL ;;06:18 PM  22 Mar 1993 ; 01 Apr 93  8:50 AM
 
 
 
 
 S REPLIEN=$$LIENI^%QSGEL3
 S INDL=""
NXINDL S INDL=$$NXTRI^%QSTRUC8(REPLIEN,INDL) Q:INDL=""
 W !,INDL
 S (REPDEST,REPSOUR,NOML,INDD,INDS)=""
 S NOML=$P(INDL,"\")
 S REP="" F %R=0:0 S REP=$O(^[QUI]RQSLIEN(REP)) Q:REP=""  Q:$D(^[QUI]RQSLIEN(REP,NOML))
 S erreur="l'individu lien correspond a un lien qui n'existe pas"
 G:REP="" ERREUR
 S REPSOUR=$$^%QSCALIN(REPLIEN,INDL,"REP.SOURCE",1)
 S erreur="pas de repertoire source"
 G:REPSOUR="" ERREUR
 S erreur="lien non qualifie"
 I '($D(^[QUI]RQSQUAL(REPSOUR,NOML))) G ERREUR
 S IINDS=$O(^[QUI]QUERYV(REPLIEN,INDL,"SOURCE."_NOML,""))
 G:IINDS="" ERREUR
 S INDS=^[QUI]QUERYV(REPLIEN,INDL,"SOURCE."_NOML,IINDS)
 S erreur="l'individu source n'existe pas"
 G:'($D(^[QUI]QUERYV(REPSOUR,INDS))) ERREUR
 S REPDEST=$$^%QSCALIN(REPLIEN,INDL,"REP.DESTINATION",1)
 S erreur="pas de repertoire destination"
 G:REPDEST="" ERREUR
 S IINDD=$O(^[QUI]QUERYV(REPLIEN,INDL,"DESTINATION."_NOML,""))
 G:IINDD="" ERREUR
 S INDD=^[QUI]QUERYV(REPLIEN,INDL,"DESTINATION."_NOML,IINDD)
 S erreur="l'individu destination n'existe pas"
 G:'($D(^[QUI]QUERYV(REPDEST,INDD))) ERREUR
 G NXINDL
ERREUR W !," -> ",INDL,"  ",erreur
 G NXINDL
 
SUPIL 
 ;

