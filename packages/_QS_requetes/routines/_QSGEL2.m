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

;%QSGEL2^INT^1^59547,73881^0
QSGEL2 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
EXREP(REP) 
 Q:REP="" 0 Q:$D(^[QUI]RQSNCLES(REP)) 1 Q 0
 
LIEN(R1,R2,GLO) 
 N LI,NL,L,I,CH,TYP,RL
 S @GLO=0,NL=0
 Q:$D(^[QUI]RQSLIEN(R1))=0
 S L="" F I=1:1 S L=$O(^[QUI]RQSLIEN(R1,L)) Q:L=""  S CH=^[QUI]RQSLIEN(R1,L) D TLI
 S @GLO=NL
 Q
TLI S TYP=$P(CH,"^",1),RL=$P(CH,"^",2)
 I RL=R2 S @GLO@(L)=TYP,NL=NL+1
 Q
 
LIEN1(R1,R2,T) 
 N L,I,CH,TYP,RL
 Q:((R1="")!(R2=""))!(T="") ""
 Q:(T<1)!(T>5) ""
 Q:'($D(^[QUI]RQSLIEN(R1))) ""
 S L="" F I=1:1 S L=$O(^[QUI]RQSLIEN(R1,L)) Q:L=""  S CH=^[QUI]RQSLIEN(R1,L),TYP=$P(CH,"^",1),RL=$P(CH,"^",2) Q:(TYP=T)&(RL=R2)
 Q L
 
EXLIEN(R1,R2,L) 
 N TYP S TYP=$$TYPE^%QSGEST9(R1,L) Q:TYP=0 0
 Q $D(^[QUI]RQSILIEN(R1,R2,TYP,L))
 
EXILIEN(L) 
 N REPS,REPD
 D LIENR(L,.REPS,.REPD)
 Q (REPS'="")&(REPD'="")
REPD(REP,L) 
 Q:(REP="")!(L="") ""
 Q:'($D(^[QUI]RQSLIEN(REP,L))) ""
 Q $P(^[QUI]RQSLIEN(REP,L),"^",2)
 
LIENI(R1,R2,L,T) 
 Q:(((R1="")!(R2=""))!(L=""))!(T="") ""
 Q:'($D(^[QUI]RQSILIEN(R1,R2,T,L))) ""
 Q $P(^[QUI]RQSILIEN(R1,R2,T,L),"^",2)
 
PERE1(R) 
 Q:R="" ""
 Q:'($D(^[QUI]RQSLIEN2(R,1))) ""
 Q $O(^[QUI]RQSLIEN2(R,1,""))
 
QUAL(REP,L) 
 Q:(REP="")!(L="") 0 Q:$D(^[QUI]RQSQUAL(REP,L)) 1 Q 0
 
LIENR(L,REPS,REPD) 
 S (REPS,REPD)=""
 Q:L=""
 N %I
 F %I=0:0 S REPS=$O(^[QUI]RQSLIEN(REPS)) Q:REPS=""  I $D(^[QUI]RQSLIEN(REPS,L)) S REPD=$P(^[QUI]RQSLIEN(REPS,L),"^",2) Q
 Q
LIENPF(RP,RF) 
 Q:(RP="")!(RF="") ""
 N L,%L
 S L=""
 F %L=0:0 S L=$O(^[QUI]RQSLIEN(RP,L)) Q:L=""  Q:$D(^[QUI]RQSILIEN(RP,RF,2,L))
 Q L
PEREFILS(RF,RP,LPF) 
 N L
 S RP="",LPF=""
 Q:^[QUI]RQSNCLES(RF)<2
 S L=$O(^[QUI]RQSLIEN2(RF,1,""))
 S RP=$P(^[QUI]RQSLIEN(RF,L),"^",2)
 S LPF=$P(^[QUI]RQSILIEN(RF,RP,1,L),"^",2)
 Q

