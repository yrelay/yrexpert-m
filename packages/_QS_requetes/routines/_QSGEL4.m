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

;%QSGEL4^INT^1^59547,73881^0
%QSGEL4 ;
 
 
 
 
 
 
 
LIENI(LIEN) 
 N BASE,BASEL,TYPE
 D LIENR^%QSGEL2(LIEN,.BASE,.BASEL)
 S TYPE=$$TYPEL^%QSGES90(LIEN)
 Q $$LIENI^%QSGEL2(BASE,BASEL,LIEN,TYPE)
 
 
MKLISTE(GLOB) 
 N RLIEN,L,%RS,RS,RSE,RD,RDE
 S RLIEN=$$LIENI^%QSGEL3
 S RS="" F %RS=0:0 S RS=$O(^[QUI]RQSLIEN(RS)) Q:RS=""  I RS'=RLIEN S RSE=$$NOMLOG^%QSF(RS) I $D(^[QUI]RQSAUTOR(WHOIS,RSE)) D MK2
 Q
MK2 S L="" F %L=0:0 S L=$O(^[QUI]RQSLIEN(RS,L)) Q:L=""  S RD=$P(^[QUI]RQSLIEN(RS,L),"^",2) I RD'=RLIEN S RDE=$$NOMLOG^%QSF(RD) I $D(^[QUI]RQSAUTOR(WHOIS,RDE)) S @GLOB@(L)=RSE_"^"_RDE_"^"_$P(^[QUI]RQSLIEN(RS,L),"^")
 Q

