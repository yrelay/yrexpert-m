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

;TOEDTGET^INT^1^59547,74872^0
TOEDTGET ;
 
 S DX=0,DY=5 D CLEBAS^%VVIDEO S DY=10 X XY W $$^%QZCHW("Un instant...") D ^%AB3STAR S PAGE=1,L1=$$^%QZCHW("|^Etude^|^Consultation^|^Date^|^No etude^|^Nb^|^Duree^|^Co.^|") K ^TACOMPIL($I)
 S NUB=-1,LI=11 F %U=1:1 S NUB=$N(^ETBATCH($I,NUB)) Q:NUB=-1  D T0
 S NBPAG=PAGE I '($D(^TACOMPIL($I,NBPAG))) S NBPAG=NBPAG-1
FIN K NUB,TETUD,LI,%U,REF,CONS,ETUD,DATE,NO,NB,COM,TI,DEB,FIN,DUREE,IN,ET,RS,%CAR,%V,%V1,%V2,LO,PP,H,M,S,%NBCAR,IT,CIT Q
T0 S REF=^ETBATCH($I,NUB),CONS=$P(REF,"""",6),DATE=$P(REF,"""",4),DEB=$P(REF,"""",10),REF=@("^[QUI]RESTEST("_REF_")"),ETUD=$P(REF,"^",1),NO=$P(REF,"^",2),NB=$P(REF,"^",3),FIN=$P(REF,"^",4),COM=$P(REF,"^",5),COM=$S(COM="RAS":"RAS",COM="":"RAS",1:"*")
 S TI=DEB D TIM0 S DEB=TI,TI=FIN D TIM0 S:TI'>DEB TI=TI+86400 S FIN=TI,TI=FIN-DEB D TIM1 S DUREE=TI K TETUD S TETUD(1)=""
 I $L(ETUD)'>45 S TETUD(1)="-"_ETUD G T1
 S IN=1,ET="-"_$E($P(ETUD,"/",1),1,44)_"/",RS=ETUD,%CAR="/" D ^%QZCHNBC S %NBCAR=%NBCAR+1 F %V=2:1:%NBCAR S PP=$P(ETUD,"/",%V),LO=($L(ET)+$L(PP))+1 D T3
 S TETUD(IN)=ET G T1
T3 I LO>45 S TETUD(IN)=ET,ET=" "_PP_"/",IN=IN+1 Q
 S ET=ET_PP_"/" Q
T1 I $L(CONS)'>30 S TETUD(1)=TETUD(1)_"^"_CONS G T2
 W *
T2 S IN=-1
T4 S IN=$N(TETUD(IN)) Q:IN=-1  S ^TACOMPIL($I,PAGE,LI)="|^"_$P(TETUD(IN),"^",1)_"^|^"_$P(TETUD(IN),"^",2)_"^|^"_DATE_"^|^"_NO_"^|^"_NB_"^|^"_DUREE_"^|^"_COM_"^|",(DATE,NO,NB,DUREE,COM)="",LI=LI+1 I LI>21 S PAGE=PAGE+1,LI=11
 G T4
TIM0 S H=$P(TI,"H",1),M=$P(TI,"H",2),S=$P(M,"'",2),M=$P(M,"'",1),TI=((H*3600)+(M*60))+S Q
TIM1 S H=TI\3600,M=(TI#3600)\60,S=(TI-(H*3600))-(M*60) F IT="H","M","S" S CIT=@IT S:$L(CIT)<2 CIT=0_CIT,@IT=CIT
 S TI=H_"H"_M_"'"_S Q
G W *

