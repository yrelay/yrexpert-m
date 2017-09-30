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

;%QSGE5^INT^1^59547,73881^0
%QSGE5 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
IR(R,I) 
 N REF
 Q:(R="")!(I="") 0
 I WHOIS("ETUDE")'=0 S REF=$$REF^%QXPGESD(WHOIS("ETUDE"),R,I) Q REF'=""
 Q $D(^[QUI]QUERYV(R,I))'=0
 
 
 
 
 
 
 
AR(R,A) Q:(R="")!(A="") 0 Q:A="UNITE.DE.COMPTE" 1
 Q $D(^[QUI]QUERY2(R,A))'=0
 
 
 
 
 
 
 
 
VAR(R,A,V) Q:((R="")!(A=""))!(V="") 0 Q:(A="UNITE.DE.COMPTE")&(V=1) 1
 Q $D(^[QUI]QUERY2(R,A,V))'=0
 
 
 
 
 
 
 
AIR(R,I,A) N REF
 Q:((R="")!(I=""))!(A="") 0 Q:A="UNITE.DE.COMPTE" 1
 I WHOIS("ETUDE")'=0 S REF=$$REFA^%QXPGESD(WHOIS("ETUDE"),R,I,A) Q REF'=""
 Q $D(^[QUI]QUERYV(R,I,A))'=0
 
 
 
 
 
 
 
 
 
VAIR(R,I,A,V) Q:(((R="")!(I=""))!(A=""))!(V="") 0 I '($$AIR(R,I,A)),A="UNITE.DE.COMPTE" Q 1
 N O,%O
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(R,I,A,O)) Q:O=""  Q:^[QUI]QUERYV(R,I,A,O)=V
 Q O'=""
 
 
 
 
 
 
 
 
 
 
OAIR(R,I,A,O) 
 N REF
 Q:(((R="")!(I=""))!(A=""))!(O="") 0
 I WHOIS("ETUDE")'=0 S REF=$$REFA^%QXPGESD(WHOIS("ETUDE"),R,I,A) Q:REF="" 0 Q $$INMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",REF,O)
 Q $D(^[QUI]QUERYV(R,I,A,O))'=0
 
 
 
 
 
 
 
 
 
 
OVAIR(R,I,A,V,O) Q:((((R="")!(I=""))!(A=""))!(V=""))!(O="") 0 Q $D(^[QUI]QUERY2(R,A,V,O,I))'=0
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
OVAR(R,A,V,O) Q:(((R="")!(A=""))!(V=""))!(O="") 0 Q $D(^[QUI]QUERY2(R,A,V,O))'=0

