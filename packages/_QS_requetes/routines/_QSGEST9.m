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

;%QSGEST9^INT^1^59547,73881^0
%QSGEST9 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TYPE(REP,ATT) Q:(REP="")!(ATT="") 0 Q:'($D(^[QUI]RQSLIEN(REP,ATT))) 0 Q $P(^[QUI]RQSLIEN(REP,ATT),"^")
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
NXOR(A,B) Q '((A&('(B)))!(B&('(A))))
 
LIEN(REP,GLOBAL) N L,I S L=$O(^[QUI]RQSLIEN(REP,"")) F I=0:1 Q:L=""  S @GLOBAL@(L)=$P(^[QUI]RQSLIEN(REP,L),"^",1),L=$O(^[QUI]RQSLIEN(REP,L))
 S @GLOBAL=I Q
 
LIENS(REP,INDIV,GLOBA) 
 N L,I,J,V,O
 S @GLOBA=0 Q:$D(^[QUI]QUERYV(REP,INDIV))<9  S L=$O(^[QUI]RQSLIEN(REP,"")) F I=0:1 Q:L=""  D L1 S @GLOBA@(L)=$P(^[QUI]RQSLIEN(REP,L),"^",1),L=$O(^[QUI]RQSLIEN(REP,L))
 S @GLOBA=I Q
L1 S O="" F J=0:0 S O=$O(^[QUI]QUERYV(REP,INDIV,L,O)) Q:O=""  S V=^[QUI]QUERYV(REP,INDIV,L,O),@GLOBA@(L,V)=O
 Q
 
REPA(GLO) 
 N MODEL,REP,I
 S MODEL=$$MODEL^%QSMODEL Q:MODEL=""
 Q:$D(^[QUI]RQSAUTOR(WHOIS))<9
 S REP=$O(^[QUI]RQSAUTOR(WHOIS,""))
 F I=1:0 Q:REP=""  S @GLO@(REP)=$$NOMINT^%QSF(REP),REP=$O(^[QUI]RQSAUTOR(WHOIS,REP))
 Q
 
 
REPAP(GLO) 
 N A,%A,J
 I WHOIS("ETUDE")'=0 D COPYLIST^%QXPPRIM(WHOIS("ETUDE"),$$NDCOUR^%QXPPRIM(WHOIS("ETUDE")),"REPERTOIRE.AUTORISE.AIEUL",GLO) Q
 F %A=0:0 S A=$O(^[QUI]RQSAUTOR(WHOIS,A)) Q:(A="")!(A="z")  I (A'="ATTRIBUT")&(A'="LIEN") S J=$$NOMINT^%QSF(A) I J'="",'($D(^[QUI]RQSFILS(J))) S @GLO@(A)=""
 Q
 
REP(GLO) 
 N MODEL,REP,I
 S MODEL=$$MODEL^%QSMODEL Q:MODEL=""
 Q:$D(^[QUI]RQSMDL1(MODEL))<9
 S REP=$O(^[QUI]RQSMDL1(MODEL,""))
 F I=1:0 Q:REP=""  S @GLO@(REP)=$$NOMINT^%QSF(REP),REP=$O(^[QUI]RQSMDL1(MODEL,REP))
 Q
 
REPI(GLO) 
 N MODEL,REP,I
 S MODEL=$$MODEL^%QSMODEL Q:MODEL=""
 Q:$D(^[QUI]RQSMDL1(MODEL))<9
 S REP=$O(^[QUI]RQSMDL1(MODEL,""))
 F I=1:0 Q:REP=""  S @GLO@($$NOMINT^%QSF(REP))=REP,REP=$O(^[QUI]RQSMDL1(MODEL,REP))
 Q
 
REPM(N) 
 N MODEL Q:N="" 0
 S MODEL=$$MODEL^%QSMODEL Q:MODEL="" 0
 Q:$D(^[QUI]RQSMDL1(MODEL,N))=0 0
 Q:$D(^[QUI]RQSAUTOR(WHOIS,N))'=0 2
 Q 1
 
 
 
 
 
 
 
 
 
 
 
TYPE2(REP,ATT) Q:(REP="")!(ATT="") 0
 Q:$$EX^%QSGESPE(ATT) 6
 Q $P($$^%QCAZG("^[QUI]RQSLIEN(REP,ATT)"),"^",1)+0
 
 
 
 
 
 
TYPESP(ATT) Q:ATT="" ""
 Q:'($$EX^%QSGESPE(ATT)) ""
 Q $O(^[QUI]QUERYV("ATTRIBUT",ATT,"TYPE.MISE.A.JOUR",""))

