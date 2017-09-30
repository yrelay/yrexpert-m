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

;%QSGES10^INT^1^59547,73881^0
%QSGES10 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
NOMEX(R,N) Q:(R="")!(N="") "" Q:'($D(^[QUI]RQSNCLES(R))) "" Q $P(N,",",^[QUI]RQSNCLES(R))
 
 
 
NOMPERE(R,N) N T,M Q:(R="")!(N="") ""
 Q:'($D(^[QUI]RQSNCLES(R))) ""
 S M=^[QUI]RQSNCLES(R) Q:(M="")!(M<2) ""
 Q $E(N,1,($L(N)-$L($P(N,",",M)))-1)
 
 
NOMFILS(R1,N1,R2,N2) N M1,M2,L,LTYP2,I,GLIEN,TEMP
 Q:(((R1="")!(R2=""))!(N1=""))!(N2="") ""
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLIEN=$$CONCAS^%QZCHAD(TEMP,"LIEN")
 S M1=$$^%QCAZG("^[QUI]RQSNCLES(R1)"),M2=$$^%QCAZG("^[QUI]RQSNCLES(R2)")
 G:(M1="")!(M2="") FIN0
 G:M1'=(M2-1) FIN0
 
 
 D LIEN^%QSGEL2(R1,R2,GLIEN)
 S L="",LTYP2=0 F I=1:1 S L=$O(@GLIEN@(L)) Q:L=""  I @GLIEN@(L)=2 S LTYP2=1
 G:LTYP2=0 FIN0
 
 K @(TEMP)
 Q N1_","_N2
FIN0 K @(TEMP) Q N2
 
 
NOMASC(R,N,I) N J,M,C1
 Q:((R="")!(N=""))!(I="") ""
 S C1=$$^%QCAZG("^[QUI]RQSNCLES(R)") Q:C1="" ""
 S M=$P(N,",",C1-I)
 F J=(C1-I)-1:-1:1 S M=$P(N,",",J)_","_M
 Q M
 
 
NOMPERES(N,I) Q $P(N,",",1,I)
 
 
ORDRE(R,N) N GG,P,O,%O,NOMPAPA,LIENPF,NOMEXT
 D ASC^%QSGES17(R,"GG") S P=$ZP(GG("")) Q:P="" ""
 S NOMPAPA=$$NOMPERE(R,N),LIENPF=$$PERE1^%QSGEL2(R),NOMEXT=$$NOMEX^%QSGES10(R,N)
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)) Q:O=""  Q:^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)=NOMEXT
 Q O
 
NEXT(R,N) N GG,P,OR,NP,RF,VAL,TYPE,NOR,O,%O,NOMPAPA,LIENPF,NOMEXT
 D ASC^%QSGES17(R,"GG") S P=$ZP(GG("")) Q:P="" ""
 S NOMPAPA=$$NOMPERE(R,N),LIENPF=$$PERE1^%QSGEL2(R),NOMEXT=$$NOMEX(R,N)
 S O="" F %O=0:0 S O=$O(^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)) Q:O=""  Q:^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)=NOMEXT
 Q:O="" ""
 S O=$O(^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)) Q:O="" ""
 S VAL=^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)
 Q NOMPAPA_","_VAL
 
 
PREV(R,N) N GG,P,OR,NP,RF,VAL,TYPE,NOR,O,%O,NOMPAPA,LIENPF,NOMEXT
 D ASC^%QSGES17(R,"GG") S P=$ZP(GG("")) Q:P="" ""
 S NOMPAPA=$$NOMPERE(R,N),LIENPF=$$PERE1^%QSGEL2(R),NOMEXT=$$NOMEX(R,N)
 S O="" F %O=0:0 S O=$ZP(^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)) Q:O=""  Q:^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)=NOMEXT
 Q:O="" ""
 S O=$ZP(^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)) Q:O="" ""
 S VAL=^[QUI]QUERYV(GG(P),NOMPAPA,LIENPF,O)
 Q NOMPAPA_","_VAL
 
 
TEST S A="JHGJH,JHGJHJH,JHGJHJH"
 W $$NOMASC("P1","JHGJHG,JHHGJHGJH,JHGJHG",1)

