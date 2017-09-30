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

;DTLORO^INT^1^59547,74866^0
ZTRANSR ;
 
 K ^TRANS($J) D ^%ZD,INT^%T S ^TRANS($J)=%DAT_"|"_%TIM K ^GLOB($J) S %NG=1 D %UCI^%QCSDIR S %CPT=0
 D RSET^%ZROMOD S %U=-1 F %G=1:1 S %U=$N(^UTILITY($J,%U)) Q:%U=-1  S ^GLOB($J,%G)="ROUTINE("""_%U_""""
COPI I '($D(^GLOB($J))) G FIN
COPJ W !,!,%G-1," Routine",$S(%NG>2:"s",1:"")," a copier",!
 D ^%IS C IO O IO:(0:0) U IO:(0:"IS":$C(13)) W *-1 U 0:("":"B") W *-1
 
 U IO:(0:"IS":$C(13)) W "OK ??",$C(13) R REP:60 U 0:("":"B") W !,"Reception n0 1 : ",REP G:REP'="OK !" ABORT
 S %NG=-1 F %UU=1:1 S %NG=$N(^GLOB($J,%NG)) Q:%NG=-1  D TRAIT
 U IO:(0:"IS":$C(13)) W "FIN",$C(13) C IO U 0:("":"B") W !,"Fin emission" D ^%ZD,INT^%T S ^TRANS($J)=^TRANS($J)_"^"_%DAT_"|"_%TIM Q
TRAIT S (%ARR,NOMTREE)=^GLOB($J,%NG),%ARR="^"_%ARR,%LARR=$L(%ARR) S:$E(NOMTREE,1)'="^" NOMTREE="^"_NOMTREE
 U 0:("":"B") W !,NOMTREE," " S %TAD="WRIT^%ZOGCOPY",$ZT="",%TREECOP=$P(NOMTREE,"]",2)
 S %TREEF=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE),%TREEDEL="^"_%TREECOP_$S(%TREECOP["(":")",1:""),%TREECOP=%TREECOP_$S(%TREECOP["(":",",1:"("),%TREE=$P(NOMTREE,"]",1)_"]"_%TREECOP
 I ($D(@%TREEF)#10)=1 S %T=%TREEF,STOP=0 D WRIT Q:STOP'=0
 S %TREE=$P(%TREEDEL,"(",1),%T=$S(NOMTREE["(":NOMTREE_")",1:NOMTREE_"("""")")
 F %U=1:1 S %T=$Q(@%T) Q:%T=""  Q:$E(%T,1,%LARR)'=%ARR  S STOP=0 D WRIT Q:STOP'=0
END Q
WRIT S %CPT=%CPT+1 H:(%CPT#10)=0 2
 S %RS=@%T U 0:("":"B") W !,%T,"=",@(%T)
 
WRITE S %OCH=%T D NETCH S %T=%NCH,%OCH=%RS D NETCH S %RS=%NCH
W1 U IO:(0:"IS":$C(13)) W "OK ??",$C(13)
 F %TIM=1:1:10 R REP:15 G:REP="BIS" W1 G:REP="OK !" T1
 U IO:(0:"IS":$C(13)) W *-1 S CPT=CPT+1 G:CPT>10 ABORT G W1
T1 W %T,$C(13),%RS,$C(13) S %L=$L(%T),%LR=$L(%RS)
 R %LT:15,%LRS:15
OK U 0:("":"B") W !,"Envoye : ",%L,"/",%LR,"   Recu : ",%LT,"/",%LRS I (%L'=%LT)!(%LR'=%LRS) W *7
 G:(%LT'=%L)!(%LR'=%LRS) NOK U IO:(0:"IS":$C(13)) W "OK !",$C(13) F %TIM=1:1:20 R REP:15 G:REP="BIS" W1 G:REP="SUITE" END
 G W1
NOK U IO:(0:"IS":$C(13)) W "nok !",$C(13) F %TIM=1:1:20 R REP:15 G:REP="BIS" W1 G:REP="SUITE" END
 G W1
ABORT S STOP=1 U 0:("":"B") W !,"Transfert interrompu !" G END
FIN K %DEL,%TREE,%NG,%G,%UU,NOMTREE,%NEW,%RS,%TREECOP,%TREEDEL Q
NETCH S %NCH="",LON=$L(%OCH) Q:LON=0  F I=1:1:LON S %CAR=$E(%OCH,I) S:$A(%CAR)'<32 %NCH=%NCH_%CAR
 K LON,%CAR Q

