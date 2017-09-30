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

;TOWRESPI^INT^1^59547,74876^0
TOWRESPI ;
 
 D ^%AB3STAR K LOSTAR S DT=0,TWREF=0,PT=0,INCO="       ??",P="^[QUI]PHAS(NUFA,TWREF)",DEV="ECR",PAGE=0,PS="^POSENR($I,PAGE)",LILIM=46,LI=$Y+3
 I LI>LILIM W # S LI=$Y
 K ^POSENR($I) D TET1 G LOOP
TETE S LI=1
TET1 S PAGE=PAGE+1,@PS@(LI)=LSTAR,LI=LI+1,@PS@(LI)=$$^%QZCHW("|^No^Machine^Operation^Dimensions a l'outil^|"),LI=LI+1,@PS@(LI)=LSTAR,LI=LI+1 Q
TET2 S PAGE=PAGE+1,LI=1
TET3 S @PS@(LI)=LSTAR,LI=LI+1,@PS@(LI)=$$^%QZCHW("|^Parametre^^Valeur^|"),LI=LI+1,@PS@(LI)=LSTAR,LI=LI+1 Q
LOOP G:'($D(@P)) FIN S N=-1
 F I=1:1 S RSI=$$^%QZCHW("|^"),N=$N(@P@(N)) Q:N=-1  S RSI=RSI_$J(N,5)_"^",%LIB=^[QUI]SECT(NUFA,TWREF,@P@(N)) D ^TOABSPEC S RSI=RSI_$E(%ABSP,1,18)_"^"_$E($P(@P@(N),"/",1),1,23)_"^" D DIMO
 S:LI'=LILIM @PS@(LI)=LSTAR,LI=LI+1 G:'($D(^[QUI]TVPAR(NUFA,TWREF))) FIN0 S P="^[QUI]AUTOPLAF(NUFA,TWREF)",@PS@(LI)="$$$",LI=LI+3 I LI>LILIM D SUIT2 G BA
 D TET3
BA K ^PLAFVU($I) S N=-1 F I=1:1 S N=$N(@P@(N)) Q:N=-1  S RSI=$P(@P@(N),"^",1),@PS@(LI)=$$^%QZCHW("|^")_RSI_"^=^"_$P(@P@(N),"^",2)_"^|",^PLAFVU($I,RSI)=1,LI=LI+1 I LI>LILIM D SUIT2
 S P="^[QUI]TVPAR(NUFA,TWREF)",N=-1 F I=1:1 S N=$N(@P@(N)) Q:N=-1  I '($D(^PLAFVU($I,N))) S @PS@(LI)="|^"_N_"^=^"_@P@(N)_"^|",LI=LI+1 I LI>LILIM D SUIT2
 S @PS@(LI)=LSTAR
FIN0 S EN=6,%U3=$P($T(POS),";;",2),NBPAG=PAGE I '($D(@PS)) S NBPAG=PAGE-1
 F PAGE=1:1:NBPAG D AFF
FIN K LSTAR,DT,TWREF,PT,INCO,P,DEV,PAGE,PS,LILIM,LI,I,RSI,N,%LIB,%ABSP,NBPAG,PCH,%U,%U1,%U2,%U3,%U4,%U5,%U6,POS,EN Q
DIMO S %U=-1,%U0=@P@(N),%U6=1 I '($D(^[QUI]DIM(NUFA,TWREF,%U0))) S RSI=RSI_"------^|",@PS@(LI)=RSI,LI=LI+1 D:LI>LILIM SUIT Q
 F %U1=1:1 S %U=$N(^[QUI]DIM(NUFA,TWREF,%U0,%U)) Q:%U=-1  S %U3=^[QUI]DIM(NUFA,TWREF,%U0,%U),%U4=$P(%U3,"|",1),%U5=$P(%U3,"|",2) D DIMOC
 K %U,%U0,%U1,%U2,%U3,%U4,%U5,%U6 Q
DIMOC I %U6>1 S RSI=""
 S $P(RSI,"^",5)=$E(%U4,1,20),$P(RSI,"^",6)="|",%U6=%U6+1,@PS@(LI)=RSI,LI=LI+1 I LI>LILIM D SUIT
 Q
SUIT S @PS@(LI)=LSTAR D TETE Q
SUIT2 S @PS@(LI)=LSTAR D TET2 Q
AFF F %U=1:1 S LI=$N(@PS@(LI)) Q:LI=-1  S %U1=@PS@(LI) S:%U1="$$$" %U3=$P($T(POSP),";;",2),EN=5 I %U1'="$$$" W ! F %U4=1:1:EN S POS=$P(%U3,";",%U4),%U5=$P(%U1,"^",%U4) W ?POS,%U5
 W:PAGE'=NBPAG # Q
POS ;;0;1;10;25;50;79
POSP ;;0;1;50;52;79

