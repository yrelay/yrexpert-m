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

;TORESBRF^INT^1^59547,74875^0
TORESBRF ;
 
 K ^POSENR($I)
 S PAGE=0,LG=10000,NARTI=-1
 F AA=0:0 S NARTI=$N(^TACOMPIL($I,NARTI)) G:NARTI=-1 FIN D TRAIT
FIN K NARTI,AA,ARTI,N,M,MM,VAL,MI,MMM,REP,ARG,NUG,UU,REF,NUM,WQ,LBCY,LV,LONG,LN
 Q
TRAIT I '($D(^POSENR($I,PAGE))) G TRAIT1
 S OK=0 F LI=1:1:5 Q:'($D(^POSENR($I,PAGE,LI)))  I ^POSENR($I,PAGE,LI)'="" S OK=1 Q
 S:OK=1 PAGE=PAGE+1,LG=0
TRAIT1 S ARTI=^TACOMPIL($I,NARTI),N=ARTI,DAT=$S($D(^[QUI]TIMCOMP(N)):$N(^[QUI]TIMCOMP(N,-1)),1:%DAT),HEUR=$S($D(^[QUI]TIMCOMP(N,DAT)):$P(^[QUI]TIMCOMP(N,DAT),"^",1),1:" ??? ")
 S VAL="Resultats de la comprehension de "_N_" du "_DAT_" a "_HEUR D ACQDON
CYCL G:'($D(^[QUI]AMBICYCL(N))) UNKN
 S M=-1 F MM=0:0 S M=$N(^[QUI]AMBICYCL(N,M)) Q:M=-1  S VAL="" D ACQDON S VAL="     Cycle sur : "_$P(M,"/",1) D ACQDON,CYCLE
UNKN 
 I '($D(^[QUI]UNKN(N))) S VAL="" D ACQDON S VAL="     PAS DE PARAMETRE INCONNU DANS "_ARTI D ACQDON G ABAC
 S M=-1 F MM=0:0 S M=$N(^[QUI]UNKN(N,M)) Q:M=-1  S MI=-1 F MMM=0:0 S MI=$N(^[QUI]UNKN(N,M,MI)) Q:MI=-1  S REP=^[QUI]UNKN(N,M,MI) D ECRKN
 G ABAC
ECRKN S VAL="" D ACQDON S VAL="     Inconnu : "_M D ACQDON S VAL="     Repere : " I REP'["$ARG" S VAL=VAL_$P($P(REP," ",1),"(",1)_"/"_$E(REP,$L($P(REP," ",1))+1,299) D ACQDON G FINI
 S ARG=$P(REP,"$ARG",2),ARG="$ARG"_$P(ARG," ",1) I $D(^[QUI]DEPARG(N,ARG)) S VAL=VAL_^[QUI]DEPARG(N,ARG) D ACQDON G FINI
 S VAL=VAL_" ???? " D ACQDON G FINI
ABAC 
 I '($D(^[QUI]GRISELEC(ARTI))) S VAL="" D ACQDON S VAL="     CONNECTION A AUCUNE ABAQUE" D ACQDON G BLOIMP
 S VAL="" D ACQDON S VAL="     Connection de "_ARTI_" aux abaques suivantes : " D ACQDON S VAL="" D ACQDON
 S NUG=-1 F UU=1:1 S NUG=$N(^[QUI]GRISELEC(ARTI,NUG)) Q:NUG=-1  S REF=^[QUI]GRISELEC(ARTI,NUG),VAL=$S(UU<10:" ",1:"")_UU_" "_$P(REF,"^",1)_" "_$P(REF,"^",2)_" "_$P(REF,"^",3)_" "_$P(REF,"^",4) D ACQDON
BLOIMP 
 S ADSTO="ACQDON^TORESBRF" D ^TORESBIM
BLOPHAS 
 D PHAS^TORESBIM
FINI Q
 
CYCLE S VAL="     Cycle : ",NUM=-1
 F WQ=0:0 S NUM=$N(^[QUI]LIBCYCLE(N,M,NUM)) Q:NUM=-1  S LBCY=^[QUI]LIBCYCLE(N,M,NUM) D TRCYCL
 S LBCY=$P(M,"/",1) D TRCYCL,ACQDON Q
 
ACQDON S LG=LG+1 I LG>LILIM S LG=1,PAGE=PAGE+1
 S ^POSENR($I,PAGE,LG)=VAL Q
 
TRCYCL S LV=$L(VAL),LN=$L(LBCY) I (LV+LN)'>76 S VAL=VAL_" => "_LBCY Q
 S LONG=(LV+LN)-76,VAL=VAL_" => "_$E(LBCY,1,LN-LONG) D ACQDON S VAL=$E(LBCY,(LN-LONG)+1,LN) Q

