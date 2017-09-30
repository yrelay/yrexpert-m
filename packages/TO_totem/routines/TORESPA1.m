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

;TORESPA1^INT^1^59547,74875^0
TORESPAR ;
 
 S DOLARI=$I D ZD^%QMDATE4 S TIT="resultats de comprehensions" D ^TOGETART
SUITE 
QUES G:'($D(^TACOMPIL($I))) FINI S DOLARI=$I,DEV=^TABIDENT(WHOIS,"PRINTER")
 D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W "Voulez vous les resultats de la comprehension sur (E)cran ou (I)mprimante " R *REP:60 S:REP=-1 REP=13 G:REP=13 FIN S REP=$C(REP) G:(REP'="E")&(REP'="I") QUES W " OK" I REP="I" O DEV U DEV
 D:REP="E" CLEPAG^%VVIDEO
 S NARTI=-1 F AA=0:0 S NARTI=$N(^TACOMPIL(DOLARI,NARTI)) G:NARTI=-1 FIN D TRAIT
 Q
TRAIT S ARTI=^TACOMPIL(DOLARI,NARTI),N=ARTI,DAT=$S($D(^[QUI]TIMCOMP(N)):$N(^[QUI]TIMCOMP(N,-1)),1:%DAT),HEUR=$S($D(^[QUI]TIMCOMP(N,DAT)):$P(^[QUI]TIMCOMP(N,DAT),"^",1),1:" ??? ") W !,!,!,?10,"Resultats de la comprehension de ",N,"  du ",DAT,"   a  ",HEUR
CYCL G:'($D(^[QUI]AMBICYCL(N))) AMBI
 S M=-1 F MM=0:0 S M=$N(^[QUI]AMBICYCL(N,M)) Q:M=-1  W !,!,?5,"Cycle sur : ",$P(M,"/",1),!,?5,"Cycle : " D CYCLE
AMBI G UNKN
 
UNKN I '($D(^[QUI]UNKN(N))) W !,!,?5,"PAS DE PARAMETRE INCONNU DANS ",ARTI G ABAC
 S M=-1 F MM=0:0 S M=$N(^[QUI]UNKN(N,M)) Q:M=-1  S MI=-1 F MMM=0:0 S MI=$N(^[QUI]UNKN(N,M,MI)) Q:MI=-1  S REP=^[QUI]UNKN(N,M,MI) D ECRKN
 G ABAC
ECRKN W !,!,?5,"Inconnu : ",M,!,?5,"Repere : " I REP'["$ARG" W $P($P(REP," ",1),"(",1),"/",$E(REP,$L($P(REP," ",1))+1,299) G FINI
 S ARG=$P(REP,"$ARG",2),ARG="$ARG"_$P(ARG," ",1) I $D(^[QUI]DEPARG(N,ARG)) W ^[QUI]DEPARG(N,ARG) G FINI
 W " ???? " G FINI
ABAC I '($D(^[QUI]GRISELEC(ARTI))) W !,!,?5,"CONNECTION A AUCUNE ABAQUE" G FINI
 W !,!,?5,"Connection de ",ARTI," aux abaques suivantes : ",!
 S NUG=-1 F UU=1:1 S NUG=$N(^[QUI]GRISELEC(ARTI,NUG)) Q:NUG=-1  S REF=^[QUI]GRISELEC(ARTI,NUG) W !,$S(UU<10:" ",1:""),UU,?5,$P(REF,"^",1),?40,$P(REF,"^",2),?55,$P(REF,"^",3),?75,$P(REF,"^",4)
FINI Q
FIN C:REP="I" DEV G END Q
END U 0 W !,"( RETURN ) " R *RET:60 Q
TOUS D ^TORESCO G END
CYCLE S NUM=-1 F WQ=0:0 S NUM=$N(^[QUI]LIBCYCLE(N,M,NUM)) Q:NUM=-1  W " => ",^[QUI]LIBCYCLE(N,M,NUM)
 W " => ",$P(M,"/",1) Q

