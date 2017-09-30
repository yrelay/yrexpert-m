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

;TO3MODPH^INT^1^59547,74870^0
TO3MODPH ;
 
 D 132^%VVIDEO S DT=0,PT=0,INCO="       ??",P="^[QUI]PHAS(NUFA,TWREF)"
BEG K ^POSENR($I) D CLEPAG^%VVIDEO S PAGE=1
LOOP G:'($D(@P)) FIN1
 W !,LOSTAR,!,"|",?10,$$^%QZCHW("Gamme de fabrication proposee pour : "),?131,"|",!,"|",?131,"|",!,"|",?10,TOID,?131,"|",!,LOSTAR
 W !,"|",?3,$$^%QZCHW("No"),?10,$$^%QZCHW("Sections"),?25,$$^%QZCHW("Operations"),?52,$$^%QZCHW("Consignes-Outillages"),?90,$S(%DIM=0:$$^%QZCHW("Temps"),1:$$^%QZCHW("Dimension a l'outils")),?105,$S(%DIM=0:$$^%QZCHW("Couts"),1:""),?131,"|",!,LOSTAR S LI=$Y,N=-1
LON S N=$N(^[QUI]PHAS(NUFA,TWREF,N)) G:N=-1 FIN S ^POSENR($I,N)=LI
 W !,"|",?1,$J(N,5) S %LIB=^[QUI]SECT(NUFA,TWREF,^[QUI]PHAS(NUFA,TWREF,N)) D ^TOABSPEC W ?7,$E(%ABSP,1,18),?26,$E($P(^[QUI]PHAS(NUFA,TWREF,N),"/",1),1,23) D CUTU:%DIM=0,DIMO:%DIM=1 S LI=LI+1
 I LI>LILIM D SUIT G BEG:%ABAND=$$^%QZCHW("D"),MOD:%ABAND=$$^%QZCHW("M"),FIN2:%ABAND=1
 G LON
DIMO S CIG=$S($D(^[QUI]CONS(NUFA,TWREF,@P@(N))):$E(^[QUI]CONS(NUFA,TWREF,@P@(N)),1,38),1:$$^%QZCHW("------")) W ?50,CIG
 S %U=-1,%U0=@P@(N),%U6=1 I '($D(^[QUI]DIM(NUFA,TWREF,%U0))) W ?90,$$^%QZCHW("------"),?131,"|" Q
 F %U1=1:1 S %U=$N(^[QUI]DIM(NUFA,TWREF,%U0,%U)) Q:%U=-1  S %U3=^[QUI]DIM(NUFA,TWREF,%U0,%U),%U4=$P(%U3,"|",1),%U5=$P(%U3,"|",2) D DIMOC
 K %U,%U0,%U1,%U2,%U3,%U4,%U5,%U6 Q
DIMOC I %U6>1 W !,"|"
 S PCH=%U5 D TO^%QZNBN1 W ?90,$E(%U4,1,20),?112," : ",$S(ISNUM=1:$J(%U5,13,3),1:$E(%U5,1,15)),?131,"|" S %U6=%U6+1,LI=LI+1 I LI>LILIM D SUIT
 Q
CUTU S CT=$S($D(^[QUI]COUT(NUFA,TWREF,@P@(N))):$J(^[QUI]COUT(NUFA,TWREF,@P@(N)),9,2),1:INCO)
 S TE=$S($D(^[QUI]DUREE(NUFA,TWREF,@P@(N))):$J(^[QUI]DUREE(NUFA,TWREF,@P@(N)),9,2),1:INCO)
 S CIG=$S($D(^[QUI]CONS(NUFA,TWREF,@P@(N))):$E(^[QUI]CONS(NUFA,TWREF,@P@(N)),1,38),1:$$^%QZCHW("------"))
 S:$D(^[QUI]DUREE(NUFA,TWREF,@P@(N))) DT=DT+^[QUI]DUREE(NUFA,TWREF,@P@(N)) S:$D(^[QUI]COUT(NUFA,TWREF,@P@(N))) PT=PT+^[QUI]COUT(NUFA,TWREF,@P@(N)) W ?50,CIG,?90,TE,?105,CT,?131,"|" Q
FIN D SUIT G BEG:%ABAND=$$^%QZCHW("D"),MOD:%ABAND=$$^%QZCHW("M") D 80^%VVIDEO G FIN2
 W !,$$^%QZCHW("|*** VALEUR A L'UNITE :"),?90,$J(DT/QTEART,9,2),?105,$J(PT/QTEART,9,2),?131,"|",!,LOSTAR
FIN1 I DEV="ECR" D POCLEPA^%VVIDEO W $$^%QZCHW("Frapper RETURN pour continuer") R XX D CLEPAG^%VVIDEO
 
FIN2 Q
SUIT S %ABAND=0 D POCLEPA^%VVIDEO W $$L23^%QSLIB2("(C)ontinuer, (M)odifier"),$S(PAGE>1:$$^%QZCHW(", (D)ebut de la gamme"),1:"")," "
 R *REP D TOUCHE^%INCCLAV(REP,.REP)
 I REP=1 S %ABAND=1 G FIN2
 S REP=$C(REP) G:(REP'=$$^%QZCHW("M"))&((REP'=$$^%QZCHW("C"))&(REP'=$$^%QZCHW("D"))) SUIT G @REP
D G:PAGE=1 SUIT S %ABAND=$$^%QZCHW("D") G FIN2
C D CLEPAG^%VVIDEO W !,$$^%QZCHW("Suite de la gamme de fabrication proposee pour :"),!,?5,TOID,!,! S LI=$Y K ^POSENR G FIN2
M D POCLEPA^%VVIDEO W $$^%QZCHW("Commande de modification : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN2
 I Y1="?" D POCLEPA^%VVIDEO W $$^%QZCHW("No=numero oper., ""No,A"":ajout,""No,M"":modif,""No,S"":suppres [RETURN] ") R *REP D TOUCHE^%INCCLAV(REP,.REP) G M
 S NO=$P(Y1,",",1),CO=$P(Y1,",",2) I (NO="")!(CO="") D ^%VSQUEAK G M
 I (CO=$$^%QZCHW("A"))&$D(^POSENR($I,NO)) D ^%VSQUEAK G M
 I (CO'=$$^%QZCHW("A"))&('($D(^POSENR($I,NO)))) D ^%VSQUEAK G M
 S %ABAND=$$^%QZCHW("M") G FIN2
MOD D ^TOGMODPH G BEG

