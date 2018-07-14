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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SYSINET^INT^1^59547,73892^0
%ZNETROUI ;
 
CH0 K CHOI F %U=0:1 S CHOI=$P($T(CHOI+%U),";;",2) Q:CHOI=""  W !,$P(CHOI,"^",1) S CHOI($P(CHOI,"^",2))=$P(CHOI,"^",1)
CHX W !,!,"Votre choix : " R *X Q:X<32  S X=$C(X) G:'($D(CHOI(X))) CHX W " ",CHOI(X) G @("CH"_X)
CH1 G ALL
CH2 W !,!,"Date de la recuperation (AAMMJJ) ? " R X G:$A(X)<32 CH0 G:'($D(^ZRI(X))) CH2 S DAT=X,X=$O(^ZRI(DAT,"")) G:X="" CH0 S Y=$O(^ZRI(DAT,X)) I Y="" S HEURE=X G RECU
 K HR W ! S X="" F %U=1:1 S X=$O(^ZRI(DAT,X)) Q:X=""  W ?((%U-1)#4)*20,%U,") ",X W:(%U#4)=0 ! S HR(%U)=X
CH4 W !,!,"Heure de recuperation : " R X G:$A(X)<32 CH2 G:'($D(HR(X))) CH4 S HEURE=HR(X) G RECU
CH3 G ARRET
ALL K %NET,%R D ^%RSET Q:%R=0  S %REP="^UTILITY("""_%JO_""")#",%ROUT=0,%TB="^UTILITY(%JO)" G TR
RECU S %REP="^ZRI("""_DAT_""","""_HEURE_""")#",%ROUT="",%TB="^ZRI(DAT,HEURE)" G TR
ARRET I '($D(^netrout)) W !,!,"Desole, rattrapage impossible..." Q
 S %REP=$P(^netrout,"#",1) I '($D(@%REP)) W !,!,"Desole, rattrapage impossible..." Q
 S %TB=%REP,%REP=%REP_"#",%ROUT=$P(^netrout,"#",2) I %ROUT="" W !,!,"Poursuite du nettoyage a partir du debut" G TR
 S RDEB=$O(@%TB@(%ROUT)) I RDEB="" W !,!,"Il n'y a plus de routine a nettoyer",! Q
 W !,!,"Poursuite du nettoyage a partir de ",RDEB G TR
TR D INIT X %NET(0) Q
INIT S %NET(0)="F %WW=0:0 S %ROUT=$O(@%TB@(%ROUT)) Q:%ROUT=""""  W !,%ROUT S ^NOMROU=%ROUT,^netrout=%REP_%ROUT D ^%SYSINE1 X %NET(2) W "" Nettoyee "" S $ZT=""G ERR1"" X X1 W "" Compilee. """
 S %NET(2)="ZR  S %NU=0 F %UU=0:0 S %NU=$N(^ROUTINE(%ROUT,0,%NU)) Q:%NU=-1  X %NET(3) S ^ROUTINE(%ROUT,0,%NU)=%EXP"
 S %NET(3)="S %EXP=^ROUTINE(%ROUT,0,%NU),%LEXP=$L(%EXP) S %DER=%LEXP F %VV=1:1:%LEXP S %DCAR=$E(%EXP,%DER),%AS=$A(%DCAR) Q:%AS>32  S %EXP=$E(%EXP,1,%DER-1),%DER=%DER-1"
 S X1="W ?$X+9\10*10,%ROUT W:$X>70 ! S NL=^ROUTINE(%ROUT,0,0) ZR  X Y1 ZS @%ROUT"
 S Y1="F L=1:1:NL ZI ^(L)"
2 S Y2="ZR  S L=0 F Z=0:0 X Z2 ZS @%ROUT Q:L>NL"
 S Z2="F L=L+1:1:L+20 Q:L>NL  ZI ^UTILITY(%JO,%ROUT,L)"
NEXT Q
ERR1 S $ZT="G ERR3" G:$ZE'?1"<STORE>".E ERR3
 W "!" F L=1:1:NL S ^UTILITY(%JO,%ROUT,L)=^ROUTINE(%ROUT,0,L)
 X Y2 G NEXT
ERR3 S $ZT="G ^%ET" W !,$ZE," loading routine ",%ROUT,".",! Q:$ZE?1"<INT".E  G NEXT
CHOI ;;1 Nettoyage de routines quelconques^1
 ;;2 Nettoyage de routines suite a une recuperation sur bande^2
 ;;3 Poursuite du dernier nettoyage interrompu par une erreur^3
 ;;

