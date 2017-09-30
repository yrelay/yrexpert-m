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

;TO3RESPH^INT^1^59547,74870^0
TO3RESPH ;;11:50 AM  29 May 1989
 
 
 
 
 Q:'($D(^[QUI]PHAS(NUFA)))
 Q:^TOZE(DOLARI,"PHASE")=0
 N POS11,L11ST
 S POS11=$S(DEV="ECR":79,1:131),L11ST=$S(DEV="ECR":LSTAR,1:LOSTAR)
 C IMPR O IMPR U IMPR
 S CTRLA=0,CTRLF=0,DT=0,STOP=0,PT=0,INCO="       ??",P="^[QUI]PHAS(NUFA,TWREF)"
 I DEV'="ECR" S RDA=$S($D(^TABIDENT(WHOIS,"TYP.IMPR")):^TABIDENT(WHOIS,"TYP.IMPR"),1:"LC35") S:RDA="" RDA="LC35" S RDA1=RDA_"O^%VPRXCA",RDA2=RDA_"F^%VPRXCA" U IMPR D @RDA1
 I DEV="ECR" D CLEPAG^%VVIDEO
 G LOOP
 
LOOP S LI=0,%KO=0 G:'($D(@P)) FIN1
 D ENTET S LI=12,N=-1,HP="^[QUI]PHAS(NUFA,TWREF,N)",%KO=0
 F I=1:1 S N=$N(^[QUI]PHAS(NUFA,TWREF,N)) Q:(N=-1)!(STOP=1)  S %KO=1,NTN=@HP,%LIB=$S($D(^[QUI]SECT(NUFA,TWREF,NTN)):^[QUI]SECT(NUFA,TWREF,NTN),1:"???") D TESBLO
 G FIN
 
TESBLO S %NOK=0,NN1=N,XX1=1,XX2=$S(DEV="ECR":20,1:26),BL=""
 I NN1["." G STB
 S NN2=$N(^[QUI]PHAS(NUFA,TWREF,NN1)),NN3=NN1_"." I $E(NN2,1,$L(NN3))=NN3 S %LIB="  --------",BL=$$^%QZCHW(" (b)"),%NOK=1
STB D ^TOABSPEC,AFF I %NOK=0 D CUTU:%DIM=0,DIMO:%DIM=1 G FTB
 W ?POS11,"|"
FTB I DEV="IMPR",(I#3)=0 H 3
 S LI=LI+1 I LI>LILIM D SUIT
 Q
AFF W !,"|",?1,$J(NN1,5),?7,$E(%ABSP,1,$S(DEV="ECR":12,1:18)),?XX2,$E($P(^[QUI]PHAS(NUFA,TWREF,N),"/",1),1,($S(DEV="ECR":19,1:23)-(XX2-$S(DEV="ECR":20,1:26)))-$L(BL)),BL
 Q
 
DIMO 
 S CIG=$S($D(^[QUI]CONS(NUFA,TWREF,@P@(N))):$E(^[QUI]CONS(NUFA,TWREF,@P@(N)),1,$S(DEV="ECR":15,1:19)),1:"------") W ?$S(DEV="ECR":40,1:50),CIG
 S %U=-1,%U0=@P@(N),%U6=1
 I '($D(^[QUI]DIM(NUFA,TWREF,%U0))) W ?$S(DEV="ECR":60,1:90),"------",?POS11,"|" Q
 F %U1=1:1 S %U=$N(^[QUI]DIM(NUFA,TWREF,%U0,%U)) Q:%U=-1  S %U3=^[QUI]DIM(NUFA,TWREF,%U0,%U),%U4=$P(%U3,"|",1),%U5=$P(%U3,"|",2) D DIMOC
 K %U,%U0,%U1,%U2,%U3,%U4,%U5,%U6 Q
DIMOC 
 I %U6>1 W !,"|"
 S PCH=%U5,%LIB=%U4 D TO^%QZNBN1,PD^TOABSPEC W ?$S(DEV="ECR":40,1:50),$E(%ABSP,1,$S(DEV="ECR":20,1:39)),?$S(DEV="ECR":55,1:90)," : ",$S(ISNUM=1:$J(%U5,13,3),1:$E(%U5,1,15)),?POS11,"|" S %U6=%U6+1,LI=LI+1 I LI>LILIM D SUIT
 Q
 
CUTU 
 S CT=$S($D(^[QUI]COUT(NUFA,TWREF,@P@(N))):$J(^[QUI]COUT(NUFA,TWREF,@P@(N)),8,2),1:INCO)
 S TE=$S($D(^[QUI]DUREE(NUFA,TWREF,@P@(N))):^[QUI]DUREE(NUFA,TWREF,@P@(N)),1:INCO),TEA=$J($P(TE,"^%",1),$S(DEV="ECR":6,1:9),2),TEB=$J($P(TE,"^",2),$S(DEV="ECR":6,1:9),2),TE=$S(TE["^":TEA_"/"_TEB,1:TE)
 S CIG=$S($D(^[QUI]CONS(NUFA,TWREF,@P@(N))):$E(^[QUI]CONS(NUFA,TWREF,@P@(N)),1,$S(DEV="ECR":18,1:26)),1:"------")
 W ?$S(DEV="ECR":40,1:50),CIG,?$S(DEV="ECR":58,1:90),TE,?$S(DEV="ECR":71,1:105),CT,?POS11,"|" Q
 
FIN G:(CTRLF=1)!(CTRLA=1) FIN11
 W !,L11ST,! G:%DIM=1 FIN1
 
 
FIN1 I (DEV="ECR")&(%KO=1) D POCLEPA^%VVIDEO W $$^%QZCHW("Frapper RETURN pour continuer") R XX D CLEPAG^%VVIDEO G FIN2
FIN11 I DEV="IMPR" U IMPR D @RDA2
 
FIN2 K %KO Q
 
SUIT I DEV="ECR" D POCLEPA^%VVIDEO W $$L14^%QSLIB1 R *RET D TOUCHE^%INCCLAV(RET,.RET),CLEPAG^%VVIDEO S:RET=1 CTRLA=1,STOP=1 S:RET=6 CTRLF=1,STOP=1 Q:STOP=1  W !,$$^%QZCHW("Suite de la gamme de fabrication proposee pour :"),!,?5,TOID,!,! S LI=$Y Q
 W !,L11ST D ENTET S LI=12 Q
 
ENTET H:DEV'="ECR" 5
 W # S %PPAGE=%PPAGE+1 D ^TOHAUPAG(IMPR,%DDATE,%HHEUR,%TTITR,%PPAGE)
 W !,!,L11ST,!,"|",?10,$$^%QZCHW("Gamme de fabrication proposee pour : "),?POS11,"|",!,"|",?POS11,"|",!,"|",?10,TOID,?POS11,"|",!,L11ST
 
 W !,"|",?3,$$^%QZCHW("No"),?9,$$^%QZCHW("Machines"),?$S(DEV="ECR":20,1:25),$$^%QZCHW("Operations"),?$S(DEV="ECR":40,1:52),$$^%QZCHW("Cons.-Outil.")
 W ?$S(DEV="ECR":62,1:90),$S(%DIM=0:$$^%QZCHW("Temps"),1:$$^%QZCHW("Dim.outil")),?$S(DEV="ECR":73,1:105),$S(%DIM=0:$$^%QZCHW("Couts"),1:""),?POS11,"|",!,L11ST
 Q

