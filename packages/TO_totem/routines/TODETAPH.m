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

;TODETAPH^INT^1^59547,74871^0
TODETAPH ;
 S NUF=NUFA,TW=TWREF
 Q:'($D(^[QUI]PHAS(NUF)))
 C IMPR O IMPR U IMPR
 N N11LA
 S N11LA=$S(DEV="ECR":69,1:121)
 S LC=0,CTRLA=0,CTRLF=0,DT=0,STOP=0
 I DEV'="ECR" S RDA=$S($D(^TABIDENT(WHOIS,"TYP.IMPR")):^TABIDENT(WHOIS,"TYP.IMPR"),1:"LC35") S:RDA="" RDA="LC35" S RDA1=RDA_"O^%VPRXCA",RDA2=RDA_"F^%VPRXCA" U IMPR D @RDA1
 S LMAX=$S(DEV="ECR":21,1:^TABIDENT(WHOIS,"IMPRCOUR"))
 
 I DEV="ECR" D CLEPAG^%VVIDEO,80^%VVIDEO G BEG
 W #
BEG S OG=-1
LOG S OG=$N(^[QUI]PHAS(NUF,TW,OG)) G:OG=-1 FOG
 S OPOG=^[QUI]PHAS(NUF,TW,OG),OP=$P(OPOG,"/",1),PH=$S($D(^[QUI]ORDEVAL(NUF,TW,"PHAS",OG)):$P(^[QUI]ORDEVAL(NUF,TW,"PHAS",OG),"^",1),1:""),MAC=$S($D(^[QUI]SECT(NUF,TW,OPOG)):^[QUI]SECT(NUF,TW,OPOG),1:"")
 D TETE
 G:'($D(^[QUI]CONS(NUF,TW,OPOG))) DIM
CONS S LI=$J("",10)_$$^%QZCHW("| Consignes : ")_^[QUI]CONS(NUF,TW,OPOG),LI=LI_$J("",N11LA-$L(LI))_"|" D ECR G ABEND:STOP=1
 S LI=$J("",10)_"|"_$TR($J("",$S(DEV="ECR":58,1:110))," ","-")_"|" D ECR G ABEND:STOP=1
DIM G:'($D(^[QUI]DIM(NUF,TW,OPOG))) CARA
 S DIM=-1,LI=$J("",10)_$$^%QZCHW("| Dimensions a l'outil"),LI=LI_$J("",N11LA,-($L(LI)))_"|" D ECR G ABEND:STOP=1
LDIM S DIM=$N(^[QUI]DIM(NUF,TW,OPOG,DIM)) G:DIM=-1 FDIM
 S DI=^[QUI]DIM(NUF,TW,OPOG,DIM),LI=$J("",10)_"|     "_$P(DI,"|",1)_" = "_$P(DI,"|",2),LG=N11LA-$L(LI),LI=LI_$J("",LG)_"|" D ECR G ABEND:STOP=1,LDIM
FDIM S LI=$J("",10)_"|"_$TR($J("",$S(DEV="ECR":58,1:110))," ","-")_"|" D ECR G ABEND:STOP=-1
CARA G:'($D(^[QUI]CARATPC(NUF,TW,OPOG))) TPCT
 S DIM=-1,LI=$J("",10)_$$^%QZCHW("| Caracteristiques a l'operation"),LI=LI_$J("",N11LA-$L(LI))_"|" D ECR G ABEND:STOP=1
LCAR S DIM=$N(^[QUI]CARATPC(NUF,TW,OPOG,DIM)) G:DIM=-1 FCAR
 S DI=^[QUI]CARATPC(NUF,TW,OPOG,DIM),LI=$J("",10)_"|     "_DIM_" = "_DI,LG=N11LA-$L(LI),LI=LI_$J("",LG)_"|" D ECR G ABEND:STOP=1,LCAR
FCAR 
TPCT I $D(^[QUI]COUT(NUF,TW,OPOG)) S LI=$J("",10)_$$^%QZCHW("| Cout retenu : ")_^[QUI]COUT(NUF,TW,OPOG),LI=LI_$J("",N11LA-$L(LI))_"|" D ECR G ABEND:STOP=1
 I $D(^[QUI]DUREE(NUF,TW,OPOG)) S LI=$J("",10)_$$^%QZCHW("| Duree retenue : ")_^[QUI]DUREE(NUF,TW,OPOG),LI=LI_$J("",N11LA-$L(LI))_"|" D ECR G ABEND:STOP=1
 S LI=$J("",10)_"|"_$TR($J("",$S(DEV="ECR":58,1:110))," ","-")_"|" D ECR G ABEND:STOP=1
 G LOG
FOG 
 G ABEND:DEV'="ECR" D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] pour continuer") R *X:^TOZE($I,"ATTENTE") G ABEND
TETE S LI="|"_$TR($J("",$S(DEV="ECR":78,1:130))," ","-")_"|" D ECR Q:STOP=1
 S PH1=PH,OP1=OP,MAC1=MAC,LG=(($L(PH)+$L(OG))+$L(OP))+$L(MAC) I LG>$S(DEV="ECR":80,1:132) D ABR G TET2
TET2 S LG=(($L(PH1)+$L(OP1))+$L(OG))+$L(MAC1)
 S LGR=($S(DEV="ECR":75,1:128)-LG)\3,LGR=$J("",LGR)
 S LI="| "_PH1_LGR_OG_LGR_OP1_LGR_MAC,LI=LI_$J("",(N11LA+10)-$L(LI))_"|" D ECR Q:STOP=1
 S LI="|"_$TR($J("",$S(DEV="ECR":78,1:130))," ","-")_"|" D ECR Q
ABR F IT="PH","OP","MAC" S %LIB=@IT D ^TOABSPEC S @(IT_"1")=%ABSP
 Q
ECR W !,LI S LC=LC+1 Q:LC<LMAX
 S LC=0 I DEV'="ECR" W # Q
QU D POCLEPA^%VVIDEO W $$L2^%QSLIB R *X:^TOZE($I,"ATTENTE") D TOUCHE^%INCCLAV(X,.X),CLEPAG^%VVIDEO
 I X=-1 S STOP=1 G FECR
 I X=1 S STOP=1
FECR Q
ABEND I DEV="ECR" D CLEPAG^%VVIDEO,80^%VVIDEO G FECR
 Q

