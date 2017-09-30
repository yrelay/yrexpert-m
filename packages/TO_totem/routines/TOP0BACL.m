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

;TOP0BACL^INT^1^59547,74873^0
TOP0BACL ;
 
 S STOP=0,INCO="       ??",P="^[QUI]PHAS(NUFA,TWREF)"
LOOP S LI=100,N=-1,LILIM=60 D INCRLG
 F I=1:1 S N=$N(^[QUI]PHAS(NUFA,TWREF,N)) Q:(N=-1)!(STOP=1)  D INCRLG U IMPR W !,! S %LIB=$S($D(^[QUI]SECT(NUFA,TWREF,^[QUI]PHAS(NUFA,TWREF,N))):^[QUI]SECT(NUFA,TWREF,^[QUI]PHAS(NUFA,TWREF,N)),1:"") D AFF,CUTU
 U IMPR W ! G FIN
AFF S OMAC="" F %LL=1:1 S MAC=$P(%LIB,".",%LL) Q:MAC=""  S OMAC=MAC
 S OMAC=$E(OMAC,1,5),SEC=$P(^[QUI]PHAS(NUFA,TWREF,N),"/",1),SECAF=SEC I $D(^[QUI]DENOPER(SEC)) S SECAF=$P(^[QUI]DENOPER(SEC),"^",1)
 I $D(^[QUI]MACHPAUT(SEC))!$D(^[QUI]MACHPAUT(SEC)) S OMAC=""
 W OMAC,?7,SECAF Q
DIMO S %UDAC=1 Q:'($D(^[QUI]DIM(NUFA,TWREF,%U0)))
 S %U=$N(^[QUI]DIM(NUFA,TWREF,%U0,%U)) Q:%U=-1  S %U3=^[QUI]DIM(NUFA,TWREF,%U0,%U),%U5=$P(%U3,"|",2),(%BIL,%LIB)=$P(%U3,"|",1) D P^TOABSPEC
 I $D(^[QUI]DENDIMO(%BIL)) S %ABSP=$P(^[QUI]DENDIMO(%BIL),"^",1),LGAB=25-$L(%U5),%ABSP=$E(%ABSP,1,LGAB) D DIMOC Q
 D DIMOC
 Q
DIMOC I %UOK=1 D INCRLG U IMPR W !,!
 S PCH=%U5 D TO^%QZNBN1 S %CH=$S(ISNUM:$J(%U5,1,2),1:%U5),%LGR=23-$L(%ABSP) D ^%QZCHBK
 U IMPR W ?53,%ABSP," ",%CH
 Q
CUTU S P="^[QUI]PHAS(NUFA,TWREF)",%UDAC=0,%UOK=0,%U=-1,%U0=@P@(N),CIG=$S($D(^[QUI]CONS(NUFA,TWREF,@P@(N))):^[QUI]CONS(NUFA,TWREF,@P@(N)),1:"")
 S PR=52-38 W ?38 F %CCXI=1:1 S SONC=$P(CIG,"|",%CCXI) Q:SONC=""  D AFFCON
 F %UU=1:1 Q:(%U=-1)&(%UDAC=1)  D DIMO S %UOK=1
 K %UDAC,%UU,%UOK,%U,%U0,%U1,%U2,%U3,%U4,%U5,%U6 Q
AFFCON I (PR-($L(SONC)+1))>0 S PR=(PR-$L(SONC))-1 U IMPR W SONC," " Q
 D DIMO,INCRLG U IMPR W !,!,?38,SONC," " S PR=52-38 Q
FIN K %LIB,SONC,%LL,%CCXI,CIG,PR,SEC,SECAF,MAC,OMAC Q
INCRLG S LI=LI+2 I LI>LILIM U IMPR W:LI<100 !,?70,".../..." W # D ^TOP0HAUC S LI=20 F %LBL=%LGCOUR:2:LI U IMPR W !,!
 Q

