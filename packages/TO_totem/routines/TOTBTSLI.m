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

;TOTBTSLI^INT^1^59547,74876^0
TOTBTSLI ;
 
 S TIT=$$^%QZCHW("Interpretation globale du SF") D ^TOGETART
 G:'($D(^TACOMPIL($I))) FIN S DOLARI=$I
 D CLEPAG^%VVIDEO S PAGE=0,DX=10,DY=10 X XY
 
 W $$^%QZCHW("Resultats sur ") S DEV=$$^%VZESOR("E") G:(DEV'=0)&(DEV'=1) FIN
 S DEV=$S(DEV=0:"E",1:"I")
 S IMPR=$S(DEV=$$^%QZCHW("E"):0,1:^TABIDENT(WHOIS,"PRINTER")),LILIM=$S(IMPR=0:22,1:47) O IMPR U IMPR
 D ^%AB3STAR S %STOP=0,NARTI=-1
 F UU=0:0 Q:%STOP=1  O IMPR U IMPR S NARTI=$N(^TACOMPIL(DOLARI,NARTI)) Q:NARTI=-1  S ARTI=^TACOMPIL(DOLARI,NARTI) D COMPR Q:%STOP=1
END I IMPR=0,%STOP'=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Fin [RETURN] ") R *RET
 C:IMPR'=0 IMPR Q
COMPR S BEG=1 D TETE S GRIL=-1
 S LIB=-1 F UU=0:0 S LIB=$N(^[QUI]TBTSLIB(ARTI,LIB)) Q:LIB=-1  S TYP=^[QUI]TBTSLIB(ARTI,LIB) D AFFTYP G:%STOP=1 FIN
 W !,LSTAR G END
TETE I IMPR=0 D CLEPAG^%VVIDEO
 I IMPR'=0 H 5 W #
 S PAGE=PAGE+1,MSG=$$^%QZCHW("- Comprehension de ")_ARTI_$S(BEG=1:"",1:$$^%QZCHW(" (suite)"))_" _" W $$^%QZCHW("Page "),PAGE,?40-($L(MSG)\2),MSG,?65,$$^%QZCHW("le ") D ZD^%QMDATE4 W %DAT,!,! S LI=3
 I $D(^[QUI]TIMCOMP(ARTI)) S DAT=$N(^[QUI]TIMCOMP(ARTI,-1)),RDCP=^[QUI]TIMCOMP(ARTI,DAT),HD=$P(RDCP,"^",1),HF=$P(RDCP,"^",2),RH=$$^%QZCHW("Derniere comprehension le ")_DAT_$$^%QZCHW(" de ")_HD_$$^%QZCHW(" a ")_HF G WR
 S RH=$$^%QZCHW("Derniere comprehension le ????")
WR I BEG=0 S LI=6 G WR2
 W !,?10,RH,!,! S LI=9,BEG=0
WR2 W ?48,$E(LSTAR,1,31),?79,"|",!,?48,$$^%QZCHW("| Obj."),?55,$$^%QZCHW("| Para."),?63,$$^%QZCHW("| Cte"),?69,$$^%QZCHW("| Inconnu"),?79,"|",!,LSTAR
 G FIN
 
SUIT I IMPR'=0 G IMPR
 D POCLEPA^%VVIDEO W $$L2^%QSLIB R *REP D TOUCHE^%INCCLAV(REP,.REP)
 I REP=1 S %STOP=1 D CLEPAG^%VVIDEO G FIN
IMPR D TETE G FIN
FIN Q
 
KILL I '(DTM) K (TACOMPIL,%PROGEX,IOM,%UCI,%ZD,MCM,%PROG,XY,IOP,IO,POP,%DAT,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="TACOMPIL","%PROGEX","IOM","%UCI","%ZD","MCM","%PROG","XY","IOP","IO","POP","%DAT","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 D CURRENT^%IS,VARSYS^%QCSAP
 Q
 
AFFTYP I (LIB["$ARG")!((LIB["%VALA")!(LIB["%ARGIN")) G FIN
 W !,"| ",LIB S M=$S(TYP="UP":"param",1:"+"),T=$E(TYP,1) W ?48,"|",?51,$S(T="O":M,1:""),?55,"|",?59,$S(T="P":M,1:""),?63,"|",?66,$S(T="C":M,1:""),?69,"|",?73,$S(T="U":M,1:""),?79,"|" S LI=LI+1 I LI>LILIM D SUIT
 G FIN
 
CADRE ;;~L~H~74~3~5/~L~H~74~3~7/~L~H~74~3~9/~L~H~74~3~22/~L~V~1~2~6/~L~V~12~2~10/~L~V~1~32~8/~L~V~1~45~8/~L~V~1~77~6/~L~V~12~77~10/~KS~l~2~5/~KS~m~2~7/~KS~l~2~9/~KS~m~2~22/~KS~w~32~7/~KS~v~32~9/~KS~w~45~7/~KS~v~45~9/~KS~k~77~5/~KS~j~77~7/~KS~k~77~9/~KS~j~77~22/
 ;;

