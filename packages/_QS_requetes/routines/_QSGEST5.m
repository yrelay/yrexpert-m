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

;%QSGEST5^INT^1^59547,73881^0
%QSGEST5 ;
 
 
 
 
 
 
 
 
 
 
AFF(R,I) D AF(R,I,0) Q
 
 
 
 
 
 
 
REP(R) Q:R="" 0 Q $D(^[QUI]QUERYV(R))'=0
 
 
 
 
 
 
REPVID(R) Q:R="" 0 Q:'($D(^[QUI]QUERYV(R))#10) 1 Q ^[QUI]QUERYV(R)=0
 
 
 
 
 
 
 
 
AF(R,I,P) N A,%A,CH,LAV,N,%N,REP,V,%V
 W !,?P,$$^%QZCHW("Repertoire : "),R,$$^%QZCHW("    Individu : "),I
 S A="" F %A=0:0 S A=$O(^[QUI]QUERYV(R,I,A)) Q:A=""  D TA
 S A="" F %A=0:0 S A=$O(^[QUI]RQSLIEN(R,A)) Q:A=""  D TLA
 Q
TLA S CH=^[QUI]RQSLIEN(R,A) Q:$P(CH,"^",1)'=2  S REP=$P(CH,"^",2)
 S N="" F %N=0:0 S N=$O(^[QUI]QUERYV(R,I,A,N)) Q:N=""  S V=^[QU]QUERYV(R,I,A,N) D AF(REP,I_","_V,P+5)
 Q
TA Q:$D(^[QUI]RQSLIEN(R,A))
 W !,?P,"     ",A
 S N="" F %N=0:0 S N=$O(^[QUI]QUERYV(R,I,A,N)) Q:N=""  S V=^[QUI]QUERYV(R,I,A,N) W ?P+30,V,?P+60,N,!
 Q
 
CARD(R) Q:R="" 0 Q:$$REPVID(R) 0 Q ^[QUI]QUERYV(R)
 
 
 
 
 
 
 
IR(R,I) 
 Q $$IR^%QSGE5(R,I)
AR(R,A) Q $$AR^%QSGE5(R,A)
VAR(R,A,V) Q $$VAR^%QSGE5(R,A,V)
AIR(R,I,A) Q $$AIR^%QSGE5(R,I,A)
VAIR(R,I,A,V) Q $$VAIR^%QSGE5(R,I,A,V)
OVAIR(R,I,A,V,O) Q $$OVAIR^%QSGE5(R,I,A,V,O)

