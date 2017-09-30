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

;%QSGES90^INT^1^59547,73881^0
QSGES90 ;
 
 
 
 
 
 
 
LISTE ;;|"ATTRIBUT"||
 ;;|"LIEN"||
 ;;|"LISTE"||
 ;;|"REQUETE"||
 
 
 
 
 
 
 
REPAS(GLO) 
 N LREPS,REP,I
 D ^%QCAGLTX("LISTE^%QSGES90","LREPS")
 S REP=$O(LREPS(""))
 F I=0:1 Q:REP=""  S LREPS(REP)=$$NOMLOG^%QSF($$ONE^%QSGEL3(REP)),REP=$O(LREPS(REP))
 D REPA^%QSGEST9(GLO)
 
 S REP=$O(LREPS(""))
 F I=0:1 Q:REP=""  K @GLO@(LREPS(REP)) S REP=$O(LREPS(REP))
 Q
 
 
 
 
 
 
 
 
REPES(GLO) 
 N LREPS,REP,I
 D ^%QCAGLTX("LISTE^%QSGES90","LREPS")
 S REP=$O(LREPS(""))
 F I=0:1 Q:REP=""  S LREPS(REP)=$$NOMLOG^%QSF($$ONE^%QSGEL3(REP)),REP=$O(LREPS(REP))
 D REP^%QSGEST9(GLO)
 
 S REP=$O(LREPS(""))
 F I=0:1 Q:REP=""  K @GLO@(LREPS(REP)) S REP=$O(LREPS(REP))
 Q
 
REPIS(GLO) 
 N LREPS,REP,I
 D ^%QCAGLTX("LISTE^%QSGES90","LREPS")
 S REP=$O(LREPS(""))
 F I=0:1 Q:REP=""  S LREPS(REP)=$$ONE^%QSGEL3(REP),REP=$O(LREPS(REP))
 D REPI^%QSGEST9(GLO)
 
 S REP=$O(LREPS(""))
 F I=0:1 Q:REP=""  K @GLO@(LREPS(REP)) S REP=$O(LREPS(REP))
 Q
 
 
 
 
 
 
 
 
 
 
 
TYPEL(LIEN) 
 N REPS,REPD
 D LIENR^%QSGEL2(LIEN,.REPS,.REPD)
 Q $$TYPE2^%QSGEST9(REPS,LIEN)
 
 
 
 
REP(M,R) 
 I (M="")!(R="") Q 0
 I '($D(^RQSMDL1(M,R))) Q 0
 I '($D(^RQSMOD3(M,R))) Q 1
 Q 2
 
LIENPF(M,R,L) 
 I ((M="")!(R=""))!(L="") Q 0
 I $$REP(M,R)'=2 Q 0
 I '($D(^RQSMDL2(M,R,L))) Q 0
 Q 1
 
LIENINV(M,R,L) 
 
 I ((M="")!(R=""))!(L="") Q 0
 Q:$D(^RQSMDL4(M,R,L)) 1
 Q 0
 
REPD(M,R,L) 
 I ((M="")!(R=""))!(L="") Q ""
 I $$LIENPF(M,R,L)=0 Q ""
 Q $P(^RQSMDL2(M,R,L),"^",1)
 
LIENR(M,R1,R2) 
 I ((M="")!(R1=""))!(R2="") Q 0
 N L,%L,S
 I $$REP(M,R1)'=2 Q 0
 I $$REP(M,R2)'=2 Q 0
 I '($D(^RQSMDL3(M,R1))) Q 0
 S L="",S=0
 F %L=0:0 S L=$O(^RQSMDL3(M,R1,L)) Q:L=""  I $P(^RQSMDL3(M,R1,L),"^",1)=R2 S S=1 Q
 Q S

