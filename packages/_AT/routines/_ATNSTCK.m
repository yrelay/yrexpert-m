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

;%ATNSTCK^INT^1^59547,73866^0
%ATNSTCK ;;02:29 PM  4 Sep 1996;
 
STOCK(NUMET,NIV,NOMATN) 
 D GLOCOP^%QCAGLC("^PARAENT("_$J_","_NIV_")","^[QUI]RQSDON(""RESATN"",""R"","""_NUMET_""",""E"")")
 D GLOCOP^%QCAGLC("^PARASOR("_$J_","_NIV_")","^[QUI]RQSDON(""RESATN"",""R"","""_NUMET_""",""S"")")
 S ^[QUI]RQSDON("RESATN","N",NOMATN,NUMET)=""
 Q
 
 
DEJAFAIT(NOMATN,NIV) 
 N ETUDE
 Q:'($D(^[QUI]RQSDON("RESATN","N",NOMATN))) ""
 S ETUDE=""
DEJBC S ETUDE=$O(^[QUI]RQSDON("RESATN","N",NOMATN,ETUDE))
 Q:ETUDE="" ""
 I '($$EGALGLO("^PARAENT("_$J_","_NIV_")","^[QUI]RQSDON(""RESATN"",""R"","""_ETUDE_""",""E"")")) G DEJBC
 Q ETUDE
 
GETRES(NOMETUD,NIV) 
 D GLOCOP^%QCAGLC("^[QUI]RQSDON(""RESATN"",""R"","""_NOMETUD_""",""S"")","^PARASOR("_$J_","_NIV_")")
 Q
 
 
EGALGLO(G1,G2) N Q1,Q2,RE1,RE2,T1,T2
 Q:$D(@G1)'=$D(@G2) 0
 S Q1=$S($E(G1,2)="[":$P(G1,"]")_"]",1:"^")
 S Q2=$S($E(G2,2)="[":$P(G2,"]")_"]",1:"^")
 S RE1=$S($E(G1,$L(G1))=")":$E(G1,1,$L(G1)-1),1:G1)
 S RE2=$S($E(G2,$L(G2))=")":$E(G2,1,$L(G2)-1),1:G2)
 S T1=G1,T2=G2
 I $D(@G1)#10 Q:@G1'=@G2 0
BCL S T1=$Q(@T1),T2=$Q(@T2)
 S T1=$$^%Q(T1),T2=$$^%Q(T2)
 I (T1="")&(T2="") Q 1
 I T1="" Q $E(Q2_$E(T2,2,$L(T2)),1,$L(RE2))'=RE2
 I T2="" Q $E(Q1_$E(T1,2,$L(T1)),1,$L(RE1))'=RE1
 S T1=Q1_$E(T1,2,$L(T1)),T2=Q2_$E(T2,2,$L(T2))
 I ($E(T1,1,$L(RE1))'=RE1)!($E(T2,1,$L(RE2))'=RE2) Q ($E(T1,1,$L(RE1))'=RE1)&($E(T2,1,$L(RE2))'=RE2)
 I $E(T1,$L(RE1)+1,$L(T1))'=$E(T2,$L(RE2)+1,$L(T2)) Q 0
 I @T1'=@T2 Q 0
 G BCL
 
 
TEST K ^TEST,^[QUI]TEST
 S ^TEST("A",1,"A",2)=4,^TEST("A",1,"A",3)=6,^TEST("A",1,"A")="zz",^TEST("A",1,"B")=9,^TEST("A",1,"C")=0
 S ^[QUI]TEST("A",1,"A",2)=4,^[QUI]TEST("A",1,"A",3)=6,^[QUI]TEST("A",1,"A")="zz",^[QUI]TEST("A",1,"C")=1
 S R=$$EGALGLO("^TEST","^[QUI]TEST") W !,1-R
 S R=$$EGALGLO("^TEST(""A"")","^[QUI]TEST") W !,1-R
 S R=$$EGALGLO("^TEST(""A"")","^[QUI]TEST(""A"")") W !,1-R
 S R=$$EGALGLO("^TEST(""A"",1,""A"")","^[QUI]TEST(""A"",1,""A"")") W !,R
 S R=$$EGALGLO("^TEST(""A"",1,""B"")","^[QUI]TEST(""A"",1,""B"")") W !,1-R
 S R=$$EGALGLO("^TEST(""A"",1,""C"")","^[QUI]TEST(""A"",1,""C"")") W !,1-R
 Q

