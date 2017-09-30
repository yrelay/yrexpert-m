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

;%PBSOV^INT^1^59547,73874^0
PTOV ;
 
ZERO K ^[QUI]GRAPHE2 Q
 
KILL(O,V) K ^[QUI]GRAPHE2(O,V) Q
 
NEW(O,V) S ^[QUI]GRAPHE2(O,V)=0 Q
 
SET(O,V,A,VAL) S ^[QUI]GRAPHE2(O,V,0,A)=VAL Q
 
LEC(O,V,A) Q:$D(^[QUI]GRAPHE2(O,V,0,A)) ^[QUI]GRAPHE2(O,V,0,A) Q ""
 
ADD(O,V,EL) N ELEM S (ELEM,^[QUI]GRAPHE2(O,V))=$S($$^%QCAZG("^[QUI]GRAPHE2(O,V)")'="":^[QUI]GRAPHE2(O,V)+1,1:1),^[QUI]GRAPHE2(O,V,ELEM)=EL Q ELEM
 
SUP(O,V,ELEM) N CH,L,%L S CH=^[QUI]GRAPHE2(O,V,ELEM)
 S L=$O(^[QUI]GRAPHE2(O,V,ELEM)) F %L=0:0 Q:L=""  S ^[QUI]GRAPHE2(O,V,L-1)=^[QUI]GRAPHE2(O,V,L),L=$O(^[QUI]GRAPHE2(O,V,L))
 I $P(CH,"^",1)=3 K ^[QUI]GRAPHE2(O,V,0,"NOMS",$P(CH,"^",6))
 K ^[QUI]GRAPHE2(O,V,^[QUI]GRAPHE2(O,V))
 S ^[QUI]GRAPHE2(O,V)=^[QUI]GRAPHE2(O,V)-1 Q
 
INSERT(O,V,EL,ELEM) N L,%L S L=$ZP(^[QUI]GRAPHE2(O,V,"")) F %L=0:0 Q:L=ELEM  S ^[QUI]GRAPHE2(O,V,L+1)=^[QUI]GRAPHE2(O,V,L)
 S ^[QUI]GRAPHE2(O,V,ELEM)=EL,^[QUI]GRAPHE2(O,V)=^[QUI]GRAPHE2(O,V)+1 Q
 
EXIST(O,V) Q $D(^[QUI]GRAPHE2(O,V))'=0
 
ADDPOINT(O,V,P,X,Y) 
 S ^[QUI]GRAPHE2(O,V,0,"NOMS",P)=X_"^"_Y Q
POINT(O,V,P) 
 Q $D(^[QUI]GRAPHE2(O,V,0,"NOMS",P))'=0
XY(O,V,P,X,Y) N C S C=^[QUI]GRAPHE2(O,V,0,"NOMS",P)
 S X=$P(C,"^",1),Y=$P(C,"^",2) Q
 
DEP(O,V,P1,P2) 
 S ^[QUI]GRAPHE2(O,V,0,"DEP",P1,P2)="" Q
 
RECOP(O1,V1,O2,V2) N I,N,%N,N1,%N1
 D KILL(O2,V2)
 F I=1:1:^[QUI]GRAPHE2(O1,V1) S ^[QUI]GRAPHE2(O2,V2,I)=^[QUI]GRAPHE2(O1,V1,I)
 S ^[QUI]GRAPHE2(O2,V2)=^[QUI]GRAPHE2(O1,V1)
 S N=-1 F %N=0:0 S N=$N(^[QUI]GRAPHE2(O1,V1,0,"NOMS",N)) Q:N=-1  S ^[QUI]GRAPHE2(O2,V2,0,"NOMS",N)=^[QUI]GRAPHE2(O1,V1,0,"NOMS",N)
 S N=-1 F %N=0:0 S N=$N(^[QUI]GRAPHE2(O1,V1,0,"DEP",N)) Q:N=-1  S N1=-1 F %N1=0:0 S N1=$N(^[QUI]GRAPHE2(O1,V1,0,"DEP",N,N1)) Q:N1=-1  S ^[QUI]GRAPHE2(O2,V2,0,"DEP",N,N1)=^[QUI]GRAPHE2(O1,V1,0,"DEP",N,N1)
 S N=-1 F %N=0:0 S N=$N(^[QUI]GRAPHE2(O1,V1,0,N)) Q:N=-1  I (N'="NOMS")&(N'="DEP") S ^[QUI]GRAPHE2(O2,V2,0,N)=^[QUI]GRAPHE2(O1,V1,0,N)
 Q
 
VIS(O,V) Q:'($D(^[QUI]GRAPHE2(O,V,0,"LIBEL"))) 1 Q ^[QUI]GRAPHE2(O,V,0,"LIBEL")
SETVIS(O,V,N) S ^[QUI]GRAPHE2(O,V,0,"LIBEL")=N Q

